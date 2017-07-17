function Time(t, n) {
    this.t = t;
    this.n = n;
};
Time.prototype.init = function() {
    var time = new Date(this.t.getTime() - this.n * 24 * 3600 * 1000);
    var y = time.getFullYear();
    var m = (m = (time.getMonth() + 1)) < 10 ? '0' + m : m;
    var d = (d = time.getDate()) < 10 ? '0' + d : d;
    var hh = (hh = time.getHours()) < 10 ? '0' + hh : hh;
    var mm = (mm = time.getMinutes()) < 10 ? '0' + mm : mm;
    var ss = (ss = time.getMilliseconds() * 60 / 1000) < 10 ? '0' + ss : ss;
    return y + '-' + m + '-' + d + ' ' + hh + ':' + mm + ':' + ss;
};
Time.prototype.judge = function(btime, etime) {
    var bTime = new Date(btime).getTime();
    var eTime = new Date(etime).getTime();
    if (eTime < bTime) {
        $.messager.alert('操作提示', '开始时间大于结束时间,请重新选择！', 'info');
        return false;
    } else if (eTime - bTime > 30 * 24 * 3600 * 1000) {
        $.messager.alert('操作提示', '时间间隔大于30天,请重新选择！', 'info');
        return false;
    }
    return true;
};