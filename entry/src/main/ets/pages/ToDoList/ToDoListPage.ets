import ToDoListConstant from './Constant/ToDoListConstant'
import ToDoListItem from './View/ToDoListItem'
import router from '@ohos.router'
import ToDoModel from './ViewModel/ToDoModel'
@Entry
@Component
struct ToDoList {

  private totalTasks: Array<string> = []

  //声明周期方法
  aboutToAppear() {
    this.totalTasks = ToDoModel.getData()
  }

  build() {
    Column({ space: ToDoListConstant.COLUMN_SPACE }) {
      Text('代办')
        .fontSize('28vp')
        .fontWeight(FontWeight.Bold)
        .lineHeight('33vp')
        .width(ToDoListConstant.TITLE_WIDTH)
        .margin({
          top: '24vp',
          bottom: '12vp'
        })
        .textAlign(TextAlign.Start)
      ForEach(this.totalTasks,(text) => {
        ToDoListItem({content:text})
      })
    }
    .width(ToDoListConstant.FULL_LENGTH)
    .height(ToDoListConstant.FULL_LENGTH)
    .backgroundColor('#F1F3F5')
  }
}