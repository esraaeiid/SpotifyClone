//
//  HomeViewController.swift
//  SpotifyClone
//
//  Created by Esraa on 11/02/2022.
//

import UIKit
import Alamofire
import PromiseKit

class HomeViewController: UIViewController {

    var coordinator: MainCoordinator?
    let homeView = HomeView()

    private lazy var session: Session = {
        return ConnectionSettings.sessionManager()
    }()

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

    func setupActions() {
        homeView.settingsButton.addTarget(self, action: #selector(settingsButtonTapped),
                                          for: .touchUpInside)
    }

   @objc func settingsButtonTapped() {
        let apiRouter = APIRouterStructure(apiRouter: .todos)

       let todosPromise: Promise<Todo> = session.request(apiRouter)
        firstly {
            todosPromise
        }
        .then { [weak self] todo -> Promise<Todo> in
            guard let self = self else { throw InternalError.unexpected }
            self.homeView.titleLabel.text = todo.title
            return Promise<Todo>.value(todo)
        }
        .catch { [weak self] error in
            guard let self = self else { return }
            self.homeView.titleLabel.text = "There was an error"
        }
        .finally {
            print("Finally Finished!")
        }
    }

}
