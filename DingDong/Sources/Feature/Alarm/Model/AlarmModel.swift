//
//  Alarm.swift
//  DingDong
//
//  Created by 김은찬 on 8/16/25.
//

import RealmSwift
import Foundation

class AlarmObject: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var date: Date
    @Persisted var alarmTitle: String
    @Persisted var alarmDescription: String
    @Persisted var isEnabled: Bool
}

