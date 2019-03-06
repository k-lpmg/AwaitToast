//
//  SectionType.swift
//  Example
//
//  Created by DongHeeKang on 04/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

enum SectionType: Int, CaseIterable {
    case settings
    case defaultExamples
    case awaitExamples
    
    var title: String {
        switch self {
        case .settings:
            return "Settings"
        case .defaultExamples:
            return "Default Examples"
        case .awaitExamples:
            return "Await Examples"
        }
    }
}
