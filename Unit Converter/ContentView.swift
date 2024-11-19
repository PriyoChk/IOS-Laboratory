import SwiftUI

struct ContentView: View {
    @State private var inputValue: String = ""
    @State private var selectedFromUnit: String = "Meter"
    @State private var selectedToUnit: String = "Centimeter"
    @State private var resultValue: Double = 0.0
    
    let units = ["Meter", "Centimeter"]

    // Conversion Logic
    func convert(value: Double, fromUnit: String, toUnit: String) -> Double {
        if fromUnit == "Meter" && toUnit == "Centimeter" {
            return value * 100 // Convert Meter to Centimeter
        } else if fromUnit == "Centimeter" && toUnit == "Meter" {
            return value / 100 // Convert Centimeter to Meter
        }
        return value
    }

    var body: some View {
        VStack {
            Text("Unit Converter")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            // Input field for the user to enter the value
            TextField("Enter value", text: $inputValue)
                .padding()
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                // Picker for selecting "From" unit (Meter or Centimeter)
                Picker("From", selection: $selectedFromUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                // Picker for selecting "To" unit (Meter or Centimeter)
                Picker("To", selection: $selectedToUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
            }
            
            // Convert button
            Button(action: {
                // Ensure the input is a valid number before performing the conversion
                if let input = Double(inputValue) {
                    resultValue = convert(value: input, fromUnit: selectedFromUnit, toUnit: selectedToUnit)
                } else {
                    resultValue = 0.0 // Reset result if input is invalid
                }
            }) {
                Text("Convert")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            // Result label to display the converted value
            Text("Converted Value: \(resultValue, specifier: "%.2f")")
                .font(.title2)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
