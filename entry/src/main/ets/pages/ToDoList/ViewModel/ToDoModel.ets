import ToDoListConstant from  '../Constant/ToDoListConstant'

export class ToDoModel {
  private tasks: Array<string> = ToDoListConstant.TODO_DATA

  getData(): Array<string> {
    return this.tasks
  }
}

export default new ToDoModel()