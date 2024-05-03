//
//  Date.ext.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 02/05/2024.
//

import Foundation


extension Date {
    
    func makeDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YY"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: self)
    }
}
