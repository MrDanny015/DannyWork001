package www.util;
//SOLR的增删改查

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.solr.core.SolrTemplate;
import org.springframework.data.solr.core.query.*;
import org.springframework.data.solr.core.query.result.HighlightEntry;
import org.springframework.data.solr.core.query.result.HighlightPage;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SolrUtils {

    //连接的solr的核心库名称
    private static final String CORE_NAME = "new_core";

    /**
     * 查询效果
     *
     * @param solrTemplate
     * @param page
     * @param rows
     * @Param sort
     * @Param order
     * @param fields
     * @param content
     * @param clazz
     * @return
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    public static Map<String, Object> solrQuery(SolrTemplate solrTemplate, Integer page, Integer rows,String sort,String order, String fields[], String content, Class clazz) throws NoSuchFieldException, IllegalAccessException {
        //定义map集合
        Map<String, Object> map = new HashMap<>();

        List list = null;
        long total = 0;


        if (content != null && !"".equals(content)) {
            //创建查询条件对象
            SimpleHighlightQuery simpleHighlightQuery = new SimpleHighlightQuery();
            Sort s =null;
            //设置排序
            if(order!=null && "asc".equals(order)) {
              s = new Sort(new Sort.Order(Sort.Direction.ASC, sort));
            }else{
                s = new Sort(new Sort.Order(Sort.Direction.DESC, sort));
            }
            if(s!=null) {
                simpleHighlightQuery.addSort(s);
            }
            //设置分页 limit 0,3
            simpleHighlightQuery.setOffset((page - 1l) * rows);
            simpleHighlightQuery.setRows(rows);


            Criteria criteria =null;
            if(fields!=null && fields.length>0) {
                //查询字段
                for (int i = 0; i < fields.length; i++) {
                    String field = fields[i];
                    if(i==0){
                        criteria = new Criteria(field).is(content);
                    }else {
                        criteria.where(field).is(content);
                    }
                    System.out.println(field + "@" + content);
                }
            }

            simpleHighlightQuery.addCriteria(criteria);


            //创建高亮的配置选项
            HighlightOptions highlightOptions = new HighlightOptions();
           if(fields!=null && fields.length>0) {
               //进行处理  高亮
               for (String field : fields) {
                   highlightOptions.addField(field);
                   System.out.println("高亮字段@@@" + field);
               }
           }

            highlightOptions.setSimplePrefix("<font color='red'>");
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
                     Field declaredField = clazz.getDeclaredField(fields[0]);
                     declaredField.setAccessible(true);
                     declaredField.set(g, highContent);
                }
                if (highlights.size() > 1 && highlights.get(1).getSnipplets().size() > 0) {
                    String highContent = highlights.get(1).getSnipplets().get(0);
                    Field declaredField = clazz.getDeclaredField(fields[1]);
                    declaredField.setAccessible(true);
                    declaredField.set(g, highContent);

                }
            }
        } else {
            SimpleQuery simpleQuery = new SimpleQuery("*:*");

            Sort s =null;
            //设置排序
            if(order!=null && "asc".equals(order)) {
                s = new Sort(new Sort.Order(Sort.Direction.ASC, sort));
            }else{
                s = new Sort(new Sort.Order(Sort.Direction.DESC, sort));
            }
            if(s!=null) {
                simpleQuery.addSort(s);
            }

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




