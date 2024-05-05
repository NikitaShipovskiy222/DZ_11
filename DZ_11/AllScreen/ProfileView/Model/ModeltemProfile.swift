//
//  ModeItem.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 05/05/2024.
//

import Foundation


struct ModeltemProfile: Identifiable {
    var id = UUID().uuidString
    var mainText: String
    var text: String? = nil
    var iconProfile: String? = nil
    var header: String? = nil
    var img: String? = nil
}
