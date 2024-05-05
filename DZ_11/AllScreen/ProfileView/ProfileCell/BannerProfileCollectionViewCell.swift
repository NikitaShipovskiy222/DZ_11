//
//  BannerProfileCollectionViewCell.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 05/05/2024.
//

import UIKit

class BannerProfileCollectionViewCell: UICollectionViewCell, ProfileCellProtocol {
    static var reuseId: String = "BannerProfileCollectionViewCell"
    
        
    
    lazy var imgView: UIImageView = {
        .config(view: $0) { img in
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            img.layer.cornerRadius = 20
            img.heightAnchor.constraint(equalToConstant: 161).isActive = true
        }
    }(UIImageView())
        
    
    lazy var vStack: UIStackView = {
        .config(view: $0) { stack in
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.alignment = .leading
            stack.addArrangedSubview(self.mainLabel)
            stack.addArrangedSubview(self.smallText)
        }
    }(UIStackView())
    
  
    lazy var mainLabel: UILabel = {
        .config(view: $0) { label in
            label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            label.textColor = .white
            label.numberOfLines = 0
            label.textAlignment = .left
        }
    }(UILabel())
    
    lazy var smallText: UILabel = {
        .config(view: $0) { small in
            small.numberOfLines = 0
            small.textAlignment = .left
            small.textColor = .white
            small.font = UIFont.systemFont(ofSize: 12, weight: .light)
        }
    }(UILabel())
    
    

    
    func setupProfileCell(item: ModeltemProfile) {
        
        imgView.image = UIImage(named: item.img ?? "")
        mainLabel.text = item.mainText
        smallText.text = item.text
        
        [vStack].forEach{
            imgView.addSubview($0)
        }
    
        addSubview(imgView)
        constraintAll()
        
    }
    
    private func constraintAll() {
        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            vStack.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 25),
            vStack.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 23),
            vStack.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -15),
            vStack.bottomAnchor.constraint(equalTo: imgView.bottomAnchor, constant: -22),

            

            
        ])
    }
    
}
    
    
