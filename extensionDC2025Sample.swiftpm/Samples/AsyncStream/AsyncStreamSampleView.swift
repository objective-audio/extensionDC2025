import SwiftUI

struct AsyncStreamSampleView: View {
    private let sample = AsyncStreamSample()
    @State private var currentValue: Int = 0
    @State private var isStreamActive = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
                .font(.title2)
                .foregroundColor(.blue)
            
            HStack(spacing: 20) {
                Button("Send +1") {
                    currentValue += 1
                    sample.send(currentValue)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Send +10") {
                    currentValue += 10
                    sample.send(currentValue)
                }
                .buttonStyle(.bordered)
                
                Button("Finish Stream") {
                    sample.finish()
                    isStreamActive = false
                }
                .buttonStyle(.bordered)
                .foregroundColor(.red)
            }
            
            if isStreamActive {
                Text("Stream is active - check console for output")
                    .font(.caption)
                    .foregroundColor(.green)
            } else {
                Text("Stream finished")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("AsyncStream")
        .navigationBarTitleDisplayMode(.inline)
    }
}
