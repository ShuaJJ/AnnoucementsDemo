//
//  TestView.swift
//  AnnoucementLabel
//
//  Created by Joshua Jiang on 2019/10/25.
//  Copyright © 2019 JoshuaJ. All rights reserved.
//

import SwiftUI

struct TestView: View {
    
    @ObservedObject var viewModel = AnnouncementViewModel()
    
    var body: some View {
        Text(viewModel.announcement!.title)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
