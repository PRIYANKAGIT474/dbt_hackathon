{{ config(materialized='view') }}

with final as (

    select    HealthPlan_City,AT.Provider_login,Encounterdate as Encounter_date,
            case when Is_Addendum=1 then Addendum_EncounterStatus else Encounter_Status END as Encounter_Doc_Status, 
            AT.Encounter_Id
    from Encountersummaryinfo AT 
    JOIN Member_Master MM  ON AT.patientid = MM.PatientID

)

select *
from final
