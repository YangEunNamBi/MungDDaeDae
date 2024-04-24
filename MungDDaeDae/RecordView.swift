import SwiftUI

struct RecordView: View {
    @State var inputNum = ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"]
    @State var persons:[Person] = [
        Person(name: "너구리", firstHeartRate: 0, differenceHeartRate: [], color: "Color 1", personNum: 0),
        Person(name: "도도", firstHeartRate: 0, differenceHeartRate: [], color: "Color 2", personNum: 1),
        Person(name: "레인", firstHeartRate: 0, differenceHeartRate: [], color: "Color 3", personNum: 2),
        Person(name: "마스", firstHeartRate: 0, differenceHeartRate: [], color: "Color 4", personNum: 3),
        Person(name: "벨라", firstHeartRate: 0, differenceHeartRate: [], color: "Color 5", personNum: 4),
        Person(name: "시네필", firstHeartRate: 0, differenceHeartRate: [], color: "Color 6", personNum: 5),
        Person(name: "찬", firstHeartRate: 0, differenceHeartRate: [], color: "Color 7", personNum: 6),
        Person(name: "테리", firstHeartRate: 0, differenceHeartRate: [], color: "Color 8", personNum: 7),
        Person(name: "파인", firstHeartRate: 0, differenceHeartRate: [], color: "Color 9", personNum: 8),
        Person(name: "하래", firstHeartRate: 0, differenceHeartRate: [], color: "Color 10", personNum: 9)
    ]
    @State private var runningTimer = "30:00"
    @State private var downloadAmount : Double = 1800.0
    @State private var isShowing = false
    @State private var isShowingPause = false
    
    @State var alertShow = false
    @State var alertText = ""
    var body: some View {
        TabView{
            ZStack{
                GeometryReader { proxy in
                    let boxWidth = proxy.size.width/13
                    let boxHeight = proxy.size.height/13
                    
                    VStack{
                        TimerManagement()
                        HStack{
                            VStack{
                                ForEach(persons, id:\.name){ i in
                                    HStack{
                                        RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                            .frame(width:boxWidth*1.5, height:boxHeight)
                                            .foregroundStyle(Color("\(i.color)"))
                                            .overlay(
                                                ZStack{
                                                    Text("\(i.name)")
                                                        .font(.title)
                                                        .foregroundStyle(Color.white)
                                                        .padding(0)
                                                    
                                                    if persons[i.personNum].firstHeartRate != 0{
                                                        Text("\(i.firstHeartRate)")
                                                            .offset(x:30, y:20)
                                                    }
                                                }
                                            )
                                        TextField("", text: $inputNum[i.personNum])
                                            .frame(width:boxWidth, height:boxHeight)
                                        Button{
                                            if i.firstHeartRate == 0{
                                                persons[i.personNum].firstHeartRate = Int(inputNum[i.personNum]) ?? 0
                                                inputNum[i.personNum] = "0"
                                                //                                            print(persons[i.inputNum].firstHeartRate)
                                            } else{
                                                persons[i.personNum].differenceHeartRate.append(abs(persons[i.personNum].firstHeartRate - (Int(inputNum[i.personNum]) ?? 0)))
                                                inputNum[i.personNum] = "0"
                                                print(persons[i.personNum].differenceHeartRate)
                                            }
                                        } label:{
                                            Text("Save")
                                        }
                                    }
                                }
                            }.padding(.leading, 10)
                            
                            Spacer()
                            
                            VStack{
                                ForEach(persons.filter { $0.differenceHeartRate != [] }.sorted(by: { $0.differenceHeartRate[0] < $1.differenceHeartRate[0] })
                                        , id:\.name){ i in
                                    ZStack{
                                        Button{
                                            alertShow.toggle()
                                        } label: {
                                            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                                .frame(width:boxWidth*1.5, height:boxHeight)
                                                .foregroundStyle(Color("\(i.color)"))
                                                .overlay(
                                                    ZStack{
                                                        Text("\(i.name)")
                                                            .font(.title)
                                                            .foregroundStyle(Color.white)
                                                            .padding(0)
                                                        if persons[i.personNum].differenceHeartRate != [0]{
                                                            Text("\(i.differenceHeartRate[0])")
                                                                .offset(x:30, y:20)
                                                        }
                                                    }
                                                )
                                        }
                                        if alertShow {
                                            
                                            VStack{
                                                TextField("", text:$alertText)
                                                    .frame(width:70, height:30)
                                                HStack{
                                                    Button{
                                                        alertShow.toggle()
                                                    } label:{
                                                        Text("취소")
                                                    }
                                                    Button{
                                                        persons[i.personNum].differenceHeartRate[0] = Int(alertText) ?? 0
                                                        alertShow.toggle()
                                                    } label:{
                                                        Text("변경")
                                                    }
                                                }
                                            }.frame(width:300, height:100)
                                        }
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            VStack{
                                ForEach(persons.filter { $0.differenceHeartRate.count >= 2  }.sorted(by: { $0.differenceHeartRate[1] < $1.differenceHeartRate[1] })
                                        , id:\.name){ i in
                                    ZStack{
                                        Button{
                                            alertShow.toggle()
                                        } label: {
                                            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                                .frame(width:boxWidth*1.5, height:boxHeight)
                                                .foregroundStyle(Color("\(i.color)"))
                                                .overlay(
                                                    ZStack{
                                                        Text("\(i.name)")
                                                            .font(.title)
                                                            .foregroundStyle(Color.white)
                                                            .padding(0)
                                                        if
                                                            persons[i.personNum].differenceHeartRate.count >= 2{
                                                            Text("\(i.differenceHeartRate[1])")
                                                                .offset(x:30, y:20)
                                                        }
                                                    }
                                                )
                                        }
                                        if alertShow {
                                            
                                            VStack{
                                                TextField("", text:$alertText)
                                                    .frame(width:70, height:30)
                                                HStack{
                                                    Button{
                                                        alertShow.toggle()
                                                    } label:{
                                                        Text("취소")
                                                    }
                                                    Button{
                                                        persons[i.personNum].differenceHeartRate[1] = Int(alertText) ?? 0
                                                        alertShow.toggle()
                                                        
                                                    } label:{
                                                        Text("변경")
                                                    }
                                                }
                                            }.frame(width:300, height:100)
                                        }
                                    }
                                    
                                }
                            }
                            
                            Spacer()
                            
                            VStack{
                                ForEach(persons.filter { $0.differenceHeartRate.count >= 3  }.sorted(by: { $0.differenceHeartRate[2] < $1.differenceHeartRate[2] })
                                        , id:\.name){ i in
                                    ZStack{
                                        Button{
                                            alertShow.toggle()
                                        } label: {
                                            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                                .frame(width:boxWidth*1.5, height:boxHeight)
                                                .foregroundStyle(Color("\(i.color)"))
                                                .overlay(
                                                    ZStack{
                                                        Text("\(i.name)")
                                                            .font(.title)
                                                            .foregroundStyle(Color.white)
                                                            .padding(0)
                                                        if persons[i.personNum].differenceHeartRate.count >= 3{
                                                            Text("\(i.differenceHeartRate[2])")
                                                                .offset(x:30, y:20)
                                                        }
                                                    }
                                                )
                                        }
                                        if alertShow {
                                            
                                            VStack{
                                                TextField("", text:$alertText)
                                                    .frame(width:70, height:30)
                                                HStack{
                                                    Button{
                                                        alertShow.toggle()
                                                    } label:{
                                                        Text("취소")
                                                    }
                                                    Button{
                                                        persons[i.personNum].differenceHeartRate[2] = Int(alertText) ?? 0
                                                        alertShow.toggle()
                                                    } label:{
                                                        Text("변경")
                                                    }
                                                }
                                            }.frame(width:300, height:100)
                                        }
                                    }
                                }
                            }
                            
                            
                        }
                    }
                    
                }
            }
            MidtermView(persons: $persons)
        }
        
    }
}


#Preview {
    RecordView()
}

struct Person {
    var name: String
    var firstHeartRate: Int
    var differenceHeartRate: [Int]
    var color: String
    var personNum: Int
    var totalDifference: Int {
        differenceHeartRate.reduce(0, +)
    }
}
