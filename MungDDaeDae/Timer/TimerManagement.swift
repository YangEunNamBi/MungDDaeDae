import SwiftUI

struct TimerManagement: View {
    @State private var runningTimer = "30:00"
    @State private var downloadAmount : Double = 1800.0
    @State private var isShowing = false
    @State private var isShowingPause = false
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                 TimerBar(downloadAmount: $downloadAmount)
                    .padding()
                
                Button(action: {
                    isShowing.toggle()
                }, label: {
                    TimerView(downloadAmount: $downloadAmount, runningTimer: $runningTimer, isShowingPause: $isShowingPause)
                })
                .sheet(isPresented: $isShowing) {
                    TimerFullView(runningTimer: $runningTimer, isShowing: $isShowing)
                        .frame(width: 1000, height: 600)
                    //                    Button("Dismiss", action: { isShowing.toggle() })
                }
            }
            .sheet(isPresented: $isShowingPause) {
                VStack{
                    Text("심박수 측정 시간입니다.")
                        .font(.system(size: 170, weight: .bold))
                    
                    Button(action: {
                        isShowingPause = false
                    }) {
                        Text("넵")
                            .font(.system(size: 36, weight: .bold))
                            .padding()
                    }
                }
                .padding()
                .frame(width: 1000, height: 800)
            }
        }
    }
}

#Preview {
    TimerManagement()
}





