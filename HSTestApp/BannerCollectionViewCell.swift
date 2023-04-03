//
//  BannerCollectionViewCell.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 03.04.2023.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    static let cellIdentifire = "banerCell"
    private lazy var banerView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(model: String) {
        self.banerView.image = UIImage(named: model)
    }
    
    private func setupView() {
        self.contentView.addSubview(banerView)
        
        NSLayoutConstraint.activate([
        
            self.banerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.banerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.banerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.banerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            
        
        ])
    }
}

}
