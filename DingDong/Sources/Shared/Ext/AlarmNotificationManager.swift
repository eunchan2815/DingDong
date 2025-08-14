//
//  AlarmNotificationManager.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import Foundation
import UserNotifications

class AlarmNotificationManager: ObservableObject {
    static let shared = AlarmNotificationManager()
    
    private init() {}
    
    // 알림 권한 요청
    func requestNotificationPermission() async -> Bool {
        let center = UNUserNotificationCenter.current()
        
        do {
            let granted = try await center.requestAuthorization(options: [.alert, .sound, .badge])
            return granted
        } catch {
            print("알림 권한 요청 실패: \(error)")
            return false
        }
    }
    
    // 알람 설정
    func scheduleAlarm(for date: Date, title: String = "딩동! 알람", body: String = "설정하신 시간입니다.") async {
        let center = UNUserNotificationCenter.current()
        
        // 권한 확인
        let settings = await center.notificationSettings()
        guard settings.authorizationStatus == .authorized else {
            print("알림 권한이 없습니다.")
            return
        }
        
        // 알림 내용 설정
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        content.badge = 1
        
        // 트리거 설정 (특정 날짜/시간)
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // 알림 요청 생성
        let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // 알림 등록
        do {
            try await center.add(request)
            print("알람이 설정되었습니다: \(date)")
            
            // 설정된 알림 확인 (디버깅용)
            let pendingNotifications = await center.pendingNotificationRequests()
            print("현재 등록된 알림 개수: \(pendingNotifications.count)")
        } catch {
            print("알람 설정 실패: \(error)")
        }
    }
    
    // 모든 알람 취소
    func cancelAllAlarms() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("모든 알람이 취소되었습니다.")
    }
    
    // 특정 알람 취소
    func cancelAlarm(identifier: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        print("알람이 취소되었습니다: \(identifier)")
    }
    
    // 등록된 알람 목록 조회
    func getPendingAlarms() async -> [UNNotificationRequest] {
        let center = UNUserNotificationCenter.current()
        return await center.pendingNotificationRequests()
    }
}
