/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mei.qcs.insulincalculator;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.ejb.Stateless;

/**
 *
 * @author Joao
 */
@WebService(serviceName = "InsulinCalculator")
@Stateless()
public class InsulinCalculator {

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
    @WebMethod(operationName = "mealDose")
    public int mealtimeInsulinDose(int carbohydrateAmount, int carbohydrateToInsulinRatio,
            int preMealBloodSugar, int targetBloodSugar, int personalSensitivity){
        
        try{
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

            return (int)dose;//ter em atenção a este cast...verificar valores para não haver asneira
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
    @WebMethod(operationName = "backgroundDose")
    public int backgroundInsulinDose(int bodyWeight){
        try{
            double dose;
            
            dose = 0.5*0.55*(double)bodyWeight;
            
            return (int)dose;//ter em atenção a este cast...verificar valores para não haver asneira
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
    @WebMethod (operationName = "sensitivity")
    public int personalSensitivityToInsulin(int physicalActivityLevel, int[] physicalActivitySamples, int[] bloodSugarDropSamples){
        double physicalActivitySamplesMean;
        double bloodSugarDropSamplesMean; 
        double beta, alpha;//parametros do least squares
        double betaDenominator = 0;
        double betaDivisor = 0;
        
        int sensitivity = -2;//return
        
        try{
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
        
        return sensitivity;
        
    }
    
    double myMean(int [] someArray){
        int sum = 0;
        double mean = 0;
        
        for(int i = 0;i< someArray.length;i++){
            sum = someArray[i];
        }
        mean = sum/someArray.length;
        
        return mean;
    }
}
