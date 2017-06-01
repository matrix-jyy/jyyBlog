package com.zkingsoft.services.web.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zkingsoft.dao.web.WebAdDao;
import com.zkingsoft.dao.web.WebAdcolumnDao;
import com.zkingsoft.exception.GlobleException;
import com.zkingsoft.model.web.WebAd;
import com.zkingsoft.model.web.WebAdcolumn;
import com.zkingsoft.pojo.PaginationVO;
import com.zkingsoft.services.web.WebAdService;
import com.zkingsoft.util.ModelUtils;

/**
 * This field was generated by Zking.software.Codegen.
 * 
 * @date 2016-12-20 15:50
 */
@Service("webAdService")
public class WebAdServiceImpl implements WebAdService {

	@Autowired
	private WebAdDao webAdDao;
	@Autowired
	private WebAdcolumnDao adColumnDao;

	@Override
	public int add(WebAd webAd) {

		return webAdDao.insert(webAd);

	}

	@Override
	public int batchAdd(List<WebAd> webAdList) {
		return webAdDao.batchInsert(webAdList);
	}

	@Override
	public int modifyByMap(WebAd oldWebAd, WebAd newWebAd) {

		if (!ModelUtils.isModified(oldWebAd, newWebAd)) {
			return 1;
		}
		Map<String, Object> modifyMap = null;
		try {
			modifyMap = ModelUtils.comparePojo2Map(oldWebAd, newWebAd);
		} catch (Exception e) {
			new GlobleException("数据对比失败");
		}
		if (modifyMap.size() > 0) {
			modifyMap.put("adId", oldWebAd.getAdId());
			webAdDao.updateByMap(modifyMap);
		}
		return 1;
	}

	@Override
	public int modifyByModel(WebAd webAd) {

		return webAdDao.updateByModel(webAd);

	}

	@Override
	public int remove(List<Long> list) {

		return webAdDao.deleteByIds(list);

	}

	@Override
	public int removeById(Long adId) {

		return webAdDao.deleteById(adId);

	}

	@Override
	public int removeByModel(WebAd webAd) {

		return webAdDao.deleteByModel(webAd);

	}

	@Override
	public List<WebAd> findInPage(WebAd webAd, PaginationVO pageVo) {

		return webAdDao.selectInPage(webAd, pageVo);

	}

	@Override
	public List<WebAd> findByModel(WebAd webAd) {

		return webAdDao.selectByModel(webAd);

	}

	@Override
	public int findTotal(WebAd webAd) {

		return webAdDao.selectTotalRecord(webAd);

	}

	@Override
	public WebAd findById(Long adId) {

		return webAdDao.selectById(adId);

	}

	@Override
	public List<WebAd> findAdByCloCode(String code) {
		WebAdcolumn advertisementColumn = new WebAdcolumn();
		advertisementColumn.setCode(code);
		List<WebAdcolumn> columns = adColumnDao.selectByModel(advertisementColumn);
		if (columns != null && !columns.isEmpty()) {
			advertisementColumn = columns.get(0);
			return webAdDao.selectAdByCloCode(code, advertisementColumn.getColCapacity());
		} else {
			return null;
		}

	}

	@Override
	public WebAd findAdByCloCodeOne(String code) {
		WebAdcolumn advertisementColumn = new WebAdcolumn();
		advertisementColumn.setCode(code);
		List<WebAdcolumn> columns = adColumnDao.selectByModel(advertisementColumn);
		if (columns != null && !columns.isEmpty()) {
			advertisementColumn = columns.get(0);
			List<WebAd> ads = webAdDao.selectAdByCloCode(code, advertisementColumn.getColCapacity());
			if (ads != null && !ads.isEmpty()) {
				return ads.get(0);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

}