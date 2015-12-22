<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	String pid=(String)request.getAttribute("pid");
%>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/style.css" />
<title>Categories Analysis</title>
</head>
<body>
	<!-- header part -->
	<s:action name="header" namespace="/" executeResult="true"
		ignoreContextParams="true"></s:action>
	<!-- header part finished -->
	<div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
		<div class="linktree">
			<a href="#">Home</a> &raquo; <a href="#">ProductName</a>
		</div>
		<br>
		<h1 style="margin-top: -10px;">ProductName</h1>
		<br>
		<div id="notification"></div>
		<script type="text/javascript" src="<%=basePath%>/js/echarts.js"></script>
		<script type="text/javascript">
		function createRandomItemStyle() {
		    return {
		        normal: {
		            color: 'rgb(' + [
		                Math.round(Math.random() * 160),
		                Math.round(Math.random() * 160),
		                Math.round(Math.random() * 160)
		            ].join(',') + ')'
		        }
		    };
		}
			require.config({
				paths : {
					echarts : '<%=basePath%>/js/dist'
				}
			});
			require([ 'echarts', 'echarts/chart/line', 'echarts/chart/bar',
					'echarts/chart/wordCloud' ],
			//渲染ECharts图表  
			function DrawEChart(ec) {
				var priceTrendChart = ec.init(document
						.getElementById('price-trend'));
				priceTrendChart.showLoading({  
	                text : "图表数据正在努力加载..."  
	            }); 
				var priceTrendOption = {
					title : {
						text : '产品历史价格走势'
					},
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : [ '价格' ]
					},
					toolbox : {
						show : true,
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : false
							},
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					xAxis : [ {
						type : 'category',
						boundaryGap : false,
						data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
					} ],
					yAxis : [ {
						type : 'value',
						axisLabel : {
							formatter : '{value} 元'
						}
					} ],
					series : [ {
						name : '产品价格',
						type : 'line',
						data : [ 110, 110, 120, 120, 110, 150, 110 ],
						markPoint : {
							data : [ {
								type : 'max',
								name : '最高价格'
							}, {
								type : 'min',
								name : '最低价格'
							} ]
						},
						markLine : {
							data : [ {
								type : 'average',
								name : '平均价格'
							} ]
						}
					} ]
				};

				//分数走势图
				var scoreTrendChart = ec.init(document
						.getElementById('score-trend'));
				scoreTrendChart.showLoading({  
	                text : "图表数据正在努力加载..."  
	            }); 
				var scoreTrendOption = {
					title : {
						text : '产品分数走势'
					},
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : [ '评价分数' ]
					},
					toolbox : {
						show : true,
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : false
							},
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					xAxis : [ {
						type : 'category',
						boundaryGap : false,
						data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
					} ],
					yAxis : [ {
						type : 'value',
						axisLabel : {
							formatter : '{value}'
						}
					} ],
					series : [ {
						name : '产品分数',
						type : 'line',
						data : [ 4.9, 4.9, 4.9, 4.8, 4.8, 4.8, 4.7 ],
						markPoint : {
							data : [ {
								type : 'max',
								name : '最高分数'
							}, {
								type : 'min',
								name : '最低分数'
							} ]
						},
						markLine : {
							data : [ {
								type : 'average',
								name : '平均分数'
							} ]
						}
					} ]
				};

				//销量走势图
				var salesTrendChart = ec.init(document
						.getElementById('sales-trend'));
				salesTrendChart.showLoading({  
	                text : "图表数据正在努力加载..."  
	            }); 
				var salesTrendOption = {
					title : {
						text : '产品销量走势'
					},
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : [ '产品销量' ]
					},
					toolbox : {
						show : true,
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : false
							},
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					xAxis : [ {
						type : 'category',
						boundaryGap : false,
						data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
					} ],
					yAxis : [ {
						type : 'value',
						axisLabel : {
							formatter : '{value}'
						}
					} ],
					series : [ {
						name : '产品销量',
						type : 'line',
						data : [ 480, 485, 494, 494, 515, 540, 555 ],

					} ]
				};
				var productRecommendChart = ec.init(document.getElementById('product-recommend'));
				productRecommendChart.showLoading({  
	                text : "图表数据正在努力加载..."  
	            }); 
				var productRecommendOption = {
					title : {
						text : '产品推荐'
					},
					tooltip : {
						show : true
					},
					series : [ {
						name : '产品推荐',
						type : 'wordCloud',
						size : [ '80%', '80%' ],
						textRotation : [ 0, 45, 90, -45 ],
						textPadding : 0,
						autoSize : {
							enable : true,
							minSize : 14
						},
						data : [ {
							name : "芦荟胶",
							value : 10000,
							itemStyle : {
								normal : {
									color : 'black'
								}
							}
						}, {
							name : "Innisfree洁面奶",
							value : 6181,
							itemStyle : createRandomItemStyle()
						}, {
							name : "花印美白精华",
							value : 4386,
							itemStyle : createRandomItemStyle()
						}, {
							name : "保水面膜",
							value : 4055,
							itemStyle : createRandomItemStyle()
						}, {
							name : "气垫bb",
							value : 2467,
							itemStyle : createRandomItemStyle()
						}, {
							name : "补水保湿霜",
							value : 2244,
							itemStyle : createRandomItemStyle()
						}, {
							name : "去角质膏",
							value : 1898,
							itemStyle : createRandomItemStyle()
						}, {
							name : "一叶子面膜",
							value : 1484,
							itemStyle : createRandomItemStyle()
						}, {
							name : "身体乳",
							value : 1112,
							itemStyle : createRandomItemStyle()
						}, {
							name : "护发素",
							value : 965,
							itemStyle : createRandomItemStyle()
						} ]
					} ]
				};
				var brandProductChart = ec.init(document
						.getElementById('brand_product'));
				brandProductChart.showLoading({  
	                text : "图表数据正在努力加载..."  
	            }); 
				var brandProductOption = {
					title : {
						text : '同品牌产品推荐'
					},
					tooltip : {
						show : true
					},
					series : [ {
						name : '同品牌产品推荐',
						type : 'wordCloud',
						size : [ '80%', '80%' ],
						textRotation : [ 0, 45, 90, -45 ],
						textPadding : 0,
						autoSize : {
							enable : true,
							minSize : 14
						},
						data : [ {
							name : "Innisfree芦荟胶",
							value : 10000,
							itemStyle : {
								normal : {
									color : 'black'
								}
							}
						}, {
							name : "Innisfree洁面奶",
							value : 6181,
							itemStyle : createRandomItemStyle()
						}, {
							name : "Innisfree美白精华",
							value : 4386,
							itemStyle : createRandomItemStyle()
						}, {
							name : "Innisfree保水面膜",
							value : 4055,
							itemStyle : createRandomItemStyle()
						}, {
							name : "Innisfree气垫bb",
							value : 2467,
							itemStyle : createRandomItemStyle()
						}, {
							name : "Innisfree补水保湿霜",
							value : 2244,
							itemStyle : createRandomItemStyle()
						}, {
							name : "Innisfree去角质膏",
							value : 1898,
							itemStyle : createRandomItemStyle()
						}, {
							name : "Innisfree面膜",
							value : 1484,
							itemStyle : createRandomItemStyle()
						}, {
							name : "Innisfree身体乳",
							value : 1112,
							itemStyle : createRandomItemStyle()
						}, {
							name : "Innisfree护发素",
							value : 965,
							itemStyle : createRandomItemStyle()
						} ]
					} ]
				};
				var url='${pageContext.request.contextPath}/productAjax.action?productId=<%=pid%>';
				$.ajax({  
	                type : "post",  
	                async : false, //同步执行  
	                url : url, 
	                dataType : "json", //返回数据形式为json  
	                success : function(result) {  
	                    if (result) {  
	                    	priceTrendOption.xAxis[0].data = result.priceTime;  
	                    	priceTrendOption.series[0].data = result.priceData;
	                    	scoreTrendOption.xAxis[0].data = result.scoreTime;  
	                    	scoreTrendOption.series[0].data = result.scoreData;
	                    	salesTrendOption.xAxis[0].data = result.salesTime;  
	                    	salesTrendOption.series[0].data = result.salesData;
	                    	productRecommendOption.series[0].data.name=result.productName;
	                    	productRecommendOption.series[0].data.value=result.productSales;
	                    	brandProductOption.series[0].data.name=result.blandName;
	                    	brandProductOption.series[0].data.value=result.blandSales;
	                    	 
	                    	priceTrendChart.hideLoading();  
	                    	priceTrendChart.setOption(priceTrendOption); 
	                    	scoreTrendChart.hideLoading();  
	                    	scoreTrendChart.setOption(scoreTrendOption);
	                    	salesTrendChart.hideLoading();  
	                    	salesTrendChart.setOption(salesTrendOption);
	                    	productRecommendChart.hideLoading();  
	                    	productRecommendChart.setOption(productRecommendOption);
	                    	brandProductChart.hideLoading();  
	                    	brandProductChart.setOption(brandProductOption);
	                    }  
	                },  
	                error : function(errorMsg) {  
	                    alert("不好意思，大爷，图表请求数据失败啦!");  
	                    priceTrendChart.hideLoading();
	                    scoreTrendChart.hideLoading();
	                    salesTrendChart.hideLoading();
	                    productRecommendChart.hideLoading();
	                    brandProductChart.hideLoading();
	                }  
	            });  
			});
		</script>
		<div id="column-left">
			<div class="box" id="box-menufix">
				<div class="box-heading_left">分析内容</div>
				<div class="box-content" style="background: none; border: none;">
					<div class="box-category">
						<ul>
							<li><a href="#product-deatail">商品信息</a>
							<li><a href="#price-trend">价格走势</a>
							<li><a href="#score-trend">分数走势</a>
							<li><a href="#sales-trend">销量走势</a></li>
							<li><a href="#product-recommend">相关产品推荐</a></li>
							<li><a href="#bland-product">同品牌产品推荐</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<div id="content">
			<div class="content-title">商品信息</div>
			<div class="category-info" id="product-detail">
				<div class="product-name">
					<span><s:property value="productDetail.productBrandName"/></span><s:property value="productDetail.productName"/>
				</div>
				<div class="image">
					<img src="<%=basePath%>/images/product_img.jpg" alt="Product" />
				</div>
				<div class="product-moredetail">
					类别：<s:property value="productDetail.categoryName"/>/<s:property value="productDetail.typeName"/> <br>
					<hr style="border: 1px dotted #ccc" />
					<br> <span style="font-size: 20px; color: #e83d02;"><s:property value="productDetail.productPrice"/></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<del><s:property value="productDetail.productOriginalPrice"/></del>
					<br>
					<hr style="border: 1px dotted #ccc" />
					<br> 已购买人数<span style="color: #e83d02;"><s:property value="productDetail.productSalesNum"/></span>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="productDetail.productScore"/>(<s:property value="productDetail.productKoubeiNum"/>篇口碑/<s:property value="productDetail.productCommentNum"/>条评论）
					<br>
					<hr style="border: 1px dotted #ccc" />
					<br> 功效：<s:property value="productDetail.productFunction"/> <br>适用人群：<s:property value="productDetail.productTargetUser"/> <br>规格：<s:property value="productDetail.productStandard"/>
					<br>生产地：<s:property value="productDetail.productYiedly"/> <br>评分细节：<s:property value="productDetail.productScoreDetail"/> <br>肤质分布：<s:property value="productDetail.productSkinDistribute"/>
					<br>
					<hr style="border: 1px dotted #ccc" />
					<br>
					<div class="purchase-button">
						<a href="<s:property value="productDetail.productUrl"/>" class="button" id="purchase-button1"><span>点击前往购买</span></a>
					</div>

				</div>
			</div>
			<div class="content-title">价格走势</div>
			<div class="category-info" id="price-trend"
				style="height: 400px; width: 775px;"></div>
			<div class="content-title">分数走势</div>
			<div class="category-info" id="score-trend"
				style="height: 400px; width: 775px;"></div>
			<div class="content-title">销量走势</div>
			<div class="category-info" id="sales-trend"
				style="height: 400px; width: 775px;"></div>
			<div class="content-title">相关产品推荐</div>
			<div class="category-info" id="product-recommend"
				style="height: 400px; width: 775px;"></div>
			<div class="content-title">同品牌产品推荐</div>
			<div class="category-info" id="brand_product"
				style="height: 400px; width: 775px;"></div>
			<div class="clearfix"></div>

		</div>

	</div>

	<!-- footer part -->
	<s:action name="footer" namespace="/" executeResult="true"
		ignoreContextParams="true"></s:action>
	<!-- footer part finished -->
</body>
</html>