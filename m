Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4144F13D0
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 13:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359562AbiDDLdM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 07:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359502AbiDDLdL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 07:33:11 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C183C737
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649071875; x=1680607875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yA5/m0X5dmUI1HuaxReEOu4kM7e1RtRgMy0Np80+5qs=;
  b=ghB1uZuyfKsPe2OCR7zr+rbDTWTXOfg10Z1kaIz9mA6S24Q3ds2J3j09
   ptwHfdB5ydKRCLj09gz9rieAM6VJc4n+z+Xj9AnY6gTyery6xyTK6Ov8o
   tQqy6Y2e84mXFoyTr7TdZJTS5hT0+V2d7l10/M5m7vyF10UvgznawrGNA
   0ChybBHzGWUyYl3bbrmZ9WeEqeZJexQfDvkG9et9e6JpBq1oA1knLRbPn
   58HZj46vs29k3dhQTxw8zu3g4mGomtw6NO4C9WUBkOBHiiRU6o37u8i7A
   Nk3XvlqFLnqFJ6ccSbtj4zIMvq4LSFHxWdHc6/CjL2CwpX08OQ14QhjpV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="321188192"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="321188192"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 04:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="696542880"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2022 04:31:12 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbKvP-00020K-Pk;
        Mon, 04 Apr 2022 11:31:11 +0000
Date:   Mon, 4 Apr 2022 19:30:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     kbuild-all@lists.01.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 5/5] usb: gadget: uvc: stop the pump on more conditions
Message-ID: <202204041903.wSoTM3yH-lkp@intel.com>
References: <20220402233914.3625405-6-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402233914.3625405-6-m.grzeschik@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

I love your patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on v5.18-rc1 next-20220404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Grzeschik/usb-gadget-uvc-fixes-and-improvements/20220404-165031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: arm64-randconfig-r016-20220404 (https://download.01.org/0day-ci/archive/20220404/202204041903.wSoTM3yH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3577e91e5a0a9a94ee3d4b22240e7b143c31133c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Grzeschik/usb-gadget-uvc-fixes-and-improvements/20220404-165031
        git checkout 3577e91e5a0a9a94ee3d4b22240e7b143c31133c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/gadget/function/uvc_video.c: In function 'uvcg_video_pump':
>> drivers/usb/gadget/function/uvc_video.c:371:74: error: 'struct uvc_device' has no member named 'streamon'
     371 |         while (video->ep->enabled || queue->queue.streaming || video->uvc->streamon) {
         |                                                                          ^~


vim +371 drivers/usb/gadget/function/uvc_video.c

   351	
   352	/* --------------------------------------------------------------------------
   353	 * Video streaming
   354	 */
   355	
   356	/*
   357	 * uvcg_video_pump - Pump video data into the USB requests
   358	 *
   359	 * This function fills the available USB requests (listed in req_free) with
   360	 * video data from the queued buffers.
   361	 */
   362	static void uvcg_video_pump(struct work_struct *work)
   363	{
   364		struct uvc_video *video = container_of(work, struct uvc_video, pump);
   365		struct uvc_video_queue *queue = &video->queue;
   366		struct usb_request *req = NULL;
   367		struct uvc_buffer *buf;
   368		unsigned long flags;
   369		int ret;
   370	
 > 371		while (video->ep->enabled || queue->queue.streaming || video->uvc->streamon) {
   372			/* Retrieve the first available USB request, protected by the
   373			 * request lock.
   374			 */
   375			spin_lock_irqsave(&video->req_lock, flags);
   376			if (list_empty(&video->req_free)) {
   377				spin_unlock_irqrestore(&video->req_lock, flags);
   378				return;
   379			}
   380			req = list_first_entry(&video->req_free, struct usb_request,
   381						list);
   382			list_del(&req->list);
   383			spin_unlock_irqrestore(&video->req_lock, flags);
   384	
   385			/* Retrieve the first available video buffer and fill the
   386			 * request, protected by the video queue irqlock.
   387			 */
   388			spin_lock_irqsave(&queue->irqlock, flags);
   389			buf = uvcg_queue_head(queue);
   390			if (buf == NULL) {
   391				spin_unlock_irqrestore(&queue->irqlock, flags);
   392				break;
   393			}
   394	
   395			video->encode(req, video, buf);
   396	
   397			/* With usb3 we have more requests. This will decrease the
   398			 * interrupt load to a quarter but also catches the corner
   399			 * cases, which needs to be handled */
   400			if (list_empty(&video->req_free) ||
   401			    buf->state == UVC_BUF_STATE_DONE ||
   402			    !(video->req_int_count %
   403			       DIV_ROUND_UP(video->uvc_num_requests, 4))) {
   404				video->req_int_count = 0;
   405				req->no_interrupt = 0;
   406			} else {
   407				req->no_interrupt = 1;
   408			}
   409	
   410			/* Queue the USB request */
   411			ret = uvcg_video_ep_queue(video, req);
   412			spin_unlock_irqrestore(&queue->irqlock, flags);
   413	
   414			if (ret < 0) {
   415				uvcg_queue_cancel(queue, 0);
   416				break;
   417			}
   418			video->req_int_count++;
   419		}
   420	
   421		if (!req)
   422			return;
   423	
   424		spin_lock_irqsave(&video->req_lock, flags);
   425		list_add_tail(&req->list, &video->req_free);
   426		spin_unlock_irqrestore(&video->req_lock, flags);
   427		return;
   428	}
   429	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
