import Foundation

final class AsyncStreamSample {
    private let stream: AsyncStream<Int>
    private let continuation: AsyncStream<Int>.Continuation
    private let task: Task<Void, Never>
    
    init() {
        print("AsyncStreamSample init start")
        let (stream, continuation) = AsyncStream<Int>.makeStream()
        
        self.stream = stream
        self.continuation = continuation
        
        task = Task {
            for await value in stream {
                print("AsyncStreamSample received : \(value)")
            }
        }
        
        continuation.yield(0)
        
        continuation.onTermination = { _ in
            print("AsyncStreamSample onTermination")
        }
    }
    
    deinit { 
        task.cancel()
        print("AsyncStreamSample deinit end")
    }
    
    func send(_ value: Int) {
        continuation.yield(value)
    }
    
    func finish() {
        continuation.finish()
    }
    
    func sendBatch(startValue: Int) {
        // 10個まとめて送信
        for i in startValue..<(startValue + 10) {
            continuation.yield(i)
        }
    }
}
