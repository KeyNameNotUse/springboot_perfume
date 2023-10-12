package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


@Component
// admin 계정 확인 클래스
public class LoginAdmin  implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String id = (String) request.getSession().getAttribute("id");
		
		if (id == null || !id.equals("admin")) {
			response.sendRedirect(request.getContextPath()+"/home/adminAlert?id=admin");
			return false;
		} else {
			return true;
		}
	}

}