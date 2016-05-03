/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mei.qcs.insulincalculator;

import static java.lang.Math.round;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Joao
 */
@WebService(serviceName = "InsulinCalculator", targetNamespace="http://insulincalculator-aybareon.rhcloud.com/InsulinCalculatorTomcat")
public class InsulinCalculator implements InsulinDoseCalculator{

    public void InsulinCalculator(){
        
    }
    /**
     * This is a sample web service operation
     * @param txt
     * @return 
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    
    /**
     *
     * @param carbohydrateAmount
     * @param carbohydrateToInsulinRatio
     * @param preMealBloodSugar
     * @param targetBloodSugar
     * @param personalSensitivity
     * @return
     */
    @WebMethod(operationName = "mealtimeInsulinDose")
    @Override
    public int mealtimeInsulinDose(
            @WebParam(name = "carbohydrateAmount")int carbohydrateAmount, 
            @WebParam(name = "carbohydrateToInsulinRatio")int carbohydrateToInsulinRatio,
            @WebParam(name = "preMealBloodSugar")int preMealBloodSugar, 
            @WebParam(name = "targetBloodSugar")int targetBloodSugar, 
            @WebParam(name = "personalSensitivity")int personalSensitivity){
        
        
        try{
            
            //verificar se os parametros estao em ordem antes de prosseguir
            if(checkParam(carbohydrateAmount,1)<0){
                System.out.println("Parametro [carbohydrateAmount] invalido");
                return -1;
            }else if(checkParam(carbohydrateToInsulinRatio,2)<0){
                System.out.println("Parametro [carbohydrateToInsulinRatio] invalido");
                return -1;
            }else if(checkParam(preMealBloodSugar,3)<0){
                System.out.println("Parametro preMealBloodSugar] invalido");
                return -1;
            }else if(checkParam(targetBloodSugar,4)<0){
                System.out.println("Parametro [targetBloodSugar] invalido");
                return -1;
            }else if(checkParam(personalSensitivity,5)<0){
                System.out.println("Parametro [personalSensitivity] invalido");
                return -1;
            }
            
            double carbohydrateDose;
            double bloodSugarDose;
            double dose;
            
            if(preMealBloodSugar < targetBloodSugar){
                return 0;
            }

            //o cast para double e importante para garantir que as operacoes feitas sao de virgula flutuante
            carbohydrateDose = (double)carbohydrateAmount / carbohydrateToInsulinRatio / personalSensitivity * 50;
            
            bloodSugarDose = (double)(preMealBloodSugar - targetBloodSugar)/personalSensitivity;

            dose = carbohydrateDose + bloodSugarDose;
            
            System.out.println("Carbohydrate dose: "+carbohydrateDose + "\nBloodSugarDose: "+bloodSugarDose + "\nValue: "+ dose);

            return (int)round(dose);//ter em atenção a este cast...verificar valores para não haver asneira
        }catch(Exception e){
            System.out.println("Error: "+e);
        }
        
        return -1;  
    }
    
    /**
     *
     * @param bodyWeight
     * @return
     */
    @WebMethod(operationName = "backgroundInsulinDose")
    @Override
    public int backgroundInsulinDose(@WebParam(name = "bodyWeight")int bodyWeight){
        
        
        try{
            if(checkParam(bodyWeight,6)<0) {
                System.out.println("Parametro bodyWeight invalido");
                return -1;
            }
            
            double dose;
            
            dose = 0.5*0.55*(double)bodyWeight;
            
            return (int)round(dose);//ter em atenção a este cast...verificar valores para não haver asneira
        }catch(Exception e){
            System.out.println("Error: " + e);
        }
  
        return -1;
    }
    
    /**
     *
     * @param physicalActivityLevel
     * @param physicalActivitySamples
     * @param bloodSugarDropSamples
     * @return
     */
    @WebMethod (operationName = "personalSensitivityToInsulin")
    @Override
    public int personalSensitivityToInsulin(
            @WebParam(name = "physicalActivityLevel") int physicalActivityLevel, 
            @WebParam(name = "physicalActivitySamples") int[] physicalActivitySamples, 
            @WebParam(name = "bloodSugarDropSamples") int[] bloodSugarDropSamples){
        
        
        
        
        int sensitivity = -2;//return
        
        try{
            if(checkParam(physicalActivityLevel,7)<0) {
                System.out.println("Parametro [physicalActivityLevel] invalido");
                return -1;
            }else{
                for(int i = 0;i<physicalActivitySamples.length;i++){
                    if(checkParam(physicalActivitySamples[i],8)<0) {
                        System.out.println("Parametro [physicalActivitySamples" + physicalActivitySamples[i] + "] invalido" );
                        return -1;
                    }else if(checkParam(bloodSugarDropSamples[i],9)<0) {
                        System.out.println("Parametro [bloodSugarDropSamples" + bloodSugarDropSamples[i] + "] invalido" );
                        return -1;
                    }
                }
            }
            
            double physicalActivitySamplesMean;
            double bloodSugarDropSamplesMean; 
            double beta, alpha;//parametros do least squares
            double betaDenominator = 0;
            double betaDivisor = 0;
            //o tamanho dos arrays tem de ser igual
            if(physicalActivitySamples.length != bloodSugarDropSamples.length){
                return -1;
            }

            physicalActivitySamplesMean = myMean(physicalActivitySamples);
            bloodSugarDropSamplesMean = myMean(physicalActivitySamples);
            /*wikipedia nao e grande fonte, mas tem referencia com sentido, por isso vamos ter esperanca: 
            https://en.wikipedia.org/wiki/Simple_linear_regression
            ref: Kenney, J. F. and Keeping, E. S. (1962) "Linear Regression and Correlation." Ch. 15 in Mathematics of Statistics, Pt. 1, 3rd ed. Princeton, NJ: Van Nostrand, pp. 252–285
            */
            for(int i=0;i<physicalActivitySamples.length;i++){
                if((physicalActivitySamples[i] < 0) || bloodSugarDropSamples[i] < 0){
                    return -1;
                }
                betaDenominator += (physicalActivitySamples[i]-physicalActivitySamplesMean)*(bloodSugarDropSamples[i]-bloodSugarDropSamplesMean);
                betaDivisor += (physicalActivitySamples[i]-physicalActivitySamplesMean)*(physicalActivitySamples[i]-physicalActivitySamplesMean);
            }
            beta = betaDenominator /betaDivisor;

            alpha = bloodSugarDropSamplesMean - beta*physicalActivitySamplesMean;


            sensitivity = (int)(alpha + beta * physicalActivityLevel);
      
        }catch(Exception e){
            System.out.println("Error: "+e);
            return -1;
        }
        
        return (int)round(sensitivity);
        
    }
    
    private double myMean(int [] someArray){
        int sum = 0;
        double mean = 0;
        
        for(int i = 0;i< someArray.length;i++){
            sum = someArray[i];
        }
        mean = sum/someArray.length;
        
        return mean;
    }
    
    private int checkParam(int paramToCheck, int type){
        switch(type){
            //gramas de carbohidratos(entre 60 e 120)
            case(1):
                if(paramToCheck<60 || paramToCheck>120){
                    return -1;
                }break;
            //relacao de carbohidratos processados por unidade de insulina(entre 10 e 15 g/unidade)
            case(2):
                if(paramToCheck<10 || paramToCheck>15){
                    return -1;
                }break;
            //nivel de acucar no sangue antes da refeicao (entre 120 e 250mg/dl)
            case(3):
                if(paramToCheck<120 || paramToCheck>250){
                    return -1;
                }break;
            //nivel de acucar no sangue pretendido antes da refeicao (entre 80 e 120mg/dl)
            case(4):
                if(paramToCheck<80 || paramToCheck>120){
                    return -1;
                }break;
            //sensibilidade individual(entre 15 e 100mg/dl)
            case(5):
                if(paramToCheck<15 || paramToCheck>100){
                    return -1;
                }break;
            //peso (entre 40 e 130 kg)
            case(6):
                if(paramToCheck<40 || paramToCheck>130){
                    return -1;
                }break;
            //nivel de actividade fisica diaria (entre 0 e 10)
            case(7):
                if(paramToCheck<0 || paramToCheck>10){
                    return -1;
                }break;
            //nivel de uma sample de actividade fisica (entre 0 e 10)
            case(8):
                if(paramToCheck<0 || paramToCheck>10){
                    return -1;
                }break;
            //amostra da perda de acucar no sangue por unidade de insulina (entre 15 e 100mg/dl)
            case(9):
                if(paramToCheck<15 || paramToCheck>100){
                    return -1;
                }break;
            default:System.out.println("Some programming error");break;
        }
        
        return 0;
    }
    
    
}
