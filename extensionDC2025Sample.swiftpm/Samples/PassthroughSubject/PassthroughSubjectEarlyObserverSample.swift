import Foundation
import Combine

final class PassthroughSubjectEarlyObserverSample {
    private let subject: PassthroughSubject<Int, Never>
    private let task: Task<Void, Never>
    
    init() {
        subject = PassthroughSubject<Int, Never>()
        
        // valuesからmakeAsyncIteratorでIteratorを作成
        let iterator = subject.values.makeAsyncIterator()
        
        task = Task { [subject] in
            while let value = await iterator.next() {
                print("PassthroughSubjectEarlyObserverSample value: \(value)")
            }
        }
        
        // 受信できる
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
