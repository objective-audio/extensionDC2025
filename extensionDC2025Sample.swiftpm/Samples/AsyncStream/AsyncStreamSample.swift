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
    
    func send(_ values: [Int]) {
        // 配列の値をまとめて送信
        for value in values {
            continuation.yield(value)
        }
    }
    
    func finish() {
        continuation.finish()
    }
}
