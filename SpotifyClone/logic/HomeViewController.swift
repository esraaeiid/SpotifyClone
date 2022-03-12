//
//  HomeViewController.swift
//  SpotifyClone
//
//  Created by Esraa on 11/02/2022.
//

import UIKit

class HomeViewController: UIViewController {

    var coordinator: MainCoordinator?
    let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupNavigationController()
        setupActions()
    }

    override func loadView() {
        self.view = homeView
    }

    func setupNavigationController() {

        self.coordinator?.navigationController.topViewController?
            .navigationItem.rightBarButtonItems =
        [UIBarButtonItem(customView: homeView.activityButton),
         UIBarButtonItem(customView: homeView.recentsButton),
         UIBarButtonItem(customView: homeView.settingsButton)]

        self.coordinator?.navigationController.topViewController?
            .navigationItem.leftBarButtonItem =  UIBarButtonItem(customView: homeView.titleLabel)  // handle this according to time
    }

    func setupActions(){

    }

}
