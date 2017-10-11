package com.zhiyou100.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.VideoDao;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.VideoService;
import com.zhiyou100.util.PageInfo;
import com.zhiyou100.vo.VideoQueryVo;
@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	private VideoDao dao;
	
	public PageInfo<Video> listVideo(VideoQueryVo videoQueryVo) {

		// 对应的页码
		int pageIndex = videoQueryVo.getPageIndex();
		
		
		int m = dao.getPageCount(videoQueryVo);
		int n = videoQueryVo.getPageSize();
		
		// 总页数
		int pageCount = (m + n - 1) / n;
		
		// 如果查询的页数大于总页数，那么查询最后一页内容
		if (pageIndex > pageCount) {
			
			pageIndex = pageCount;
			
			videoQueryVo.setPageIndex(pageIndex);
		}
		
		// 当前页的内容
		List<Video> data = dao.listVideo(videoQueryVo);
		
		// 把上面三个数据封装在 pageInfo 对象中
		PageInfo<Video> pageInfo = new PageInfo<Video>(pageIndex, pageCount, data);
		
		return pageInfo;
	}

	public int deleteVideoById(Long... ids) {

		return dao.deleteVideoById(ids);
	}

	public void addVideo(Video video) {

		dao.addVideo(video);

	}

	public int updateVideo(Video video) {

		return dao.updateVideo(video);
	}

	public List<Video> listVideosByTerm(String videoName, Long speakerId, Long courseId) {

		List<Video> list = dao.listVideosByTerm(videoName, speakerId, courseId);

		return list;
	}


}
