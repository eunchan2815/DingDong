//
//  AlarmItem.swift
//  DingDong
//
//  Created by 김은찬 on 8/12/25.
//

import SwiftUI
import RealmSwift

struct AlarmItem: View {
    @ObservedRealmObject var alarm: AlarmObject
    
    var body: some View {
        ZStack {
            VStack {
                Color.clear.frame(height: 50)
                HStack {
                    Image(.clock)
                    Spacer()
                }
                .padding(.trailing, 240)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(alarm.date.formatted(date: .abbreviated, time: .omitted))
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(alarm.isEnabled ? Color.white : Color.black)
                        .animation(.easeInOut(duration: 0.3), value: alarm.isEnabled)
                    
                    Text(alarm.date.formatted(date: .omitted, time: .shortened))
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(alarm.isEnabled ? Color.white : Color.black)
                        .animation(.easeInOut(duration: 0.3), value: alarm.isEnabled)
                }
                
                Spacer()
                
                Toggle("", isOn: Binding(
                    get: { alarm.isEnabled },
                    set: { newValue in
                        if let realm = alarm.realm {
                            try? realm.write {
                                alarm.isEnabled = newValue
                            }
                        }
                    }
                ))
                .toggleStyle(CustomToggleStyle())
                .scaleEffect(0.8)
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: alarm.isEnabled)
            }
            .padding(.horizontal, 40)
        }
        .frame(width: 360, height: 120)
        .background(alarm.isEnabled ? Color.main : Color.white)
        .clipShape(size: 20)
        .animation(.easeInOut(duration: 0.3), value: alarm.isEnabled)
    }
}

