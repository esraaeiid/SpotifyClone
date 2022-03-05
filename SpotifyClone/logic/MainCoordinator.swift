//
//  MainCoordinator.swift
//  SpotifyClone
//
//  Created by Esraa on 05/03/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController

    enum StepAction {
        case puch(viewController: UIViewController, animated: Bool)
        case present(UIViewController, UIModalPresentationStyle)
        case dismiss
        case pop
        case none
    }

    /// navigate function used to ease navigation between view controllers
    /// - Parameter flowAction: type of navigatio needed
    private func navigate(_ flowAction: StepAction) {
        switch flowAction {
        case .puch(let viewController, let animated):
            self.navigationController.pushViewController(viewController, animated: animated)
        case .present(let viewController, let presentationStyle):
            viewController.modalPresentationStyle = presentationStyle

            if let presentedontroller = navigationController.presentedViewController {
                presentedontroller.present(viewController, animated: true, completion: nil)
            } else {
                self.navigationController.topViewController?.present(viewController, animated: true, completion: nil)
            }

        case .dismiss:
            if let presentedController = navigationController.presentedViewController {
                presentedController.dismiss(animated: true, completion: nil)
            } else {
                self.navigationController.topViewController?.dismiss(animated: true, completion: nil)
            }

        case .pop:
            self.navigationController.popViewController(animated: true)
        case .none:
            break
        }
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = ViewController()
        viewController.coordinator = self
        navigate(.puch(viewController: viewController, animated: false))
    }
}
