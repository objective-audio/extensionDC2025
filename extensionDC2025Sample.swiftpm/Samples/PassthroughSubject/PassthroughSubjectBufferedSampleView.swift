import SwiftUI

struct PassthroughSubjectBufferedSampleView: View {
    let sample = PassthroughSubjectBufferedSample()
    @State private var currentValue: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                currentValue += 1
                sample.send(currentValue)
            }
            
            Button("Send Batch (15 values)") {
                sample.sendBatch()
            }
            
            Button("Finish Stream") {
                sample.finish()
            }
            .foregroundColor(.red)
        }
        .navigationTitle("PassthroughSubject")
    }
}
