import SwiftUI

struct CrashSampleView: View {
    let sample = CrashSample()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Crash Sample")
                .font(.title2)
                .foregroundColor(.red)
            
            Text("このサンプルを実行するとクラッシュします")
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
            
            Button("Crash App") {
                sample.crash()
            }
            .foregroundColor(.red)
            .font(.title3)
        }
        .navigationTitle("Crash Sample")
    }
}
