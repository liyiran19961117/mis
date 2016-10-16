# mis
## 管理信息系统</br>
### ER图</br>
![ER图](images/logicalmodel.png)</br>
<p> </p>
### 查询保养记录sql语句：</br>
select maintenance_record.equipment_sn,maintenance_project.project_content,</br>
maintenance_record.person,maintenance_record.condition,maintenance_record.time,</br>
       equipment_type.equipmenttype_name,fitting.name1,fitting.number</br>
from equipment_type,maintenance_record,maintenance_project,equipment,fitting</br>
where maintenance_record.equipment_sn=0101</br>
and maintenance_record.project_sn=maintenance_project.project_sn</br>
and equipment_type.equipmenttype_sn=equipment.equipmenttype_sn</br>
and equipment.equipment_sn=maintenance_record.equipment_sn</br>
and fitting.record_sn=maintenance_record.record_sn</br>
![查询保养记录图](images/query.png)</br>
<p> </p>
### 预警sql语句：</br>
select distinct s2.equipment_sn</br>
from equipment_type s1,maintenance_record s2,equipment s3,</br>
(select  equipment_sn,time</br>
from maintenance_record s2</br>
group by s2.equipment_sn</br>
order by s2.time desc limit 1 ) as s4</br>
where s1.maintenance_type-DATEDIFF(now(),s4.time)<s1.early_warming</br>
and s1.equipmenttype_sn=s3.equipmenttype_sn</br>
and s3.equipment_sn=s2.equipment_sn</br>
and s4.equipment_sn=s2.equipment_sn</br>
![预警图](images/warning.png)</br>