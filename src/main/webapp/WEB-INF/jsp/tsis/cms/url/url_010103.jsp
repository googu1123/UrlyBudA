<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery graph.js Plugin Demo</title>
    <link rel="stylesheet" href="css/chart/style.css">
    <link rel="stylesheet" href="css/chart/bar.css">
    <style>
    body { background-color:#fafafa; font-family:'Roboto';}
    </style>
  </head>
  <body>
  
  <h1 style="text-align:center;">Short URL 클릭 결과</h1>
    <div id="wrapper">
         <div class="chart">
            <h3>GID : tbroad007</h3>
            <table id="data-table" border="1" cellpadding="10" cellspacing="0">
               <thead>
                  <tr>
                     <td>&nbsp;</td>
                     <th scope="col"></th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <th scope="row">HTML/CSS</th>
                     <td>85</td>
                  </tr>
                  <tr>
                     <th scope="row">Bootstrap</th>
                     <td>90</td>
                  </tr>
                  <tr>
                     <th scope="row">JavaScript</th>
                     <td>70</td>
                  </tr>
                  <tr>
                     <th scope="row">AngularJS</th>
                     <td>60</td>
                  </tr>
                  <tr>
                     <th scope="row">jQuery</th>
                     <td>85</td>
                  </tr>
                  <tr>
                     <th scope="row">Ajax</th>
                     <td>60</td>
                  </tr>
                  <tr>
                     <th scope="row">PHP</th>
                     <td>50</td>
                  </tr>
                  <tr>
                     <th scope="row">Scrum</th>
                     <td>1</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
  <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
      <script src="js/graph.js"></script>
      <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
  </body>
</html>
