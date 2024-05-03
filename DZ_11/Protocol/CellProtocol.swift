//
//  CellProtocol.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 02/05/2024.
//

import UIKit

protocol CellProtocol: AnyObject {
    static var reuseId: String {get}
    var imgView: UIImageView {get set}
    func setupCell(item: ModelItem)
}
