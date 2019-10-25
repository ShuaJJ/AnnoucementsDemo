//
//  File.swift
//  AnnoucementLabel
//
//  Created by Joshua Jiang on 2019/10/25.
//  Copyright © 2019 JoshuaJ. All rights reserved.
//

import Foundation

// MVVM中的M(Model)部分
// conform to Identifiable，必须要有一个id属性，这样才可以用在Swift中的List(相当于UIKit的TableView)
struct Announcement: Identifiable {
    static let MaxCount: Int = 3
    
    let id: Int
    let title: String
}
