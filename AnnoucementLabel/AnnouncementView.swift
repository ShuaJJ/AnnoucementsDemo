//
//  AnnoucementView.swift
//  AnnoucementLabel
//
//  Created by Joshua Jiang on 2019/10/24.
//  Copyright © 2019 JoshuaJ. All rights reserved.
//

import SwiftUI

// MVVM中的V(View)部分
struct AnnoucementView: View {
    
    // 只有用@ObservedObject来wrap上面定义的ObservableObject，才会根据@Published的属性的更新来刷新
    @ObservedObject var viewModel = AnnouncementViewModel()
    private let interval: TimeInterval = 1.0
    
    /*** TODO - not working
     * 从左面平移消失，从右边进来的动画
    ***/
    var transition: AnyTransition {
        AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    }
    
    var body: some View {
        VStack {
            Text("Demo")
            Divider()
            // 因为announcement是optional，SwiftUI不能Optional Binding，所以这算是一个cheat的方法来
            // Unwrap optional
            viewModel.announcement.map {
                Text($0.title)
                    .transition(transition)
            }
        }
        .onAppear() {
            self.viewModel.startTimer(interval: self.interval)
        }
        .onDisappear() {
            self.viewModel.cancelTimer()
        }
    }
    
}

struct AnnoucementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnoucementView()
    }
}
