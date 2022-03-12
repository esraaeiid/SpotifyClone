//
//  HomeView.swift
//  SpotifyClone
//
//  Created by Esraa on 05/03/2022.
//

import UIKit

class HomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let settingsButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 43)
        button.setImage(UIImage(named: "settings")?.withTintColor(.black), for: .normal)
        return button
    }()

    let recentsButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 43)
        button.setImage(UIImage(named: "recents")?.withTintColor(.black), for: .normal)
        return button
    }()

    let activityButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 43)
        button.setImage(UIImage(named: "activity")?.withTintColor(.black), for: .normal)
        return button
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Good morning"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()

    func setupConstraints() {

    }

}
