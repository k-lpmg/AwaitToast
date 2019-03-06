//
//  SettingCellType.swift
//  Example
//
//  Created by DongHeeKang on 04/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

enum SettingCellType: Int, CaseIterable {
    case tapToDismiss
    case topDirection
    
    var title: String {
        switch self {
        case .tapToDismiss:
            return "Tap to dismiss"
        case .topDirection:
            return "Top direction"
        }
    }
}
