package com.wcs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.wcs.entity.Size;
import com.wcs.exception.WCSException;

class BookingDAO {


	

	
	
	Map<String, Byte> selectSeatsAllColumn(String date, String time)  throws WCSException{
		Map<String, Byte> seatMapFromDB = new HashMap<>();
		final String SELECT_SEAT_ALL_COLUMN = "SELECT date, seat_row_name, "
				+ time
				+ " FROM wcs.booking "
				+ " WHERE date= ?";
		
		try (	Connection connection = MySQLConnection.getConnection(); //1, 2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_SEAT_ALL_COLUMN); //3.準備指令
				){
			//3.1傳入?的值
			/*pstmt.setString(1, time);//time = "seat_byte_12" or "seat_byte_17" or "seat_byte_19"
			pstmt.setString(2, date);*/
			pstmt.setString(1, date);
			
			try(	ResultSet rs= pstmt.executeQuery(); //4.執行指令
					){
				//5.處理rs
				while(rs.next()) {					
					seatMapFromDB.put(rs.getString("seat_row_name"), rs.getByte(time));
				}				
			}			
		} catch (SQLException e) {
			throw new WCSException("讀取座位狀態失敗", e);
		}
		return seatMapFromDB;
		
	}
	
	Map<String, Byte> selectSeatColumn(Set<String> keySet, String date, String time)  throws WCSException{
		//依照陣列值的數量設定?並設定pstmt對應數量。
		//因傳進來的值經過檢查，必有一筆以上，預設(?並在離開for後加上)
		String keySetToMark = "(?";
		for(int i=0; i<keySet.size()-1; i++) {
			keySetToMark += ",?";
		}
		keySetToMark += ")";
		
		final String SELECT_SEAT_COLUMN_BY_KEYSET ="SELECT "
				+ " seat_row_name, " 
				+ time 
				+ " FROM wcs.booking "
				+ " WHERE seat_row_name IN "
				+ keySetToMark;
		
		
		//System.out.println("SQL程式:" + SELECT_SEAT_COLUMN_BY_KEYSET);
		
		Map<String, Byte> seatMapFromDB = new HashMap<>();
		String[] keySetArray = keySet.toArray(new String[keySet.size()]);
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_SEAT_COLUMN_BY_KEYSET);
		){
			//pstmt.setArray(1, connection.createArrayOf("keySetArray", keySetArray));
			for(int i=0; i<keySetArray.length; i++) {
				pstmt.setString(i+1, keySetArray[i]);
			}
			try(
				ResultSet rs = pstmt.executeQuery();	
			){
				while(rs.next()) {
					seatMapFromDB.put(rs.getString("seat_row_name"), rs.getByte(time));
				}
			}
			
			
		}catch(SQLException e) {
			throw new WCSException("讀取座位狀態失敗", e);
		}
		
		return seatMapFromDB;
	}

}
