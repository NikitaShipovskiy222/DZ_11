//
//  model.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 03/05/2024.
//

import Foundation


struct ItemMessenge {
    
    var id = UUID().uuidString
    var image: String
    var name: String
    var discription: String
    
    static func mockData() -> [ItemMessenge] {
        
        [
            ItemMessenge(image: "1", name: "Nikita", discription: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"),
            ItemMessenge(image: "2", name: "Fill", discription: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"),
            ItemMessenge(image: "3", name: "Rasul", discription: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"),
            ItemMessenge(image: "4", name: "Farid", discription: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"),
    
        ]
    }
}
