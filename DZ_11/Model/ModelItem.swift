//
//  modelItem.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 01/05/2024.
//

import Foundation

struct ModelItem: Identifiable {
    var id = UUID().uuidString
    var name: String? = nil
    var date: Date? = nil
    var mainText: String? = nil
    var text: String
    var header: String? = nil
    var headerButton: String? = nil
    var footerText: String? = nil
    var icon: String? = nil
    var image: String? = nil
}
