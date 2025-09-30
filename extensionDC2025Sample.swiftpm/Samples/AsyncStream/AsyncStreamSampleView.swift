import SwiftUI

struct AsyncStreamSampleView: View {
    let sample = AsyncStreamSample()
    @State private var currentValue: Int = 0
    @State private var isFinished = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                currentValue += 1
                sample.send(currentValue)
            }
            .disabled(isFinished)
            
            Button("Send +10") {
                currentValue += 10
                sample.send(currentValue)
            }
            .disabled(isFinished)
            
            Button("Finish Stream") {
                sample.finish()
                isFinished = true
            }
            .disabled(isFinished)
            
            if isFinished {
                Text("Stream finished - sending after finish won't be received")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("AsyncStream")
    }
}
