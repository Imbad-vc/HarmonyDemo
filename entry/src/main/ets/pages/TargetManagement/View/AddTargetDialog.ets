
import { TMConstant } from '../Common/TMConstant'

@Preview
@CustomDialog
export default struct AddTargetDialog {

  @State subtaskName: string = ''
  private controller?: CustomDialogController
  onClickOk?: (value: string) => void

  build() {
    Column() {
      Text('添加子目标')
        .width(TMConstant.FULL_WIDTH)
        .fontSize('20fp')
        .fontWeight(TMConstant.FONT_WEIGHT)
        .fontColor('#182431')
        .textAlign(TextAlign.Start)
      TextInput({ placeholder:'请输入子目标名称'})
        .placeholderColor(Color.Gray)
        .placeholderFont({size:'16fp'})
        .caretColor(Color.Blue)
        .backgroundColor('#0D182431')
        .width(TMConstant.FULL_WIDTH)
        .height(TMConstant.DIALOG_INPUT_HEIGHT)
        .margin({ top: TMConstant.DIALOG_INPUT_MARGIN })
        .fontSize('16fp')
        .fontColor('#182431')
        .onChange((value: string) => {
          this.subtaskName = value;
        })
      Blank()
      Row() {
        Button('取消')
          .dialogButtonStyle()
          .onClick(() => {
            this.controller?.close();
          })
        Divider()
          .vertical(true)
        Button('确定')
          .dialogButtonStyle()
          .onClick(() => {
            if (this.onClickOk !== undefined) {
              this.onClickOk(this.subtaskName);
            }
          })
      }
      .width(TMConstant.DIALOG_OPERATION_WIDTH)
      .height(TMConstant.DIALOG_OPERATION_HEIGHT)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding('24vp')
    .height('168vp')
    .width(TMConstant.DIALOG_WIDTH)
    .borderRadius(TMConstant.DIALOG_BORDER_RADIUS)
    .backgroundColor(Color.White)
  }

}

@Extend(Button) function dialogButtonStyle() {
  .fontSize('16fp')
  .height('32vp')
  .width('96vp')
  .backgroundColor(Color.White)
  .fontColor('#007DFF')
}