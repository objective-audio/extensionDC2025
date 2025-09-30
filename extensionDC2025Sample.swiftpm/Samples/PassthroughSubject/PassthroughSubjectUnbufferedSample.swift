import Foundation
import Combine

final class PassthroughSubjectUnbufferedSample {
    private let subject: PassthroughSubject<Int, Never>
    private let task: Task<Void, Never>
    
    init() {
        print("PassthroughSubjectUnbufferedSample init start")
        subject = PassthroughSubject<Int, Never>()
        
        let values = subject.values
        
        task = Task {
            for await value in values {
                print("PassthroughSubjectUnbufferedSample received : \(value)")
            }
        }
        
        // 受信できない
        subject.send(0)
        
        Task {
            for i in 1...10 {
                // ほぼ受信できない
                self.subject.send(i)
            }
        }
    }
    
    deinit { 
        task.cancel()
        print("PassthroughSubjectUnbufferedSample deinit end")
    }
    
    func send(_ values: [Int]) {
        for value in values {
            // 受信側で待機していて単独で送信する分には受信できる
            subject.send(value)
        }
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
    
}
