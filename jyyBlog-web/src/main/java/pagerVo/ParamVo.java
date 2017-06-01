package pagerVo;

import java.util.List;

import com.zkingsoft.model.bus.BusParameterSettings;

/**
 * 接收页面集合的对象
 * 
 * @author jiangyouyao
 *
 */
public class ParamVo {
	private List<BusParameterSettings> param;

	public List<BusParameterSettings> getParam() {
		return param;
	}

	public void setParam(List<BusParameterSettings> param) {
		this.param = param;
	}

}
