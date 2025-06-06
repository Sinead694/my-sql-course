Select 
    ps.PatientId
    , ps.AdmittedDate
    , ps.DischargeDate
    , ps.Hospital
    , ps.Ward 
From PatientStay ps
where ps.hospital IN ('kingston', 'pruh')
AND ps.Ward like '%surgery'


