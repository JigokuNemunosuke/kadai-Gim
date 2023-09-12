package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//フォワード先
		String forwardPath = null;
		
		//doGetの種類を判別するaction値をリクエストパラメータから取得
		String action = request.getParameter("action");
		
		//「変更画面表示」をリクエストされたときの処理
		if(action == null) {
			//フォワード先を設定
			forwardPath = "/WEB-INF/jsp/main.jsp";
		}
		
		//登録確認画面から「変更実行」をリクエストされたときの処理
		else if(action.equals("logout")) {
			//セッションスコープを破棄
			HttpSession session = request.getSession();
			session.invalidate();
			
			//変更後のフォワード先を設定
			forwardPath = "/WEB-INF/jsp/logout.jsp";
		}
			
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
