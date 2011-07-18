<%--
  - Author: isv, tangzx, flexme, Veve
  -
  - Version: 1.0.2 (Cockpit Enterprise Dashboard 2 Assembly 1.0)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the Enterprise Dashboard view.
  -
  - Version 1.0.1 - Direct - Project Dashboard Assembly Change Note
  - Show project status color in enterprise health table.
  -
  - Version 1.0.2 - Cockpit - Enterprise Dashboard 2 Assembly Change Note
  - Implemented latest changes to UI according to requirements
  -
  - Version 1.0.3 - TC Cockpit Enterprise Dashboard Update Cost Breakdown Assembly Change Note
  - Add contest cost breakdown and market cost breakdown popup windows.
  -
  - Version 1.1 - Release Assembly - TC Cockpit Enterprise Dashboard Update Assembly 1 Change Note
  - Add the new summary panel for chart view and table view.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>
<fmt:setLocale value="en_US"/>
<ui:dashboardPageType tab="overview"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="includes/htmlhead.jsp"/>
    <link rel="stylesheet" href="/css/datepicker.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/dashboard-view.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/dashboard-enterprise.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/jquery.multiSelect.css" media="all" type="text/css"/>

    <!-- load the data for Charts -->
    <script type="text/javascript">
        var chartData =
        {
            contest:{
                column:["date", "Customer Avg Contest Duration", "Market Avg Contest Duration"],
                week:[
                <c:forEach items="${viewData.durationStats['WEEK']}" var="stat" varStatus="loop">
                    <c:if test="${loop.index > 0}">,</c:if>
                    {date:"<c:out value='${stat.timePeriodLabel}'/>",
                     customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                     tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                </c:forEach>
                ],
                month:[
                    <c:forEach items="${viewData.durationStats['MONTH']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ],
                quarter:[
                    <c:forEach items="${viewData.durationStats['QUARTER']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ],
                year:[
                    <c:forEach items="${viewData.durationStats['YEAR']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ]
            },
            cost:{
                column:["date", "Customer Avg Cost", "Market Avg Cost"],
                week:[
                    <c:forEach items="${viewData.costStats['WEEK']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ],
                month:[
                    <c:forEach items="${viewData.costStats['MONTH']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ],
                quarter:[
                    <c:forEach items="${viewData.costStats['QUARTER']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ],
                year:[
                    <c:forEach items="${viewData.costStats['YEAR']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ]
            },
            fulfill:{
                column:["date", "Customer Avg Fulfillment", "Market Avg Fulfillment"],
                week:[
                    <c:forEach items="${viewData.fulfillmentStats['WEEK']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ],
                month:[
                    <c:forEach items="${viewData.fulfillmentStats['MONTH']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ],
                quarter:[
                    <c:forEach items="${viewData.fulfillmentStats['QUARTER']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ],
                year:[
                    <c:forEach items="${viewData.fulfillmentStats['YEAR']}" var="stat" varStatus="loop">
                        <c:if test="${loop.index > 0}">,</c:if>
                        {date:"<c:out value='${stat.timePeriodLabel}'/>",
                         customer:<fmt:formatNumber value="${stat.clientValue}" pattern="0.##" />,
                         tc:<fmt:formatNumber value="${stat.overallValue}" pattern="0.##" />}
                    </c:forEach>
                ]
            }
        }

        var isAdmin = ${admin}; 
        
    </script>
    <!-- google visualization -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="/scripts/dashboard-chart.js"></script>
    <script type="text/javascript" src="/scripts/dashboard-view.js"></script>
    <script type="text/javascript" src="/scripts/dashboard-chart-range.js"></script>
    <script type="text/javascript" src="/scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="/scripts/jquery.multiselect.js"></script>
	<script type="text/javascript" src="/scripts/jquery.tools.min.js"></script>
</head>

<body id="page">
<div id="wrapper">
    <div id="wrapperInner">
        <div id="container">
            <div id="content">

                <jsp:include page="includes/header.jsp"/>

                <div id="mainContent">

                    <jsp:include page="includes/right.jsp"/>

                    <div id="area1"><!-- the main area -->
                        <div class="area1Content">

                            <div class="spaceWhite"></div>
                            <div class="dashboardTable">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" class="expand">Enterprise Health</a>
                                    </dt>
                                    <dd>
                                        <div class="dashboardTableBody">
                                            <table cellpadding="0" cellspacing="0" id="enterpriseHealthTable">
                                                <colgroup>
                                                    <col/>
                                                    <col width="17%"/>
                                                    <col width="17%"/>
                                                    <col width="17%"/>
                                                    <col width="17%"/>
                                                </colgroup>
                                                <tr>
                                                    <th class="first">Project</th>
                                                    <th>Average Contest Duration (Hours)</th>
                                                    <th>Average Cost per Contest</th>
                                                    <th>Total Project Cost</th>
                                                    <th>Average Fulfillment</th>
                                                </tr>
                                                <tbody>
                                                <c:forEach items="${viewData.projects}" var="project">
                                                    <tr>
                                                        <td class="first">
                                                            <a class="longWordsBreak ${project.projectStatusColor.name}"
                                                               href="projectOverview?formData.projectId=${project.project.id}">
                                                                <c:out value="${project.project.name}"/></a>
                                                        </td>
                                                        <td><span class="">
                                                        <fmt:formatNumber value="${project.averageContestDuration}"
                                                                          pattern="##0.##"/></span></td>
                                                        <td><span class="">
                                                        <fmt:formatNumber value="${project.averageCostPerContest}"
                                                                          pattern="$#,##0.00"/></span></td>
                                                        <td><span class="">
                                                        <fmt:formatNumber value="${project.totalProjectCost}"
                                                                          pattern="$#,##0.00"/></span></td>
                                                        <td><span class="">
                                                        <fmt:formatNumber value="${project.averageFulfillment}"
                                                                          pattern="##0.##"/>%</span></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                            <!-- End .dashboardTable -->

                            <div class="chartCollapse">
                                <a class="expand" href="javascript:void(0)">Chart View</a>
                                <div class="btnArea">
                                    <a href="javascript:" class="active btnGraph"></a>
                                    <a href="javascript:" class="btnTable"></a>
                                </div>
                            </div>

                            <div class="chartContent">

                                <div class="summaryPanel">
                                    <fmt:parseDate value="${formData.startDate}" pattern="MM/dd/yyyy" var="startDate"/>
                                    <fmt:parseDate value="${formData.endDate}" pattern="MM/dd/yyyy" var="endDate"/>
                                    <span class="zoomMessage" id="zoomMessage"></span>
									<span class="date">Date : <span id="startDateLabel"><fmt:formatDate value="${startDate}" pattern="MMM dd,yyyy"/></span> - <span id="endDateLabel"><fmt:formatDate value="${endDate}" pattern="MMM dd,yyyy"/></span></span>
									<ul class="tabs customer">
										<li><a href="javascript:;" class="customer current">Customer Summary</a></li>
										<li><a href="javascript:;" class="market">Market Summary</a></li>
										<li><a href="javascript:;" class="compare">Compare</a></li>
									</ul>
									<div class="tabsContent">
										<div class="customerSummary">
											<table id="customerSummaryData" cellpadding="0" cellspacing="0" class='<s:if test="viewData.customerSummary == null">hide</s:if>'>
												<tbody>
													<tr>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Fulfillment
																<div class="tooltipBox firstColumn"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Fulfillment</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average contests fulfillment of the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="customerAverageFulfillment" class="fieldData"><fmt:formatNumber value="${viewData.customerSummary.averageFulfillment}" pattern="##0.##"/>%</td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Duration
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Duration</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average Contest Duration of the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="customerAverageDuration" class="fieldData"> <fmt:formatNumber value="${viewData.customerSummary.averageContestDuration}" pattern="##0.#"/> days</td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Vol
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Total number of contests completed in the date range for customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="customerTotalVol" class="fieldData"><fmt:formatNumber value="${viewData.customerSummary.totalContestVolume}" pattern="##0"/></td>
														<td class="fieldName"><div class="tooltipWrapper"> Cost Range
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Cost Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The cost range of contests for the customer, from min to max</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="customerMinMaxCost" class="fieldData">$<fmt:formatNumber value="${viewData.customerSummary.minContestCost}" pattern="#,##0.00"/> - $<fmt:formatNumber value="${viewData.customerSummary.maxContestCost}" pattern="#,##0.00"/></td>
													</tr>
													<tr>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Cost
																<div class="tooltipBox firstColumn"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The average contest cost of the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="customerAverageCost" class="fieldData">$<fmt:formatNumber value="${viewData.customerSummary.averageContestCost}" pattern="#,##0.00"/></td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Vol
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average Contest Volume in 30 days for the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="customerAverageVol" class="fieldData"><fmt:formatNumber value="${viewData.customerSummary.averageVolPerMonth}" pattern="##0.#"/></td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Member Cost
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Member Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The total memeber cost of the contests for the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="customerTotalCost" class="fieldData">$<fmt:formatNumber value="${viewData.customerSummary.totalMemberCost}" pattern="#,##0.00"/></td>
														<td class="fieldName"><div class="tooltipWrapper"> Duration Range
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Duration Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The contest duration range of contests for the customer, from min to max in days</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="customerMinMaxDuration" class="fieldData"><fmt:formatNumber value="${viewData.customerSummary.minContestDuration}" pattern="##0.#"/> - <fmt:formatNumber value="${viewData.customerSummary.maxContestDuration}" pattern="##0.#"/> days</td>
													</tr>
												</tbody>
											</table>

                                            <table id="customerSummaryNoData" cellpadding="0" cellspacing="0" class='<s:if test="viewData.customerSummary != null">hide</s:if>'>
												<tbody>
													<tr>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Fulfillment
																<div class="tooltipBox firstColumn"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Fulfillment</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average contests fulfillment of the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Duration
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Duration</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average Contest Duration of the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Vol
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Total number of contests completed in the date range for customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Cost Range
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Cost Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The cost range of contests for the customer, from min to max</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
													</tr>
													<tr>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Cost
																<div class="tooltipBox firstColumn"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The average contest cost of the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Vol
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average Contest Volume in 30 days for the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Member Cost
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Member Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The total member cost of the contests for the customer</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Duration Range
																<div class="tooltipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Duration Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The contest duration range of contests for the customer, from min to max in days</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- End .customerSummary -->
										<div class="marketSummary hide">
											<table id="marketSummaryData" cellpadding="0" cellspacing="0" class='<s:if test="viewData.marketSummary == null">hide</s:if>'>
												<tbody>
													<tr>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Fulfillment
																<div class="tooltipBox greenToolTipBox firstColumn"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Fulfillment</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average contests fulfillment of the whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="marketAverageFulfillment" class="fieldData"><fmt:formatNumber value="${viewData.marketSummary.averageFulfillment}" pattern="##0.##"/>%</td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Duration
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Duration</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average Contest Duration of the whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="marketAverageDuration" class="fieldData"><fmt:formatNumber value="${viewData.marketSummary.averageContestDuration}" pattern="##0.#"/> days</td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Vol
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Total number of contests completed in the date range for whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="marketTotalVol" class="fieldData"><fmt:formatNumber value="${viewData.marketSummary.totalContestVolume}" pattern="##0"/></td>
														<td class="fieldName"><div class="tooltipWrapper"> Cost Range
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Cost Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The cost range of contests for the whole market, from min to max</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="marketMinMaxCost" class="fieldData">$<fmt:formatNumber value="${viewData.marketSummary.minContestCost}" pattern="#,##0.00"/> - $<fmt:formatNumber value="${viewData.marketSummary.maxContestCost}" pattern="#,##0.00"/></td>
													</tr>
													<tr>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Cost
																<div class="tooltipBox greenToolTipBox firstColumn"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The average contest cost of the whole market in the date range</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="marketAverageCost" class="fieldData">$<fmt:formatNumber value="${viewData.marketSummary.averageContestCost}" pattern="#,##0.00"/></td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Vol
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average Contest Volume in 30 days for the whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="marketAverageVol" class="fieldData"><fmt:formatNumber value="${viewData.marketSummary.averageVolPerMonth}" pattern="##0.#"/></td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Member Cost
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Member Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The total memeber cost of the contests for the whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="marketTotalCost" class="fieldData">$<fmt:formatNumber value="${viewData.marketSummary.totalMemberCost}" pattern="#,##0.00"/></td>
														<td class="fieldName"><div class="tooltipWrapper"> Duration Range
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Duration Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The contest duration range of contests for the whole market, from min to max in days</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td id="marketMinMaxDuration" class="fieldData"><fmt:formatNumber value="${viewData.marketSummary.minContestDuration}" pattern="##0.#"/> - <fmt:formatNumber value="${viewData.marketSummary.maxContestDuration}" pattern="##0.#"/> days</td>
													</tr>
												</tbody>
											</table>

                                            <table id="marketSummaryNoData" cellpadding="0" cellspacing="0" class='<s:if test="viewData.marketSummary != null">hide</s:if>'>
												<tbody>
													<tr>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Fulfillment
																<div class="tooltipBox greenToolTipBox firstColumn"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Fulfillment</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average contests fulfillment of the whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Duration
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Duration</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average Contest Duration of the whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Vol
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Total number of contests completed in the date range for whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Cost Range
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Cost Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The cost range of contests for the whole market, from min to max</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
													</tr>
													<tr>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Cost
																<div class="tooltipBox greenToolTipBox firstColumn"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The average contest cost of the whole market in the date range</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Vol
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Average Contest Volume in 30 days for the whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Member Cost
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Member Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The total memeber cost of the contests for the whole market</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
														<td class="fieldName"><div class="tooltipWrapper"> Duration Range
																<div class="tooltipBox greenToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Duration Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The contest duration range of contests for the whole market, from min to max in days</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldData">N/A</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- End .marketSummary -->
										<div class="compare hide">
											<table cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td></td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Fulfillment
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Fulfillment</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Comparison of customer average fulfillment with market average fulfillment</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Cost
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Comparison of customer average contest cost with market average contset cost</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Duration
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Duration</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Comparison of customer average contest duration with market average contest duration</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldName"><div class="tooltipWrapper"> Avg. Vol
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Avg. Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Comparison of customer average volume per month with market average volume per month</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Vol
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Vol</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Comparison of customer total contests volume with market total contests volume</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldName"><div class="tooltipWrapper"> Total Member Cost
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Total Member Cost</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Comparison of customer total member cost with market total member cost</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldName"><div class="tooltipWrapper"> Cost Range
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Cost Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Comparison of customer contest cost range with market contest cost range</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldName"><div class="tooltipWrapper"> Duration Range
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Duration Range</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>Comparison of customer contest duration range with market contest duration range</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
														<td class="fieldName"><div class="tooltipWrapper"> Mkt Cap %
																<div class="tooltipBox orangeToolTipBox"> <span class="arrow"></span>
																	<div class="tooltipHeader">
																		<div class="tooltipHeaderRight">
																			<div class="tooltipHeaderCenter">
																				<h2>Mkt Cap %</h2>
																			</div>
																		</div>
																	</div>
																	<!-- End .tooltipHeader -->
																	<div class="tooltipContent">
																		<p>The percentage of (customer total member cost / market total member cost)</p>
																	</div>
																	<!-- End .tooltipContent -->
																	<div class="tooltipFooter">
																		<div class="tooltipFooterRight">
																			<div class="tooltipFooterCenter"></div>
																		</div>
																	</div>
																	<!-- End .tooltipFooter -->
																</div>
																<!-- End .tooltipBox -->
															</div>

															<!-- End .tooltipWrapper --></td>
													</tr>

													<tr id="comparisonCustomerData" class='<s:if test="viewData.customerSummary == null">hide</s:if>'>
														<td class="firstColumn">Customer</td>
														<td id="customerAverageFulfillmentComparison"><fmt:formatNumber value="${viewData.customerSummary.averageFulfillment}" pattern="##0.##"/>%</td>
														<td id="customerAverageCostComparison">$<fmt:formatNumber value="${viewData.customerSummary.averageContestCost}" pattern="#,##0.00"/></td>
														<td id="customerAverageDurationComparison"><fmt:formatNumber value="${viewData.customerSummary.averageContestDuration}" pattern="##0.#"/> days</td>
														<td id="customerAverageVolComparison"><fmt:formatNumber value="${viewData.customerSummary.averageVolPerMonth}" pattern="##0.#"/></td>
														<td id="customerTotalVolComparison"><fmt:formatNumber value="${viewData.customerSummary.totalContestVolume}" pattern="##0"/></td>
														<td id="customerTotalCostComparison">$<fmt:formatNumber value="${viewData.customerSummary.totalMemberCost}" pattern="#,##0.00"/></td>
														<td id="customerMinMaxCostComparison">$<fmt:formatNumber value="${viewData.customerSummary.minContestCost}" pattern="#,##0.00"/> - $<fmt:formatNumber value="${viewData.customerSummary.maxContestCost}" pattern="#,##0.00"/></td>
														<td id="customerMinMaxDurationComparison"><fmt:formatNumber value="${viewData.customerSummary.minContestDuration}" pattern="##0.#"/> - <fmt:formatNumber value="${viewData.customerSummary.maxContestDuration}" pattern="##0.#"/> days</td>
														<td id ="marketCap" rowspan="2" class="mkt"><fmt:formatNumber value="${viewData.customerSummary.totalMemberCost / viewData.marketSummary.totalMemberCost}" pattern="##0.##"/>%</td>
													</tr>
                                                    <tr id="comparisonCustomerNoData" class='<s:if test="viewData.customerSummary != null">hide</s:if>'>
														<td class="firstColumn">Customer</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
                                                        <td>N/A</td>
                                                        <td>N/A</td>
														<td rowspan="2" class="mkt">N/A</td>
													</tr>
													<tr class='marketTR <s:if test="viewData.marketSummary == null">hide</s:if>' id="comparisonMarketData">
														<td class="firstColumn">Market</td>
														<td id="marketAverageFulfillmentComparison"><fmt:formatNumber value="${viewData.marketSummary.averageFulfillment}" pattern="##0.##"/>%</td>
														<td id="marketAverageCostComparison">$<fmt:formatNumber value="${viewData.marketSummary.averageContestCost}" pattern="#,##0.00"/></td>
														<td id="marketAverageDurationComparison"><fmt:formatNumber value="${viewData.marketSummary.averageContestDuration}" pattern="##0.#"/> days</td>
														<td id="marketAverageVolComparison"><fmt:formatNumber value="${viewData.marketSummary.averageVolPerMonth}" pattern="##0.#"/></td>
														<td id="marketTotalVolComparison"><fmt:formatNumber value="${viewData.marketSummary.totalContestVolume}" pattern="##0"/></td>
														<td id="marketTotalCostComparison">$<fmt:formatNumber value="${viewData.marketSummary.totalMemberCost}" pattern="#,##0.00"/></td>
														<td id="marketMinMaxCostComparison">$<fmt:formatNumber value="${viewData.marketSummary.minContestCost}" pattern="#,##0.00"/> - $<fmt:formatNumber value="${viewData.marketSummary.maxContestCost}" pattern="#,##0.00"/></td>
														<td id="marketMinMaxDurationComparison"><fmt:formatNumber value="${viewData.marketSummary.minContestDuration}" pattern="##0.#"/> - <fmt:formatNumber value="${viewData.marketSummary.maxContestDuration}" pattern="##0.#"/> days</td>
													</tr>
                                                    <tr class='marketTR <s:if test="viewData.marketSummary != null">hide</s:if>' id="comparisonMarketNoData">
														<td class="firstColumn">Market</td>
                                                        <td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
                                                        <td>N/A</td>
                                                        <td>N/A</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- End .compare -->
									</div>
									<!-- End .tabsContent -->
								</div>
                                <!-- start tableDataArea-->
                                <div class="tableDataArea" id="firstTableDataArea">
                                    <!-- start dashboardTable-->
                                    <div class="dashboardTable">
                                        <dl>
                                            <dd>
                                                <!-- start dashboardTableHeader-->
                                                <div class="dashboardTableHeader" id="firstDashboardTableHeader">
                                                    <table  cellpadding="0" cellspacing="0">
                                                        <colgroup>
                                                            <col width="8%" />
                                                            <col width="10%" />
                                                            <col width="10%" />
                                                            <col/>
                                                            <col width="9%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col />
                                                        </colgroup>
                                                        <tbody>
                                                            <tr class="head">
                                                                <td class="first noBT" rowspan="2"><strong>Date</strong></td>
                                                                <td class="noBT" rowspan="2"><strong>Customer</strong></td>
                                                                <td class="noBT" rowspan="2"><strong>Project</strong></td>
                                                                <td class="noBT" rowspan="2"><strong>Contest Name</strong></td>
                                                                <td class="noBT" rowspan="2">Contest Type</td>
                                                                <td class="noBT" colspan="2"><strong>FullFillment</strong></td>
                                                                <td class="noBT" colspan="2"><strong>Member Cost</strong></td>
                                                                <td class="noBT" colspan="2"><strong>Duration</strong> (Days)</td>
                                                            </tr>
                                                            <tr class="head">
                                                                <td>Contest</td>
                                                                <td>Market Avg</td>
                                                                <td>Contest<br/><a href="javascript:void(0)" class="contestDlink">(Breakdown)</a></td>
                                                                <td>Market Avg<br/><a href="javascript:void(0)" class="marketDlink">(Breakdown)</td>
                                                                <td>Contest</td>
                                                                <td>Market Avg</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- end dashboardTableHeader-->
                                                <!-- start dashboardTableBody-->
                                                <div class="dashboardTableBody" id="firstDashboardTableBody">
                                                    <table  cellpadding="0" cellspacing="0">
                                                        <colgroup>
                                                            <col width="8%" />
                                                            <col width="10%" />
                                                            <col width="10%" />
                                                            <col/>
                                                            <col width="9%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col width="8%" />
                                                            <col />
                                                        </colgroup>
                                                        <thead>
                                                            <tr>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                                 <th></th>
                                                            </tr>
                                                        </thead>
                                                    <tbody>
                                                    </tbody>
                                                 </table>
                                              </div>
                                              <!-- end dashboardTableBody-->

                                              <div class="dashboardTableFooter" id="firstDashboardTableFooter">
                                                    <div class="pagination pagination3">
                                                        <div class="pages">
                                                            <a class="prev prevInactive">Prev</a><!-- we are on the first page so the prev link must be deactive -->
                                                            <a class="current">1</a>
                                                            <a >2</a>
                                                            <a class="next">Next</a>
                                                        </div><!-- End .pages -->
                                                        <div class="allPages"></div>
                                                        <div class="showPages"><!-- number of rows that can be displayed on the same page -->
                                                            <label><strong>Show:</strong></label>
                                                            <select>
                                                                <option>5</option>
                                                                <option>10</option>
                                                                <option>25</option>
                                                                <option>50</option>
                                                                <option selected="true">All</option>
                                                            </select>
                                                            <span>per page</span>
                                                        </div><!-- End .showPages -->
                                                    </div><!-- End .pagination -->
                                                    <div class="panel panel3">
                                                    </div><!-- End .panel -->
                                                </div><!-- End .dashboardTableFooter-->
                                            </dd>
                                        </dl>
                                    </div>
                                    <!-- end dashboardTable-->
                                </div>
                                <!-- end tableDataArea-->
                                <div class="graphArea">
                                <div class="visualization">
                                    <s:form action="dashboardEnterprise" namespace="/" id="EnterpriseDashboardForm"
                                            method="get">
                                        <input type="hidden" name="zoomType" value="" id="zoomTypeInput"/>
                                        <div class="top">
                                            <div class="dateRange">
                                                    <strong>Zoom</strong> :
                                                       <a href="WEEK" class="zoomLink">1 Week</a> &nbsp;
                                                       <a href="MONTH" class="zoomLink">1 Month</a>  &nbsp;
                                                       <a href="QUARTER" class="zoomLink">3 Month</a>  &nbsp;
                                                       <a href="HALF_OF_THE_YEAR" class="zoomLink">6 Month</a> &nbsp;
                                                       <a href="YEAR" class="zoomLink">YTD</a> &nbsp;
                                            </div>
                                            <div class="displaying">
                                                <span>Displaying :</span>
                                                <input type="radio" name="displaying" value="contest"/>
                                                <span>Contest Duration&nbsp;</span>
                                                <input type="radio" name="displaying" checked="checked" value="cost"/>
                                                <span>Cost&nbsp;</span>
                                                <input type="radio" name="displaying" value="fulfill"/>
                                                <span>Fulfillment</span>
                                            </div>
                                        </div>
                                        <!-- top -->

                                        <div class="chartWrapper">
                                            <div id="chart_div"></div>
                                            <div id="NoEnoughStats" class="hide">
                                                <p>NO ENOUGH STATISTICS TO RENDER THE CHART</p>
                                            </div>
                                        </div>
                                        <!-- chart container-->

                                        <div class="filterLinkArea">
                                            <a class="fiterButton" href="javascript:">Filters</a>

                                            <div class="filterArea">

                                                <div class="filterProject">
                                                    <span class="label">Project Name </span>
                                                    <s:select list="viewData.projectsLookupMap" name="formData.projectIds"
                                                              id="formData.projectIds"/>
                                                </div>

                                                <div class="firstRow">
                                                    <div class="datePicker">
                                                        <div>
                                                            <span class="label">Start: </span>
                                                            <s:textfield name="formData.startDate" readonly="true"
                                                                         id="startDateEnterprise"
                                                                         cssClass="text date-pick"/>
                                                        </div>
                                                        <div>
                                                            <span class="label">End: </span>
                                                            <s:textfield name="formData.endDate" readonly="true"
                                                                         id="endDateEnterprise" cssClass="text date-pick"/>
                                                        </div>
                                                    </div>

                                                    <div class="timeDimension">
                                                        <strong>Group By</strong><br/>
                                                        <select id="timeDimension">
                                                            <option value="">Select Time Dimension</option>
                                                            <option value="week">Week</option>
                                                            <option value="month" selected="selected">Month</option>
                                                            <option value="quarter">Quarter</option>
                                                            <option value="year">Year</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="spacer"></div>
                                                <div class="secondRow">
                                                    <div class="filterContest">
                                                        <div class="columns contestType">
                                                            <strong>Contest Type</strong><br/>
                                                            <s:select list="viewData.projectCategories" multiple="true"
                                                                      cssClass="multiselect"
                                                                      id="formData.projectCategoryIds"
                                                                      name="formData.projectCategoryIds" size="5"/>
                                                        </div>

                                                        <div class="columns" id="customerNameFilter">
                                                            <strong>Customer Name</strong><br/>
                                                            <s:select list="viewData.clientAccounts" id="formData.customerIds"
                                                                      name="formData.customerIds" size="1"/>
                                                        </div>

                                                        <div class="columns" id="clientBillingProjectsFilter">
                                                            <strong>Billing Account</strong><br/>
                                                            <s:select list="viewData.clientBillingProjects"
                                                                      id="formData.billingAccountIds"
                                                                      name="formData.billingAccountIds" size="1"/>
                                                        </div>

                                                        <div class="columns columnButton">
                                                            <a class="button6 applyButton" href="javascript:"
                                                               id="enterpriseDashboardSubmit">
                                                                <span class="left"><span class="right">Apply</span></span>
                                                            </a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End .filterArea -->
                                        </div>


                                        <div id="filterResultContainer"></div>

                                        <div id="validationErrors"></div>
                                        <!-- start tableDataArea-->
                                        <div class="tableDataArea hide" id="dynamicTableView">
                                            <!-- start dashboardTable-->
                                            <div class="dashboardTable">
                                                <dl>
                                                    <dd>
                                                        <!-- start dashboardTableHeader-->
                                                        <div class="dashboardTableHeader" id="secondDashboardTableHeader">
                                                            <table  cellpadding="0" cellspacing="0">
                                                                <colgroup>
                                                                    <col width="8%" />
                                                                    <col width="10%" />
                                                                    <col width="10%" />
                                                                    <col/>
                                                                    <col width="9%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col />
                                                                </colgroup>
                                                                <tbody>
                                                                    <tr class="head">
                                                                        <td class="first noBT" rowspan="2"><strong>Date</strong></td>
                                                                        <td class="noBT" rowspan="2"><strong>Customer</strong></td>
                                                                        <td class="noBT" rowspan="2"><strong>Project</strong></td>
                                                                        <td class="noBT" rowspan="2"><strong>Contest Name</strong></td>
                                                                        <td class="noBT" rowspan="2">Contest Type</td>
                                                                        <td class="noBT" colspan="2"><strong>FullFillment</strong></td>
                                                                        <td class="noBT" colspan="2"><strong>Member Cost</strong></td>
                                                                        <td class="noBT" colspan="2"><strong>Duration</strong> (Days)</td>
                                                                    </tr>
                                                                    <tr class="head">
                                                                        <td>Contest</td>
                                                                        <td>Market Avg</td>
                                                                        <td>Contest<br/><a href="javascript:void(0)" class="contestDlink">(Breakdown)</a></td>
                                                                        <td>Market Avg <br/><a href="javascript:void(0)" class="marketDlink">(Breakdown)</td>
                                                                        <td>Contest</td>
                                                                        <td>Market Avg</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <!-- end dashboardTableHeader-->
                                                        <!-- start dashboardTableBody-->
                                                        <div class="dashboardTableBody tableViewChart" id="secondDashboardTableBody">
                                                            <table  id="secondDashboardTableBodyTable" cellpadding="0" cellspacing="0">
                                                                <colgroup>
                                                                    <col width="8%" />
                                                                    <col width="10%" />
                                                                    <col width="10%" />
                                                                    <col/>
                                                                    <col width="9%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col width="8%" />
                                                                    <col />
                                                                </colgroup>
                                                                <thead>
                                                                    <tr>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                         <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                </tbody>
                                                             </table>
                                                            <div class="hide loadingIndicator" style="width:50%;margin:auto"><img src="../images/ajax-loader.gif" alt="Loading..."></img></div>
                                                        </div>
                                                        <!-- end dashboardTableBody-->
                                                        <div class="dashboardTableFooter" id="secondDashboardTableFooter">
                                                            <div class="pagination pagination3">
                                                                <div class="pages">
                                                                    <a class="prev prevInactive">Prev</a><!-- we are on the first page so the prev link must be deactive -->
                                                                    <a class="current">1</a>
                                                                    <a >2</a>
                                                                    <a class="next">Next</a>
                                                                </div><!-- End .pages -->
                                                                <div class="allPages"></div>
                                                                <div class="showPages"><!-- number of rows that can be displayed on the same page -->
                                                                    <label><strong>Show:</strong></label>
                                                                    <select>
                                                                        <option>5</option>
                                                                        <option>10</option>
                                                                        <option>25</option>
                                                                        <option>50</option>
                                                                        <option selected="true">All</option>
                                                                    </select>
                                                                    <span>per page</span>
                                                                </div><!-- End .showPages -->
                                                            </div><!-- End .pagination -->
                                                            <div class="panel panel3">
                                                            </div><!-- End .panel -->
                                                        </div><!-- End .dashboardTableFooter-->
                                                    </dd>
                                                 </dl>
                                             </div>
                                            <!-- end dashboardTable-->
                                        </div>
                                        <!-- end tableDataArea-->
                                    </s:form>
                                </div>
                                <!-- End .visualization -->
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <!-- End #mainContent -->

                <jsp:include page="includes/footer.jsp"/>

            </div>
            <!-- End #content -->
        </div>
        <!-- End #container -->
    </div>
</div>
<!-- End #wrapper -->

<jsp:include page="includes/popups.jsp"/>

<div class="popups">
    <div class="expandViewPopup hide" id="contestDViewPopup">
        <div class="close">
            <a href="javascript:void(0)" id="contestDViewClose"></a>.
        </div>
        <div class="popContent">
            <h2>Cost Details</h2>
            <div class="dashboardTable costTable">
                <div id="thirdDashboardTableBody" class="tableWrapper dashboardTableHeader costBreakDownChart">
                    <table cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="70px" />
                            <col width="94px" />
                            <col width="94px" />
                            <col width="140px"/>
                            <col width="84px" />
                            <col width="50px" />
                            <col width="70px" />
                            <col width="50px" />
                            <col width="70px" />

                            <col width="50px" />
                            <col width="70px" />
                            <col width="50px" />
                            <col width="50px" />
                            <col width="70px" />
                            <col width="50px" />
                            <col width="50px" />
                            <col width="50px" />
                            <col width="50px" />
                            <col width="50px" />
                            <col width="70px" />
                            <col />
                        </colgroup>
                        <thead>
                            <tr class="head costHead">
                                <th class="first noBT" rowspan="2"><strong>Date</strong></th>
                                <th class="noBT" rowspan="2"><strong>Customer</strong></th>
                                <th class="noBT" rowspan="2"><strong>Project</strong></th>
                                <th class="noBT" rowspan="2"><strong>Contest Name</strong></th>
                                <th class="noBT" rowspan="2">Contest Type</th>
                                <th class="noBT" colspan="2"><strong>FullFilment</strong></th>
                                <th class="noBT" colspan="2"><strong>Member Cost</strong></th>
                                <th class="noBT" colspan="9"><strong>Member Cost Breakdown</strong></th>
                                <th class="noBT" colspan="2"><strong>Duration</strong> (Days)</th>
                            </tr>
                            <tr class="head costHead">
                                <th>Contest</th>
                                <th>Market Avg</th>
                                <th>Contest</th>
                                <th>Market Avg</th>
                                <th>Prizes</th>
                                <th>Spec Review</th>
                                <th>Review</th>
                                <th>Reliability</th>
                                <th>Digital Run</th>
                                <th>Copilot</th>
                                <th>Build</th>
                                <th>Bugs</th>
                                <th>Misc</th>
                                <th>Contest</th>
                                <th>Market Avg</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="expandViewPopup" id="marketDViewPopup" style="display:none">
        <div class="close">
            <a href="javascript:void(0)" id="marketDViewClose"></a>.
        </div>
        <div class="popContent">
            <h2>Average Market Cost Details</h2>
            <div class="dashboardTable marketTable">
            <div id="fourthDashboardTableBody" class="tableWrapper dashboardTableHeader marketBreakDownChart">
                <table cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="140px" />
                        <col width="94px" />

                        <col width="70px" />
                        <col width="94px" />
                        <col width="70px"/>
                        <col width="70px" />
                        <col width="94px" />
                        <col width="70px" />
                        <col width="70px" />
                        <col width="70px" />
                        <col width="70px" />
                        <col />
                    </colgroup>
                    <thead>
                        <tr class="head">
                            <th  class="first noBT">Contest Type</th>
                            <th  class="noBT">Average Member Cost</th>

                            <th  class="noBT">Prizes</th>
                            <th  class="noBT">Spec Review</th>
                            <th  class="noBT">Review</th>
                            <th  class="noBT">Reliability</th>
                            <th  class="noBT">Digital Run</th>
                            <th  class="noBT">Copilot</th>
                            <th  class="noBT">Build</th>
                            <th  class="noBT">Bugs</th>
                            <th  class="noBT">Misc</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="hide handler">
        <a href="#" id="contestDViewMock"></a>
        <a href="#" id="marketDViewMock"></a>
    </div>
</div>

</body>
<!-- End #page -->

</html>
