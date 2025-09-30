import Foundation
import Combine

/* @MainActor */
final class CrashSample {
    let subject = CurrentValueSubject<Int, Never>(0)
    var cancellable: AnyCancellable?

    init() {
      cancellable = subject
        .receive(on: DispatchQueue.global())
        .sink { /* @MainActor */ _ in
          // @MainActorのクロージャをBGスレッドから呼ぶとSwift6ではクラッシュする
        }
    }
}
