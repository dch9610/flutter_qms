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
    SELECT 
        iEntWeightA + iEntWeightB + iEntWeightC + iEntWeightD as iEntWeight,
        iDel1WeightA + iDel2WeightA + iDel3WeightA +
        iDel1WeightB + iDel2WeightB + iDel3WeightB +
        iDel1WeightC + iDel2WeightC + iDel3WeightC +
        iDel1WeightD + iDel2WeightD + iDel3WeightD as iDelSumWeight,
        iDel3WeightA + iDel3WeightB + iDel3WeightC + iDel3WeightD as iDelErrorWeight,
        iTm3TimeA + iTm3TimeB + iTm3TimeC + iTm3TimeD as iTmTime,
        cDate
    FROM WRKRSQF
    WHERE cDate <= '$predate'
      AND (
        iDel1WeightA + iDel2WeightA + iDel3WeightA +
        iDel1WeightB + iDel2WeightB + iDel3WeightB +
        iDel1WeightC + iDel2WeightC + iDel3WeightC +
        iDel1WeightD + iDel2WeightD + iDel3WeightD
      ) > 0
    ORDER BY cDate DESC
    LIMIT 1
";
$response = [];

$result1 = $conn->query($query1);


if ($row = $result1->fetch_assoc()) {
    $response['dayProduct'] = $row;
}

// 두 번째 쿼리 (당당월간 합계)
$query2 = "
    SELECT 
        SUM(iEntWeightA + iEntWeightB + iEntWeightC + iEntWeightD) as iEntWeightSum,
        SUM(
            iDel1WeightA + iDel2WeightA + iDel3WeightA +
            iDel1WeightB + iDel2WeightB + iDel3WeightB +
            iDel1WeightC + iDel2WeightC + iDel3WeightC +
            iDel1WeightD + iDel2WeightD + iDel3WeightD
        ) as iDelWeightSum
    FROM WRKRSQF
    WHERE MID(cDate, 1, 6) = '$curmonth'
";
$result2 = $conn->query($query2);


if ($row = $result2->fetch_assoc()) {
    $response['curMonthProduct'] = $row;
}

// 세 번째 쿼리 (전전월간 합계)
$query3 = "
    SELECT 
        SUM(iEntWeightA + iEntWeightB + iEntWeightC + iEntWeightD) as iEntWeightSum,
        SUM(
            iDel1WeightA + iDel2WeightA + iDel3WeightA +
            iDel1WeightB + iDel2WeightB + iDel3WeightB +
            iDel1WeightC + iDel2WeightC + iDel3WeightC +
            iDel1WeightD + iDel2WeightD + iDel3WeightD
        ) as iDelWeightSum
    FROM WRKRSQF
    WHERE MID(cDate, 1, 6) = '$premonth'
";
$result3 = $conn->query($query3);


if ($row = $result3->fetch_assoc()) {
    $response['preMonthProduct'] = $row;
}

// PLTCM LINE SPEED STATE
$queryLineSpeed = "
    SELECT iTRSpeed, i6BRSpeed, iSTSpeed, iPLSpeed, iEntSpeed, cRcvDate FROM LMPCYCF
";
$resultLineSpeed = $conn->query($queryLineSpeed);


if ($row = $resultLineSpeed->fetch_assoc()) {
    $response['LineSpeed'] = $row;
}

$iSeq = 48;
$queryCurrent = "
    SELECT TRIM(cCoilNo) as  cCoilNo, iThick, iTarThick, iTarWidth, iSteelGradeNo, iWidth 
    FROM LMPTRKF
    WHERE iSeq = $iSeq
";
$resultCurrent = $conn->query($queryCurrent);

if ($row = $resultCurrent->fetch_assoc()) {
    $response['Current'] = $row;
}

if($response['Current']['cCoilNo'] == ""){
    $iSeq = 47;
    $queryCurrent = "
    SELECT TRIM(cCoilNo) as  cCoilNo, iThick, iTarThick, iTarWidth, iSteelGradeNo, iWidth 
    FROM LMPTRKF
    WHERE iSeq = $iSeq";
    
    $resultCurrent = $conn->query($queryCurrent);

    if ($row = $resultCurrent->fetch_assoc()) {
        $response['Current'] = $row;
    }
}

$currentCoilNo = $response['Current']['cCoilNo'];

if ($iSeq == 48) {
    $iSeq = 47;
} else {
    $iSeq = 46;
}
$queryNext = "
    SELECT TRIM(cCoilNo) as cCoilNo, iThick, iTarThick, iTarWidth, iSteelGradeNo, iWidth 
    FROM LMPTRKF
    WHERE (iSeq BETWEEN 18 AND $iSeq) AND cCoilNo <> '$currentCoilNo' 
    ORDER BY  iSeq DESC LIMIT 1
";

$resultNext = $conn->query($queryNext);

if ($row = $resultNext->fetch_assoc()) {
    $response['Next'] = $row;
}

echo json_encode($response);
// echo $response['Current']['cCoilNo'];

$conn->close();
?>