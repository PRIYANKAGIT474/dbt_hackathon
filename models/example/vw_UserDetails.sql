{{ config(materialized='view') }}

with final as (

    select UM.User_login_name,concat(UM.User_First_Name , ' ' , UM.User_Last_Name) as User_FullName
    from USER_Master UM
    join Mongo_Users_Roles MUR on MUR.Username=Concat('LANDMARKHEALTH\\' ,'',UM.User_login_name)
    

)

select *
from final

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
