package cn.edu.hbpu.erp.pojo;

import java.util.ArrayList;
import java.util.List;

public class DepartmentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DepartmentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDepidIsNull() {
            addCriterion("depId is null");
            return (Criteria) this;
        }

        public Criteria andDepidIsNotNull() {
            addCriterion("depId is not null");
            return (Criteria) this;
        }

        public Criteria andDepidEqualTo(Integer value) {
            addCriterion("depId =", value, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidNotEqualTo(Integer value) {
            addCriterion("depId <>", value, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidGreaterThan(Integer value) {
            addCriterion("depId >", value, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidGreaterThanOrEqualTo(Integer value) {
            addCriterion("depId >=", value, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidLessThan(Integer value) {
            addCriterion("depId <", value, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidLessThanOrEqualTo(Integer value) {
            addCriterion("depId <=", value, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidIn(List<Integer> values) {
            addCriterion("depId in", values, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidNotIn(List<Integer> values) {
            addCriterion("depId not in", values, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidBetween(Integer value1, Integer value2) {
            addCriterion("depId between", value1, value2, "depid");
            return (Criteria) this;
        }

        public Criteria andDepidNotBetween(Integer value1, Integer value2) {
            addCriterion("depId not between", value1, value2, "depid");
            return (Criteria) this;
        }

        public Criteria andDepnameIsNull() {
            addCriterion("depName is null");
            return (Criteria) this;
        }

        public Criteria andDepnameIsNotNull() {
            addCriterion("depName is not null");
            return (Criteria) this;
        }

        public Criteria andDepnameEqualTo(String value) {
            addCriterion("depName =", value, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameNotEqualTo(String value) {
            addCriterion("depName <>", value, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameGreaterThan(String value) {
            addCriterion("depName >", value, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameGreaterThanOrEqualTo(String value) {
            addCriterion("depName >=", value, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameLessThan(String value) {
            addCriterion("depName <", value, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameLessThanOrEqualTo(String value) {
            addCriterion("depName <=", value, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameLike(String value) {
            addCriterion("depName like", value, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameNotLike(String value) {
            addCriterion("depName not like", value, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameIn(List<String> values) {
            addCriterion("depName in", values, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameNotIn(List<String> values) {
            addCriterion("depName not in", values, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameBetween(String value1, String value2) {
            addCriterion("depName between", value1, value2, "depname");
            return (Criteria) this;
        }

        public Criteria andDepnameNotBetween(String value1, String value2) {
            addCriterion("depName not between", value1, value2, "depname");
            return (Criteria) this;
        }

        public Criteria andDepmanagerIsNull() {
            addCriterion("depManager is null");
            return (Criteria) this;
        }

        public Criteria andDepmanagerIsNotNull() {
            addCriterion("depManager is not null");
            return (Criteria) this;
        }

        public Criteria andDepmanagerEqualTo(String value) {
            addCriterion("depManager =", value, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerNotEqualTo(String value) {
            addCriterion("depManager <>", value, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerGreaterThan(String value) {
            addCriterion("depManager >", value, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerGreaterThanOrEqualTo(String value) {
            addCriterion("depManager >=", value, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerLessThan(String value) {
            addCriterion("depManager <", value, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerLessThanOrEqualTo(String value) {
            addCriterion("depManager <=", value, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerLike(String value) {
            addCriterion("depManager like", value, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerNotLike(String value) {
            addCriterion("depManager not like", value, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerIn(List<String> values) {
            addCriterion("depManager in", values, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerNotIn(List<String> values) {
            addCriterion("depManager not in", values, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerBetween(String value1, String value2) {
            addCriterion("depManager between", value1, value2, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepmanagerNotBetween(String value1, String value2) {
            addCriterion("depManager not between", value1, value2, "depmanager");
            return (Criteria) this;
        }

        public Criteria andDepcountIsNull() {
            addCriterion("depCount is null");
            return (Criteria) this;
        }

        public Criteria andDepcountIsNotNull() {
            addCriterion("depCount is not null");
            return (Criteria) this;
        }

        public Criteria andDepcountEqualTo(Integer value) {
            addCriterion("depCount =", value, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountNotEqualTo(Integer value) {
            addCriterion("depCount <>", value, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountGreaterThan(Integer value) {
            addCriterion("depCount >", value, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountGreaterThanOrEqualTo(Integer value) {
            addCriterion("depCount >=", value, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountLessThan(Integer value) {
            addCriterion("depCount <", value, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountLessThanOrEqualTo(Integer value) {
            addCriterion("depCount <=", value, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountIn(List<Integer> values) {
            addCriterion("depCount in", values, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountNotIn(List<Integer> values) {
            addCriterion("depCount not in", values, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountBetween(Integer value1, Integer value2) {
            addCriterion("depCount between", value1, value2, "depcount");
            return (Criteria) this;
        }

        public Criteria andDepcountNotBetween(Integer value1, Integer value2) {
            addCriterion("depCount not between", value1, value2, "depcount");
            return (Criteria) this;
        }

        public Criteria andIsuseIsNull() {
            addCriterion("isUse is null");
            return (Criteria) this;
        }

        public Criteria andIsuseIsNotNull() {
            addCriterion("isUse is not null");
            return (Criteria) this;
        }

        public Criteria andIsuseEqualTo(Integer value) {
            addCriterion("isUse =", value, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseNotEqualTo(Integer value) {
            addCriterion("isUse <>", value, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseGreaterThan(Integer value) {
            addCriterion("isUse >", value, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseGreaterThanOrEqualTo(Integer value) {
            addCriterion("isUse >=", value, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseLessThan(Integer value) {
            addCriterion("isUse <", value, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseLessThanOrEqualTo(Integer value) {
            addCriterion("isUse <=", value, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseIn(List<Integer> values) {
            addCriterion("isUse in", values, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseNotIn(List<Integer> values) {
            addCriterion("isUse not in", values, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseBetween(Integer value1, Integer value2) {
            addCriterion("isUse between", value1, value2, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsuseNotBetween(Integer value1, Integer value2) {
            addCriterion("isUse not between", value1, value2, "isuse");
            return (Criteria) this;
        }

        public Criteria andIsdelIsNull() {
            addCriterion("isDel is null");
            return (Criteria) this;
        }

        public Criteria andIsdelIsNotNull() {
            addCriterion("isDel is not null");
            return (Criteria) this;
        }

        public Criteria andIsdelEqualTo(Integer value) {
            addCriterion("isDel =", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelNotEqualTo(Integer value) {
            addCriterion("isDel <>", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelGreaterThan(Integer value) {
            addCriterion("isDel >", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelGreaterThanOrEqualTo(Integer value) {
            addCriterion("isDel >=", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelLessThan(Integer value) {
            addCriterion("isDel <", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelLessThanOrEqualTo(Integer value) {
            addCriterion("isDel <=", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelIn(List<Integer> values) {
            addCriterion("isDel in", values, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelNotIn(List<Integer> values) {
            addCriterion("isDel not in", values, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelBetween(Integer value1, Integer value2) {
            addCriterion("isDel between", value1, value2, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelNotBetween(Integer value1, Integer value2) {
            addCriterion("isDel not between", value1, value2, "isdel");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}