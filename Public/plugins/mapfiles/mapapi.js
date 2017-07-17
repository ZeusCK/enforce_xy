//定义googleMapPath 常量
if(typeof app == 'undefined')  console.log('请引入APP.js后,var app = new App();');
window.googleMapPath = app.public+'/plugins/';

window.google = window.google || {};
google.maps = google.maps || {};
(function() {

  function getScript(src) {
    document.write('<script src="'+window.googleMapPath + src + '" type="text/javascript"><\/script>');
  }

  var modules = google.maps.modules = {};
  google.maps.__gjsload__ = function(name, text) {
    modules[name] = text;
  };
  //根据不同的目录需要修改路径
  google.maps.Load = function(apiLoad) {
    delete google.maps.Load;
    apiLoad([null,[[["",""],null,null,null,null,"m@255000000",["",""]],[["",""],null,null,null,1,"145",["",""]],[["",""],null,null,null,null,"h@255000000",[""]],[["",""],null,null,null,null,"t@132,r@255000000",["",""]],null,null,[[""]],[["",""],null,null,null,null,"84",["",""]],[["",""]],[["",""]],[["",""]],[["",""]],[["",""]],[["",""]],[["",""]]],
      ["zh-CN","CN",null,0,null,null,window.googleMapPath+"mapfiles/","","",""],
      [window.googleMapPath+"mapfiles/api-3/16/2","3.16.2"],[202450162],1,null,null,null,null,0,"",null,null,0,"",null,"","",null,window.googleMapPath+"mapfiles",[["",""],["",""],[null,[[0,"m",255000000]],[null,"zh-CN","CN",null,18,null,null,null,null,null,null,[[47],[37,[["smartmaps"]]]]],0],[null,[[0,"m",255000000]],[null,"zh-CN","CN",null,18,null,null,null,null,null,null,[[47],[37,[["smartmaps"]]]]],3],[null,[[0,"m",255000000]],[null,"zh-CN","CN",null,18,null,null,null,null,null,null,[[50],[37,[["smartmaps"]]]]],0],[null,[[0,"m",255000000]],[null,"zh-CN","CN",null,18,null,null,null,null,null,null,[[50],[37,[["smartmaps"]]]]],3],[null,[[4,"t",132],[0,"r",132000000]],[null,"zh-CN","CN",null,18,null,null,null,null,null,null,[[5],[37,[["smartmaps"]]]]],0],[null,[[4,"t",132],[0,"r",132000000]],[null,"zh-CN","CN",null,18,null,null,null,null,null,null,[[5],[37,[["smartmaps"]]]]],3],[null,null,[null,"zh-CN","CN",null,18],0],[null,null,[null,"zh-CN","CN",null,18],3],[null,null,[null,"zh-CN","CN",null,18],6],[null,null,[null,"zh-CN","CN",null,18],0],[""],""],2,500], loadScriptTime);
  };
  var loadScriptTime = (new Date).getTime();
  getScript("mapfiles/api-3/16/2/main.js");
})();