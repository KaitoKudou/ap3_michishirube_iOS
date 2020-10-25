//
//  NaviTimeSelectPresenter.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/29.
//

import Foundation

class NaviTimeSelectPresenter {
    let settingKey = "time" // UserDafaultを使う時のキー
    let userDefaults = UserDefaults.standard
    
    // UIDatePickerViewから時間と分を取得
    // 入力された時間を分に直して、80%にする
    func format(date: Date) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        var hoursToMinutes = 0
        
        if hour > 0 {
            hoursToMinutes = hour * 60
            userDefaults.register(defaults: [settingKey: (hoursToMinutes + minute) * 4 / 5])
        } else {
            userDefaults.register(defaults: [settingKey: minute * 4 / 5])
        }
    }
}
