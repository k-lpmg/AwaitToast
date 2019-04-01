//
//  DefaultToastView.swift
//  AwaitToast
//
//  Created by DongHeeKang on 01/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

class DefaultToastView: ToastView<DefaultToastAppearance> {
    
    // MARK: - Properties
    
    let text: String?
    let attributedString: NSAttributedString?
    
    // MARK: - UI Components
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = appearance.numberOfLines
        label.textAlignment = appearance.textAlignment
        label.font = appearance.textFont
        label.textColor = appearance.textColor
        return label
    }()
    
    // MARK: - Con(De)structor
    
    init(text: String, direction: ToastDirection) {
        self.text = text
        self.attributedString = nil
        super.init(direction: direction)
        
        commonInit()
        textLabel.text = text
    }
    
    init(attributedString: NSAttributedString, direction: ToastDirection) {
        self.text = nil
        self.attributedString = attributedString
        super.init(direction: direction)
        
        commonInit()
        textLabel.attributedText = attributedString
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    func commonInit() {
        contentView.addSubview(textLabel)
        layout()
    }
    
}

// MARK: - Layout

extension DefaultToastView {
    
    private func layout() {
        let titleEdgeInsets = appearance.titleEdgeInsets
        textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: titleEdgeInsets.left).isActive = true
        textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: titleEdgeInsets.top).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -titleEdgeInsets.right).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -titleEdgeInsets.bottom).isActive = true
    }
    
}
