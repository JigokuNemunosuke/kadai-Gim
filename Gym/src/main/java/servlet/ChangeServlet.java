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

import model.ChangeLogic;
import model.Customer;

/**
 * Servlet implementation class ConfirmServlet
 */
@WebServlet("/ChangeServlet")
public class ChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeServlet() {
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
			forwardPath = "/WEB-INF/jsp/change.jsp";
		}
		
		//登録確認画面から「変更実行」をリクエストされたときの処理
		else if(action.equals("done")) {
			//セッションスコープに保存された変更後情報を取得
			HttpSession session = request.getSession();
			Customer changeCon = (Customer) session.getAttribute("changeCon");
			
			//登録処理の実行
			ChangeLogic bo = new ChangeLogic();
			Customer changeDone = new Customer();
			try {
				changeDone = bo.execute(changeCon);
			} catch (SQLException e) {
				String systemErrorMsg = "システムエラーが発生しました。管理者に問い合わせてください。";
				request.setAttribute("systemErrorMsg", systemErrorMsg);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/error.jsp");
				dispatcher.forward(request, response);
			}
			
			//情報変更後のchangeDoneインスタンスをCustomerに上書き
			session.setAttribute("customer", changeDone);
			
			//セッションスコープからchangeConインスタンスを削除
			session.removeAttribute("changeCon");
			
			//変更後のフォワード先を設定
			forwardPath = "/WEB-INF/jsp/changeDone.jsp";
		}
			
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String telno = request.getParameter("telno");
		String postalcode = request.getParameter("postalcode");
		String address = request.getParameter("address");
		String rank = request.getParameter("rank");
		
		//changeConインスタンスの生成
		Customer changeCon = new Customer(code, name, telno, postalcode, address, rank);
		
		//変更なしの情報をcustomerから取得
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		//changeCon.setCode(customer.getCode());
		
		if (name.equals("")) {
			changeCon.setName(customer.getName());
		}
		if (telno.equals("")) {
			changeCon.setTelno(customer.getTelno());
		}
		if (postalcode.equals("")) {
			changeCon.setPostalcode(customer.getPostalcode());
		}
		if (address.equals("")) {
			changeCon.setAddress(customer.getAddress()); }
		if (rank.equals("")) {
			changeCon.setRank(customer.getRank());
		}
		
		//変更内容をセッションスコープに保存
		session.setAttribute("changeCon", changeCon);
		
		//確認画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/changeConfirm.jsp");
		dispatcher.forward(request, response);
		//request.getRequestDispatcher("/changeConfirm.jsp").forward(request, response);
	}

}
