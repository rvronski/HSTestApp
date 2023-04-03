//
//  MenuCollectionViewCell.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 03.04.2023.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "menuCell"
    
    private lazy var productImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.image = UIImage(named: "pizza")
        return image
    }()
   
    private lazy var foodNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.text = "Пицца с ветчиной"
        return label
    }()
    
    private lazy var foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        return label
    }()
    
    private lazy var priceButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("315p", for: .normal)
        button.setTitleColor(UIColor.systemPink, for: .normal)
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(productImage)
        self.contentView.addSubview(foodNameLabel)
        self.contentView.addSubview(foodDescriptionLabel)
        self.contentView.addSubview(priceButton)
        
        NSLayoutConstraint.activate([
        
            self.productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 24),
            self.productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            self.productImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -24),
            self.productImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.352),
            self.productImage.heightAnchor.constraint(equalTo: self.productImage.widthAnchor),
            
            self.foodNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 32),
            self.foodNameLabel.leftAnchor.constraint(equalTo: self.productImage.rightAnchor, constant: 32),
            
            self.foodDescriptionLabel.topAnchor.constraint(equalTo: self.foodNameLabel.bottomAnchor, constant: 8),
            self.foodDescriptionLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -24),
            self.foodDescriptionLabel.leftAnchor.constraint(equalTo: self.productImage.rightAnchor, constant: 32),
            
            self.priceButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -24),
            self.priceButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -24),
            self.priceButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.232),
            self.priceButton.heightAnchor.constraint(equalTo: self.priceButton.widthAnchor, multiplier: 0.367),
            self.priceButton.topAnchor.constraint(equalTo: self.foodDescriptionLabel.bottomAnchor, constant: 16),
            
            
            
            
        
        
        ])
    }
}
