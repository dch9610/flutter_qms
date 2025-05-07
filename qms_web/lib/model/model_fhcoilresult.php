<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("210.1.1.77", "level2", "level2", "qms",5550);

if ($conn->connect_error) {
    die(json_encode(["error" => "DB connection failed"]));
}

$predate = date("Ymd",strtotime('-1 day'));          //이전일자

//  월 변수
$curmonth = date("Ym",time());
$premonth = date("Ym",strtotime('-1 month'));

$query1 = "
    SELECT cStartTime, cEndTime, iProcTime, cFHCoilNo, cL3FHCoilNo,
    cSteelGrade, if(cNextProc='','FH',cNextProc), iHotWidth00, iHotThick00, iActWidth, iActThk, iActWeight,
    cCoilStatus,iClaLength 
    FROM DELRSQF
    WHERE cEndTime > '20250507065959'
    ORDER BY cStartTime DESC
";
$response = [];

$result1 = $conn->query($query1);


if ($result1) {
    while ($row = $result1->fetch_assoc()) {
        $response['fhCoilResult'][] = $row;
    }
} else {
    $response['error'] = 'Query failed';
}

echo json_encode($response);
// echo $response['Current']['cCoilNo'];

$conn->close();
?>