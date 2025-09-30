import Foundation

final class NotificationCenterSample {
    private static let notificationCenter = NotificationCenter.default
    private static let notificationName = Notification.Name("SampleNotification")
    private let task: Task<Void, Never>
    
    init() {
        // AsyncSequenceを返すnotifications関数を使用
        task = Task {
            let notifications = Self.notificationCenter.notifications(named: Self.notificationName)
            for await notification in notifications {
                if let userInfo = notification.userInfo,
                   let message = userInfo["message"] as? String {
                    print("NotificationCenterSample received: \(message)")
                }
            }
        }
        
        // 受信できない
        sendNotification(message: "initialized")
    }
    
    deinit {
        task.cancel()
    }
    
    func sendNotification(message: String) {
        Self.notificationCenter.post(
            name: Self.notificationName,
            object: nil,
            userInfo: ["message": message]
        )
    }
    
    func sendNotification(intValue: Int) {
        sendNotification(message: "Value: \(intValue)")
    }
}
