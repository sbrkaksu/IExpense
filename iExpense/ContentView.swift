//
//  ContentView.swift
//  iExpense
//
//  Created by Berk Aksu on 2.01.2024.
//

import SwiftUI

struct ContentView: View {
    //An instance (or object) has been created.
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        VStack{
            NavigationView{
                List{
                    ForEach(expenses.items){ item in
                        HStack{
                                Text("\(item.name) - ")
                                Text(item.type)
                                    .foregroundColor(.gray)
                            Spacer()
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationTitle("iExpense")
                .toolbar {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddExpense){
                    AddView(expenses: expenses)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
