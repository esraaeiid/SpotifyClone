//
//  NetworkLayer.swift
//  SpotifyClone
//
//  Created by Esraa on 11/03/2022.
//

import Foundation

enum HTTPMethods: String {

    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}


protocol Items {
    associatedtype DataTypes

    var items: [DataTypes] {get set}

    mutating func add(item: DataTypes)
}
extension Items {
    mutating func add(item: DataTypes) {
        items.append(item)
    }
}

struct Page: Items {
var items =  [String]()
}




