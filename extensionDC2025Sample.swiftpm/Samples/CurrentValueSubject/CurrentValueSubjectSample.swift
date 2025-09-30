import Foundation
import Combine

final class CurrentValueSubjectSample {
    private let subject: CurrentValueSubject<Int, Never>
    private let task: Task<Void, Never>
    
    init() {
        print("CurrentValueSubjectSample init start")
        subject = CurrentValueSubject<Int, Never>(0)
        
        task = Task { [subject] in
            for await value in subject.values {
                print("CurrentValueSubjectSample value: \(value)")
            }
        }
        
        // 受信できない
        subject.send(0)
        // 受信できる
        subject.send(1)
    }
    
    deinit { 
        task.cancel()
        print("CurrentValueSubjectSample deinit end")
    }
    
    func send(_ value: Int) {
        subject.send(value)
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
    
    func sendBatch() {
        // 少なくとも最後は受信できる
        for i in 101...110 {
            subject.send(i)
        }
    }
}
