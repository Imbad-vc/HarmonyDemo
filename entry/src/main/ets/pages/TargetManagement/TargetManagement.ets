import StartOptions from '@ohos.app.ability.StartOptions'
import promptAction from '@ohos.promptAction'
import getCurrentTime from '../Common/DateUtil'
import {TMConstant} from '../TargetManagement/Common/TMConstant'
import AddTargetDialog from './View/AddTargetDialog'
import TargetInformation from './View/TargetInformation'
import TargetList from './View/TargetList'
import TargetModel, { TaskItemBean } from './ViewModel/TargetModel'

@Entry
@Preview
@Component
 struct TargetManagement {
  @State targetData:Array<TaskItemBean> = TargetModel.getData()
  @State totalTasksNumber: number = 0;
  @State completedTasksNumber: number = 0;
  @State latestUpdateDate: string = TMConstant.DEFAULT_PROGRESS_VALUE;

  @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false

  onProgressChanged() {
    this.totalTasksNumber = this.targetData.length
    this.completedTasksNumber = this.targetData.filter((item: TaskItemBean) => {
      return item.progressValue === TMConstant.SLIDER_MAX_VALUE;
    }).length;
    this.latestUpdateDate = getCurrentTime();
  }

  //自定义弹窗
  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialog({
      onClickOk: (value: string): void => this.saveTask(value)
    }),
    alignment: DialogAlignment.Bottom,
    offset: {
      dx: TMConstant.DIALOG_OFFSET_X,
      dy: '-16vp'
    },
    customStyle: true,
    autoCancel: false
  })

  saveTask(taskName: string) {
    if (taskName === '') {
      promptAction.showToast({
        message: '任务名称不能为空！',
        duration: TMConstant.TOAST_TIME,
        bottom: TMConstant.TOAST_MARGIN_BOTTOM
      });
      return;
    }
    TargetModel.addData(new TaskItemBean(taskName, 0, getCurrentTime()));
    this.targetData = TargetModel.getData()
    this.overAllProgressChanged = !this.overAllProgressChanged
    this.dialogController.close()
  }

  aboutToAppear() {
    // let item1:TaskItemBean = new TaskItemBean('任务管理1',50,'2024-03-08 15:56:07')
    // let item2:TaskItemBean = new TaskItemBean('任务管理1',50,'2024-03-08 15:56:07')
    // let item3:TaskItemBean = new TaskItemBean('任务管理1',50,'2024-03-08 15:56:07')
    // TargetModel.addData(item1)
    // TargetModel.addData(item2)
    // TargetModel.addData(item3)
    // this.targetData = TargetModel.getData()
  }

  build() {
    Column() {
      Text('中钧科技')
        .width(TMConstant.TITLE_WIDTH)
        .height('32vp')
        .fontSize('24fp')
        .fontWeight(TMConstant.FONT_WEIGHT_LARGE)
        .textAlign(TextAlign.Start)
        .margin({
          top: '12vp',
          bottom: '12vp'
        })
      TargetInformation({
        latestUpdateDate: this.latestUpdateDate,
        totalTasksNumber: this.totalTasksNumber,
        completedTasksNumber: this.completedTasksNumber
      })
      TargetList({
        targetData:$targetData,
        onAddClick:():void => this.dialogController.open()
      })
        .height(TMConstant.LIST_BOARD_HEIGHT)
    }
    .backgroundColor('#F1F3F5')
    .width(TMConstant.FULL_WIDTH)
    .height(TMConstant.FULL_HEIGHT)
  }
}