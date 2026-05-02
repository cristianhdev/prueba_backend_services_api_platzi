
import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;


public class TestRunner {

    @Test
    void testRun() {

        // Timestamp para reportes únicos
        String timestamp = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss").format(new Date());

        // Ejecutar features
        SuiteResult results = Runner.path("classpath:features")
                //.tags("@delete-user-by-id")
                .outputDir("Reports/karate-reports_" + timestamp)
                .outputCucumberJson(true)
                .parallel(3);

        // Generar reporte Cucumber HTML
        System.out.println(results.getReportDir());
         generateReport(results.getReportDir().toString().concat("/cucumber-json"));

        // Validar ejecución
        assertFalse(results.isFailed());
    }

    public static void generateReport(String karateOutputPath) {

        File reportDir = new File(karateOutputPath);

        // Obtener todos los JSON generados por Karate
        File[] files = reportDir.listFiles((dir, name) -> name.endsWith(".json"));

        List<String> jsonPaths = new ArrayList<>();

        if (files != null) {
            for (File file : files) {
                jsonPaths.add(file.getAbsolutePath());
            }
        } else {
            System.out.println("No se encontraron archivos JSON para el reporte");
            return;
        }

        // Configuración del reporte
        Configuration config = new Configuration(new File("Reports"), "Karate Project");

        config.addClassifications("Environment", "QA");
        config.addClassifications("Project", "API Automation");
        config.addClassifications("Executed By", "Karate");

        // Generar reporte
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();

    }

}
