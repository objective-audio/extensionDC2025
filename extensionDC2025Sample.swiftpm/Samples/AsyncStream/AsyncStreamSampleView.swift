import SwiftUI

struct AsyncStreamSampleView: View {
    @State private var sample: AsyncStreamSample?
    @State private var currentValue: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                currentValue += 1
                sample?.send(currentValue)
            }
            .disabled(sample == nil)
            
            Button("Send +10") {
                currentValue += 10
                sample?.send(currentValue)
            }
            .disabled(sample == nil)
            
            Button("Finish Stream") {
                sample?.finish()
                sample = nil
            }
            .disabled(sample == nil)
        }
        .navigationTitle("AsyncStream")
        .onAppear {
            sample = AsyncStreamSample()
        }
        .onDisappear {
            sample?.finish()
            sample = nil
        }
    }
}
