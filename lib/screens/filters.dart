import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key, required this.selectedFilters});
  final Map<String, bool> selectedFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
  
}

class _FiltersScreenState extends State<FiltersScreen>{
  var glutenFreeEnabled = false;
  var lactoseFreeEnabled = false;
  var veganEnabled = false;
  var vegetarianEnabled = false;
  @override
  void initState() {
    super.initState();
    glutenFreeEnabled = widget.selectedFilters["glutenFree"]!;
    lactoseFreeEnabled = widget.selectedFilters["lactoseFree"]!;
    veganEnabled = widget.selectedFilters["vegan"]!;
    vegetarianEnabled = widget.selectedFilters["vegetarian"]!;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
    body: 
       PopScope(
        canPop: false,
        onPopInvoked: (didPop) async{
          Navigator.of(context).pop(
            {
               "glutenFree" : glutenFreeEnabled,
               "lactoseFree": lactoseFreeEnabled,
               "vegan" : veganEnabled,
               "vegetarian" : vegetarianEnabled, 
            }
          );
        },
         child: Column(
            children: [
              SwitchListTile(value: glutenFreeEnabled, onChanged: (isChanged){
                setState(() {
                  glutenFreeEnabled = isChanged;
                });
                }, 
              title: Text("Gluten-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),
              ),
              subtitle:  Text("Only include gluten-free meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              ),
          
               SwitchListTile(value: lactoseFreeEnabled, onChanged: (isChanged){
                setState(() {
                  lactoseFreeEnabled = isChanged;
                });
                }, 
              title: Text("Lactose-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),
              ),
              subtitle:  Text("Only include lactose-free meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              ),
          
              SwitchListTile(value: veganEnabled, onChanged: (isChanged){
                setState(() {
                  veganEnabled = isChanged;
                });
                }, 
              title: Text("Vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),
              ),
              subtitle:  Text("Only include vegan meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              ),
          
              SwitchListTile(value: vegetarianEnabled, onChanged: (isChanged){
                setState(() {
                  vegetarianEnabled = isChanged;
                });
                }, 
              title: Text("Vegetarian",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),
              ),
              subtitle:  Text("Only include vegetarian meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              ),
            ],
          ),
       ),
      );
  
  }
  
}