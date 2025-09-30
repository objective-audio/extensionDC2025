import SwiftUI

enum SampleDestination: Hashable {
    case asyncStream
    case notificationCenterLate
    case notificationCenterEarly
    case passthroughSubjectUnbuffered
    case passthroughSubjectBuffered
    case currentValueSubject
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
                    navigationPath.append(SampleDestination.passthroughSubjectUnbuffered)
                } label: {
                    VStack(alignment: .leading) {
                        Text("PassthroughSubject Unbuffered")
                            .font(.headline)
                        Text("何も対策をしていないまま使用")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Button {
                    navigationPath.append(SampleDestination.passthroughSubjectBuffered)
                } label: {
                    VStack(alignment: .leading) {
                        Text("PassthroughSubject Buffered")
                            .font(.headline)
                        Text("バッファやIteratorなどの対策をした")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Button {
                    navigationPath.append(SampleDestination.currentValueSubject)
                } label: {
                    VStack(alignment: .leading) {
                        Text("CurrentValueSubject Sample")
                            .font(.headline)
                        Text("初期値を持つSubjectの動作確認")
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
                case .passthroughSubjectUnbuffered:
                    PassthroughSubjectUnbufferedSampleView()
                case .passthroughSubjectBuffered:
                    PassthroughSubjectBufferedSampleView()
                case .currentValueSubject:
                    CurrentValueSubjectSampleView()
                }
            }
        }
    }
}
