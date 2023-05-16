with Users as (

    select * from {{ ref('vw_UserDetails') }}

),

Encounters as (

    select * from {{ ref('vw_EncounterStatus') }}

),
 

final as (

    select
        E.HealthPlan_City,
        E.Provider_login,
        U.User_FullName as Provider_name,
        E.Encounter_Doc_Status as Encounter_Status,
       --Month(E.Encounter_date,Month) as Month_of_Encounter,
       --convert(char(3), [E.Encounter_date], 0),
       Convert(varchar(10), E.Encounter_date,101) as Encounter_date,
        Count(distinct E.Encounter_Id) as No_of_Encounters

    from Encounters E
     join Users U ON  E.Provider_login = U.User_login_name
     Group by 1,2,3,4,5

)

select * from final
