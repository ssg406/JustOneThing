@MainActor
final class TodoManager {
    
    private var container: ModelContainer
    
    init(container: ModelContainer) {
        self.container = container
    }
    
    private var context: ModelContext {
        ModelContext(container)
    }
    
    func allTodos() throws -> [TodoItem] {
        try context.fetch(FetchDescriptor<TodoItem>())
    }
    
    func addTodo(_ todo: TodoItem) throws {
        context.insert(todo)
        try context.save()
    }
    
    func updateTodo(_ todo: TodoItem) throws {
        // not implemented
    }
    
    func deleteTodo(_ todo: TodoItem) throws {
        context.delete(todo)
    }
}
