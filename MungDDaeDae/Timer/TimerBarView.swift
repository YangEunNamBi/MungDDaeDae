import SwiftUI

struct TimerBar: View {
    @Binding var downloadAmount: Double

    var body: some View {
        VStack {
            ProgressView("", value: downloadAmount, total: 1800.0)
//                .accentColor(.secondary)
                .progressViewStyle(BarProgressStyle(height: 24)) // 스타일 적용
        }
    }
}

struct BarProgressStyle: ProgressViewStyle {
    var color: Color = .yellow
    var height: Double = 20.0
    var labelFontStyle: Font = .body

    func makeBody(configuration: Configuration) -> some View {

        let progress = configuration.fractionCompleted ?? 0.0

        GeometryReader { geometry in

            VStack(alignment: .leading) {
                configuration.label
                    .font(labelFontStyle)

                RoundedRectangle(cornerRadius: 30.0)
                    .fill(.secondary)
                    .frame(height: height)
                    .frame(width: geometry.size.width)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(color)
                            .frame(width: geometry.size.width * progress)
                            .overlay {
                                if let currentValueLabel = configuration.currentValueLabel {

                                    currentValueLabel
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            }
                    }

            }

        }
    }
}

