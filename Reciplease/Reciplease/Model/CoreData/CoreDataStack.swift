
import Foundation
import CoreData

final class CoreDataStack {

    // MARK: - Properties

    private let persistentContainerName = "Reciplease"

    // MARK: - Singleton

    static var shared = CoreDataStack()

    // MARK: - Public

    var viewContext: NSManagedObjectContext {
        return CoreDataStack.shared.persistentContainer.viewContext
    }

    // MARK: - Private

    private init() {}

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistentContainerName)
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo) for : \(storeDescription.description)")
            }
        }
        return container
    }()
}