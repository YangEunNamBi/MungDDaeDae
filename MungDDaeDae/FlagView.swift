import SwiftUI

struct FlagView: View {
    var body: some View {
        Link("애국가 1절 바로가기",  destination: URL(string: "https://www.youtube.com/watch?v=LNCFgfaC9fc")!)
            .font(.title)
            .foregroundStyle(.black)
    }
}
