//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Marcel Maciaszek on 17/04/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    

    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter({ $0.featured})
        
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                Text("Featured Recipes ")
                    .bold()
                    .padding(.leading)
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 33))
                Image(systemName: "star.fill")
                    .padding(.top, 40)
            }
        
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    
                    // loop through each recipe
                    ForEach (0..<featuredRecipes.count) { index in
                        
                            
                            
                        Button(action: {
                            
                            //show the recipe detail sheet
                            self.isDetailViewShowing = true
                            
                        }, label: {
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0) {
                                    Image(featuredRecipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        
                                    Text(featuredRecipes[index].name)
                                        .padding(5)
                                        .font(Font.custom("Avenir ", size: 15))
                                }
                                
                            }
                        }
                       )
                        .tag(index)
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.7) , radius: 10, x: -5, y: 5)
                            
                        
                        
                        
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Preparation time: ")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir ", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Avenir ", size: 15))
            }
            .padding([.leading, .bottom])
        }
        .sheet(isPresented: $isDetailViewShowing) {
            RecipeDetailView(recipe: featuredRecipes[tabSelectionIndex])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
