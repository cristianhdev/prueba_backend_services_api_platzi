import io.karatelabs.core.Runner;
import org.junit.jupiter.api.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TestRunnerProducts {

    @Test
    void testRun(){

        String timestamp = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss").format(new Date());

        Runner.path("classpath:features/products")
                .tags("@GetAllProducts")
                .outputDir("Reports/karate-reports_" + timestamp)
                .outputCucumberJson(true)
                .parallel(3);
    }
}


