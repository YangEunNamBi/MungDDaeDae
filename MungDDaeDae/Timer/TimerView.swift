import SwiftUI

struct TimerView: View {
    @State private var isTimerFinished = false
    
    @Binding var downloadAmount: Double
    @Binding var runningTimer: String
    @Binding var isShowingPause: Bool
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    var body: some View {
        VStack {
            VStack{
                Text(runningTimer)
                    .font(.largeTitle)
            }
        }
        .onReceive(timer) { _ in
//            if !isShowingPause {
                if downloadAmount > 0 {
                    downloadAmount -= 1
                } else if downloadAmount == 0 {
                    isTimerFinished = true
                }
                runningTimer = convertSecondsToTime(timeInSeconds: Int(downloadAmount))
                
                if downloadAmount == 1790 || downloadAmount == 600 || downloadAmount == 0 {
                    isShowingPause = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        isShowingPause = false
                    }
                }
//            }
        }
        .frame(width: 100)
    }
}

