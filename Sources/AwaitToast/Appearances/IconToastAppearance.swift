//
//  IconToastAppearance.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

public final class IconToastAppearance: ToastAppearance {
    
    static var shared: IconToastAppearance = .init()
    required init() {
    }
    
    // EdgeInsets
    public var titleEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 16)
    public var imageEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 8)
    
    // ToastView
    public var height: CGFloat = 96
    public var backgroundColor: UIColor = UIColor.black

    // ImageView
    public var imageContentMode: UIView.ContentMode = .scaleToFill
    public var imageTintColor: UIColor? = nil
    
    // TextLabel
    public var numberOfLines: Int = 0
    public var textAlignment: NSTextAlignment = .left
    public var textFont: UIFont = UIFont.preferredFont(forTextStyle: .subheadline)
    public var textColor: UIColor = .white
    
}

