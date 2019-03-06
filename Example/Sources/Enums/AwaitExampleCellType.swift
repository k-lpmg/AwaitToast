//
//  AwaitExampleCellType.swift
//  Example
//
//  Created by DongHeeKang on 06/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

enum AwaitExampleCellType: Int, CaseIterable, ExampleCellType {
    case defaultAwait
    case finishDefaultAwait
    case iconAwait
    case finishIconAwait
    case dismissAwaitLatestToast
    case dismissAllToast
    
    var action: String {
        switch self {
        case .defaultAwait:
            return "Show"
        case .finishDefaultAwait:
            return "Finish"
        case .iconAwait:
            return "Show"
        case .finishIconAwait:
            return "Finish"
        case .dismissAwaitLatestToast:
            return "Dismiss"
        case .dismissAllToast:
            return "Dismiss"
        }
    }
    
    var target: String {
        switch self {
        case .defaultAwait:
            return "default await toast"
        case .finishDefaultAwait:
            return "default await toast"
        case .iconAwait:
            return "icon await toast"
        case .finishIconAwait:
            return "icon await toast"
        case .dismissAwaitLatestToast:
            return "await latest toast"
        case .dismissAllToast:
            return "all toast"
        }
    }
    
    var imageName: String {
        switch self {
        case .defaultAwait:
            return "await"
        case .finishDefaultAwait:
            return "exit"
        case .iconAwait:
            return "await"
        case .finishIconAwait:
            return "exit"
        case .dismissAwaitLatestToast:
            return "trash"
        case .dismissAllToast:
            return "trash"
        }
    }
}
