//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Carson Gross on 6/14/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.orderStruct.type) {
                        ForEach(OrderStruct.types.indices, id: \.self) {
                            Text(OrderStruct.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.orderStruct.quantity)", value: $order.orderStruct.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.orderStruct.specialRequestEnabled.animation())
                    
                    if order.orderStruct.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.orderStruct.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.orderStruct.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
