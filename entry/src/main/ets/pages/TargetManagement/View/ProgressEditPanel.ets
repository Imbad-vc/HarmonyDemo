import {TMConstant} from  '../Common/TMConstant'

@Preview
  @Component
export default struct ProgressEditPanel {
  @Link sliderMode: number
  @Prop slidingProgress: number = 0
  onCancel?: () => void
  onClickOK?: (progress: number) => void

  build() {
    Column() {
      Row() {
        Slider({
          value: this.slidingProgress,
          min: TMConstant.SLIDER_MIN_VALUE,
          max: TMConstant.SLIDER_MAX_VALUE,
          style: SliderStyle.InSet,
          step: TMConstant.SLIDER_STEP
        })
          .width(TMConstant.SLIDER_INNER_WIDTH)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.slidingProgress = Math.floor(value);
            this.sliderMode = mode;
          })
        Text(`${this.slidingProgress}%`)
          .fontSize('14fp')
          .fontWeight(TMConstant.FONT_WEIGHT)
          .fontColor('#4D4D4D')
          .textAlign(TextAlign.Center)
          .margin({ left: '8vp' })
      }
      .width(TMConstant.SLIDER_WIDTH)
      .height(TMConstant.SLIDER_HEIGHT)
      Row() {
        CustomButton({
          buttonText: '取消'
        })
          .onClick(() => {
            if (this.onCancel !== undefined) {
              this.onCancel();
            }
          })
        CustomButton({
          buttonText: '确定'
        })
          .onClick(() => {
            if (this.onClickOK !== undefined) {
              this.onClickOK(this.slidingProgress);
            }
          })
      }
      .margin({ top: TMConstant.SLIDER_BUTTON_MARGIN })
      .width(TMConstant.DIALOG_OPERATION_WIDTH)
      .justifyContent(FlexAlign.SpaceBetween)
    }

    .height('84vp')
    .width(TMConstant.FULL_WIDTH)
    .justifyContent(FlexAlign.End)
  }
}

@Component
struct CustomButton {
  @State buttonColor: string = '#FFFFFF'
  buttonText?: string

  build() {
    Text(this.buttonText)
      .dialogButtonStyle()
      .backgroundColor(this.buttonColor)
      .borderRadius(TMConstant.LIST_RADIUS)
      .textAlign(TextAlign.Center)
      .onTouch((event?: TouchEvent) => {
        if (event !== undefined && event.type === TouchType.Down) {
          this.buttonColor = '#E8E7EB'
        }
        if (event !== undefined && event.type === TouchType.Up) {
          this.buttonColor = '#FFFFFF'
        }
      })
  }
}


@Extend(Text) function dialogButtonStyle() {
  .fontSize('16fp')
  .height('32vp')
  .width('96vp')
  .fontColor('#007DFF')
}