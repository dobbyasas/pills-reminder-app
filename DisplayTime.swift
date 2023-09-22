import Foundation

let calendar = Calendar.current

func secondsUntil(time: String) -> TimeInterval? {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mma"
    
    guard let targetDate = formatter.date(from: time) else {
        print("Failed to parse time.")
        return nil
    }
    
    let now = Date()
    if let nextTargetDate = calendar.nextDate(after: now, matching: DateComponents(hour: calendar.component(.hour, from: targetDate), minute: calendar.component(.minute, from: targetDate)), matchingPolicy: .nextTime) {
        return nextTargetDate.timeIntervalSince(now)
    }
    return nil
}

let scheduledTime = "1:30AM" // Set your time here
let messageToDisplay = "It's time!"

if let duration = secondsUntil(time: scheduledTime) {
    print("Waiting until \(scheduledTime)...")
    sleep(UInt32(duration))
    print(messageToDisplay)
} else {
    print("Failed to calculate wait duration.")
}
