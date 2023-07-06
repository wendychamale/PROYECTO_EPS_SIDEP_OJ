package gt.gob.oj.SIDEP.manager;

import java.io.Writer;
import java.io.PrintWriter;
import java.io.StringWriter;
import gt.gob.oj.utils.jsonResult;
import gt.gob.oj.SIDEP.model.TtOrganigrama;
import java.sql.ResultSetMetaData;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Objects;
import java.util.HashMap;
import java.sql.ResultSet;
import gt.gob.oj.utils.ConnectionsPool;
import java.util.ArrayList;
import java.util.Map;
import java.util.List;
import gt.gob.oj.utils.Config;

public class OrganigramaManager
{
    String SCHEMA;
    
    public OrganigramaManager() {
        this.SCHEMA = new Config().getDBSchema();
    }
    
    public List<Map<String, Object>> getPadrePrincipal() throws Exception {
        final List<Map<String, Object>> salida = new ArrayList<Map<String, Object>>();
        final ConnectionsPool c = new ConnectionsPool();
        final Connection conn = c.conectar();
        System.out.println("PADRE ORGANIGRAMA......\n");
        final CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_ORGANIGRAMA.PROC_INS_RH_PADRE (?,?)");
        call.registerOutParameter("P_CUR_DATASET", -10);
        call.registerOutParameter("P_MSJ", 12);
        call.execute();
        final ResultSet rset = (ResultSet)call.getObject("P_CUR_DATASET");
        final ResultSetMetaData meta = rset.getMetaData();
        while (rset.next()) {
            final Map<String, Object> map = new HashMap<String, Object>();
            for (int i = 1; i <= meta.getColumnCount(); ++i) {
                final String key = meta.getColumnName(i).toString();
                final String value = Objects.toString(rset.getString(key), "");
                map.put(key, value);
            }
            salida.add(map);
        }
        rset.close();
        call.close();
        conn.close();
        return salida;
    }
    
    public List<Map<String, Object>> getHijosOrganigrama(final int codigo_padre) throws Exception {
        final List<Map<String, Object>> salida = new ArrayList<Map<String, Object>>();
        final ConnectionsPool c = new ConnectionsPool();
        final Connection conn = c.conectar();
        System.out.println("ORGANIGRAMA......\n");
        final CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_ORGANIGRAMA.PROC_INS_RH_AREA_DEPARTAMENTO (?,?,?)");
        call.setInt("p_area_padre", codigo_padre);
        call.registerOutParameter("P_CUR_DATASET", -10);
        call.registerOutParameter("P_MSJ", 12);
        call.execute();
        final ResultSet rset = (ResultSet)call.getObject("P_CUR_DATASET");
        System.out.println("dentro ver organigrama nnn......" + this.SCHEMA + "\n");
        final ResultSetMetaData meta = rset.getMetaData();
        System.out.println("tam......" + rset.getFetchSize() + "\n");
        System.out.println("tam1......" + meta.getColumnCount() + "\n");
        while (rset.next()) {
            final Map<String, Object> map = new HashMap<String, Object>();
            for (int i = 1; i <= meta.getColumnCount(); ++i) {
                final String key = meta.getColumnName(i).toString();
                final String value = Objects.toString(rset.getString(key), "");
                map.put(key, value);
            }
            System.out.println("p1......" + map.toString() + "\n");
            salida.add(map);
        }
        rset.close();
        call.close();
        conn.close();
        return salida;
    }
    
    public List<Map<String, Object>> deleteHijosOrganigrama(final int codigo_area) throws Exception {
        final List<Map<String, Object>> salida = new ArrayList<Map<String, Object>>();
        final ConnectionsPool c = new ConnectionsPool();
        final Connection conn = c.conectar();
        System.out.println("ORGANIGRAMA......\n");
        final CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_ORGANIGRAMA.PROC_DELETE_RH_AREA_DEPARTAMENTO (?,?,?)");
        call.setInt("p_codigo_area", codigo_area);
        call.registerOutParameter("P_CUR_DATASET", -10);
        call.registerOutParameter("P_MSJ", 12);
        call.execute();
        System.out.println("dentro ELIMINAR AREA organigrama......" + this.SCHEMA + "\n");
        final ResultSet rset = (ResultSet)call.getObject("P_CUR_DATASET");
        final ResultSetMetaData meta = rset.getMetaData();
        System.out.println("tam......" + rset.getFetchSize() + "\n");
        System.out.println("tam1......" + meta.getColumnCount() + "\n");
        while (rset.next()) {
            final Map<String, Object> map = new HashMap<String, Object>();
            for (int i = 1; i <= meta.getColumnCount(); ++i) {
                final String key = meta.getColumnName(i).toString();
                final String value = Objects.toString(rset.getString(key), "");
                map.put(key, value);
            }
            System.out.println("p1......" + map.toString() + "\n");
            salida.add(map);
        }
        rset.close();
        call.close();
        conn.close();
        return salida;
    }
    
    public jsonResult addChild(final TtOrganigrama ttDependencia) throws Exception {
        jsonResult salida = new jsonResult();
        final ConnectionsPool c = new ConnectionsPool();
        final Connection conn = c.conectar();
        conn.setAutoCommit(false);
        System.out.println("ORGANIGRAMA......\n");
        try {
            salida = this.insDependencia(ttDependencia, conn);
            if (salida.id > 0) {
                salida.result = "OK";
                conn.commit();
            }
            else {
                conn.rollback();
                salida.result = "ERROR";
                salida.id = -1;
            }
        }
        catch (Exception ex) {
            final StringWriter sw = new StringWriter();
            ex.printStackTrace(new PrintWriter(sw));
            final String exceptionAsString = sw.toString();
            ex.printStackTrace();
            conn.rollback();
            salida.id = -1;
            salida.msj = "@" + ex.getMessage() + "@" + exceptionAsString;
            salida.result = "ERROR";
        }
        return salida;
    }
    
    public jsonResult insDependencia(final TtOrganigrama ttDependencia, final Connection conn) throws Exception {
        final jsonResult salida = new jsonResult();
        System.out.println("dentro insertar Organigrama......" + this.SCHEMA + "\n");
        final CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_ORGANIGRAMA.PROC_INSERT_RH_AREA_DEPARTAMENTO (?,?,?,?)");
        call.setInt("p_area_padre", ttDependencia.AREA_PADRE);
        call.setString("p_nombre_area", ttDependencia.NOMBRE_AREA);
        call.registerOutParameter("p_id_salida", 2);
        call.registerOutParameter("p_msj", 12);
        call.execute();
        salida.id = call.getInt("p_id_salida");
        salida.msj = call.getString("p_msj");
        if (salida.id > 0) {
            salida.result = "OK";
        }
        System.out.println("todo ok insert organigrama......" + this.SCHEMA + "\n");
        call.close();
        return salida;
    }
}