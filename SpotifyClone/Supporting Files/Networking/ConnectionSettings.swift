//
//  ConnectionSettings.swift
//  SpotifyClone
//
//  Created by Esraa on 17/03/2022.
//

import Foundation
import Alamofire

struct ConnectionSettings { }

extension ConnectionSettings {

    static func sessionManager() -> Session {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil

        let sessionManager = Session(configuration: configuration,
                                     startRequestsImmediately: false)

        return sessionManager
    }

}
