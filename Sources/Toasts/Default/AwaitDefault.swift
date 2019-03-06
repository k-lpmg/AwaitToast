//
//  AwaitDefault.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

extension AwaitToast {
    
    public static func `default`(initialText: String, endText: String, direction: ToastDirection = .top) -> AwaitToast {
        return AwaitDefault(initialText: initialText, endText: endText, direction: direction)
    }
    
    public static func `default`(initialAttributedString: NSAttributedString, endAttributedString: NSAttributedString, direction: ToastDirection = .top) -> AwaitToast {
        return AwaitDefault(initialAttributedString: initialAttributedString, endAttributedString: endAttributedString, direction: direction)
    }
    
}

final private class AwaitDefault: AwaitToastProducer<DefaultToastAppearance> {
    
    init(initialText: String, endText: String, direction: ToastDirection) {
        super.init(view: AwaitDefaultToastView(initialText: initialText, endText: endText, direction: direction))
    }
    
    init(initialAttributedString: NSAttributedString, endAttributedString: NSAttributedString, direction: ToastDirection) {
        super.init(view: AwaitDefaultToastView(initialAttributedString: initialAttributedString, endAttributedString: endAttributedString, direction: direction))
    }
    
}
