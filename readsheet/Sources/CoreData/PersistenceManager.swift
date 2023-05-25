//
//  PersistenceManager.swift
//  readsheet
//
//  Created by fonbrot on 12.02.2022.
//

import CoreData

struct PersistenceManager {
    
    static let shared = PersistenceManager()
    
    let persistentContainer: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "readsheet")
        if inMemory,
           let storeDescription = persistentContainer.persistentStoreDescriptions.first {
            storeDescription.url = URL(fileURLWithPath: "/dev/null")
        }
        persistentContainer.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unable to configure Core Data Store: \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // The context couldn't be saved.
                // You should add your own error handling here.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveResult(right: Bool) {
        if let object = fetchToday() {
            if right {
                object.right += 1
            } else {
                object.wrong += 1
            }
        } else {
            let result = DayResult(context: persistentContainer.viewContext)
            result.date = Calendar.current.startOfDay(for: Date())
            if right {
                result.right = 1
                result.wrong = 0
            } else {
                result.right = 0
                result.wrong = 1
            }
        }
        saveContext()
    }
    
    func fetchToday() -> DayResult? {
        let today = Calendar.current.startOfDay(for: Date())
        let fetchRequest: NSFetchRequest<DayResult> = DayResult.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K >= %@", #keyPath(DayResult.date), today as CVarArg)
        do {
            let result = try persistentContainer.viewContext.fetch(fetchRequest)
            return result.first
        } catch {
            return nil
        }
    }
    
    static var preview: PersistenceManager {
        let result = PersistenceManager(inMemory: true)
        let viewContext = result.persistentContainer.viewContext
        for index in 0...10 {
            let result = DayResult(context: viewContext)
            result.date = Calendar.current.startOfDay(for: Calendar.current.date(byAdding: .day, value: -index, to: Date())!)
            result.right = .random(in: 1...100)
            result.wrong = .random(in: 1...100)
        }
        return result
    }
}
