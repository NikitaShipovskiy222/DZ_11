//
//  UsersCollectionViewCell.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 02/05/2024.
//

import UIKit

final class UsersCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 15
        backgroundColor = .white
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var vStack: UIStackView = {
        .config(view: $0) { stack in
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .equalCentering
            stack.addArrangedSubview(self.imgView)
            stack.addArrangedSubview(self.userName)
            stack.addArrangedSubview(self.discriptionLabel)
            stack.addArrangedSubview(self.sendButton)
            
        }
    }(UIStackView())
    
    lazy var sendButton: UIButton = {
        $0.setTitle("Написать", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        $0.setTitleColor(.blue, for: .normal)
        return $0
    }(UIButton())
    
    lazy var discriptionLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
        $0.numberOfLines = 0

        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var userName: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var imgView: UIImageView = {
        .config(view: $0) { img in
            img.heightAnchor.constraint(equalToConstant: 50).isActive = true
            img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true
            img.layer.cornerRadius = 25
            img.clipsToBounds = true
        }
    }(UIImageView())
    
    
    
    static var reuseId: String = "UsersCollectionViewCell"
    
    func setupCell(item: ModelItem) {
        userName.text = item.name
        discriptionLabel.text = item.text
       imgView.image = UIImage(named: item.image ?? "")
        
       addSubview(vStack)
        makeConstraint()
    
        
    }
    
    private func makeConstraint() {
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
        ])
    }
}
