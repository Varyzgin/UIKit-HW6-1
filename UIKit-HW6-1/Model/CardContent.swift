//
//  Card.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/2/24.
//

struct CardContent {
    let name: String
    let surname: String
    let image: String
    let header: String
    let date: String
    let text: String
        
    static func mockData() -> [CardContent] {
        [
            CardContent(name: "Dimajjbkj", surname: "Varyzginlhjhhjjhjhh dfrgnererg", image: "photo1", header: "Eagle", date: "20 мая 2024", text: "This's a really beautiful bird pictured in black and white tones. It's a great example of how to use a monochrome image to create a striking and visually appealing design."),
            CardContent(name: "Dima", surname: "V", image: "photo2", header: "Red Walls", date: "19 сентября 2024", text: "Please, look at this aesthetic photo of guy in front of red bricks wall. It's a magic of UIKit to show you this card in fantastic way.")
        ]
    }
}
