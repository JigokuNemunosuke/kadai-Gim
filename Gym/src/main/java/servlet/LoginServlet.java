package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.LoginLogic;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		String code = request.getParameter("code");
		String pass = request.getParameter("pass");
		
		//Customerインスタンスの生成
		Customer customer = new Customer(code, pass);
		
		//ログイン処理の実行
		LoginLogic bo = new LoginLogic();
		
		try {
			customer = bo.execute(customer);
		} catch (SQLException e) {
			String systemErrorMsg = "システムエラーが発生しました。管理者に問い合わせてください。";
			request.setAttribute("systemErrorMsg", systemErrorMsg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/error.jsp");
			dispatcher.forward(request, response);
		}
		
		//ログイン処理の成否によって処理を分岐
		if (customer != null) {
			//ログイン成功時、セッションスコープにユーザー情報を保存
			HttpSession session = request.getSession();
			session.setAttribute("customer", customer);
			
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/main.jsp");
			dispatcher.forward(request, response);
			
		} else {
			//ログイン失敗時、エラーを表示してフォワード
			String loginErrorMsg = "ログインに失敗しました。<br>会員番号とパスワードを確認して、再度お試しください。";
			request.setAttribute("loginErrorMsg", loginErrorMsg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
	}
}
