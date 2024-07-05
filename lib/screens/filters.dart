import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
    body: 
        Column(
            children: [
              SwitchListTile(value: activeFilters["glutenFree"]!, onChanged: (isChanged){
                 ref.read(filtersProvider.notifier).setFilter("glutenFree", isChanged);
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
          
               SwitchListTile(value: activeFilters["lactoseFree"]!, onChanged: (isChanged){
                 ref.read(filtersProvider.notifier).setFilter("lactoseFree", isChanged);
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
          
              SwitchListTile(value: activeFilters["vegan"]!, onChanged: (isChanged){
                ref.read(filtersProvider.notifier).setFilter("vegan", isChanged);
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
          
              SwitchListTile(value: activeFilters["vegetarian"]!, onChanged: (isChanged){
                ref.read(filtersProvider.notifier).setFilter("vegetarian", isChanged);
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
        );
  }
  
}