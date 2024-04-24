import SwiftUI

struct BeforeContest: View {
    var body: some View {
        NavigationSplitView {
            MainView()
        }
    detail: {
    }
        
        
    }
}

struct MainView: View{
    var body: some View{
        List {
            NavigationLink(destination: DetailView()) {
                Text("대회에 앞서")
            }
            
            NavigationLink(destination: FlagView()) {
                Text("애국가")
            }
            NavigationLink(destination: RecordView()) {
                Text("기록표")
            }
            //            NavigationLink(destination: midTermView()) {
            //                Text("최종")
            //            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct DetailView: View {
    var body: some View {
        TabView() {
            ArrangeSeatsView()
                .tabItem {
                    Text("0. 자리 배치")
                }
            WatchSettingView()
                .tabItem {
                    Text("1. 워치 세팅")
                    
                }
            CheckHeartRate()
                .tabItem {
                    Text("2. 심박수 체크 시간")
                }
            RuleExplain()
                .tabItem {
                    Text("3. 규칙 설명")
                }
            SpecialPrize()
                .tabItem {
                    Text("3. 추가")
                }
        }
        .tabViewStyle(.automatic)
    }
}

struct ArrangeSeatsView: View {
    var body: some View {
        GeometryReader { geometry in
            
            ForEach(0..<10) { index in
                let angle = Double(index) / 10 * 2 * .pi
                let x = geometry.size.width / 2 + cos(angle) * 180
                let y = geometry.size.height / 2 + sin(angle) * 180
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50)
                    .position(x: x, y: y)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct WatchSettingView: View {
    var body: some View {
        Image("watch_setting")
            .resizable()
            .padding()
            .scaledToFit()
        
        
    }
}

struct CheckHeartRate: View {
    var body: some View {
        VStack {
            Image("heart_rate_time")
                .resizable()
                .scaledToFit()
                .padding()
            Text("총 4번")
                .font(.system(size: 36, weight: .regular, design: .default))
            Image("calculate")
                .resizable()
                .scaledToFit()
                .frame(width: 800)
            
        }
        .minimumScaleFactor(0.8) // 텍스트 축소 최소 비율
        .lineLimit(1) // 텍스트 줄 수 제한
        .padding() // 간격 추가
        .frame(maxWidth: .infinity) // 최대 너비 설정
        
        
    }
}

struct RuleExplain: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("1.  멍때리기 편한 자세로 앉아주세요!")
                .padding(.bottom, 4)
                .padding(.leading, 20)
                .font(.system(size: 40, weight: .regular, design: .default))
            Text("(팔을 기대도 좋습니다. 단 의자 사용은 지양합니다!)")
                .padding([.bottom, .leading], 20)
                .font(.system(size: 30, weight: .regular, design: .default))
            Text("2.  심박수 측정을 위해 애플워치가 잘보이도록 팔을 편히 위치해주세요!")
                .padding(20)
                .font(.system(size: 40, weight: .regular, design: .default))
            Text("3.  완전히 눕거나 눈을 감고 자는건 안됩니다!")
                .padding(20)
                .font(.system(size: 40, weight: .regular, design: .default))
        }
        .minimumScaleFactor(0.8) // 텍스트 축소 최소 비율
        .lineLimit(1) // 텍스트 줄 수 제한
        .padding() // 간격 추가
        .frame(maxWidth: .infinity) // 최대 너비 설정
    }
}



struct SpecialPrize: View {
    var body: some View {
        VStack {
            Text("심박수 안정성 외에도")
                .padding(10)
                .font(.system(size: 40, weight: .regular, design: .default)) // 초기 크기 설정
            
            Text("추가적인 특별상이 있을 예정입니다!")
                .multilineTextAlignment(.center)
                .font(.system(size: 40, weight: .regular, design: .default)) // 초기 크기 설정
        }
        .minimumScaleFactor(0.8) // 텍스트 축소 최소 비율
        .lineLimit(1) // 텍스트 줄 수 제한
        .padding() // 간격 추가
        .frame(maxWidth: .infinity) // 최대 너비 설정
    }
    
}
//#Preview {
//    MainView()
//}
