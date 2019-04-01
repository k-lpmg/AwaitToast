//
//  IconToastView.swift
//  AwaitToast
//
//  Created by DongHeeKang on 01/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

class IconToastView: ToastView<IconToastAppearance> {
    
    // MARK: - Constants
    
    private enum Const {
        static let imageSize = CGSize(width: 24, height: 24)
    }
    
    // MARK: - Properties
    
    let image: UIImage?
    let imageLocation: IconImageLocation
    let text: String?
    let attributedString: NSAttributedString?
    
    // MARK: - UI Components
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.contentMode = appearance.imageContentMode
        imageView.tintColor = appearance.imageTintColor
        return imageView
    }()
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
    
    init(image: UIImage, imageLocation: IconImageLocation, text: String, direction: ToastDirection) {
        self.image = image
        self.imageLocation = imageLocation
        self.text = text
        self.attributedString = nil
        super.init(direction: direction)
        
        commonInit()
        textLabel.text = text
    }
    
    init(image: UIImage, imageLocation: IconImageLocation, attributedString: NSAttributedString, direction: ToastDirection) {
        self.image = image
        self.imageLocation = imageLocation
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
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        layout()
    }
    
}

// MARK: - Layout

extension IconToastView {
    
    private func layout() {
        let titleEdgeInsets = appearance.titleEdgeInsets
        let imageEdgeInsets = appearance.imageEdgeInsets
        
        let imageViewTopConstant = imageEdgeInsets.top - imageEdgeInsets.bottom
        imageView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor, constant: imageViewTopConstant).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Const.imageSize.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Const.imageSize.height).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: titleEdgeInsets.top).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -titleEdgeInsets.bottom).isActive = true
        
        switch imageLocation {
        case .left:
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: imageEdgeInsets.left).isActive = true
            
            let textLabelLeftConstant = titleEdgeInsets.left + imageEdgeInsets.right
            textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: textLabelLeftConstant).isActive = true
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -titleEdgeInsets.right).isActive = true
        case .right:
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -imageEdgeInsets.right).isActive = true
            
            let textLabelRightConstant = titleEdgeInsets.right + imageEdgeInsets.left
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: titleEdgeInsets.left).isActive = true
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -textLabelRightConstant).isActive = true
        }
    }
    
}
