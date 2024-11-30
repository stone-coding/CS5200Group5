package service;

import java.util.List;

import Pojo.Applyout;
import Pojo.Rentlist;

public interface ApplyoutService {
	public void insertapplyout(Rentlist rentlist);
	List<Applyout> findallapplyout();
	public void updateapplyout(Applyout applyout);
	public void agreeapplyout(Integer id);
	public void deleteapplyout(Integer id);
}
