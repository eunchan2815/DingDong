//
//  DateSelectionViewModel.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//


import SwiftUI

class DateSelectionViewModel: ObservableObject {
    @Published var displayDate: Date
    @Published var selectedDate: Date
    
    private let helper = CalendarHelper()
    
    init(selectedDate: Date) {
        self.selectedDate = selectedDate
        self.displayDate = selectedDate
    }
    
    var monthYearString: String {
        helper.monthYearString(from: displayDate)
    }
    
    var selectedDateString: String {
        helper.selectedDateString(from: selectedDate)
    }
    
    var calendarDays: [Int] {
        helper.daysInMonth(for: displayDate)
    }
    
    func isSelected(_ day: Int) -> Bool {
        guard let date = helper.date(for: day, in: displayDate) else { return false }
        return Calendar.current.isDate(date, inSameDayAs: selectedDate)
    }
    
    func select(_ day: Int) {
        if let date = helper.date(for: day, in: displayDate) {
            selectedDate = Calendar.current.startOfDay(for: date)
        }
    }
    
    func previousMonth() {
        if let newDate = Calendar.current.date(byAdding: .month, value: -1, to: displayDate) {
            displayDate = newDate
        }
    }
    
    func nextMonth() {
        if let newDate = Calendar.current.date(byAdding: .month, value: 1, to: displayDate) {
            displayDate = newDate
        }
    }
}
