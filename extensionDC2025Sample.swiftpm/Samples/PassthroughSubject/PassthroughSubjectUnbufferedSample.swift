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
        Task {
            for value in values {
                subject.send(value)
                switch wait {
                case .none:
                    // 待ちを入れなければ受信できないか、1個程度受信できる
                    break
                case .yield:
                    // yieldを入れただけでは取りこぼすことが多い
                    await Task.yield()
                case .sleep(let seconds):
                    // sleepを入れた場合、受信側がそれより十分に軽ければ受信できる
                    try? await Task.sleep(for: .seconds(seconds))
                }
            }
        }
    }
    
    func finish() {
        subject.send(completion: .finished)
    }
    
}
