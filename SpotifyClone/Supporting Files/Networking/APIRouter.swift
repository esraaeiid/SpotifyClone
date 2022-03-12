//
//  APIRouter.swift
//  SpotifyClone
//
//  Created by Esraa on 12/03/2022.
//

///[https://www.youtube.com/watch?v=irt20ODkI3o]

import Foundation
import Alamofire


// MARK: - APIRouter Structure

struct APIRouterStructure: URLRequestConvertible {

    let apiRouter: APIRouter

    /// Provide Default headers values and add additional headers if exist
    /// - Returns: HTTPHeaders Dictionary 
    func defaultHeaders() -> HTTPHeaders {
        var headersDictionary = [
            "Accept" : "application/json",
            "Origin" : "some origin"
        ]


        if let additionalHeaders = apiRouter.additionalHeaders {
            let additionalHeadersDictionary = additionalHeaders.dictionary
            additionalHeadersDictionary.forEach { (key, value) in
                headersDictionary[key] = value
            }
        }


        return HTTPHeaders(headersDictionary)
    }


    func asURLRequest() throws -> URLRequest {
        let url = try apiRouter.baseURL.asURL()
        let path = apiRouter.path
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = apiRouter.method.rawValue
        urlRequest.timeoutInterval = apiRouter.timeout
        urlRequest.headers = defaultHeaders()
        return urlRequest
    }


}



//MARK: - APIRouter
enum APIRouter {

    ///Endpoints
    case todos

    ///baseURL
    var baseURL: String {
        switch self {
        case .todos:
            return "https://jsonplaceholder.typicode.com/"
        }
    }

    ///path
    var path: String {
        switch self {
        case .todos:
            return "todos/1"
        }
    }

    ///methods
    var method: HTTPMethod {
        switch self {
        case .todos:
            return .get
        }
    }

    /// encoding
    var encoding: ParameterEncoding {
        switch method {
        default:
            return URLEncoding.default
        }
    }

    ///parameters
    var parameters: Parameters?{
        switch self {
        case .todos:
            return nil
        }
    }


    ///body
    var body: Parameters? {
        switch self {
        case .todos:
            return nil
        }
    }


    ///additional headers
    var additionalHeaders: HTTPHeaders? {
        switch self {
        case .todos:
            return HTTPHeaders(["Token": "SomeToken"])
        }
    }

    ///time-out
    var timeout: TimeInterval{
        switch self {
        default:
            return 20
        }
    }


}
