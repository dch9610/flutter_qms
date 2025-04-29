<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("210.1.1.77", "level2", "level2", "qms",5550);

if ($conn->connect_error) {
    die(json_encode(["error" => "DB connection failed"]));
}

$predate = date("Ymd",strtotime('-1 day'));          //이전일자

$query = "        SELECT iEntWeightA + iEntWeightB + iEntWeightC + iEntWeightD as iEntWeight, ";     //투입량
$query = $query."        iDel1WeightA + iDel2WeightA + iDel3WeightA + ";
$query = $query."        iDel1WeightB + iDel2WeightB + iDel3WeightB + ";
$query = $query."        iDel1WeightC + iDel2WeightC + iDel3WeightC + ";
$query = $query."        iDel1WeightD + iDel2WeightD + iDel3WeightD as iDelSumWeight, ";               // 생산량
$query = $query."        iDel3WeightA + iDel3WeightB + iDel3WeightC + iDel3WeightD as iDelErrorWeight, "; // 불량량
$query = $query."        iTm3TimeA + iTm3TimeB + iTm3TimeC + iTm3TimeD as iTmTime, ";              // T/Hour
$query = $query."        cDate ";
$query = $query."   FROM WRKRSQF ";
$query = $query."  WHERE cDate <= '$predate' ";
$query = $query."    AND iDel1WeightA + iDel2WeightA + iDel3WeightA + ";
$query = $query."        iDel1WeightB + iDel2WeightB + iDel3WeightB + ";
$query = $query."        iDel1WeightC + iDel2WeightC + iDel3WeightC + ";
$query = $query."        iDel1WeightD + iDel2WeightD + iDel3WeightD > 0 ";
$query = $query." ORDER BY cDate DESC LIMIT 1 ";
$result = $conn->query($query);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);

$conn->close();
?>