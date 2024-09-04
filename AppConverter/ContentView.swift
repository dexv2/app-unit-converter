//
//  ContentView.swift
//  AppConverter
//
//  Created by Vermont Phil Paguiligan on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "m"
    @State private var outputUnit = "ft"
    
    let lengthUnits = ["m", "km", "ft", "yd", "mi"]
    
    func anyToMeter(value: Double, unit: String) -> Double {
        switch unit {
        case "km":
            return value * 1000
        case "ft":
            return value / 3.281
        case "yd":
            return value / 1.094
        case "mi":
            return value * 1609
        default:
            return value
        }
    }
    
    func meterToAny(value: Double, unit: String) -> Double {
        switch unit {
        case "km":
            return value / 1000
        case "ft":
            return value * 3.281
        case "yd":
            return value * 1.094
        case "mi":
            return value / 1609
        default:
            return value
        }
    }
    
    var outputValue: Double {
        let meterValue = anyToMeter(value: inputValue, unit: inputUnit)
        return meterToAny(value: meterValue, unit: outputUnit)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert") {
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To") {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(lengthUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Enter value (\(inputUnit))") {
                    TextField("Enter value (\(inputUnit))", value: $inputValue, format: .number)
                }
                
                Section("Result (\(outputUnit))") {
                    Text(outputValue, format: .number)
                }
            }
            .navigationTitle("App Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
