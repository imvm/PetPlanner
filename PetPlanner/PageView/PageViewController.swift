/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that wraps a UIPageViewController.
*/

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    var wrapsAround: Bool
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self, wrapsAround: wrapsAround)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var wrapsAround: Bool
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController, wrapsAround: Bool) {
            parent = pageViewController
            self.wrapsAround = wrapsAround
            controllers = parent.pages.map {
                let controller = UIHostingController(rootView: $0)
                controller.view.backgroundColor = .clear
                return controller
            }
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                if wrapsAround {
                    return controllers.last
                } else {
                    return nil
                }
            }
            return controllers[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                if wrapsAround {
                    return controllers.first
                } else {
                    return nil
                }
            }
            return controllers[index + 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
