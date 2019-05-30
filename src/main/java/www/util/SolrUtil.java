package www.util;
//SOLR的增删改查

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.solr.core.SolrTemplate;
import org.springframework.data.solr.core.query.Criteria;
import org.springframework.data.solr.core.query.HighlightOptions;
import org.springframework.data.solr.core.query.SimpleHighlightQuery;
import org.springframework.data.solr.core.query.SimpleQuery;
import org.springframework.data.solr.core.query.result.HighlightEntry;
import org.springframework.data.solr.core.query.result.HighlightPage;

import java.lang.reflect.Field;
import java.util.*;

public class SolrUtil {

    //连接的solr的核心库名称
    private static final String CORE_NAME = "new_core";

    /**
     * 查询效果
     *
     * @param solrTemplate
     * @param page
     * @param rows
     * @param field
     * @param content
     * @param clazz
     * @return
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    public static Map<String, Object> solrQuery(SolrTemplate solrTemplate, Integer page, Integer rows, String field, String content, Class clazz) throws NoSuchFieldException, IllegalAccessException {
        //定义map集合
        Map<String, Object> map = new HashMap<>();

        List list = null;
        long total = 0;


        if (content != null && !"".equals(content)) {
            //创建查询条件对象
            SimpleHighlightQuery simpleHighlightQuery = new SimpleHighlightQuery();

            //设置分页 limit 0,3
            simpleHighlightQuery.setOffset((page - 1l) * rows);
            simpleHighlightQuery.setRows(rows);
            Criteria criteria = new Criteria(field).is(content.replaceAll(" ", ""));
            simpleHighlightQuery.addCriteria(criteria);


            //创建高亮的配置选项
            HighlightOptions highlightOptions = new HighlightOptions();
            //进行处理
            highlightOptions.addField(field);
            highlightOptions.setSimplePrefix("<font color='green'>");
            highlightOptions.setSimplePostfix("</font>");
            //进行高亮设置
            simpleHighlightQuery.setHighlightOptions(highlightOptions);


            //进行查询 利用模板对象
            HighlightPage highlightPage = solrTemplate.queryForHighlightPage(CORE_NAME, simpleHighlightQuery, clazz);

            //System.out.println("total:总计记录数:"+highlightPage.getTotalElements());
            total = highlightPage.getTotalElements();
            //获取数据内容
            list = highlightPage.getContent();

            for (Object g : list) {
                List<HighlightEntry.Highlight> highlights = highlightPage.getHighlights(g);
                if (highlights.size() > 0 && highlights.get(0).getSnipplets().size() > 0) {
                    String highContent = highlights.get(0).getSnipplets().get(0);
                    Field declaredField = clazz.getDeclaredField(field);
                    declaredField.setAccessible(true);
                    declaredField.set(g, highContent);
                }
            }
        } else {
            SimpleQuery simpleQuery = new SimpleQuery("*:*");
            //设置分页 limit 0,3
            simpleQuery.setOffset((page - 1l) * rows);
            simpleQuery.setRows(rows);
            Page query = solrTemplate.query(CORE_NAME, simpleQuery, clazz);
            total = query.getTotalElements();
            list = query.getContent();
        }
        //list.forEach(System.out::println);


        map.put("total", total);
        map.put("rows", list);

        return map;
    }


    /**
     * 更新操作
     *
     * @param solrTemplate
     * @param obj
     */
    public static void saveBean(SolrTemplate solrTemplate, Object obj) {
        solrTemplate.saveBean(CORE_NAME, obj);
        solrTemplate.commit(CORE_NAME);
    }


    /**
     * 删除方法
     *
     * @param solrTemplate
     * @param ids
     */
    public static void deleteByIds(SolrTemplate solrTemplate, Integer ids[]) {
        List<String> sids = new ArrayList<>();

        for (Integer id : ids) {
            sids.add(id.toString());
        }
        solrTemplate.deleteByIds(CORE_NAME, sids);
        solrTemplate.commit(CORE_NAME);
    }
}




