//
//  ContentView.swift
//  picker test
//
//  Created by Arthur Sh on 30.08.2022.
//

import SwiftUI

struct ContentView: View {
    
     let cities = [
        "Mexico City",
        "New York City",
        "Los Angeles",
        "Toronto",
        "Chicago",
        "Houston",
        "Havana",
        "Montréal",
        "Ecatepec de Morelos",
        "Philadelphia"
    ]
    
    let menuItems = [
        "Sweet potato fries",
        "Nachos",
        "Grilled salmon salad",
        "Pad thai",
        "Fish tacos",
        "Turkey burger",
        "Poutine",
        "Potato leek soup"
    ]
    
    
    let times = [
        "7AM",
        "9AM",
        "1PM",
        "7PM",
        "9PM"
    ]
    @State private var city = 1
    
    @State private var wheely = 4
    
    @State private var timeForPickUp = 2
    
    
    var body: some View {
        
        VStack{
            
            Text("Ottimo Restorante")
                .font(.largeTitle)
                .bold()
            
            
            Spacer()
            
            HStack{
                Text("location:")
                Picker("Loc", selection: $city) {
                    ForEach(0..<cities.count, id: \.self){ index in
                        Text(cities[index]).tag(index)
                    }
                }.pickerStyle(MenuPickerStyle())
            }
            Spacer()
            Text("Order:")
            Picker("wheelY", selection: $wheely) {
                ForEach(0..<menuItems.count, id: \.self){ index in
                    Text(menuItems[index]).tag(index)
                    
                }
            }.pickerStyle(WheelPickerStyle())
            
            Spacer()
            Text("Pick up time:")
            
            Picker("times", selection: $timeForPickUp) {
                ForEach(0..<times.count, id: \.self){ index in
                    Text(times[index]).tag(String(index))
                }
            }
            .padding()
            .pickerStyle(SegmentedPickerStyle())
            
            
            
            Button("Random picker :)") {
                city = .random(in: 0..<cities.count)
                wheely = .random(in: 0..<menuItems.count)
                timeForPickUp = .random(in: 0..<times.count)
                }
            }
            
         
        }
        
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
