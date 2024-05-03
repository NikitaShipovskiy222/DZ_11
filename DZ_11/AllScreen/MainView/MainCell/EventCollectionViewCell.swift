//
//  EventCollectionViewCell.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 02/05/2024.
//

import UIKit

final class EventCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    static var reuseId: String = "EventCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        clipsToBounds = true
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imgView: UIImageView = {
        .config(view: $0) { img in
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            img.heightAnchor.constraint(equalToConstant: 25).isActive = true
            img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true
        }
    }(UIImageView())
    
     lazy var hStack: UIStackView = {
        .config(view: $0) { stack in
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .equalSpacing
            stack.addArrangedSubview(self.imgView)
            stack.addArrangedSubview(self.labelText)
            stack.addArrangedSubview(self.arrowImg)
        }
    }(UIStackView())
    
//    
    lazy var labelText: UILabel = {
        .config(view: $0) { label in
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = .black
            label.textAlignment = .left
        }
    }(UILabel())
   
    lazy var arrowImg: UIImageView = {
        .config(view: $0) { img in
            img.image = UIImage(named: "arrow")
            img.heightAnchor.constraint(equalToConstant: 16).isActive = true
            img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true
            
        }
    }(UIImageView())
    
    func setupCell(item: ModelItem) {
        labelText.text = item.text
        imgView.image = UIImage(named: item.icon ?? "")

       addSubview(hStack)
        constraintAll()
    }
    
    private func constraintAll() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
}
