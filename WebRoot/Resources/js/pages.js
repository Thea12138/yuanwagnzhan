/**
 * 做分页计算的公共函数
 * 
 */
	function pages(rows,pagerowCount,pageno){
		var row =parseInt(rows);
		var pa=parseInt(pagerowCount);
		var pageviewno = Math.ceil(row/pa);
		var totalPage;
		if(pageviewno>10){
			totalPage=10;
		}else{
			totalPage=pageviewno;
		}
		//alert("sessionStorage.pageno:"+sessionStorage.pageno);
		sessionStorage.pageno=pageno;
		SetPaginator(pageno,rows,pageviewno,totalPage);
	}
		// 设置分页
	function SetPaginator(currentPage, pagerowCount, pageviewno,totalPage) {

		var options = {
			alignment : 'center',
			//设置当前页
			currentPage : currentPage,
			//显示几个操作按钮
			numberOfPages : totalPage,
			//设置总页数
			totalPages : pageviewno,
			onPageClicked : function(e, originalEvent, type, page) {
				GetChangePageData(page);
			}
		};
		
		$('#pages').bootstrapPaginator(options);
	}