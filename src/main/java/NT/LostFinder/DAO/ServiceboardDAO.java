package NT.LostFinder.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import NT.LostFinder.DTO.Serviceboard;

public class ServiceboardDAO {
	public static ServiceboardDAO sb=null;
	private ServiceboardDAO() {
	}
	synchronized public static ServiceboardDAO getBoardDAO() {
		if(sb==null)
			sb=new ServiceboardDAO();
		return sb;
	}
	synchronized public static boolean example(Serviceboard data) {
		String sql="sql commend";
		try(Connection con=Connect.getInstance();PreparedStatement ps=con.prepareStatement(sql);){
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	synchronized public static boolean createBoard(Serviceboard data) {
		String sql="insert into serviceboard values(serviceboard_seq.nextval,?,?,?,sysdate,default)";
		try(Connection con=Connect.getInstance();PreparedStatement ps=con.prepareStatement(sql);){
			ps.setString(1, data.getService_title());
			ps.setString(2, data.getMember_id());
			ps.setString(3, data.getService_content());
			if(ps.executeUpdate()==1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	synchronized public static ArrayList<Serviceboard> listBoard(int data, String id){
		String sql="select service_no, service_title, member_id, service_content, service_createdate, service_viewcount from (select rownum as rum, service_no, service_title, member_id, service_content, service_createdate, service_viewcount from (select * from serviceboard where=member_id='"+id+"' order by service_no)) where rum <= (select count(*) from serviceboard) -"+((data-1)*10)+" and rum > (select count(*) from serviceboard) -"+(data*10)+" order by rum asc;";
		try(Connection con=Connect.getInstance();PreparedStatement ps=con.prepareStatement(sql);ResultSet rs=ps.executeQuery()){
			ArrayList<Serviceboard> lists=new ArrayList<Serviceboard>();
			if(rs.next()) {
				do 
					lists.add(new Serviceboard(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5),Integer.parseInt(rs.getString(6))));
				while(rs.next());
				return lists;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	synchronized public static ArrayList<Serviceboard> listBoard(int data){
		String sql="select service_no, service_title, member_id, service_content, service_createdate, service_viewcount from (select rownum as rum, service_no, service_title, member_id, service_content, service_createdate, service_viewcount from (select * from serviceboard order by service_no)) where rum <= (select count(*) from serviceboard) -"+((data-1)*10)+" and rum > (select count(*) from serviceboard) -"+(data*10)+" order by rum asc";
		try(Connection con=Connect.getInstance();PreparedStatement ps=con.prepareStatement(sql);ResultSet rs=ps.executeQuery()){
			ArrayList<Serviceboard> lists=new ArrayList<Serviceboard>();
			if(rs.next()) {
				do 
					lists.add(new Serviceboard(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5),Integer.parseInt(rs.getString(6))));
				while(rs.next());
				return lists;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	synchronized public static int listPageBoard(){
		String sql="select count(*) from serviceboard";
		try(Connection con=Connect.getInstance();PreparedStatement ps=con.prepareStatement(sql);ResultSet rs=ps.executeQuery()){
			if(rs.next())
				return Integer.parseInt(rs.getString(1));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 1;
	}
}