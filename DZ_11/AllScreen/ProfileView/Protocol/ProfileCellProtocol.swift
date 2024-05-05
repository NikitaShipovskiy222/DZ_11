//
//  ProfileCellProtocol.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 05/05/2024.
//

import UIKit

protocol ProfileCellProtocol: AnyObject {
    static var reuseId: String {get}
    var imgView: UIImageView {get set}
    func setupProfileCell(item: ModeltemProfile)
}



