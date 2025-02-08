//
//  Video.swift
//  swiftui
//
//  Created by Tharin KRUY on 8/2/25.
//


import Foundation


struct Video: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var uploadDate: String
}



struct VideoList {
    static let topFive = [
        Video(imageName: "shanks", title: "the king shanks", uploadDate: "Jan 4, 2004"),
        Video(imageName: "usopp", title: "the king of pirate", uploadDate: "Jan 4, 2004"),
        Video(imageName: "nami", title: "the king shanks", uploadDate: "Jan 4, 2004"),
        Video(imageName: "zoro", title: "the king shanks", uploadDate: "Jan 4, 2004"),
        Video(imageName: "sanji", title: "the king shanks", uploadDate: "Jan 4, 2004"),
    ]
}
