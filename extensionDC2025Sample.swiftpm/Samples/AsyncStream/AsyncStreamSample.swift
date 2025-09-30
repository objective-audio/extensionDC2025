import Foundation

final class AsyncStreamSample {
    private let stream: AsyncStream<Int>
    private let continuation: AsyncStream<Int>.Continuation
    private let task: Task<Void, Never>
    
    init() {
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
    
    deinit { task.cancel() }
    
    func send(_ value: Int) {
        continuation.yield(value)
    }
    
    func finish() {
        continuation.finish()
    }
}
