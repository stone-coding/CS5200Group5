package dao;

import java.util.List;

import Pojo.Applyout;
import org.apache.ibatis.annotations.Param;

public interface ApplyoutMapper {
	public void insertapplyout(Applyout applyout);

	List<Applyout> findallapplyout();
	public void updateapplyout(Applyout applyout);
	public void updateapplyoutbyhouse(Applyout applyout);
	public Applyout findbyid(Integer id);
	public void deleteapplyout(Integer id);

	//@Param annotation to indicate the name of the parameter in the SQL statement
	Applyout getByHouseIdAndUserIdAndStatus(@Param("house_id") String house_id, @Param("userlist_id") Integer userlist_id,  @Param("status")String status);
}
