//
//  FooterCollectionReusableView.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 02/05/2024.
//

import UIKit

final class FooterCollectionReusableView: UICollectionReusableView {
    static let reuseId: String = "FooterCollectionReusableView"
    
    
    private lazy var footerTitle: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
        $0.textColor = .gray
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    

    
    func getFooter(footerText: String){
        addSubview(footerTitle)
        footerTitle.text = footerText
        makeConstraint()
    
    }
    
    private func makeConstraint() {
        
        NSLayoutConstraint.activate([
            footerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            footerTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            footerTitle.topAnchor.constraint(equalTo: topAnchor),
            footerTitle.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            ])
    }
}
