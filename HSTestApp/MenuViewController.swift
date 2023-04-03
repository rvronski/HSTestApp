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
            
        }
        private func setupView(){
            self.view.backgroundColor = .opaqueSeparator
           
            
            NSLayoutConstraint.activate([
            
               
            
            
            ])
        }
        
        private func createLayout() -> UICollectionViewLayout {
            let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
                let section = self.layoutSection(for: sectionKind, layoutEnvironment: layoutEnvironment)
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(44)),
                    elementKind: MenuViewController.headerElementKind,
                    alignment: .top)
                section.boundarySupplementaryItems = [sectionHeader]
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
    //        menuCollectionView.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.cellIdentifire)
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
    //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.cellIdentifire, for: indexPath) as! LatestCollectionViewCell
    //                cell.configure(model: self.latest[indexPath.row])
    //                return cell
               
                    
                case .none:
                    fatalError("no cell")
                    
                }
            })
            let supplementaryRegistration = UICollectionView.SupplementaryRegistration
            <TitleSupplementaryView>(elementKind: PageOneViewController.headerElementKind) {
                (supplementaryView, string, indexPath) in
                let section = Section(rawValue: indexPath.section)
                switch section {
                case .menu:
                    supplementaryView.label.text = ""
                    supplementaryView.allButtom.isHidden = true
                case .latest:
                    supplementaryView.label.text = "Latest"
                case .flashSale:
                    supplementaryView.label.text = "Flash Sale"
                case .brands:
                    supplementaryView.label.text = "Brands"
                    supplementaryView.allButtom.isHidden = false
                case .none:
                    fatalError()
               
                }
                
          

            }
            
            dataSource.supplementaryViewProvider = { (view, kind, index) in
                return self.shopCollectionView.dequeueConfiguredReusableSupplementary(
                    using: supplementaryRegistration, for: index)
            }
            
            var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
            let flashId = flashSale.map({$0.id.hashValue})
            let latId = latest.map({$0.id.hashValue})
            let model = PageOneModel()
            let brandsId = model.brandsImage.map({$0.hashValue})
            snapshot.appendSections([.menu])
            snapshot.appendItems((Array(0..<12)), toSection: .menu)
            snapshot.appendSections([.latest])
            snapshot.appendItems(latId, toSection: .latest)
            snapshot.appendSections([.flashSale])
            snapshot.appendItems(flashId, toSection: .flashSale)
            snapshot.appendSections([.brands])
            snapshot.appendItems(brandsId, toSection: .brands)
            
            self.dataSource.apply(snapshot, animatingDifferences: false)
        }
        
        private func layoutSection(for section: Section, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
            switch section {
            case .menu:
                return menuSection()
            case .latest:
                return latestSection()
            case .flashSale:
                return flashSaleSection()
            case .brands:
               return brandsSection()
            }
        }
        
        private func menuSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/6.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            //        group.contentInsets = .init(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
        
        private func latestSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3.0), heightDimension: .fractionalHeight(1.0)) // height is ignored
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.450))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item]) // <<<===
            //        group.interItemSpacing = .fixed(2.0)
            
            
            let section = NSCollectionLayoutSection(group: group)
            //        section.interGroupSpacing = 8
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
        
        private func flashSaleSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/2.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item]) // <<<===
            //        group.interItemSpacing = .fixed(2.0)
            
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 8
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
        
        private func brandsSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 8
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
        




