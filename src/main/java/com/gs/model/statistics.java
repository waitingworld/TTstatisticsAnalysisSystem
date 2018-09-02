package com.gs.model;

import java.util.Date;

public class statistics {
    private String id;
    private Type type;
    private Integer total;
    private Integer Correct_number;
    private Date finish_date;
    private Integer finish_time;
    private String examination_name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getCorrect_number() {
        return Correct_number;
    }

    public void setCorrect_number(Integer correct_number) {
        Correct_number = correct_number;
    }

    public Date getFinish_date() {
        return finish_date;
    }

    public void setFinish_date(Date finish_date) {
        this.finish_date = finish_date;
    }

    public Integer getFinish_time() {
        return finish_time;
    }

    public void setFinish_time(Integer finish_time) {
        this.finish_time = finish_time;
    }

    public String getExamination_name() {
        return examination_name;
    }

    public void setExamination_name(String examination_name) {
        this.examination_name = examination_name;
    }
}
