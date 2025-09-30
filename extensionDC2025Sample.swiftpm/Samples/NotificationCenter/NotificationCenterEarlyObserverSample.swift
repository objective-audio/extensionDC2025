import Foundation

final class NotificationCenterEarlyObserverSample {
    private static let notificationCenter = NotificationCenter.default
    private static let notificationName = Notification.Name("EarlyObserverNotification")
    private let task: Task<Void, Never>
    
    init() {
        print("NotificationCenterEarlyObserverSample init start")
        // notificationsの取得をTaskの前で行う
        let notifications = Self.notificationCenter.notifications(named: Self.notificationName)
        
        task = Task {
            for await notification in notifications {
                if let userInfo = notification.userInfo,
                   let message = userInfo["message"] as? String {
                    print("NotificationCenterEarlyObserverSample received: \(message)")
                }
            }
        }
        
        // 受信できる
        sendNotification(message: "initialized")
    }
    
    deinit {
        task.cancel()
        print("NotificationCenterEarlyObserverSample deinit end")
    }
    
    func send(_ messages: [String]) {
        for message in messages {
            Self.notificationCenter.post(
                name: Self.notificationName,
                object: nil,
                userInfo: ["message": message]
            )
        }
    }
    
    func sendNotification(message: String) {
        send([message])
    }
    
    func sendNotification(intValue: Int) {
        sendNotification(message: "Value: \(intValue)")
    }
    
}
