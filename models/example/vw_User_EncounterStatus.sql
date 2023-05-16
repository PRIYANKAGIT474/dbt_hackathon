with final as (

    select
        HealthPlan_City,
        Provider_login,
        Provider_name,
        Encounter_Doc_Status,
        --Encounter_date,
        Count(1) as visits
    from  {{ ref('vw_User_EncounterDetails') }}
    Group by 1,2,3,4
)

select * from final
