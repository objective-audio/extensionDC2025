import Foundation

final class NotificationCenterSample {
    private static let notificationCenter = NotificationCenter.default
    private static let notificationName = Notification.Name("SampleNotification")
    private let task: Task<Void, Never>
    
    init() {
        // AsyncSequenceを返すnotifications関数を使用
        task = Task {
            for await notification in Self.notificationCenter.notifications(named: Self.notificationName) {
                if let userInfo = notification.userInfo,
                   let message = userInfo["message"] as? String {
                    print("NotificationCenterSample received: \(message)")
                }
            }
        }
        
        print("NotificationCenterSample initialized")
    }
    
    deinit {
        task.cancel()
        print("NotificationCenterSample deinitialized")
    }
    
    func sendNotification(message: String) {
        Self.notificationCenter.post(
            name: Self.notificationName,
            object: nil,
            userInfo: ["message": message]
        )
    }
    
    func sendNotificationWithValue(_ value: Int) {
        sendNotification(message: "Value: \(value)")
    }
}
