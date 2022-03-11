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

struct Question: Identifiable, Codable {
    var id : String? = UUID().uuidString
    var text = ""
}

struct HomeView : View {
    @State private var question = Question(text: "Buy a car?")
    @State private var yesReasons : [Reason] = [Reason(text: "Commuting")]
    @State private var noReasons : [Reason] = [Reason(text: "Cost")]
    @State private var yesTextFieldText = ""
    @State private var noTextFieldText = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Question")) {
                    TextField("Question", text: $question.text)

                }
                Section(header: Text("Answers")){
                    DisclosureGroup("Yes") {
                        ForEach(yesReasons){ reason in
                            Text(reason.text)
                        }
                        HStack{
                            TextField("Add a reason", text: $yesTextFieldText)
                            Button {
                                yesReasons.append(Reason(text: yesTextFieldText))
                            } label: {
                                Image(systemName: "plus.circle")
                            }
                        }
                    }
                    DisclosureGroup("No") {
                        ForEach(noReasons){ reason in
                            Text(reason.text)
                        }
                        HStack{
                            TextField("Add a reason", text: $yesTextFieldText)
                            Button {
                                noReasons.append(Reason(text: yesTextFieldText))
                            } label: {
                                Image(systemName: "plus.circle")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Decision Maker")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
    }
}
