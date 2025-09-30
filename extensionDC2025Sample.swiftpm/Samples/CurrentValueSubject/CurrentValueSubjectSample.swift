import Foundation
import Combine

final class CurrentValueSubjectSample {
    private let subject: CurrentValueSubject<Int, Never>
    private let task: Task<Void, Never>
    
    init() {
        subject = CurrentValueSubject<Int, Never>(0)
        
        task = Task { [subject] in
            for await value in subject.values {
                print("CurrentValueSubjectSample value: \(value)")
            }
        }
        
        // 受信できる
        subject.send(1)
    }
    
    deinit { task.cancel() }
    
    func send(_ value: Int) {
        subject.send(value)
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
    
    func sendBatch() {
        // ほぼ受信できる
        for i in 1...10 {
            subject.send(i)
        }
    }
}
