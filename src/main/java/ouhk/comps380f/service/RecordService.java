package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import ouhk.comps380f.model.Record;

public interface RecordService {
    
    public long createRecord(String userName, String orderList) throws IOException;
    
    public List<Record> getRecord();
    
    public Record getRecord(long id);
    
}
