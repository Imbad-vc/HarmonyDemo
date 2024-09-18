/**
* Saving and manipulating data displayed on the page.
*/
import Logger from '../../Common/Logger'
import { TMConstant } from '../Common/TMConstant'

const TAG = '[DataModel]'
export class TargetModel {

  //储存数据
  private targetData: Array<TaskItemBean> = [];

  //获取数据
  getData(): Array<TaskItemBean> {
    return this.targetData;
  }

  /**
   *删除数据
   *@param selectArr: 是否被选中标识数组
   * */

  deleteData(selectArr: Array<boolean>) {
    if (!selectArr) {
      Logger.error(TAG, '删除失败: ' + selectArr);
    }
    let dataLen = this.targetData.length - TMConstant.ONE_TASK;
    for (let i = dataLen; i >= 0; i--) {
      if (selectArr[i]) {
        this.targetData.splice(i, TMConstant.ONE_TASK);
      }
    }
  }

  /**
   * 添加数据
   *
   * @param 新增数据
   */
  addData(data: TaskItemBean) {
    if (!data) {
      Logger.error(TAG, 'addData error because data is: ' + data);
      return;
    }
    this.targetData.push(data);
  }

  /**
   * 获取最新进度
   */
  getLatestProgressValue(): number {
    if (this.targetData.length === 0) {
      return 0;
    }
    return this.targetData[this.targetData.length - TMConstant.ONE_TASK].progressValue;
  }

  /**
   * 根据index更新进度以及更新日期
   *
   * @param 任务数据index.
   * @param updateValue 任务进度.
   * @param updateDate 任务更新时间.
   */
  updateProgress(index: number, updateValue: number, updateDate: string): boolean {
    if (!this.targetData[index]) {
      return false;
    }
    this.targetData[index].progressValue = updateValue;
    this.targetData[index].updateDate = updateDate;
    return true;
  }
}

export default new TargetModel();

//任务Model
export class TaskItemBean {
  //任务名称
  taskName: string;

  //更新时间
  updateDate: string;

  //进度
  progressValue: number;

  //初始化方法
  constructor(taskName: string, progressValue: number, updateDate: string) {
    this.taskName = taskName;
    this.progressValue = progressValue;
    this.updateDate = updateDate;
  }
}