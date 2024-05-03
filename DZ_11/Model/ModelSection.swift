//
//  ModelSection.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 01/05/2024.
//

import Foundation


struct ModelSection: Identifiable {
    var id = UUID().uuidString
    var header: String
    var item: [ModelItem]
    var headerButton: String
    var footerText: String
    
    static func mockData() -> [ModelSection] {
        let firstSection = [
            ModelItem(date: Date(), mainText: "Batman: Arkham Shadow — ещё один Бэтмен для VR", text: "Lorem ipsum dolor sit amet consectetur", image: "batman" ),
            ModelItem(date: Date(), mainText: "В четвёртом сезоне Diablo IV обновят систему предметов", text: "Lorem ipsum dolor sit amet consectetur", image: "diablo4" ),
            ModelItem(date: Date(), mainText: "«Фоллаут» стал вторым сериалом в истории Amazon", text: "Lorem ipsum dolor sit amet consectetur", image: "follout" )
            ]
        
        let secondSection = [
        ModelItem(text: "Вас пригласили", icon: "instagram"),
        ModelItem(text: "Вас отметили", icon: "facebook"),
        ModelItem(text: "Вам письмо", icon: "gmail"),
        ModelItem(text: "Ответь пожалуйста",  icon: "vkicon"),
        ModelItem(text: "Вас отметили",  icon: "twitter"),
        ModelItem(text: "Штраф за превышение",  icon: "police")
        ]
        
        let thindSecond = [
        ModelItem(name: "Ilya", text: "Lorem ipsum dolor sit amet consectetur", image: "1"),
        ModelItem(name: "Pasha", text: "Lorem ipsum dolor sit amet consectetur", image: "2"),
        ModelItem(name: "Fill", text: "Lorem ipsum dolor sit amet consectetur", image: "3"),
        ModelItem(name: "Roma", text: "Lorem ipsum dolor sit amet consectetur", image: "4")
        ]
        
        let newSection = ModelSection(header: "Новости", item: firstSection, headerButton: "listdz", footerText: "Lorem ipsum dolor sit amet consectetur. Enim suspendisse accumsan sed augue interdum velit aliquam lobortis donec.")
        let eventsSecotion = ModelSection(header: "События", item: secondSection, headerButton: "Подробнее", footerText: "")
        let userSection = ModelSection(header: "Пользователи", item: thindSecond, headerButton: "Показать все", footerText: "")
        
        return [newSection, eventsSecotion, userSection]
    }
}
