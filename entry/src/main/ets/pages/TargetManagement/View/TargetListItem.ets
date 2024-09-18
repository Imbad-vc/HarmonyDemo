import getCurrentTime from '../../Common/DateUtil'
import { TMConstant } from '../Common/TMConstant'
import ProgressEditPanel from  '../View/ProgressEditPanel'
import TargetModel, {TaskItemBean} from '../ViewModel/TargetModel'

@Preview
@Component
export default struct TargetListItem {
  private taskItem?: TaskItemBean
  @State latestProgress?: number = 0;
  @State updateDate?: string = '';
  @State sliderMode: number = TMConstant.DEFAULT_SLIDER_MODE
  @State isExpanded: boolean = false
  @Prop isEditMode: boolean = false
  @Link selectArr: Array<boolean>
  public index: number = 0
  @Link @Watch('onClickIndexChanged') clickIndex: number
  @Consume overAllProgressChanged: boolean
  onClickIndexChanged() {
    if (this.clickIndex !== this.index) {
      this.isExpanded = false
    }
  }

  aboutToAppear() {
    this.latestProgress = this.taskItem.progressValue
    this.updateDate = this.taskItem.updateDate
  }

  @Builder TargetItem(){
    Row() {
      Text(this.taskItem.taskName)
        .fontSize('16fp')
        .fontWeight(TMConstant.FONT_WEIGHT)
        .fontColor('#182431')
        .width(TMConstant.TASK_NAME_WIDTH)
        .textAlign(TextAlign.Start)
        .maxLines(TMConstant.MAX_LINES)
      Blank()
      Column() {
        Text(`${this.latestProgress}%`)
          .fontSize('16fp')
          .fontWeight(TMConstant.FONT_WEIGHT)
          .fontColor('#182431')
        Row() {
          Text('更新时间：')
            .opacityTextStyle()
          Text(`${this.updateDate}`)
            .opacityTextStyle()
        }
        .margin({ top: '2pv' })
      }
      .alignItems(HorizontalAlign.End)
    }
    .width(TMConstant.FULL_WIDTH)
  }

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Column(){
        this.TargetItem()
        if (this.isExpanded) {
          Blank()
          ProgressEditPanel({
            slidingProgress: this.latestProgress,
            onCancel: () => this.isExpanded = false,
            onClickOK: (progress: number): void => {
              this.latestProgress = progress;
              this.updateDate = getCurrentTime();
              let result = TargetModel.updateProgress(this.index, this.latestProgress, this.updateDate);
              if (result) {
                this.overAllProgressChanged = !this.overAllProgressChanged
              }
              this.isExpanded = false
            },
            sliderMode: $sliderMode
          })
        }
      }
      .padding({
        left: '16vp',
        top: '14vp',
        bottom: '12vp',
        right: this.isEditMode ? '54vp' : '16vp'
      })
      .borderRadius(TMConstant.LIST_RADIUS)
      .width(TMConstant.FULL_WIDTH)
      .backgroundColor(Color.White)
      .onClick(() => {
        if (this.sliderMode === TMConstant.CLICK_SLIDER_MODE) {
          this.sliderMode = TMConstant.DEFAULT_SLIDER_MODE
          return
        }
        if (!this.isEditMode) {
          animateTo({ duration: TMConstant.DURATION }, () => {
            this.isExpanded = !this.isExpanded
          })
          this.clickIndex = this.index
        }
      })

      if (this.isEditMode) {
        Row() {
          Checkbox()
            .selectedColor('#007DFF')
            .width(TMConstant.CHECKBOX_WIDTH)
            .margin({right:'16vp'})
            .select(this.selectArr[this.index])
            .onChange((isCheck: boolean) => {
              this.selectArr[this.index] = isCheck;
            })
        }
        .width(TMConstant.FULL_WIDTH)
        .justifyContent(FlexAlign.End)
      }
    }
    .width(TMConstant.FULL_WIDTH)
  }

}

//扩展方法？
@Extend(Text) function opacityTextStyle() {
  .fontSize('12fp')
  .fontColor('#182431')
  .opacity(TMConstant.OPACITY)
  .fontWeight(TMConstant.FONT_WEIGHT)
}