
with validation as (
    select HealthPlan_City, Provider_name, Encounter_Doc_Status, Encounter_date, visits, count(*) as duplicate_field
    from vw_User_EncounterDetails
),

validation_errors as (
    select
*
    from validation
    where limit duplicate_field > 0
)

select *
from validation_errors