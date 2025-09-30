import SwiftUI

enum SampleDestination: Hashable {
    case asyncStream
    case notificationCenterLate
    case notificationCenterEarly
    case passthroughSubject
}

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                Button {
                    navigationPath.append(SampleDestination.asyncStream)
                } label: {
                    VStack(alignment: .leading) {
                        Text("AsyncStream Sample")
                            .font(.headline)
                        Text("AsyncStreamの動作確認")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Button {
                    navigationPath.append(SampleDestination.notificationCenterLate)
                } label: {
                    VStack(alignment: .leading) {
                        Text("NotificationCenter Late Observer")
                            .font(.headline)
                        Text("notifications取得前にpostされた通知は受信できない")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Button {
                    navigationPath.append(SampleDestination.notificationCenterEarly)
                } label: {
                    VStack(alignment: .leading) {
                        Text("NotificationCenter Early Observer")
                            .font(.headline)
                        Text("notifications取得後にpostされた通知は受信できる")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Button {
                    navigationPath.append(SampleDestination.passthroughSubject)
                } label: {
                    VStack(alignment: .leading) {
                        Text("PassthroughSubject Sample")
                            .font(.headline)
                        Text("values受信処理開始前に送信された値は受信できない")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Concurrency Samples")
            .navigationDestination(for: SampleDestination.self) { destination in
                switch destination {
                case .asyncStream:
                    AsyncStreamSampleView()
                case .notificationCenterLate:
                    NotificationCenterLateObserverSampleView()
                case .notificationCenterEarly:
                    NotificationCenterEarlyObserverSampleView()
                case .passthroughSubject:
                    PassthroughSubjectLateObserverSampleView()
                }
            }
        }
    }
}
