import Foundation
import Combine

final class PassthroughSubjectUnbufferedSample {
    private let subject: PassthroughSubject<Int, Never>
    private let task: Task<Void, Never>
    
    init() {
        subject = PassthroughSubject<Int, Never>()
        
        task = Task { [subject] in
            for await value in subject.values {
                print("PassthroughSubjectUnbufferedSample value: \(value)")
            }
        }
        
        // 受信できない
        subject.send(0)
        
        Task {
            for i in 1...10 {
                // おそらく受信できない
                self.subject.send(i)
            }
        }
    }
    
    deinit { task.cancel() }
    
    func send(_ value: Int) {
        // 受信側で待機していて単独で送信する分には受信できる
        subject.send(value)
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
}
