/**
 * 
 */
function EmoaUtil(){
	
}

EmoaUtil.prototype={
		getLoginUser:function(){
			var loginUser;
			$.ajax({
				url:"loadCurrentLoginUser.do",
				async:false,
				cache:false,
				type:"POST",
				success:function(data){
					loginUser = data.data;
				}
			});
			return loginUser;
		},
		showInfoMessage:function(msg){
			$.messager.alert("提示",msg,"info");
		},
		showErrorMessage:function(msg){
			$.messager.alert("错误",msg,"error");
		},
		showWarningMessage:function(msg){
			$.messager.alert("警告",msg,"warning");
		},
		showMessage:function(msg){
			$.messager.show({
				msg:msg,
				timeout:5000,
				showType:'slide'
			});
		},

		/**
		 * 将平行数组形式json对象转换成树形结构
		 * datas，field:比对的属性，
		 * pField:子对象引用的父对象的字段值
		 * cField:父对象存储的子对象数组
		 * data:如果data不为空，则需将data加入datas中的某个元素作为其子节点，需迭代处理
		 * return [treeDatas,childrenDatas]
		 */
		arr2tree:function(datas,field,pField,cField){//更改算法(不使用迭代方式)
			if(!datas||!field||!pField)return [datas,[]];
			var ps={},i=0,len=datas.length,children=[];
			for(i;i<len;i++){ps[datas[i][field]]=datas[i];}
			for(i=0;i<len;i++){
				var data=datas[i];
				if(data[pField]){
					var p=ps[data[pField]];
					if(!p){continue;}
					datas.splice(i,1);
					children.push(data);
					if(p[cField]){
						p[cField].push(data);
					}else{
						p[cField]=[data];
					}
					i--;len--;
				}
			}
			return [datas,children];
		}
}

var util=new EmoaUtil();