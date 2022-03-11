//
//  ChoiceDetailView.swift
//  DecisionMaker
//
//  Created by Tim Yoon on 3/10/22.
//

import SwiftUI

struct ChoiceDetailView : View {
    @State private var choice : Choice
    var saveCompletion : (Choice)->()
    var deleteCompletion : (Choice)->()
    
    init(choice: Choice, saveCompletion: @escaping (Choice)->(), deleteCompletion: @escaping  (Choice)->()) {
        _choice = State(initialValue: choice)
        self.saveCompletion = saveCompletion
        self.deleteCompletion = deleteCompletion
    }
    
    var body: some View {
        Form{
            Section(header: Text("Choice")) {
                TextField("choice", text: $choice.text)
            }

        }
    }
}

struct ChoiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChoiceDetailView(choice: Choice.mockChoice, saveCompletion: {_ in}, deleteCompletion: {_ in})

        }
    }
}
