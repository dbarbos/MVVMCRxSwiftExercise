//
//  Restaurant.swift
//  MVVMCRxSwift
//
//  Created by Diler Barbosa on 07/10/20.
//

import Foundation


struct Restaurant : Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine : String, Decodable {
    case hamburguería
    case massaría
    case churrascaría
}
