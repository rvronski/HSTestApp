//
//  HeaderMenuSupplementaryView.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 03.04.2023.
//

import UIKit

class HeaderMenuSupplementaryView:  UICollectionReusableView  {
    
    let identifier = "title-supplementary-reuse-identifier"
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()
    
    private lazy var menuCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
//   
    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func isHidden(_ config: Bool) {
        self.isHidden = config
    }
    
    private func setup() {
        addSubview(menuCollection)
        
        NSLayoutConstraint.activate([
        
            menuCollection.topAnchor.constraint(equalTo: topAnchor),
            menuCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
            menuCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            menuCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            
        ])
    }
    
    
}
extension HeaderMenuSupplementaryView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HeaderCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemWidth = (collectionView.frame.width - 64) / 3.3
        let itemHeight = itemWidth / 3

        return CGSize(width: itemWidth, height: itemHeight)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("🍳🍏")
    }
}

