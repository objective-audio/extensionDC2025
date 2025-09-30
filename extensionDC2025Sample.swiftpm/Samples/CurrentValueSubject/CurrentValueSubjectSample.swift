import Foundation
import Combine

final class CurrentValueSubjectSample {
    private let subject: CurrentValueSubject<Int, Never>
    private let task: Task<Void, Never>
    
    init() {
        print("CurrentValueSubjectSample init start")
        subject = CurrentValueSubject<Int, Never>(0)
        
        let values = subject.values
        
        task = Task {
            for await value in values {
                print("CurrentValueSubjectSample value: \(value)")
            }
        }
        
        // 受信できない
        subject.send(-1)
        // 受信できる
        subject.send(0)
    }
    
    deinit { 
        task.cancel()
        print("CurrentValueSubjectSample deinit end")
    }
    
    func send(_ values: [Int]) {
        for value in values {
            subject.send(value)
        }
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
    
}
