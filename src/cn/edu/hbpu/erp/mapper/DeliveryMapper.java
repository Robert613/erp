package cn.edu.hbpu.erp.mapper;

import cn.edu.hbpu.erp.pojo.Delivery;
import cn.edu.hbpu.erp.pojo.DeliveryExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface DeliveryMapper {
    int countByExample(DeliveryExample example);

    int deleteByExample(DeliveryExample example);

    int deleteByPrimaryKey(Integer did);

    int insert(Delivery record);

    int insertSelective(Delivery record);

    List<Delivery> selectByExample(DeliveryExample example);

    Delivery selectByPrimaryKey(Integer did);

    int updateByExampleSelective(@Param("record") Delivery record, @Param("example") DeliveryExample example);

    int updateByExample(@Param("record") Delivery record, @Param("example") DeliveryExample example);

    int updateByPrimaryKeySelective(Delivery record);

    int updateByPrimaryKey(Delivery record);
    
    List<Delivery> getDeliveryList();
    
    int updateDeliveryByIsDel(int oid);
    
    List<Delivery> selectByMultiQuery(Map<String, String> map);
    
    Delivery selectByDid(int did);
}