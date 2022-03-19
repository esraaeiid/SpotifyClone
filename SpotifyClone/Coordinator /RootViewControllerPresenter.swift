//
//  RootViewControllerPresenter.swift
//  SpotifyClone
//
//  Created by Esraa on 18/03/2022.
//


import UIKit

protocol RootViewControllerPresenterProtocol {
    func presentViewController(_ viewController: UIViewController, withAnimations: Bool)
}

final class RootViewControllerPresenter: RootViewControllerPresenterProtocol {


    private let window: UIWindow?


    init(window: UIWindow?) {
        self.window = window
    }


    func presentViewController(_ viewController: UIViewController, withAnimations: Bool = true) {
        guard let window = window else { return }
        window.rootViewController = viewController
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .light
        }
        window.makeKeyAndVisible()
        if withAnimations {
            UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil)
        }
    }
}
