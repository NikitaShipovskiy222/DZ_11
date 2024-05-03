//
//  MainViewController.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 01/05/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let item = ModelSection.mockData()
    
    lazy var mainCollection: UICollectionView = {
        $0.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseId)
        $0.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.reuseId)
       $0.register(UsersCollectionViewCell.self, forCellWithReuseIdentifier: UsersCollectionViewCell.reuseId)
        $0.register(MainHeaderCollectionReusableCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainHeaderCollectionReusableCell.reuseId)
        $0.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.reuseId)
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: getLayout()))
    
    
    private func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0: return self.makeBannerSection()
            case 1: return self.makeEventSection()
            default: return self.makeUsersSection()
            }
        }
    }
    
    private func makeBannerSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .estimated(161))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 11, trailing: 30)
        section.boundarySupplementaryItems = [self.createHeaderSize(), self.createFooterSize()]
        return section
        
    }
    
    
    private func makeEventSection() -> NSCollectionLayoutSection {
  
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                              , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30)
        return section
    }
    
    
    private func makeUsersSection() -> NSCollectionLayoutSection {
  
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                              , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30)
        return section
    }
    
    
    private func createHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .absolute(50)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
    private func createFooterSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .absolute(50)),
              elementKind: UICollectionView.elementKindSectionFooter,
              alignment: .bottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainCollection)
        view.backgroundColor = .white
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item[section].item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let items = item[indexPath.section].item[indexPath.item]
    
        switch indexPath.section {
        case 0:
            guard let cell = mainCollection.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseId, for: indexPath) as? BannerCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: items)
            return cell
        case 1:
            guard let cell = mainCollection.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reuseId, for: indexPath) as? EventCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: items)
            return cell
        default:
            guard let cell = mainCollection.dequeueReusableCell(withReuseIdentifier: UsersCollectionViewCell.reuseId, for: indexPath) as? UsersCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: items)
            return cell
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let items = item[indexPath.section]
    
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainHeaderCollectionReusableCell.reuseId, for: indexPath) as? MainHeaderCollectionReusableCell else {return UICollectionReusableView()}
            header.getHeader(header: items.header)
            return header
            
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.reuseId, for: indexPath) as? FooterCollectionReusableView else {return UICollectionReusableView()}
            header.getFooter(footerText: items.footerText)
            return header
        }
    }
    
}
