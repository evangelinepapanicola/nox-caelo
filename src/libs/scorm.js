import pipwerks from "pipwerks-scorm-api-wrapper";

export default class SCORM {
  constructor() {
    this.startTime = new Date();
    // this.rand = Math.random(); // Checking all instances are identical
    this.scorm = pipwerks.SCORM;
    this.scorm.version = "1.2";
    this.connected = this.scorm.init();

    let suspendData = this.scorm.get("cmi.suspend_data") || "";
    try {
      this.suspendData = JSON.parse(suspendData);
    } catch (e) {
      this.suspendData = {};
    }

    this.complete();

    //window.onunload = this.scorm.quit;
  }

  getSuspendData(key = null) {
    return key === null ? this.suspendData : this.suspendData[key] || null;
  }

  setSuspendData(key, value) {
    this.suspendData[key] = value;
    this.scorm.set("cmi.suspend_data", JSON.stringify(this.suspendData));
    this.scorm.save();
  }

  set(param, value) {
    this.scorm.set(param, value);
    this.scorm.save();
  }

  get(param) {
    let val = this.scorm.get(param);
    switch (val) {
      case "null":
        return null;
      default:
        return val;
    }
  }

  complete() {
    this.scorm.set("cmi.core.lesson_status", "completed");
    this.scorm.save();
  }

  incomplete() {
    this.scorm.set("cmi.core.lesson_status", "incomplete");
    this.scorm.save();
  }

  /**
   * Can't be called if completion is 'complete'
   */
  fail() {
    // this.incomplete(); // Might allow calling if completion is 'complete'
    this.scorm.set("cmi.core.lesson_status", "failed");
    this.scorm.save();
  }

  /**
   * Also marks as completion as 'complete'
   */
  pass() {
    this.scorm.set("cmi.core.lesson_status", "passed");
    this.scorm.save();
  }

  browsed() {
    this.scorm.set("cmi.core.lesson_status", "browsed");
    this.scorm.save();
  }

  score(score) {
    this.scorm.set("cmi.core.score.raw", score);
    this.scorm.save();
  }

  end() {
    this.scorm.set(
      "cmi.core.session_time",
      SCORM.convertToSCORM12Time(
        new Date().getTime() - this.startTime.getTime()
      )
    );
    this.scorm.set("cmi.core.exit", "");
  }
  
  static padWithZeroes( numToPad, padBy ) {
    let len = padBy;
    while( --len ) {
      numToPad = '0' + numToPad;
    }
    return numToPad.slice( -padBy );
  }

  static convertToSCORM12Time(msConvert) {

    let msPerSec = 1000;
    let msPerMin = msPerSec * 60;
    let msPerHour = msPerMin * 60;

    let ms = msConvert % msPerSec;
    msConvert -= ms;

    let secs = msConvert % msPerMin;
    msConvert -= secs;
    secs /= msPerSec;

    let mins = msConvert % msPerHour;
    msConvert -= mins;
    mins /= msPerMin;

    let hrs = msConvert / msPerHour;

    if (hrs > 9999) {
      return "9999:99:99.99";
    } else {
      let str = [
        SCORM.padWithZeroes(hrs, 4),
        SCORM.padWithZeroes(mins, 2),
        SCORM.padWithZeroes(secs, 2)
      ].join(":");
      return str + "." + Math.floor(ms / 10);
    }
  }
}
