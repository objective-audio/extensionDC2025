import Foundation
import Combine

final class PassthroughSubjectBufferedSample {
    private let subject: PassthroughSubject<Int, Never>
    private let task: Task<Void, Never>
    
    init() {
        print("PassthroughSubjectBufferedSample init start")
        subject = PassthroughSubject<Int, Never>()
        
        let values = subject.buffer(size: 10, prefetch: .byRequest, whenFull: .dropOldest).values
        var iterator = values.makeAsyncIterator()
        
        task = Task {
            while let value = await iterator.next() {
                print("PassthroughSubjectBufferedSample value: \(value)")
            }
        }
        
        // 受信できる
        subject.send(0)
    }
    
    deinit { 
        task.cancel()
        print("PassthroughSubjectBufferedSample deinit end")
    }
    
    func send(_ values: [Int]) {
        for value in values {
            subject.send(value)
        }
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
    
    func sendBatch() {
        // バッファより少し大きい数（15個）を送信
        let values = Array(100...115)
        send(values)
    }
}
