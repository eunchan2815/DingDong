import Foundation

struct CalendarHelper {
    let calendar = Calendar.current
    let locale = Locale(identifier: "ko_KR")
    
    func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    func selectedDateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = "dd-MMMM-yyyy"
        return formatter.string(from: date)
    }
    
    func daysInMonth(for date: Date) -> [Int] {
        let startOfMonth = calendar.dateInterval(of: .month, for: date)?.start ?? date
        let range = calendar.range(of: .day, in: .month, for: date) ?? 1..<32
        let numberOfDays = range.count
        
        let firstWeekday = calendar.component(.weekday, from: startOfMonth)
        let adjustedFirstWeekday = (firstWeekday + 5) % 7
        
        var days: [Int] = Array(repeating: 0, count: adjustedFirstWeekday)
        days.append(contentsOf: 1...numberOfDays)
        return days
    }
    
    func date(for day: Int, in month: Date) -> Date? {
        guard day > 0 else { return nil }
        let startOfMonth = calendar.startOfDay(for: calendar.dateInterval(of: .month, for: month)?.start ?? month)
        return calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)
    }
}

