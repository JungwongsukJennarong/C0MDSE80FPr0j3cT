package ouhk.comps380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.Record;

public interface RecordRepository extends JpaRepository<Record, Long> {
}
