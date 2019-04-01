//
//  AwaitDefaultToastView.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

class AwaitDefaultToastView: AwaitToastView<DefaultToastAppearance> {
    
    // MARK: - Properties
    
    let initialText: String?
    let endText: String?
    let initialAttributedString: NSAttributedString?
    let endAttributedString: NSAttributedString?
    
    // MARK: - UI Components
    
    lazy var initialTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = appearance.numberOfLines
        label.textAlignment = appearance.textAlignment
        label.font = appearance.textFont
        label.textColor = appearance.textColor
        return label
    }()
    lazy var endTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = appearance.numberOfLines
        label.textAlignment = appearance.textAlignment
        label.font = appearance.textFont
        label.textColor = appearance.textColor
        return label
    }()
    
    // MARK: - Con(De)structor
    
    init(initialText: String, endText: String, direction: ToastDirection) {
        self.initialText = initialText
        self.endText = endText
        self.initialAttributedString = nil
        self.endAttributedString = nil
        super.init(direction: direction)
        
        commonInit()
        initialTextLabel.text = initialText
        endTextLabel.text = endText
    }
    
    init(initialAttributedString: NSAttributedString, endAttributedString: NSAttributedString, direction: ToastDirection) {
        self.initialText = nil
        self.endText = nil
        self.initialAttributedString = initialAttributedString
        self.endAttributedString = endAttributedString
        super.init(direction: direction)
        
        commonInit()
        initialTextLabel.attributedText = initialAttributedString
        endTextLabel.attributedText = endAttributedString
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overridden: AwaitToastView
    
    override func finish(duration: TimeInterval, completion: (() -> Void)? = nil) {
        initialTextLabel.removeFromSuperview()
        
        contentView.addSubview(endTextLabel)
        endTextLabel.frame = endTextLabelFrame
        
        UIView.animate(withDuration: duration, animations: {
            var frame = self.endTextLabel.frame
            frame.origin.y = self.endTextLabelToOriginY
            self.endTextLabel.frame = frame
        }) { (_) in
            completion?()
        }
    }
    
    // MARK: - Internal methods
    
    func commonInit() {
        contentView.addSubview(initialTextLabel)
        layout()
    }
    
}

// MARK: - Layout

extension AwaitDefaultToastView {
    
    private func layout() {
        let titleEdgeInsets = appearance.titleEdgeInsets
        initialTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: titleEdgeInsets.left).isActive = true
        initialTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: titleEdgeInsets.top).isActive = true
        initialTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -titleEdgeInsets.right).isActive = true
        initialTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -titleEdgeInsets.bottom).isActive = true
    }
    
}
