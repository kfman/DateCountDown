//
//  TargetDateView.swift
//  CountDown
//
//  Created by Klaus Fischer on 05.11.22.
//

import SwiftUI

struct TargetDateView: View {
    let targetDate: TargetDate
    
    @State var days: Int = 0
    
    func formatStringDate(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.")
            return dateFormatter.string(from: date)
    }
    
    var body: some View {
        HStack{
            Text(formatStringDate(date: targetDate.date))
                .padding(.trailing, 6)
            Text(targetDate.title)
            Spacer()
            Text("\(targetDate.date.getDaysBetweenToday()) Tage")
        }.padding(.horizontal, 10)
    }
}

struct TargetDateView_Previews: PreviewProvider {
    static var previews: some View {
        TargetDateView(targetDate: TargetDate(
                                              date: Date(timeIntervalSince1970: 1676569676), title: "Ignatz"))
    }
}
