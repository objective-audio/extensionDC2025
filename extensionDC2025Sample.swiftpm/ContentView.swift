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
                
                NavigationLink(destination: NotificationCenterLateObserverSampleView()) {
                    VStack(alignment: .leading) {
                        Text("NotificationCenter Late Observer")
                            .font(.headline)
                        Text("notifications取得前にpostされた通知は受信できない")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                NavigationLink(destination: NotificationCenterEarlyObserverSampleView()) {
                    VStack(alignment: .leading) {
                        Text("NotificationCenter Early Observer")
                            .font(.headline)
                        Text("notifications取得後にpostされた通知は受信できる")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Concurrency Samples")
        }
    }
}
