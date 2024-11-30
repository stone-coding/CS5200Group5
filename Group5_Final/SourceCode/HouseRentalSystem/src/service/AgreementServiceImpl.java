package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Pojo.Agreement;
import dao.AgreementMapper;

@Service
@Transactional
public class AgreementServiceImpl implements AgreementService {
	@Autowired
	private AgreementMapper agreementMapper;

	@Override
	public void insertagreement(Agreement agreement) {
		agreementMapper.insertagreement(agreement);

	}

	@Override
	public Agreement findagreement(String house_id) {
		Agreement agreement=agreementMapper.findagreement(house_id);
		return agreement;
	}

	@Override
	public void updateagreement(Agreement agreement) {

		agreementMapper.updateagreement(agreement);
	}

	@Override
	public void deleteagreement(String house_id) {
		// TODO Auto-generated method stub
		agreementMapper.deleteagreement(house_id);

	}

}
