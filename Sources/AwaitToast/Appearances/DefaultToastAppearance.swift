//
//  DefaultToastAppearance.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

public final class DefaultToastAppearance: ToastAppearance {
    
    static var shared: DefaultToastAppearance = .init()
    required init() {
    }
    
    // EdgeInsets
    public var titleEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    
    // ToastView
    public var height: CGFloat = 96
    public var backgroundColor: UIColor = UIColor.black
    
    // TextLabel
    public var numberOfLines: Int = 0
    public var textAlignment: NSTextAlignment = .center
    public var textFont: UIFont = UIFont.preferredFont(forTextStyle: .subheadline)
    public var textColor: UIColor = .white
    
}
