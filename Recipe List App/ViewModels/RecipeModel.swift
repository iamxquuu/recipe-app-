import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        
    }
    
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        //get a single service size by multypling denominator by the recipe serbings
        
        //get targett portion by multypling numerator by target servings
        
        //reduce fraction by greatest common divisor
        //get the whole portion if numerator > denominator
        return String(targetServings)
    }
    
}
