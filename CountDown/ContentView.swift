//
//  ContentView.swift
//  CountDown
//
//  Created by Klaus Fischer on 05.11.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var targets: [TargetDate]
    @State var showNewItemDialog: Bool = false
    
    init(targets: [TargetDate]? = nil) {
        self.targets = targets ?? []
    }
    
    func saveTargets(){
        let dataJson = try? JSONEncoder().encode(self.targets)
        
        if dataJson != nil {
            UserDefaults.standard.setValue(dataJson, forKey: "targets")
        }
    }

    
    var body: some View {
        NavigationView {
            
            List{
                ForEach(targets) { target in
                    TargetDateView(targetDate: target)
                }.onDelete { index in
                    targets.remove(atOffsets: index)
                    saveTargets()
                }
            }
            .padding()
            .navigationTitle("Count Down")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { // <2>3>
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add"){
                        showNewItemDialog.toggle()
                    }
                }
            }
            
        }
        .sheet(isPresented: $showNewItemDialog) {
            // TODO on dismiss
        } content: {
            AddNewItem(){ result in
                guard let newTarget = result else{
                    return
                }
                targets.append(newTarget)
                saveTargets()
            }
        }
        .onAppear {
            if let dataJson = UserDefaults.standard.data(forKey: "targets"){
                self.targets = (try? JSONDecoder().decode([TargetDate].self, from: dataJson)) ?? []
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(targets: [TargetDate(date: Date(timeIntervalSince1970: 1676569676), title: "Ignatz")])
    }
}
