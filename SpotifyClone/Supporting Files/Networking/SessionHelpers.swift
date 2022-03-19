//
//  SessionHelpers.swift
//  SpotifyClone
//
//  Created by Esraa on 18/03/2022.
//

import Foundation
import Alamofire
import PromiseKit

enum InternalError: LocalizedError {
    case unexpected
}

extension Session {

    /// request json
    func request<T: Codable>(_ urlRequestConvertible: APIRouterStructure) -> Promise<T> {

        return Promise<T> { steal in
            request(urlRequestConvertible).responseDecodable { (response: DataResponse<T, AFError>) in
                guard response.response != nil else {
                    if let error = response.error {
                        steal.reject(error)
                    } else {
                        steal.reject(InternalError.unexpected)
                    }
                    return
                }

                switch response.result {
                case .success(let value):
                    steal.fulfill(value)
                case .failure(let error):
                    steal.reject(error)
                }
            }
            .resume()

        }
    }


    /// request data not json
    func request(_ urlRequestConvertible: APIRouterStructure) -> Promise<Data?> {

        return Promise<Data?> { steal in
            request(urlRequestConvertible).responseDecodable { (response: DataResponse<Data?, AFError>) in
                guard response.response != nil else {
                    if let error = response.error {
                        steal.reject(error)
                    } else {
                        steal.reject(InternalError.unexpected)
                    }
                    return
                }

                switch response.result {
                case .success(let value):
                    steal.fulfill(value)
                case .failure(let error):
                    steal.reject(error)
                }
            }
            .resume()

        }
    }

}
