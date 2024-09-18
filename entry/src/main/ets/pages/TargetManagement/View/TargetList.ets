import  {TMConstant} from  '../Common/TMConstant'
import TargetModel, { TaskItemBean} from '../ViewModel/TargetModel'
import TargetListItem from './TargetListItem'


@Preview
@Component
export default struct TargetList {
  @Consume overAllProgressChanged: boolean
  @Link targetData: Array<TaskItemBean>
  @State isEditMode: boolean = false
  @State selectAll: boolean = false
  @State clickIndex: number = TMConstant.DEFAULT_CLICK_INDEX
  @State selectArray: Array<boolean> = []
  onAddClick?: () => void

  build() {
    Column() {
      Row() {
        Text('子目标')
          .fontSize('20fp')
          .fontWeight(TMConstant.FONT_WEIGHT_LARGE)
          .fontColor('#182431')
        Blank()
        if (this.targetData.length > 0) {
          if (this.isEditMode) {
            Text('取消')
              .operateTextStyle('#007DFF')
              .margin({ left: '16vp' })
              .onClick(() => {
                this.selectAll = false
                this.isEditMode = false
                this.selectAllOrCancel(false)
              })
            Text('全选')
              .operateTextStyle('#007DFF')
              .margin({
                left: '16vp'
              })
            Checkbox()
              .select(this.isSelectAll())
              .selectedColor('#007DFF')
              .width(TMConstant.CHECKBOX_WIDTH)
              .onClick(() => {
                this.selectAll = !this.selectAll
                this.selectAllOrCancel(this.selectAll)
              })
          }else{
            Text('编辑')
              .operateTextStyle('#007DFF')
              .onClick(() => {
                this.isEditMode = true
              })
          }
        }


      }
      .width(TMConstant.FULL_WIDTH)
      .height('30vp')
      .padding({
        left:'16vp',
        right:'11vp'
      })

      List({space:TMConstant.LIST_SPACE}) {
          ForEach(this.targetData,(item: TaskItemBean, index: number | undefined) => {
            ListItem() {
              TargetListItem({
                taskItem:item,
                index: index,
                isEditMode:this.isEditMode,
                selectArr: $selectArray,
                clickIndex: $clickIndex
              })
            }
          })
      }
      .edgeEffect(EdgeEffect.None)
      .margin({ top: '12vp' })
      .width(TMConstant.FULL_WIDTH)
      .height(TMConstant.LIST_HEIGHT)

      Blank()
      if (this.isEditMode) {
        Button('删除')
          .opacity(this.isSelectRows() ? TMConstant.NO_OPACITY : TMConstant.OPACITY)
          .enabled(this.isSelectRows() ? true : false)
          .operateButtonStyle('#E84026')
          .onClick(() => {
            this.deleteSelected();
            this.selectAllOrCancel(false);
            this.selectAll = false;
          })
      }else {
        Button('添加目标')
          .operateButtonStyle('#007DFF')
          .onClick(() => {
            if (this.onAddClick !== undefined) {
              this.onAddClick()
            }
          })
      }
    }
    .width(TMConstant.MAIN_BOARD_WIDTH)
    .height(TMConstant.FULL_HEIGHT)
    .padding({ top: '16vp' })
  }

  //删除已选择的数据
  deleteSelected() {
    TargetModel.deleteData(this.selectArray);
    this.targetData = TargetModel.getData();
    this.overAllProgressChanged = !this.overAllProgressChanged;
    this.isEditMode = false;
  }

  //全选选择&取消
  selectAllOrCancel(selectStatus: boolean) {
    let newSelectArray: Array<boolean> = []
    this.targetData.forEach(() => {
      newSelectArray.push(selectStatus)
    })
    this.selectArray = newSelectArray
  }

  //是否全选
  isSelectAll(): boolean {
    if (this.selectArray.length === 0) {
      return false
    }
    let deSelectCount: Length = this.selectArray.filter((selected: boolean) => selected === false).length;
    if (deSelectCount === 0) {
      this.selectAll = true
      return true
    }
    this.selectAll = false
    return false
  }

  //是否有选中
  isSelectRows(): boolean {
    return this.selectArray.filter((selected: boolean) => selected === true).length !== 0;
  }
}



//自定义按钮样式
@Extend(Text) function operateTextStyle(color: string) {
  .fontSize('19fp')
  .fontColor(color)
  .lineHeight('19vp')
  .fontWeight(TMConstant.FONT_WEIGHT)
}

//操作按钮样式
@Extend(Button) function operateButtonStyle(color: string) {
  .width('156vp')
  .height('46vp')
  .fontSize('16fp')
  .fontWeight(TMConstant.FONT_WEIGHT)
  .fontColor(color)
  .backgroundColor('#0D182431')
}
