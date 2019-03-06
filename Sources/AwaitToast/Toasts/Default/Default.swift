//
//  Default.swift
//  AwaitToast
//
//  Created by DongHeeKang on 28/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

extension Toast {
    
    public static func `default`(text: String, direction: ToastDirection = .top) -> Toast {
        return Default(text: text, direction: direction)
    }
    
    public static func `default`(attributedString: NSAttributedString, direction: ToastDirection = .top) -> Toast {
        return Default(attributedString: attributedString, direction: direction)
    }
    
}

final private class Default: DefaultToastProducer<DefaultToastAppearance> {
    
    init(text: String, direction: ToastDirection) {
        super.init(view: DefaultToastView(text: text, direction: direction))
    }
    
    init(attributedString: NSAttributedString, direction: ToastDirection) {
        super.init(view: DefaultToastView(attributedString: attributedString, direction: direction))
    }
    
}
