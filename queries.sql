--List of chemicals manufactured by "The Chemical Company" and audited by "The Auditing Company" (ID: 5432):

SELECT C.*
FROM Chemical C
JOIN VerifiedChemical Ve ON C.ChemicalID = Ve.ChemicalID
WHERE C.ManufacturerName = 'The Chemical Company'
  AND Ve.AuditorID = 5432;

--Retrieve a list of chemicals audited by an auditor with the highest number of audits:

SELECT C.*
FROM Chemical C
JOIN VerifiedChemical Ve ON C.ChemicalID = Ve.ChemicalID
JOIN (
    SELECT AuditorID, COUNT(*) AS NumAudits
    FROM VerifiedChemical
    GROUP BY AuditorID
    ORDER BY NumAudits DESC
    LIMIT 1
) AS TopAuditor ON Ve.AuditorID = TopAuditor.AuditorID;

--Chemicals with auditing date between 2022-01-01 and 22-09-30, and unverified chemicals added within the same time range:

SELECT *
FROM Chemical
WHERE (ChemicalID IN (SELECT ChemicalID FROM VerifiedChemical WHERE AuditingDate BETWEEN '2022-01-01' AND '2022-09-30'))
   OR (ChemicalID IN (SELECT ChemicalID FROM UnverifiedChemical WHERE DateAdded BETWEEN '2022-01-01' AND '2022-09-30'));

--Combined list of all chemicals with an indicator column for verified/unverified:

SELECT C.*, CASE 
    WHEN Ve.ChemicalID IS NOT NULL 
    THEN 'Verified' 
    ELSE 'Unverified' 
END AS VerificationStatus
FROM Chemical C
LEFT JOIN VerifiedChemical Ve ON C.ChemicalID = Ve.ChemicalID
LEFT JOIN UnverifiedChemical Uv ON C.ChemicalID = Uv.ChemicalID;

--To show only unique results, you can use the DISTINCT keyword:

SELECT DISTINCT C.*, CASE 
    WHEN Ve.ChemicalID IS NOT NULL 
    THEN 'Verified' 
    ELSE 'Unverified' 
END AS VerificationStatus
FROM Chemical C
LEFT JOIN VerifiedChemical Ve ON C.ChemicalID = Ve.ChemicalID
LEFT JOIN UnverifiedChemical Uv ON C.ChemicalID = Uv.ChemicalID;

