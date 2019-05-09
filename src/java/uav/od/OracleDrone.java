package uav.od;

import java.util.Locale;

/**
 *
 * @author Jesimar S. Arantes
 */
public class OracleDrone {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Locale.setDefault(Locale.US);
        Drone drone = new Drone();
        CommunicationGCS communicationGCS = new CommunicationGCS(drone);
        communicationGCS.startServerOD();
        communicationGCS.receiveData();
    }
    
}
