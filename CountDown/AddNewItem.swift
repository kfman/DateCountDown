//
//  AddNewItem.swift
//  CountDown
//
//  Created by Klaus Fischer on 05.11.22.
//

import SwiftUI

struct AddNewItem: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var title: String = ""
    @State var date: Date = Date()
    
    let callback: (TargetDate?)->Void
    
    init(_ callback: @escaping (TargetDate?)->Void) {
        self.callback = callback
    }
    
    var body: some View {
        VStack {
            Form {
                // DatePicker,
                TextField(text: $title){Text("Title")}
                DatePicker("Zieldatum", selection: $date, displayedComponents: .date)
               
            }
            Button("Speichern"){
                presentationMode.wrappedValue.dismiss()
                let result = TargetDate(date: date, title: title)
                callback(result)
            }
        }
    }
}

struct AddNewItem_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItem(){_ in}
    }
}
