//
//  Coordinator.swift
//  SpotifyClone
//
//  Created by Esraa on 05/03/2022.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] {get set}
    var navigationController: UINavigationController { get set }
    func start ()
}
