//
//  HeaderCollectionViewCell.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 04.04.2023.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
     lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pizza"
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 20
        label.textColor = .systemPink
        label.textAlignment = .center
        label.layer.borderColor = UIColor.systemPink.cgColor
        return label
    
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func config(_ categories: String) {
        title.text = categories
    }
    
    private func setup() {
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
        
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
        ])
    }
   
}
