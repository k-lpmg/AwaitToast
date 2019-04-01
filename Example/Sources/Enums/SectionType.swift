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
    case longText
    
    var title: String {
        switch self {
        case .settings:
            return "Settings"
        case .defaultExamples:
            return "Default Examples"
        case .awaitExamples:
            return "Await Examples"
        case .longText:
            return "Long Text Example"
        }
    }
}
