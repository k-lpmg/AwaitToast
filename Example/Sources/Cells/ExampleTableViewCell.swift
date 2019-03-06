//
//  ExampleTableViewCell.swift
//  Example
//
//  Created by DongHeeKang on 03/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

final class ExampleTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let reuseIdentifier = "ExampleTableViewCell"
    
    // MARK: - UI Components
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let actionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    private let targetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .right
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Con(De)structor
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(actionLabel)
        contentView.addSubview(targetLabel)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    func configure(with type: ExampleCellType) {
        iconImageView.image = UIImage(named: type.imageName)
        actionLabel.text = type.action
        targetLabel.text = type.target
    }
    
}

// MARK: - Layout

extension ExampleTableViewCell {
    
    private func layout() {
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        actionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16).isActive = true
        actionLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor).isActive = true
        actionLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        targetLabel.leadingAnchor.constraint(equalTo: actionLabel.trailingAnchor, constant: 8).isActive = true
        targetLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        targetLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor).isActive = true
    }
    
}
