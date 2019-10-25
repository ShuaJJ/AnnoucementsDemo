//
//  ContentView.swift
//  AnnoucementLabel
//
//  Created by Joshua Jiang on 2019/10/24.
//  Copyright © 2019 JoshuaJ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // 相当于UINavigationController
        NavigationView() {
            // 在NavigationView之内添加NavigationLink就相当于navigationController.push()
            NavigationLink(destination: AnnoucementView()) {
                Text("Go to annoucements")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
