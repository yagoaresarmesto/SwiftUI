import SwiftUI

struct Example: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        DatePicker("Please enter a date", selection: $wakeUp).labelsHidden()
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents:  .hourAndMinute).labelsHidden()
        DatePicker("Please enter a date", selection: $wakeUp, in:Date.now...)
        
    }
    
    func exampledDates(){
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
    func exampleDates2(){
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
    }
}

#Preview {
    Example()
}
