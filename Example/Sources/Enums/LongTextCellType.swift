//
//  LongTextCellType.swift
//  Example
//
//  Created by DongHeeKang on 01/04/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

enum LongTextCellType: Int, CaseIterable {
    case automaticDimension
    case longTestToast
    
    var title: String {
        switch self {
        case .automaticDimension:
            return "AutomaticDimension"
        case .longTestToast:
            return ""
        }
    }
}
