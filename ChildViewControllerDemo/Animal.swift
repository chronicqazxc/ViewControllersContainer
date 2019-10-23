//
//  Animal.swift
//  ChildViewControllerDemo
//
//  Created by Hsiao, Wayne on 2019/10/23.
//  Copyright © 2019 Hsiao, Wayne. All rights reserved.
//

import Foundation

enum Animal: String {
    case Cat
    case Dog
    case Human
    
    var symbol: String {
        switch self {
        case .Cat:
            return "🐱"
        case .Dog:
            return "🐶"
        case .Human:
            return "🕺"
        }
    }
}
