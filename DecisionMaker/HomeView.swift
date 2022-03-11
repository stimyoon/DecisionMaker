//
//  HomeView.swift
//  DecisionMaker
//
//  Created by Tim Yoon on 3/10/22.
//

import SwiftUI

struct Reason : Identifiable, Codable {
    var id : String? = UUID().uuidString
    var text = ""
    static var mockReason = Reason(text: "")
}
struct Choice : Identifiable, Codable {
    var id : String? = UUID().uuidString
    var text = ""
    var reasons : [Reason] = []
    static var mockChoice = Choice(text: "yes")
}



struct HomeView: View {
    @State private var choices : [Choice] = [
        Choice(text: "Yes", reasons: [Reason(text: "Tastes Good"),
                                      Reason(text: "Makes me happy")]),
        Choice(text: "No", reasons: [])
    ]
    @State private var questionText = ""
    @State private var newChoice = ""
    @State private var yesReasonText = ""
    var body: some View {
    
        Form{
            Section(header: Text("Question")) {
                TextField("Enter Question", text: $questionText)
                    .textFieldStyle(.roundedBorder)
                
            }
            Section(header: Text("Choices")) {
                ForEach(choices){ choice in
                    DisclosureGroup("\(choice.text)") {
                        ForEach(choice.reasons){ reason in
                            Text(reason.text)
                        }
                        HStack{
                            TextField("reasons", text: $yesReasonText)
                                .textFieldStyle(.roundedBorder)
                            Button {
                                choices[0].reasons.append(Reason(text: yesReasonText))
                            } label: {
                                Image(systemName: "plus.circle")
                            }

                        }
                    }
                }
//                HStack {
//                    TextField("New Choice", text: $newChoice)
//                    Button {
//                        choices.append(newChoice)
//                    } label: {
//                        Image(systemName: "plus.circle")
//                    }
//
//                }
            }
        }
        .navigationTitle("Decision Maker")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
    }
}
