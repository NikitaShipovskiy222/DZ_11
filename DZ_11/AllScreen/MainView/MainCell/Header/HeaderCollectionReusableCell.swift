//
//  HeaderCollectionReusableView.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 02/05/2024.
//

import UIKit

final class HeaderCollectionReusableCell: UICollectionReusableView {
    
    static let reuseId: String = "HeaderCollectionReusableCell"
    
    private lazy var hStack: UIStackView = {
        .config(view: $0) { stack in
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .equalSpacing
            stack.addArrangedSubview(self.headerTitle)
            stack.addArrangedSubview(self.button)
        }
    }(UIStackView())
    
    private lazy var headerTitle: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .black)
        $0.textColor = .black
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var button: UIButton = {
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(.blue, for: .normal)
        return $0
    }(UIButton())
    
    
    func getHeader(header: String, headerButton: String){
        addSubview(hStack)
        headerTitle.text = header
        button.setTitle(headerButton, for: .normal)
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
