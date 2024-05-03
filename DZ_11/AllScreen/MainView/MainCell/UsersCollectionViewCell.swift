//
//  UsersCollectionViewCell.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 02/05/2024.
//

import UIKit

final class UsersCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    
    lazy var imgView: UIImageView = {
        $0.layer.cornerRadius = 25
        return $0
    }(UIImageView(frame: CGRect(x: 20, y: 20, width: 50, height: 50)))
    
    
    
    static var reuseId: String = "UsersCollectionViewCell"
    
    func setupCell(item: ModelItem) {
        imgView.image = UIImage(named: item.image ?? "")
        
        addSubview(imgView)
        
    }
}
