//
//  HeaderMenuSupplementaryView.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 03.04.2023.
//

import UIKit

class HeaderMenuSupplementaryView: UICollectionViewCell {
        static let identifire = "HeaderCell"
    private lazy var menuButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pizza", for: .normal)
        button.setTitleColor(UIColor.systemPink, for: .normal)
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setup() {
        contentView.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
        
            menuButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            menuButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            menuButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
        ])
    }
    
    
}


