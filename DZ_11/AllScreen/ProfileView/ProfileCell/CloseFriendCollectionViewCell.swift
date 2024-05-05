//
//  CloseFriendCollectionViewCell.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 05/05/2024.
//

import UIKit

class CloseFriendCollectionViewCell: UICollectionViewCell, ProfileCellProtocol {

    
    static var reuseId: String = "CloseFriendCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 15
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imgView: UIImageView = {
        .config(view: $0) { img in
            img.clipsToBounds = true
            img.heightAnchor.constraint(equalToConstant: 25).isActive = true
            img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true
        }
    }(UIImageView())
    
     lazy var hStack: UIStackView = {
        .config(view: $0) { stack in
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fillProportionally
            stack.addArrangedSubview(self.imgView)
            stack.addArrangedSubview(self.labelText)
        }
    }(UIStackView())
    
//
    lazy var labelText: UILabel = {
        .config(view: $0) { label in
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = .black
            label.textAlignment = .center
        }
    }(UILabel())
   
    
    func setupProfileCell(item: ModeltemProfile) {
        labelText.text = item.mainText
        imgView.image = UIImage(named: item.iconProfile ?? "")
       addSubview(hStack)
        constraintAll()
    }
    
    private func constraintAll() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            
        ])
        
    }
}
