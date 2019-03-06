//
//  DefaultExampleCellType.swift
//  Example
//
//  Created by DongHeeKang on 06/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

enum DefaultExampleCellType: Int, CaseIterable, ExampleCellType {
    case `default`
    case icon
    case dismissDefaultLatestToast
    case dismissAllToast
    
    var action: String {
        switch self {
        case .default:
            return "Show"
        case .icon:
            return "Show"
        case .dismissDefaultLatestToast:
            return "Dismiss"
        case .dismissAllToast:
            return "Dismiss"
        }
    }
    
    var target: String {
        switch self {
        case .default:
            return "default toast"
        case .icon:
            return "icon toast"
        case .dismissDefaultLatestToast:
            return "default latest toast"
        case .dismissAllToast:
            return "all toast"
        }
    }
    
    var imageName: String {
        switch self {
        case .default:
            return "toast"
        case .icon:
            return "toast"
        case .dismissDefaultLatestToast:
            return "trash"
        case .dismissAllToast:
            return "trash"
        }
    }
}
