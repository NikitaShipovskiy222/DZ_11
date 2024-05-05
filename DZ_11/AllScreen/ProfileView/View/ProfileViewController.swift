//
//  ProfileViewController.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 01/05/2024.
//

import UIKit

class ProfileViewController: UIViewController {


    private let items = ModelSectionProfile.mockData()
    
    
    lazy var profileCollection: UICollectionView = {
        $0.register(BannerProfileCollectionViewCell.self, forCellWithReuseIdentifier: BannerProfileCollectionViewCell.reuseId)
        $0.register(HeaderCell.self, forSupplementaryViewOfKind:  UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.reuseId)
        $0.register(CloseFriendCollectionViewCell.self, forCellWithReuseIdentifier: CloseFriendCollectionViewCell.reuseId)
        $0.dataSource = self
        $0.backgroundColor = .background
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: getLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Ваш аккаунт"

        view.addSubview(profileCollection)

    
    }
    
    private func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _  in
            switch section {
            case 0: return self.makeBannerSection()
            default: return self.makeCloseFriendSection()
            }
             
        }
        
    }
    

    
    
    private func makeBannerSection() -> NSCollectionLayoutSection{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .estimated(161))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [self.createHeaderSize()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 50, trailing: 30)
        return section
        
    }
    
    private func makeCloseFriendSection() -> NSCollectionLayoutSection {
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                            , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(59))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0 , bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [self.createHeaderSize()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 50, trailing: 30)
        return section
    }
    
    
    private func createHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .absolute(35)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    

    
}


extension ProfileViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = items[indexPath.section].items[indexPath.item]
        
        switch indexPath.section {
        case 0:
            guard let cell = profileCollection.dequeueReusableCell(withReuseIdentifier: BannerProfileCollectionViewCell.reuseId, for: indexPath) as? BannerProfileCollectionViewCell else {return UICollectionViewCell()}
            cell.setupProfileCell(item: item)
            return cell
            
        default:
            guard let cell = profileCollection.dequeueReusableCell(withReuseIdentifier: CloseFriendCollectionViewCell.reuseId, for: indexPath) as? CloseFriendCollectionViewCell else {return UICollectionViewCell()}
            cell.setupProfileCell(item: item)
            return cell
        
        }
        
    }
    
    
    
}


extension ProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let items = items[indexPath.section]
        
        
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseId, for: indexPath) as? HeaderCell else {return UICollectionReusableView()}
            header.getProfileHeader(header: items.header)
            return header
    
        }
    
}
    

