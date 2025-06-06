Select 
    ps.PatientId
    , DATEADD(day, -14, ps.AdmittedDate) as ReminderDate
    , DATEDIFF(day, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    , ps.AdmittedDate
    , ps.DischargeDate
    , ps.Hospital
    , ps.Ward
    ,ps.Tariff 
From PatientStay ps
where ps.hospital IN ('kingston', 'pruh')
--AND ps.Ward like '%surgery'
and ps.AdmittedDate >= datefromparts(2024,2,27)
and ps.DischargeDate BETWEEN '2024/03/03' and '2024/03/05'
and ps.Tariff > 7 
order by 
    ps.AdmittedDate
    , ps.DischargeDate


Select
    ps.hospital
    ,ps.Ward
    ,count(*) as numberofpatients
    ,sum(ps.Tariff) as TotalTariff
    ,avg(ps.Tariff) as AvgTariff
    ,sum(ps.Tariff)/count(*) as average2
From PatientStay ps
Group BY ps.Hospital
Having Count(*) >10
Order by numberofpatients DESC

Select *
from DimHospitalBad

SELECT
    ps.PatientId
    , ps.Hospital
    , h.Hospital
    , ps.AdmittedDate
    , h.HospitalType
    , h.HospitalSize
From PatientStay ps full outer JOIN DimHospitalBad h on ps.Hospital = h.Hospital
