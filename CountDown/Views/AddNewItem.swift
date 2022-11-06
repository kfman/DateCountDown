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
    
    func removeTimeComponent(_ date: Date)->Date{
        return date.setTime(hour: 0, min: 0, sec: 0) ?? date
    }
    
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
                
                let correctedDate = removeTimeComponent(date)
                let result = TargetDate(date: correctedDate, title: title)
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
