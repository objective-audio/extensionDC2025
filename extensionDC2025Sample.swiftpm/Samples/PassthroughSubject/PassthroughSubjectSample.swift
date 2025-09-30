import Foundation
import Combine

final class PassthroughSubjectSample {
    private let subject: PassthroughSubject<Int, Never>
    private let task: Task<Void, Never>
    
    init() {
        subject = PassthroughSubject<Int, Never>()
        
        task = Task { [subject] in
            for await value in subject.values {
                print("PassthroughSubjectSample value: \(value)")
            }
        }
        
        subject.send(0)
    }
    
    deinit { task.cancel() }
    
    func send(_ value: Int) {
        subject.send(value)
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
}
