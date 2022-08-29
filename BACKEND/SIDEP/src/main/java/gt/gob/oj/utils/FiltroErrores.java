package gt.gob.oj.utils;

public class FiltroErrores {
  public static String filtraMensaje(String msj) {
    Config conf = new Config();
    if (conf.getparametrosMensajeDebug().equals("0"))
      try {
        return msj.split("@")[1];
      } catch (Exception ex) {
        return msj;
      }  
    return msj;
  }
}
