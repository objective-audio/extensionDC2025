import SwiftUI

struct CurrentValueSubjectSampleView: View {
    let sample = CurrentValueSubjectSample()
    @State private var currentValue: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                sample.send([currentValue])
                currentValue += 1
            }
            
            Button("Send Batch (10 values)") {
                let values = Array(currentValue..<(currentValue + 10))
                sample.send(values)
                currentValue += 10
            }
            
            Button("Finish Stream") {
                sample.finish()
            }
            .foregroundColor(.red)
        }
        .navigationTitle("CurrentValueSubject")
    }
}
