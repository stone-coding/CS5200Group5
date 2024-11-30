package dao;

import Pojo.Agreement;

public interface AgreementMapper {

	public void insertagreement(Agreement agreement);
	public Agreement findagreement(String house_id);
	public void updateagreement(Agreement agreement);
	public void deleteagreement(String house_id);
}
