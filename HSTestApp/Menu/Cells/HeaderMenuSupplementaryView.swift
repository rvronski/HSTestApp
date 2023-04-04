//
//  HeaderMenuSupplementaryView.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 03.04.2023.
//

import UIKit

protocol HeaderDelegate: AnyObject {
    func scrollMenu(index: Int)
}

class HeaderMenuSupplementaryView:  UICollectionReusableView  {
    var index: Int = 0
    let identifier = "title-supplementary-reuse-identifier"
    var delegate: HeaderDelegate?
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()
    
     lazy var menuCollection: UICollectionView = {
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
        categories.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HeaderCollectionViewCell
        cell.config(categories[indexPath.row])
        cell.layer.cornerRadius = 20
        if indexPath.row == self.index {
            cell.backgroundColor = .systemPink
            cell.title.textColor = .white
        } else {
            cell.backgroundColor = .clear
            cell.title.textColor = .systemPink
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemWidth = (collectionView.frame.width - 64) / 3.3
        let itemHeight = itemWidth / 3

        return CGSize(width: itemWidth, height: itemHeight)

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.index = indexPath.row
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        delegate?.scrollMenu(index: index)
        collectionView.reloadData()
    }
}

