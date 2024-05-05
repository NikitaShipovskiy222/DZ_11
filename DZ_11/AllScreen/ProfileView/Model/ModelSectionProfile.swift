//
//  ModelSectionProfile.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 05/05/2024.
//

import Foundation


struct ModelSectionProfile {
    var id = UUID().uuidString
    var header: String
    var items: [ModeltemProfile]

    
    static func mockData() -> [ModelSectionProfile]{
        
        let firstSection = [
            ModeltemProfile(mainText: "Batman: Arkham Shadow — ещё один Бэтмен для VR", text: "Lorem ipsum dolor sit amet consectetur", img: "batman"),
            ModeltemProfile(mainText: "В четвёртом сезоне Diablo IV обновят систему предметов", text: "Lorem ipsum dolor sit amet consectetur", img: "diablo4"),
            ModeltemProfile(mainText: "«Фоллаут» стал вторым сериалом в истории Amazon", text: "Lorem ipsum dolor sit amet consectetur", img: "follout"),

        ]
        
        
        let secondSection = [
            
            ModeltemProfile(mainText: "Лучшие друзья", iconProfile: "image 5")
        ]
        
        let thurdSection = [
        
            ModeltemProfile(mainText: "Настройки", iconProfile: "image 6"),
            ModeltemProfile(mainText: "Конфиденциальность", iconProfile: "image 7"),
            ModeltemProfile(mainText: "Данные и память", iconProfile: "image 8"),
            ModeltemProfile(mainText: "Язык", iconProfile: "image 9")

        ]
        
        
        let fourthSection = [
        
            ModeltemProfile(mainText: "Устройсва", iconProfile: "image 10"),
            ModeltemProfile(mainText: "Папки с новостями", iconProfile: "image 11"),
            ModeltemProfile(mainText: "Оформние", iconProfile: "image 12"),
            ModeltemProfile(mainText: "Заблокированые", iconProfile: "image 13"),
            ModeltemProfile(mainText: "Подписки", iconProfile: "image 14"),
        ]
        
        let bannerSection = ModelSectionProfile(header: "Лучшие новости", items: firstSection)
        let closeFriendSection = ModelSectionProfile(header: "Друзья", items: secondSection)
        let settingsAccountSection = ModelSectionProfile(header: "Настройки", items: thurdSection)
        let lastSection = ModelSectionProfile(header: "Папки", items: fourthSection )
        
        return [bannerSection,closeFriendSection, settingsAccountSection, lastSection]
    }
    
}
