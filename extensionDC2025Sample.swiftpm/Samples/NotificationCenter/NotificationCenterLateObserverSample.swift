import Foundation

final class NotificationCenterLateObserverSample {
    private static let notificationCenter = NotificationCenter.default
    private static let notificationName = Notification.Name("SampleNotification")
    private let task: Task<Void, Never>
    
    init() {
        print("NotificationCenterLateObserverSample init start")
        task = Task {
            let notifications = Self.notificationCenter.notifications(named: Self.notificationName)
            for await notification in notifications {
                if let userInfo = notification.userInfo,
                   let message = userInfo["message"] as? String {
                    print("NotificationCenterLateObserverSample received: \(message)")
                }
            }
        }
        
        // 受信できない
        sendNotification(message: "initialized")
    }
    
    deinit {
        task.cancel()
        print("NotificationCenterLateObserverSample deinit end")
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
