//
//  Period.swift
//  AnnoucementLabel
//
//  Created by Joshua Jiang on 2019/10/24.
//  Copyright © 2019 JoshuaJ. All rights reserved.
//

import Foundation
import Combine

// MVVM中的VM(ViewModel) - 连接View和Model，主要是Model的数据转化成能在View中显示的形式
// conform to ObservableObject，这样class中用@Published wrap的properties每次更新都会通知使用此class的View
class AnnouncementViewModel: ObservableObject {
    @Published private(set) var announcement : Announcement?
    // 用于储存publisher，如果一个订阅没有被储存在variable或者像这个数组中的话，在代码第一次运行完的时候就会被cancel
    private var subscriptions: [AnyCancellable] = []
    
    func startTimer(interval: TimeInterval) {
        var counter = 0
        let announcements = createAnnouncements()
        Timer
            .publish(every: interval, on: .main, in: .common)
            // timer publisher只有call connect()之后才会开始发送，autoconnect就是只要用subscriber就自动开始
            .autoconnect()
            // debug用，打印出每个事件
            .print()
            .sink(receiveValue: { _ in
                counter += 1
                if counter == Announcement.MaxCount {
                    counter = 0
                }
                // 每秒更新一次，相对应的view也会刷新用到这个属性的部分
                self.announcement = announcements[counter]
        })
            // 用store来把这个subscription储存到数组中，以防被cancel
        .store(in: &subscriptions)
    }
    
    func cancelTimer() {
        // 为了性能和c内存，在不用的时候把subscriptions给cancel
        for cancellable in subscriptions {
            cancellable.cancel()
        }
    }
    
    func createAnnouncements() -> [Announcement] {
        var result = [Announcement]()
        for i in (1...Announcement.MaxCount) {
            let announcement = Announcement(id: i, title: "I am title \(i)")
            result.append(announcement)
        }
        return result
    }
}
