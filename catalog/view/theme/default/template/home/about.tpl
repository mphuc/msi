<?php echo $self->load->controller('home/page/header'); ?> 
   <div class="cf content">
   <div class="col-md-3 left-menu two-column-left">
      <div class="moduletable">
         <div class="moduletable">
            <ul class="menu">
               <li class=""><a href="/leadership/senior-leadership-team"><span>Leadership Team</span></a></li>
               <li class=""><a href="/our-history"><span>Our History</span></a></li>
               <li class=""><a href="/socially-responsible-investing-policy"><span>Socially Responsible Investing Policy</span></a></li>
               <li class=""><a href="/in-the-community"><span>In the Community</span></a></li>
               <li class=""><a href="/contact-us-about-us"><span>Contact Us</span></a></li>
            </ul>
         </div>
      </div>
   </div>
   <div id="print-region" class="col-md-9 two-column-right">
      <div class="blog_aboutus">
         <div class="category-desc">
            <h1>ABOUT MACKAY SHIELDS</h1>
            <div class="cf about-us">
               <div class="about-us-left">
                  <p>Building on our mission of managing income-oriented strategies designed to help our clients’ better meet their investment objectives, MacKay Shields has established a reputation over 40 years as a trusted and respected investment manager.</p>
                  <p>Today we offer a broad range of fixed income related strategies and solutions for a wide array of global clients including pension funds, government and financial institutions, family offices, high net worth individuals, endowments and foundations, and retail clients. Our investment strategies embrace extensive credit research conducted by investment teams comprised of over 50 investment professionals.</p>
               </div>
               <div class="about-us-right quote">
                  <div class="jcepopup-div" style="float:left; width:100%;"><a href="https://www.mackayshields.com/learn-more-about-mackay-shields" style="" class="jcepopup" rel="" onclick="recordVideoAccess('https://www.mackayshields.com/learn-more-about-mackay-shields', 'https://www.mackayshields.com/about-us', '/images/learn-about-mackay-video-img.png');">
                     <img class="jcepopup-img" height="150" width="100%" border="0" src="catalog/view/theme/default/home/images/learn-about-mackay-video-img.png">
                     </a>
                  </div>
               </div>
            </div>
            <div class="clr"></div>
         </div>
         <div class="cf items-row cols-1 row-0">
            <div class="cf item column-1">
               <div class="cf">
                  <div style="width: 634px;" class="left">
                     <h3 style="text-align:center">Total Assets under management: $95 billion</h3>
                  </div>
               </div>
               <div class="article-content cf">
                  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                  <script type="text/javascript">   
                     google.load('visualization', '1', {packages:['corechart']});
                     //google.setOnLoadCallback(setTimeout(function() { drawAssetsByClientTypeChart(); }, 10));
                     google.setOnLoadCallback(drawAssetsByClientTypeChart);
                     function drawAssetsByClientTypeChart() {
                     var data = google.visualization.arrayToDataTable([
                      ['Name', 'Value'],['Sub-advisory Funds: 47%', 47],['Public Funds: 17%', 17],['Taft-Hartley: 7%', 7],['Non-Profit & Other: 4%', 4],['Corporates: 13%', 13],['Insurance: 12%', 12],
                     ]);
                     var options = {
                      colors: ['#4C89A5', '#2F635C', '#6E6E6E', '#73988D', '#003A63', '#7B833C'],
                      chartArea: { width: '100%', height: '75%' },
                      fontSize: '12',
                      fontName: 'Arial Narrow',
                      pieSliceText: 'none',
                      pieStartAngle: 100,
                      tooltip: {text: 'percentage'},
                      legend: {position: 'right', textStyle: {fontSize: '12', bold: true}},
                     };
                     
                     var chart = new google.visualization.PieChart(document.getElementById('assets_by_client_type'));
                     
                     google.visualization.events.addListener(chart, 'onmouseover', function(e) {
                     // Hide the 2nd row of the tooltip
                     jQuery('#assets_by_client_type svg > g:last-child > g > g:last-child').css('display', 'none');
                     });
                     
                     chart.draw(data, options);
                     }
                  </script><script src="https://www.google.com/uds/?file=visualization&amp;v=1&amp;packages=corechart" type="text/javascript"></script>
                  <link href="https://www.google.com/uds/api/visualization/1.0/84dc8f392c72d48b78b72f8a2e79c1a1/ui+vi.css" type="text/css" rel="stylesheet">
                  <script src="https://www.google.com/uds/api/visualization/1.0/84dc8f392c72d48b78b72f8a2e79c1a1/format+vi,default+vi,ui+vi,corechart+vi.I.js" type="text/javascript"></script>    
                  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                  <script type="text/javascript">
                     google.load('visualization', '1', {packages:['corechart']});
                     google.setOnLoadCallback(drawAssetsByClientDomicileChart);
                     function drawAssetsByClientDomicileChart() {
                     var data = google.visualization.arrayToDataTable([
                      ['Name', 'Value'],['North America: 76%', 76],['Europe: 17%', 17],['Asia: 7%', 7],
                     ]);
                     
                     var options = {
                      colors: ['#4C89A5', '#7B833C', '#6E6E6E'],
                      chartArea: { width: '100%', height: '75%' },
                      fontSize: '12',
                      fontName: 'Arial Narrow',
                      pieSliceText: 'none',
                      pieStartAngle: 0,
                      tooltip: {text: 'percentage'},
                      legend: {position: 'right', textStyle: {fontSize: '12', bold: true}},
                     };
                     
                     var chart = new google.visualization.PieChart(document.getElementById('assets_by_client_domicile'));
                     
                     google.visualization.events.addListener(chart, 'onmouseover', function(e) {
                     // Hide the 2nd row of the tooltip         
                     jQuery('#assets_by_client_domicile svg > g:last-child > g > g:last-child').css('display', 'none');
                     });
                     
                     chart.draw(data, options);
                     }
                  </script>
                  <div style="width:100%; height:270px; float:left;">
                     <div style="background-color:white; width:100%; height:40px; float:left;text-align:center;">
                        <span style="font-family:Georgia; font-size:15px; color:#003A63; margin-top:20px; margin-left:225px; float:left; font-weight:bold;">Assets by Client Type*</span>
                     </div>
                     <div style="background-color:white; width:100%; height:260px; float:left;">
                        <div id="assets_by_client_type" style="width: 480px; height:260px; float: left; padding-left: 80px;">
                           <div style="position: relative;">
                              <div dir="ltr" style="position: relative; width: 480px; height: 260px;">
                                 <div aria-label="Một biểu đồ." style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%;">
                                    <svg width="480" height="260" aria-label="Một biểu đồ." style="overflow: hidden;">
                                       <defs id="defs"></defs>
                                       <rect x="0" y="0" width="480" height="260" stroke="none" stroke-width="0" fill="#ffffff"></rect>
                                       <g>
                                          <rect x="316" y="33" width="164" height="107" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                          <g>
                                             <rect x="316" y="33" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                             <g>
                                                <text text-anchor="start" x="333" y="43.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">Sub-advisory Funds: 47%</text>
                                             </g>
                                             <circle cx="322" cy="39" r="6" stroke="none" stroke-width="0" fill="#4c89a5"></circle>
                                          </g>
                                          <g>
                                             <rect x="316" y="52" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                             <g>
                                                <text text-anchor="start" x="333" y="62.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">Public Funds: 17%</text>
                                             </g>
                                             <circle cx="322" cy="58" r="6" stroke="none" stroke-width="0" fill="#2f635c"></circle>
                                          </g>
                                          <g>
                                             <rect x="316" y="71" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                             <g>
                                                <text text-anchor="start" x="333" y="81.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">Taft-Hartley: 7%</text>
                                             </g>
                                             <circle cx="322" cy="77" r="6" stroke="none" stroke-width="0" fill="#6e6e6e"></circle>
                                          </g>
                                          <g>
                                             <rect x="316" y="90" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                             <g>
                                                <text text-anchor="start" x="333" y="100.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">Non-Profit &amp; Other: 4%</text>
                                             </g>
                                             <circle cx="322" cy="96" r="6" stroke="none" stroke-width="0" fill="#73988d"></circle>
                                          </g>
                                          <g>
                                             <rect x="316" y="109" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                             <g>
                                                <text text-anchor="start" x="333" y="119.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">Corporates: 13%</text>
                                             </g>
                                             <circle cx="322" cy="115" r="6" stroke="none" stroke-width="0" fill="#003a63"></circle>
                                          </g>
                                          <g>
                                             <rect x="316" y="128" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                             <g>
                                                <text text-anchor="start" x="333" y="138.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">Insurance: 12%</text>
                                             </g>
                                             <circle cx="322" cy="134" r="6" stroke="none" stroke-width="0" fill="#7b833c"></circle>
                                          </g>
                                       </g>
                                       <g>
                                          <path d="M149,131L230.1661384055193,77.88636732122265A97,97,0,0,1,244.52635204218416,147.84387323369225L149,131A0,0,0,0,0,149,131" stroke="#ffffff" stroke-width="1" fill="#7b833c"></path>
                                       </g>
                                       <g>
                                          <path d="M149,131L165.8438732336922,35.473647957815814A97,97,0,0,1,230.1661384055193,77.88636732122265L149,131A0,0,0,0,0,149,131" stroke="#ffffff" stroke-width="1" fill="#003a63"></path>
                                       </g>
                                       <g>
                                          <path d="M149,131L141.55825427169862,34.28588303398874A97,97,0,0,1,165.84387323369225,35.47364795781583L149,131A0,0,0,0,0,149,131" stroke="#ffffff" stroke-width="1" fill="#73988d"></path>
                                       </g>
                                       <g>
                                          <path d="M149,131L101.08763894132952,46.658991837993796A97,97,0,0,1,141.55825427169862,34.28588303398874L149,131A0,0,0,0,0,149,131" stroke="#ffffff" stroke-width="1" fill="#6e6e6e"></path>
                                       </g>
                                       <g>
                                          <path d="M149,131L52.009455171097486,132.3543314928971A97,97,0,0,1,101.08763894132952,46.658991837993796L149,131A0,0,0,0,0,149,131" stroke="#ffffff" stroke-width="1" fill="#2f635c"></path>
                                       </g>
                                       <g>
                                          <path d="M149,131L244.52635204218416,147.84387323369225A97,97,0,0,1,52.009455171097486,132.3543314928971L149,131A0,0,0,0,0,149,131" stroke="#ffffff" stroke-width="1" fill="#4c89a5"></path>
                                       </g>
                                       <g></g>
                                    </svg>
                                    <div aria-label="Cách trình bày dữ liệu dưới dạng bảng biểu trong biểu đồ." style="position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;">
                                       <table>
                                          <thead>
                                             <tr>
                                                <th>Name</th>
                                                <th>Value</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>Sub-advisory Funds: 47%</td>
                                                <td>47</td>
                                             </tr>
                                             <tr>
                                                <td>Public Funds: 17%</td>
                                                <td>17</td>
                                             </tr>
                                             <tr>
                                                <td>Taft-Hartley: 7%</td>
                                                <td>7</td>
                                             </tr>
                                             <tr>
                                                <td>Non-Profit &amp; Other: 4%</td>
                                                <td>4</td>
                                             </tr>
                                             <tr>
                                                <td>Corporates: 13%</td>
                                                <td>13</td>
                                             </tr>
                                             <tr>
                                                <td>Insurance: 12%</td>
                                                <td>12</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                              <div aria-hidden="true" style="display: none; position: absolute; top: 270px; left: 490px; white-space: nowrap; font-family: &quot;Arial Narrow&quot;; font-size: 12px; font-weight: bold;">Insurance: 12%</div>
                              <div></div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div style="background-color:white; width:100%; height:300px; float:left; margin-top:45px;">
                     <div style="background-color:white; width:100%; height:45px; float:left;text-align:center;">
                        <span style="font-family:Georgia; font-size:15px; color:#003A63; margin-top:20px; margin-left:215px; float:left; font-weight:bold;">Assets by Client Domicile*</span>
                     </div>
                     <div id="assets_by_client_domicile" style="width: 480px; height:250px; float: left; padding-left: 90px;">
                        <div style="position: relative;">
                           <div dir="ltr" style="position: relative; width: 480px; height: 250px;">
                              <div aria-label="Một biểu đồ." style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%;">
                                 <svg width="480" height="250" aria-label="Một biểu đồ." style="overflow: hidden;">
                                    <defs id="defs"></defs>
                                    <rect x="0" y="0" width="480" height="250" stroke="none" stroke-width="0" fill="#ffffff"></rect>
                                    <g>
                                       <rect x="316" y="31" width="164" height="50" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                       <g>
                                          <rect x="316" y="31" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                          <g>
                                             <text text-anchor="start" x="333" y="41.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">North America: 76%</text>
                                          </g>
                                          <circle cx="322" cy="37" r="6" stroke="none" stroke-width="0" fill="#4c89a5"></circle>
                                       </g>
                                       <g>
                                          <rect x="316" y="50" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                          <g>
                                             <text text-anchor="start" x="333" y="60.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">Europe: 17%</text>
                                          </g>
                                          <circle cx="322" cy="56" r="6" stroke="none" stroke-width="0" fill="#7b833c"></circle>
                                       </g>
                                       <g>
                                          <rect x="316" y="69" width="164" height="12" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect>
                                          <g>
                                             <text text-anchor="start" x="333" y="79.2" font-family="Arial Narrow" font-size="12" font-weight="bold" stroke="none" stroke-width="0" fill="#222222">Asia: 7%</text>
                                          </g>
                                          <circle cx="322" cy="75" r="6" stroke="none" stroke-width="0" fill="#6e6e6e"></circle>
                                       </g>
                                    </g>
                                    <g>
                                       <path d="M149,125L108.97674659288315,39.946257068194186A94,94,0,0,1,149,31L149,125A0,0,0,0,0,149,125" stroke="#ffffff" stroke-width="1" fill="#6e6e6e"></path>
                                    </g>
                                    <g>
                                       <path d="M149,125L55.18548752774247,119.09769116424455A94,94,0,0,1,108.97674659288315,39.946257068194186L149,125A0,0,0,0,0,149,125" stroke="#ffffff" stroke-width="1" fill="#7b833c"></path>
                                    </g>
                                    <g>
                                       <path d="M149,125L149,31A94,94,0,1,1,55.18548752774247,119.09769116424455L149,125A0,0,0,1,0,149,125" stroke="#ffffff" stroke-width="1" fill="#4c89a5"></path>
                                    </g>
                                    <g></g>
                                 </svg>
                                 <div aria-label="Cách trình bày dữ liệu dưới dạng bảng biểu trong biểu đồ." style="position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;">
                                    <table>
                                       <thead>
                                          <tr>
                                             <th>Name</th>
                                             <th>Value</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>North America: 76%</td>
                                             <td>76</td>
                                          </tr>
                                          <tr>
                                             <td>Europe: 17%</td>
                                             <td>17</td>
                                          </tr>
                                          <tr>
                                             <td>Asia: 7%</td>
                                             <td>7</td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                           <div aria-hidden="true" style="display: none; position: absolute; top: 260px; left: 490px; white-space: nowrap; font-family: &quot;Arial Narrow&quot;; font-size: 12px; font-weight: bold;">Asia: 7%</div>
                           <div></div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="article-content">
                  <p class="fine-print">*AUM shown is as of December 31, 2016. In respect to AUM by client type and domicile, due to rounding, some of the items may not equal 100% or any expressed totals as applicable.
                  </p>
               </div>
            </div>
            <span class="row-separator">&nbsp;</span>
         </div>
         <div class="cf items-row cols-1 row-1">
            <div class="cf item column-1">
               <div class="article-content">
                  <h3>Fixed Income Assets Under Management <span style="text-transform:none">(in Billions)</span></h3>
                  <img src="catalog/view/theme/default/home/images/article_images/aum_chart4Q2016.jpg" alt="aum_chart4Q2016">
                  <p class="fine-print">&nbsp;</p>
               </div>
            </div>
            <span class="row-separator">&nbsp;</span>
         </div>
         <div class="cf items-row cols-1 row-2">
            <div class="cf item column-1">
               <div class="article-content">
                  <h3>Dynamic Strategies with Client Objectives in Mind&nbsp;</h3>
                  <img src="catalog/view/theme/default/home/images/article_images/risk_spectrum2014.jpg" alt="risk_spectrum2014">
                  <p class="fine-print">The above chart is for illustrative purposes only and not drawn to scale. Furthermore, the chart may not reflect the referenced strategies on an expected return and risk basis at any point in time. Potential returns may not be achieved.</p>
                  <br>
                  <div style="border-top-style:solid; border-top-width:1px; border-top-color:grey; margin-top:15px;"><span><br><em>
                     As a SEC-registered investment adviser, MacKay Shields LLC claims compliance with the Global Investment Performance Standards (GIPS®) and prepares and presents its performance reports in compliance with the GIPS standards. The firm receives verification from an independent accounting firm (Ashland Partners &amp; Company LLP) on a quarterly basis. The firm has been independently verified from January 1, 1988 through June 30, 2016.  The effective date of compliance with the GIPS® Standards is January 1, 1988. 
                     Click <a href="mailto:answers@mackayshields.com" style="color:#0a3555; text-decoration:underline;">here</a> to receive the full list and descriptions of MacKay’s active composites that adhere to the GIPS standards.</em></span>
                  </div>
               </div>
            </div>
            <span class="row-separator">&nbsp;</span>
         </div>
      </div>
   </div>
</div>
<?php echo $self->load->controller('home/page/footer'); ?> 