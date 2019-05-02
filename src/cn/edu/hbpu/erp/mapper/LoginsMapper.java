package cn.edu.hbpu.erp.mapper;

import cn.edu.hbpu.erp.pojo.Logins;
import cn.edu.hbpu.erp.pojo.LoginsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LoginsMapper {
    int countByExample(LoginsExample example);

    int deleteByExample(LoginsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Logins record);

    int insertSelective(Logins record);

    List<Logins> selectByExample(LoginsExample example);

    Logins selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Logins record, @Param("example") LoginsExample example);

    int updateByExample(@Param("record") Logins record, @Param("example") LoginsExample example);

    int updateByPrimaryKeySelective(Logins record);

    int updateByPrimaryKey(Logins record);
    
    List<Logins> getLoginsList();
}