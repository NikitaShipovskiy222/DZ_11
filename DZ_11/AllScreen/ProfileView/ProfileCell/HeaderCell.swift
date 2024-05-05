//
//  HeaderCollectionReusableView.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 02/05/2024.
//

import UIKit

final class HeaderCell: UICollectionReusableView {
    
    static let reuseId: String = "HeaderCollectionReusableCell"
    
    private lazy var hStack: UIStackView = {
        .config(view: $0) { stack in
            stack.axis = .horizontal
            stack.alignment = .leading
            stack.distribution = .equalSpacing
            stack.addArrangedSubview(self.headerTitle)
        }
    }(UIStackView())
    
    private lazy var headerTitle: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .black)
        $0.textColor = .black
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    

    
    
    func getProfileHeader(header: String){
        addSubview(hStack)
        headerTitle.text = header
        makeConstraint()
    
    }
    
    private func makeConstraint() {
        
        NSLayoutConstraint.activate([
        
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            ])
    }
    
}
