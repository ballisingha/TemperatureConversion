//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Guriqbal Singh Amroke on 05.02.26.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperature: Double = 0.0
    @State private var temperatureScaleFrom: String = "Celsius"
    @State private var temperatureScaleTo: String = "Fahrenheit"
    let temperatureScales = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedTemperature: Double {
        let input = inputTemperature
        
        if temperatureScaleFrom == temperatureScaleTo {
            return input
        }
        
        let valueInCelsius: Double
        switch temperatureScaleFrom {
        case "Celsius":
            valueInCelsius = input
        case "Fahrenheit":
            valueInCelsius = (input - 32) * 5 / 9
        case "Kelvin":
            valueInCelsius = input - 273.15
        default:
            valueInCelsius = input
        }
        
        switch temperatureScaleTo {
        case "Celsius":
            return valueInCelsius
        case "Fahrenheit":
            return valueInCelsius * 9 / 5 + 32
        case "Kelvin":
            return valueInCelsius + 273.15
        default:
            return valueInCelsius
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter temperature", value: $inputTemperature, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Choose a temperature scale to convert from.") {
                    Picker("Temperature Scale", selection: $temperatureScaleFrom) {
                        ForEach(temperatureScales, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Choose temperature scales to convert to.") {
                    Picker("Convert To", selection: $temperatureScaleTo) {
                        ForEach(temperatureScales, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                Section("Converted Temperature") {
                    Text("\(convertedTemperature, format: .number) \(temperatureScaleTo)")
                    
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    ContentView()
}
