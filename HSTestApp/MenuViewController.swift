//
//  ViewController.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 03.04.2023.
//

import UIKit

    class MenuViewController: UIViewController {
        
        static let headerElementKind = "header-element-kind"

        
        private let bannerImage = ["1625537050_13-kartinkin-com-p-sushi-pitstsa-fon-krasivie-foni-13","1625702581_15-phonoteka-org-p-art-pitstsa-menyu-krasivo-18","CrXD7fxWgAAjvoB.jpg-large"]
        
        enum Section: Int, CaseIterable {
            case banners
            case menu
        }
       
        var menuCollectionView: UICollectionView! = nil
        var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            configureHierarchy()
            configureDataSource()
        }
        private func setupView(){
            self.view.backgroundColor = .opaqueSeparator
        }
        
        private func createLayout() -> UICollectionViewLayout {
            let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
                let section = self.layoutSection(for: sectionKind, layoutEnvironment: layoutEnvironment)
//                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//                    layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                                       heightDimension: .estimated(44)),
//                    elementKind: MenuViewController.headerElementKind,
//                    alignment: .top)
//                section.boundarySupplementaryItems = [sectionHeader]
                return section
            }
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.interSectionSpacing = 16.0
            let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
            return layout
        }

        func configureHierarchy() {
            
            menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
            menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
            menuCollectionView.backgroundColor = .white
            menuCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            menuCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.cellIdentifire)
            menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifire)
    //        menuCollectionView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashSaleCollectionViewCell.cellIdentifire)
    //        menuCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier: BrandCollectionViewCell.cellIdentifier)
            self.view.addSubview(menuCollectionView)
            
            NSLayoutConstraint.activate([
                menuCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                menuCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                menuCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                menuCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        }
        
        func configureDataSource() {
            dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: menuCollectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell in
                let section = Section(rawValue: indexPath.section)
    //            let model = PageOneModel()
                switch section {
                case .banners:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.cellIdentifire, for: indexPath) as! BannerCollectionViewCell
                  
                    cell.config(model: self.bannerImage[indexPath.row])
                    return cell
                   
                case .menu:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifire, for: indexPath) as! MenuCollectionViewCell
                   
                    return cell
               
                    
                case .none:
                    fatalError("no cell")
                    
                }
            })
//
            var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
            let bannersId = bannerImage.map({$0.hashValue})
//
            snapshot.appendSections([.banners])
            snapshot.appendItems(bannersId, toSection: .banners)
            snapshot.appendSections([.menu])
            snapshot.appendItems((Array(0..<12)), toSection: .menu)
            self.dataSource.apply(snapshot, animatingDifferences: false)
        }
        
        private func layoutSection(for section: Section, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
            switch section {
            case .banners:
                return bannersSection()
            case .menu:
                return menuSection()
           
            }
        }
        
        private func bannersSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/1.3), heightDimension: .fractionalWidth(0.350))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 0
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
        
        private func menuSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)) 
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.450))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
           
            return section
        }
        
        
        
       
    }
        




