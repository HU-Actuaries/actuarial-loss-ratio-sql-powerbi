/* PROJE: SİGORTA PORTFÖYÜ KARLILIK ANALİZİ
   YÖNTEM: CTE (Common Table Expression) */ 

WITH Hazirlik_Tablosu AS (
    SELECT 
        annual_premium,
        total_claims_paid,
        
        CASE 
            WHEN age < 30 THEN 'Genc (0-29)'
            WHEN age BETWEEN 30 AND 45 THEN 'Orta Yas (30-45)'
            WHEN age BETWEEN 46 AND 60 THEN 'Olgun (46-60)'
            ELSE 'Yasli (60+)' 
        END AS Yas_Grubu,

        CASE 
            WHEN smoker = 'Current' THEN 'Aktif İcici'
            WHEN smoker = 'Former' THEN 'Birakmis'
            ELSE 'Hic Icmemis' 
        END AS Sigara_Statusu
    FROM 
        dbo.medical_insurance
)

SELECT 
    Yas_Grubu,
    Sigara_Statusu,
    
    COUNT(*) as Police_Sayisi,
    
    CAST(AVG(annual_premium) AS DECIMAL(10,2)) as Mevcut_Ortalama_Prim,
    
    CAST(AVG(total_claims_paid) AS DECIMAL(10,2)) as Kisi_Basi_Hasar_Maliyeti,
    
    CAST(SUM(total_claims_paid) * 1.0 / SUM(annual_premium) AS DECIMAL(10, 2)) AS Loss_Ratio,

    CAST(AVG(total_claims_paid) / 0.75 AS DECIMAL(10,2)) as Olmasi_Gereken_Prim,
    
    CAST(
        ((AVG(total_claims_paid) / 0.75) - AVG(annual_premium)) 
        / NULLIF(AVG(annual_premium), 0) * 100 
    AS DECIMAL(10,2)) as Gereken_Zam_Yuzdesi

FROM Hazirlik_Tablosu
GROUP BY Yas_Grubu, Sigara_Statusu
ORDER BY Loss_Ratio DESC;