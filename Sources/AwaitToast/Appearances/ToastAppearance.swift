//
//  ToastAppearance.swift
//  AwaitToast
//
//  Created by DongHeeKang on 28/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

protocol ToastAppearance: class {
    
    static var shared: Self { get set }
    
    init()
    
    // EdgeInsets
    var titleEdgeInsets: UIEdgeInsets { get set }
    
    // ToastView
    var height: CGFloat { get set }
    var backgroundColor: UIColor { get set }
    
    // TextLabel
    var numberOfLines: Int { get set }
    var textAlignment: NSTextAlignment { get set }
    var textFont: UIFont { get set }
    var textColor: UIColor { get set }
    
}
