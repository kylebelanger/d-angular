
#   01/26
#   Working multiple definitions/examples in console
#   -------------------------------------------------


   # Nil for first evaluation 
   firstDefinition = nil  
  
   # Loop through definitions
   test[0]["primaries"][0]["entries"].first(3).each do |element| 
    
      # Initialize definition and example variables 
      definition = element["terms"][0]["text"]
      example    = element["entries"][0]["terms"][0]["text"] rescue false

       # Ensure definition and example exist and not the same as first 
       if (definition rescue false) != false && definition != firstDefinition
          puts definition
       end 

          if (example rescue false) != false
            puts example
          end

     # First definition and example (for second evaluation) 
     firstDefinition    = test[0]["primaries"][0]["entries"][0]["terms"][0]["text"]

   end  



test[0]["primaries"][0]["entries"][0]["entries"][0]["terms"][0]["text"]
