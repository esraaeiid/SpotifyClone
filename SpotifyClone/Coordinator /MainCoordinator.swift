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

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = HomeViewController()
        self.navigationController.isNavigationBarHidden = false
        viewController.coordinator = self
        navigationController.setViewControllers([viewController], animated: false)
    }
}
