/**
 * 分页工具 by 姜友瑶 2016-07-20
 */
var Pagination = function() {

	return {
		initParam:{
			pageNow : 1,
			pageSize : 10,
			url:"",
			pagingBoxSelect:"#pagingBox",
			showdataBoxSelect:"#showdataBox",
			offsetSelect:"#_offset",//数据角标
			builderDate:null,//创建数据函数
		},
		
		init:function(param){
			initParam=$.extend(this.initParam,param);
			console.log(param)
			console.log(initParam)
			return this;
		},

		/**
		 * 改变页数
		 */
		changePage : function(_pageNow) {
			initParam.pageNow = _pageNow;
			$(initParam.offsetSelect).val((initParam.pageNow - 1) * initParam.pageSize);
			this.serchDate();
		},
		
		//搜索数据
		 serchDate:function(){
			
			$.AjaxProxy({c:false,p:MForm.toJson("#dataform")}).invoke(initParam.url , function(loj){
				$(initParam.showdataBoxSelect).empty().html(Pagination.initParam.builderDate(loj));
				//构建分页信息
				Pagination.paging(loj.getValue("total"));
			});
			
		},
		/**
		 * 计算分页
		 */
		 paging:function(rowCount){
			 console.log( initParam.pageNow);
			if(rowCount%initParam.pageSize==0){
				initParam.pageCount=parseInt(rowCount/initParam.pageSize);
				}else{
					initParam.pageCount=parseInt(rowCount/initParam.pageSize+1);
				}
//			var html = '<span><span>共 ' + rowCount + ' 条记录 </span> &nbsp&nbsp共'
//					+ initParam.pageCount + '页/当前第' + initParam.pageNow + '页</span>&nbsp&nbsp';
			var html="";
			if (initParam.pageNow == 1) {
				html += '<a class="size-S mr-5" onclick="javascript:void(0)" >&lt;</a>';
			} else {
				html += '<a class="size-S mr-5"  onclick="Pagination.changePage(' + (initParam.pageNow - 1) + ')"  >&lt;</a>';
			}
			var begin = 0;
			var end = 0;

			if (initParam.pageCount <= 6) {
				begin = 1;
				end = initParam.pageCount;
			} else {
				begin = initParam.pageNow - 2;
				end = initParam.pageNow + 3 >initParam.pageCount?initParam.pageCount:initParam.pageNow + 3 ;
				if (begin < 1) {
					begin = 1;
					end = 6;
				}
				if (end > initParam.pageCount) {
					begin = pageCount - 5;
					end = pageCount;
				}
			}
			if (initParam.pageNow > 3) {
				html += '<a class="size-S mr-5" onclick="Pagination.changePage(' + 1 + ')" >首页</a>';
			}
			for (var i = begin; i <= end; i++) {

				if (initParam.pageNow == i) {
					html += '<a class="active size-S mr-5" onclick="javascript:void(0)" >'
							+ i + '</a>';
				} else {
					html += '<a class=" size-S mr-5" onclick="Pagination.changePage(' + i + ')">' + i + '</a>';
				}

			}
			if (end < initParam.pageCount) {
				html += '<a class=" size-S mr-5" onclick="Pagination.changePage(' + pageCount + ')">尾页</a>';
			}
			if (initParam.pageNow == initParam.pageCount) {
				html += '<a class="size-S mr-5"  onclick="javascript:void(0)">&gt;</a>';
			} else {

				html += '<a class="size-S mr-5" onclick="Pagination.changePage(' + (initParam.pageNow + 1) + ')" >&gt;</a>';
			}
			$(initParam.pagingBoxSelect).empty().html(html);
		}
	}
}();