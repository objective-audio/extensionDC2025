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
                
                NavigationLink(destination: NotificationCenterSampleView()) {
                    VStack(alignment: .leading) {
                        Text("NotificationCenter Sample")
                            .font(.headline)
                        Text("NotificationCenterの動作確認")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Concurrency Samples")
        }
    }
}
