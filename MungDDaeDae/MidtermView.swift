import SwiftUI

struct MidtermView: View {
    @Binding var persons:[Person]
    
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Spacer()
                    Image("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[1].name)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                    Text("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[1].name)")
                        .font(.title)
                    Rectangle()
                        .foregroundStyle(.gray).opacity(0.4)
                        .frame(width: 200, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            VStack {
                                HStack(alignment: .bottom) {
                                    Text("편차 :")
                                    Text("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[1].totalDifference)")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                    Text("BPM")
                                        .foregroundStyle(.red)
                                }
                                .padding()
                                
                            }
                                .padding()
                            
                        )
                }
                VStack {
                    Spacer()
                    
                    Image("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[0].name)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                    Text("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[0].name)")
                        .font(.title)
                    Rectangle()
                        .foregroundStyle(.yellow)
                        .frame(width: 200, height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            VStack {
                                
                                HStack(alignment: .bottom) {
                                    Text("편차 :")
                                    Text("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[0].totalDifference)")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                    Text("BPM")
                                        .foregroundStyle(.red)
                                }
                                .padding()
                                
                            }
                                .padding()
                            
                        )
                }
                VStack {
                    Spacer()
                    Image("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[2].name)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                    Text("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[2].name)")
                        .font(.title)
                    Rectangle()
                        .foregroundStyle(.brown)
                        .frame(width: 200, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            VStack {
                                HStack(alignment: .bottom) {
                                    Text("편차 :")
                                    Text("\(persons.sorted(by: { $0.totalDifference < $1.totalDifference})[2].totalDifference)")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                    Text("BPM")
                                        .foregroundStyle(.red)
                                }
                                .padding()
                                
                            }
                                .padding()
                            
                        )
                }
                
            }
            .padding()
            .bold()
            
        }
    }
}
