import SwiftUI

struct TimerFullView: View {
    @Binding var runningTimer: String
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack{
            Text(runningTimer)
                .font(.system(size: 240, weight: .bold))
            
            Button(action: { isShowing.toggle() }){
                Text("종료")
                    .font(.system(size: 36, weight: .bold))
                    .padding()
            }
        }
        .padding()
    }
}
