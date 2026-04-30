import io.karatelabs.core.Runner;
import org.junit.jupiter.api.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TestRunnerFilters {
    @Test
    void testRun(){

        String timestamp = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss").format(new Date());

        Runner.path("classpath:features/filters")
                .tags("FilterFindByCategoryIdNotExist")
                .outputDir("Reports/karate-reports_" + timestamp)
                .outputCucumberJson(true)
                .parallel(3);
    }
}
