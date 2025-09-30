import SwiftUI

struct CurrentValueSubjectSampleView: View {
    let sample = CurrentValueSubjectSample()
    @State private var currentValue: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                currentValue += 1
                sample.send(currentValue)
            }
            
            Button("Send Batch (10 values)") {
                sample.sendBatch()
            }
            
            Button("Finish Stream") {
                sample.finish()
            }
            .foregroundColor(.red)
        }
        .navigationTitle("CurrentValueSubject")
    }
}
