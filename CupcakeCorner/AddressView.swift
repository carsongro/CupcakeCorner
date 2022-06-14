//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Carson Gross on 6/14/22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.orderStruct.name)
                TextField("Street Address", text: $order.orderStruct.streetAddress)
                TextField("City", text: $order.orderStruct.city)
                TextField("Zip", text: $order.orderStruct.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout")
                }
            }
            .disabled(order.orderStruct.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
