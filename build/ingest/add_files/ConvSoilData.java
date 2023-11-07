package com.cityhub.adapter.convex;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.json.JSONObject;

import com.cityhub.exception.CoreException;
import com.cityhub.core.AbstractNormalSource;
import com.cityhub.utils.DataCoreCode.SocketCode;
import com.cityhub.utils.DateUtil;
import com.fasterxml.jackson.core.type.TypeReference;

import lombok.extern.slf4j.Slf4j;

@SuppressWarnings("unchecked")
@Slf4j
public class ConvSoilData extends AbstractNormalSource {

  @Override
  public String doit(BasicDataSource datasource)  {
    List<Map<String, Object>> rtnList = new LinkedList<>();
    String rtnStr = "";
    
        // 원시 데이터를 가져오기 위한  쿼리
    JSONArray serviceListArr = (JSONArray)ConfItem.getJSONArray("serviceList");
    JSONObject serviceListObj = serviceListArr.getJSONObject(0);
    
    String sql = serviceListObj.getString("query");
    String id = serviceListObj.getString("id");
    
    try (PreparedStatement pstmt = datasource.getConnection().prepareStatement(sql);){
      try (ResultSet rs = pstmt.executeQuery()){
        while (rs.next()) {
            
          Map<String, Object> tMap = objectMapper.readValue(templateItem.getJSONObject(ConfItem.getString("modelId")).toString(), new TypeReference<Map<String, Object>>() {});
          Map<String, Object> wMap = new LinkedHashMap<>();
          Find_wMap(tMap, "measurementDtm").put("value", rs.getString("measurement_dtm"));
          Find_wMap(tMap, "soilTemperature").put("value", rs.getString("soil_temperature"));
          Find_wMap(tMap, "sensorId").put("value", rs.getString("sensor_id"));
          
          tMap.put("id", id);
          rtnList.add(tMap);
          String str = objectMapper.writeValueAsString(tMap);
         toLogger(SocketCode.DATA_CONVERT_SUCCESS, id, str.getBytes());
        }
        sendEvent(rtnList, ConfItem.getString("datasetId"));
      } catch (SQLException e) {
        log.error("Exception : " + ExceptionUtils.getStackTrace(e));
      }
    } catch (SQLException e) {
      log.error("Exception : " + ExceptionUtils.getStackTrace(e));
    } catch (CoreException e) {
      if ("!C0099".equals(e.getErrorCode())) {
        toLogger(SocketCode.DATA_CONVERT_FAIL, id, e.getMessage());
      }
    } catch (Exception e) {
      toLogger(SocketCode.DATA_CONVERT_FAIL, id, e.getMessage());
      log.error("Exception : " + ExceptionUtils.getStackTrace(e));
    }

    return "Success";
  } // end of doit

  Map<String, Object> Find_wMap(Map<String, Object> tMap, String Name) {
    Map<String, Object> ValueMap = (Map) tMap.get(Name);
    ValueMap.put("observedAt", DateUtil.getTime());
    return ValueMap;
  }

  private String refineId(String id) {

    while (id.length() < 12) {
      id = "0" + id;
    }
    StringBuffer idBuffer = new StringBuffer(id);
    idBuffer.insert(10, "_");
    idBuffer.insert(6, "_");
    idBuffer.insert(3, "_");
    id = ConfItem.getString("id_prefix") + idBuffer.toString();
    return id;
  }
}
// end of class

