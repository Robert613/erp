package cn.edu.hbpu.erp.mapper;

import cn.edu.hbpu.erp.pojo.Department;
import cn.edu.hbpu.erp.pojo.DepartmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartmentMapper {
    int countByExample(DepartmentExample example);

    int deleteByExample(DepartmentExample example);

    int deleteByPrimaryKey(Integer depid);

    int insert(Department record);

    int insertSelective(Department record);

    List<Department> selectByExample(DepartmentExample example);

    Department selectByPrimaryKey(Integer depid);

    int updateByExampleSelective(@Param("record") Department record, @Param("example") DepartmentExample example);

    int updateByExample(@Param("record") Department record, @Param("example") DepartmentExample example);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
    
    int updateByIsDel(Integer depid);
    
    int updateByIsUse1(Integer depid);
    
    int updateByIsUse2(Integer depid);
    
    List<Department> getDepartmentsList();
}