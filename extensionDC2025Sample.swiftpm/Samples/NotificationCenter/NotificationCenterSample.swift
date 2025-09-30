import Foundation

final class NotificationCenterSample {
    private let notificationCenter = NotificationCenter.default
    private let notificationName = Notification.Name("SampleNotification")
    private var observer: NSObjectProtocol?
    
    init() {
        // NotificationCenterのnotificationsを使用して通知を監視
        observer = notificationCenter.addObserver(
            forName: notificationName,
            object: nil,
            queue: .main
        ) { notification in
            if let userInfo = notification.userInfo,
               let message = userInfo["message"] as? String {
                print("NotificationCenterSample received: \(message)")
            }
        }
        
        print("NotificationCenterSample initialized")
    }
    
    deinit {
        if let observer = observer {
            notificationCenter.removeObserver(observer)
        }
        print("NotificationCenterSample deinitialized")
    }
    
    func sendNotification(message: String) {
        notificationCenter.post(
            name: notificationName,
            object: nil,
            userInfo: ["message": message]
        )
    }
    
    func sendNotificationWithValue(_ value: Int) {
        sendNotification(message: "Value: \(value)")
    }
}
