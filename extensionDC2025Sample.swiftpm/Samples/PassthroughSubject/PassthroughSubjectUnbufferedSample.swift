import Foundation
import Combine

enum WaitMethod {
    case none
    case yield
    case sleep(seconds: Double)
}

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
            // 1つも受信できない可能性あり
            send(Array(-10..<0))
        }
    }
    
    deinit { 
        task.cancel()
        print("PassthroughSubjectUnbufferedSample deinit end")
    }
    
    func send(_ values: [Int], wait: WaitMethod = .none) {
        // 受信側で待機していれば一つは受信できる
        for value in values {
            subject.send(value)
            switch wait {
            case .none:
                break
            case .yield:
                Task.yield()
            case .sleep(let seconds):
                try? await Task.sleep(for: .seconds(seconds))
            }
        }
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
    
}
