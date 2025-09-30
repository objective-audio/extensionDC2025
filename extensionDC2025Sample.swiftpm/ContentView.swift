import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: AsyncStreamSampleView()) {
                    VStack(alignment: .leading) {
                        Text("AsyncStream Sample")
                            .font(.headline)
                        Text("AsyncStreamの動作確認")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Concurrency Samples")
        }
    }
}
