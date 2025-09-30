import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Concurrency Samples") {
                    NavigationLink(destination: AsyncStreamSampleView()) {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("AsyncStream Sample")
                                    .font(.headline)
                                Text("AsyncStreamの動作確認")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Concurrency Samples")
        }
    }
}
