//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Marcel Maciaszek on 10/04/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                
                //MARK: recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingrideints
                VStack(alignment: .leading) {
                    Text("Ingridients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text(" - " + item)
                            
                    }
                    
                    
                }.padding(.horizontal)
                //MARK: Divider
                Divider()
                    
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index) + "- " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                }.padding(.horizontal)
            }
            }
        .navigationBarTitle(recipe.name)
        }
    }

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}