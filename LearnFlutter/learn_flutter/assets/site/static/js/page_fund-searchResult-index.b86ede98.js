(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["page_fund-searchResult-index"],{"008e":function(t,a,e){"use strict";e.d(a,"b",(function(){return i})),e.d(a,"c",(function(){return n})),e.d(a,"a",(function(){}));var i=function(){var t=this.$createElement,a=this._self._c||t;return a("v-uni-view",{attrs:{id:"search_result"}})},n=[]},1030:function(t,a,e){var i=e("3964");i.__esModule&&(i=i.default),"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=e("4f06").default;n("3a9a3860",i,!0,{sourceMap:!1,shadowMode:!1})},1925:function(t,a,e){"use strict";var i=e("1030"),n=e.n(i);n.a},3964:function(t,a,e){var i=e("24fb");a=i(!1),a.push([t.i,'@charset "UTF-8";\r\n/**\r\n * 这里是uni-app内置的常用样式变量\r\n *\r\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\r\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\r\n *\r\n */\r\n/**\r\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\r\n *\r\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\r\n */\r\n/* 颜色变量 */\r\n/* 行为相关颜色 */\r\n/* 文字基本颜色 */\r\n/* 背景颜色 */\r\n/* 边框颜色 */\r\n/* 尺寸变量 */\r\n/* 文字尺寸 */\r\n/* 图片尺寸 */\r\n/* Border Radius */\r\n/* 水平间距 */\r\n/* 垂直间距 */\r\n/* 透明度 */\r\n/* 文章场景相关 */#search_result[data-v-8d8cd5ae]{width:100%;height:100%}',""]),t.exports=a},4267:function(t,a,e){var i=e("8840");i.__esModule&&(i=i.default),"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=e("4f06").default;n("3799585c",i,!0,{sourceMap:!1,shadowMode:!1})},6276:function(t,a,e){"use strict";e.r(a);var i=e("7eaf"),n=e("c24a");for(var s in n)["default"].indexOf(s)<0&&function(t){e.d(a,t,(function(){return n[t]}))}(s);e("afdc");var r=e("f0c5"),c=Object(r["a"])(n["default"],i["b"],i["c"],!1,null,"dced0c16",null,!1,i["a"],void 0);a["default"]=c.exports},"7b71":function(t,a,e){"use strict";e("7a82"),Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var i={name:"SearchResult",props:{eventData:{type:Object|Array,default:function(){return{}}}},watch:{eventData:{handler:function(){this.setChart()}}},methods:{setChart:function(){var t=this.eventData["x_axis_points"],a=this.eventData["y_axis_amount_points"],e=this.eventData["y_axis_number_points"],i=echarts.init(document.getElementById("search_result"));console.log(1111),i.setOption({tooltip:{trigger:"axis",position:[60,20],extraCssText:"z-index: 3"},legend:{right:"10%",data:["项目数量","资助金额"]},grid:{top:"25%",left:"5%",right:"6%",bottom:"3%",containLabel:!0},xAxis:{type:"category",data:t,boundaryGap:!1},yAxis:[{name:"资助金额(共".concat(this.eventData["all_amount_sum"]||0,"万)"),type:"value",axisLabel:{formatter:"{value}万"}},{name:"项目数量(共".concat(this.eventData["all_number_sum"]||0,"个)"),type:"value",position:"right",axisLabel:{formatter:"{value}个"}}],series:[{name:"资助金额",type:"line",data:a,yAxisIndex:0},{name:"项目数量",type:"line",data:e,yAxisIndex:1}]}),0==t.length&&i.clear()}}};a.default=i},"7eaf":function(t,a,e){"use strict";e.d(a,"b",(function(){return i})),e.d(a,"c",(function(){return n})),e.d(a,"a",(function(){}));var i=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("v-uni-view",{staticClass:"container",style:{paddingTop:t.$store.state.NAVBAR_HEIGHT+6+"px"}},[e("Navbar",{attrs:{barTitle:"查询结果"}}),e("v-uni-view",{staticClass:"condition"},[t._v("搜索条件匹配："),e("v-uni-text",{staticStyle:{color:"rgba(15, 168, 172, 1)"}},[t._v(t._s(t.count_match))]),t._v("条相关记录！结果最多显示"+t._s(t.count_show)+"条，如果匹配结果太多，请您进一步精炼筛选条件。")],1),t.showChart?e("v-uni-view",{staticClass:"chart-content"},[e("v-uni-view",{staticClass:"title"},[t._v(t._s(t.queryParams["titleName"]))]),e("v-uni-view",{staticClass:"chart"},[e("SearchResultChart",{attrs:{eventData:t.statistics}})],1)],1):t._e(),e("v-uni-view",{staticClass:"content"},[t._l(t.resultList,(function(a){return e("v-uni-view",{key:a.id,staticClass:"card"},[e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("题目")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.title||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("负责人")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.owner||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("单位")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.organization||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("金额（万）")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.amount||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("项目编号")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.projectid||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("项目类型")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.projecttype||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("所属学部")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.categoryname||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("批准年份")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.approveyear||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("学科分类")]),e("v-uni-view",{staticClass:"data"},[t._v("一级："+t._s(a.categoryname1||"-")+", 二级："+t._s(a.categoryname2||"-")+",\n          三级："+t._s(a.categoryname3||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("学科代码")]),e("v-uni-view",{staticClass:"data"},[t._v("一级："+t._s(a.categorycode1||"-")+", 二级："+t._s(a.categorycode2||"-")+",\n          三级："+t._s(a.categorycode3||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("执行时间")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.starttime||"-")+" 至 "+t._s(a.endtime||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("中文关键词")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.keywords_chinese||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("英文关键词")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.keywords_english||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("结题摘要")]),e("v-uni-view",{staticClass:"data"},[t._v(t._s(a.abstract_finished||"-"))])],1),e("v-uni-view",{staticClass:"card-item"},[e("v-uni-view",{staticClass:"label"},[t._v("参与人列表")]),e("v-uni-view",{staticClass:"data"},[t._v("-")])],1)],1)})),t.count_show==t.resultList.length?e("v-uni-view",{staticStyle:{"padding-bottom":"27rpx","font-size":"28rpx",color:"#767676","text-align":"center"}},[t._v("没有更多了...")]):t._e()],2)],1)},n=[]},8840:function(t,a,e){var i=e("24fb");a=i(!1),a.push([t.i,'@charset "UTF-8";\r\n/**\r\n * 这里是uni-app内置的常用样式变量\r\n *\r\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\r\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\r\n *\r\n */\r\n/**\r\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\r\n *\r\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\r\n */\r\n/* 颜色变量 */\r\n/* 行为相关颜色 */\r\n/* 文字基本颜色 */\r\n/* 背景颜色 */\r\n/* 边框颜色 */\r\n/* 尺寸变量 */\r\n/* 文字尺寸 */\r\n/* 图片尺寸 */\r\n/* Border Radius */\r\n/* 水平间距 */\r\n/* 垂直间距 */\r\n/* 透明度 */\r\n/* 文章场景相关 */.container[data-v-dced0c16]{background-color:#eee;min-height:100vh}.condition[data-v-dced0c16]{padding:%?40?% %?32?%;font-size:%?32?%;font-family:Font-Regular,Heiti SC;font-weight:400;color:#767676}.chart-content[data-v-dced0c16]{margin-bottom:%?40?%;padding:0 %?32?%}.chart-content .title[data-v-dced0c16]{margin-bottom:%?40?%;font-size:%?34?%;font-family:Font-Bold,Heiti SC;font-weight:400;color:#1a1a1a}.chart-content .chart[data-v-dced0c16]{width:100%;height:%?400?%;background-color:#fff}.content[data-v-dced0c16]{padding:0 %?16?%\r\n  /* 表单样式 */}.content .card[data-v-dced0c16]{box-sizing:border-box;width:100%;padding:%?40?% %?16?%;margin-bottom:%?32?%;background:#fff;box-shadow:0 %?6?% %?16?% 0 rgba(0,0,0,.16);border-radius:%?20?%}.content .card .card-item[data-v-dced0c16]{display:flex;margin-bottom:%?20?%}.content .card .card-item .label[data-v-dced0c16]{width:%?144?%;font-size:%?26?%;font-family:Font-Bold,Heiti SC;font-weight:400;color:#1a1a1a}.content .card .card-item .data[data-v-dced0c16]{flex:1;font-size:%?26?%;font-family:Font-Regular,Heiti SC;font-weight:400;color:#767676}.content .card .card-item[data-v-dced0c16]:last-child{margin-bottom:0}',""]),t.exports=a},"90e6":function(t,a,e){"use strict";e.r(a);var i=e("7b71"),n=e.n(i);for(var s in i)["default"].indexOf(s)<0&&function(t){e.d(a,t,(function(){return i[t]}))}(s);a["default"]=n.a},afdc:function(t,a,e){"use strict";var i=e("4267"),n=e.n(i);n.a},b0ad:function(t,a,e){"use strict";e.r(a);var i=e("008e"),n=e("90e6");for(var s in n)["default"].indexOf(s)<0&&function(t){e.d(a,t,(function(){return n[t]}))}(s);e("1925");var r=e("f0c5"),c=Object(r["a"])(n["default"],i["b"],i["c"],!1,null,"8d8cd5ae",null,!1,i["a"],void 0);a["default"]=c.exports},c24a:function(t,a,e){"use strict";e.r(a);var i=e("d268"),n=e.n(i);for(var s in i)["default"].indexOf(s)<0&&function(t){e.d(a,t,(function(){return i[t]}))}(s);a["default"]=n.a},d268:function(t,a,e){"use strict";e("7a82");var i=e("4ea4").default;Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0,e("99af");var n=i(e("c7eb")),s=i(e("5530")),r=i(e("1da1")),c=i(e("b0ad")),o={name:"searchResult",components:{SearchResultChart:c.default},data:function(){return{count_show:0,count_match:0,showChart:!1,resultList:[],interfaceName:"",statistics:[],page:1,queryParams:{},timer:null}},onLoad:function(t){t.params&&(this.queryParams=JSON.parse(decodeURIComponent(t.params))||{},this.resultList=[],this.initData())},onShow:function(){window.flutter_inappwebview&&window.flutter_inappwebview.callHandler("keke",'{"type": "goDetails"}')},onReachBottom:function(){var t=this;this.resultList.length<this.count_match&&(this.timer&&clearTimeout(this.timer),uni.showLoading({title:"正在加载中..."}),this.timer=setTimeout((function(){t.page++,t.queryResult()}),1e3))},methods:{initData:function(){if(this.showChart=!1,"basic"==this.queryParams.searchType)this.interfaceName="grantSearchByBasic";else switch(this.queryParams["key"]){case"subject1":this.interfaceName="grantSearchBySubjectSingle";break;case"subject2":this.interfaceName="grantSearchByFieldMultiple";break;case"subject3":this.interfaceName="grantSearchByFieldSingle";break;case"subject4":this.interfaceName="grantSearchBySubjectAndFieldMultiple";break;case"person1":this.interfaceName="grantSearchByOwnerSingleOrganization";break;case"person2":this.interfaceName="grantSearchByOwnerMultipleOrganization";break;case"unit1":this.interfaceName="grantSearchByOrganizationSingle";break;case"unit2":this.interfaceName="grantSearchByOrganizationMultiple";break;case"unit3":this.interfaceName="grantSearchByOrganizationRank";break;case"box1":this.interfaceName="grantSearchByProvinceSingle";break;case"box2":this.interfaceName="grantSearchByProvinceMultiple";break;case"search1":this.interfaceName="grantSearchByFullRange";break}this.queryResult()},queryResult:function(){var t=this;return(0,r.default)((0,n.default)().mark((function a(){var e,i,r;return(0,n.default)().wrap((function(a){while(1)switch(a.prev=a.next){case 0:return e=(0,s.default)({currentpage:t.page},t.queryParams),1==t.page&&uni.showLoading({title:"正在加载中..."}),delete e.key,delete e.titleName,a.prev=4,a.next=7,t.$axios.fund[t.interfaceName](e,!1);case 7:i=a.sent,r=i.data,uni.hideLoading(),t.resultList=t.resultList.concat(r.projects||[]),t.count_show=r.count_show,t.count_match=r.count_match,"basic"!=t.queryParams.searchType&&"search1"!=t.queryParams["key"]&&(t.showChart=!0,t.$nextTick((function(){t.setLineChart(r.statistics)}))),a.next=20;break;case 16:a.prev=16,a.t0=a["catch"](4),t.$kekeToast({title:a.t0.message,icon:"error",timeout:0}),uni.navigateBack();case 20:case"end":return a.stop()}}),a,null,[[4,16]])})))()},setLineChart:function(t){this.statistics=t}}};a.default=o}}]);