package gt.gob.oj.SIDEP.model;

import gt.gob.oj.SIDEP.model.TtDependencia;
import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.Item;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Base64;
import java.util.Date;

public class Archivo extends Item {
  public String ID_ARCHIVO;
  
  public String NAME;
  
  public String CARPETA;
  
  public String SIZE;
  
  public String DATA;
  
  public Archivo() {}
  
  public Archivo(String archivo, String carpeta, String data) {
    this.NAME = archivo;
    this.CARPETA = carpeta;
    this.DATA = data;
  }
  
  public String getRutaArchivo(TtDependencia ttDependencia) {
    Date date = new Date();
    LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    int year = localDate.getYear();
    int month = localDate.getMonthValue();
    int day = localDate.getDayOfMonth();
    ttDependencia.RUTA = String.valueOf(year) + "/" + month + "/" + day + "/";
    return ttDependencia.RUTA;
  }
  
  public Boolean guardarArchivo(TtDependencia ttDependencia) {
    Config cf = new Config();
    Boolean resultado = Boolean.valueOf(true);
    String ruta = String.valueOf(cf.getArchivoRuta()) + cf.getArchivoCarpeta() + ttDependencia.RUTA + ttDependencia.ID_SOLICITUD + "/";
    try {
      File file = new File(ruta);
      file.mkdirs();
      byte[] data = Base64.getDecoder().decode(ttDependencia.ARCHIVO);
      OutputStream stream = new FileOutputStream(String.valueOf(ruta) + ttDependencia.NOMBRE_ARCHIVO);
      stream.write(data);
      stream.close();
    } catch (Exception e) {
      System.out.println("Error: " + e.getMessage());
      resultado = Boolean.valueOf(false);
    } 
    System.out.println("Ruta: " + ttDependencia.ARCHIVO);
    System.out.println("Resultado de subida de arvchivo" + resultado);
    return resultado;
  }
}
