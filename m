Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481B54693F5
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 11:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237849AbhLFKeg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 05:34:36 -0500
Received: from mga14.intel.com ([192.55.52.115]:42596 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236616AbhLFKef (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Dec 2021 05:34:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="237514830"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="237514830"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 02:31:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="460792169"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 06 Dec 2021 02:31:04 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muBGx-000LAc-GF; Mon, 06 Dec 2021 10:31:03 +0000
Date:   Mon, 6 Dec 2021 18:30:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     kbuild-all@lists.01.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v4 7/7] usb: gadget: uvc: add format/frame handling code
Message-ID: <202112061803.4OpPVpwb-lkp@intel.com>
References: <20211205225803.268492-8-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205225803.268492-8-m.grzeschik@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on usb/usb-testing v5.16-rc4 next-20211206]
[cannot apply to balbi-usb/testing/next peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Grzeschik/usb-gadget-uvc-use-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20211206-070014
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-s002-20211206 (https://download.01.org/0day-ci/archive/20211206/202112061803.4OpPVpwb-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/8fdc5cd9a8845e9a061b42155d8d05ddb8514921
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Grzeschik/usb-gadget-uvc-use-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20211206-070014
        git checkout 8fdc5cd9a8845e9a061b42155d8d05ddb8514921
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/f_uvc.c:240:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dwMaxPayloadTransferSize @@     got restricted __le16 const [usertype] wMaxPacketSize @@
   drivers/usb/gadget/function/f_uvc.c:240:48: sparse:     expected unsigned int [usertype] dwMaxPayloadTransferSize
   drivers/usb/gadget/function/f_uvc.c:240:48: sparse:     got restricted __le16 const [usertype] wMaxPacketSize
>> drivers/usb/gadget/function/f_uvc.c:359:18: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/function/f_uvc.c:361:23: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/function/f_uvc.c:363:50: sparse: sparse: restricted __le16 degrades to integer

vim +240 drivers/usb/gadget/function/f_uvc.c

   197	
   198	/* --------------------------------------------------------------------------
   199	 * Control requests
   200	 */
   201	
   202	void uvc_fill_streaming_control(struct uvc_device *uvc,
   203				   struct uvc_streaming_control *ctrl,
   204				   int iframe, int iformat, unsigned int ival)
   205	{
   206		struct uvcg_format *uformat;
   207		struct uvcg_frame *uframe;
   208	
   209		/* Restrict the iformat, iframe and ival to valid values. Negative
   210		 * values for ifrmat and iframe will result in the maximum valid value
   211		 * being selected
   212		 */
   213		iformat = clamp((unsigned int)iformat, 1U,
   214				(unsigned int)uvc->header->num_fmt);
   215		uformat = find_format_by_index(uvc, iformat);
   216		if (!uformat)
   217			return;
   218	
   219		iframe = clamp((unsigned int)iframe, 1U,
   220			       (unsigned int)uformat->num_frames);
   221		uframe = find_frame_by_index(uvc, uformat, iframe);
   222		if (!uframe)
   223			return;
   224	
   225		ival = clamp((unsigned int)ival, 1U,
   226			     (unsigned int)uframe->frame.b_frame_interval_type);
   227		if (!uframe->dw_frame_interval[ival - 1])
   228			return;
   229	
   230		memset(ctrl, 0, sizeof(*ctrl));
   231	
   232		ctrl->bmHint = 1;
   233		ctrl->bFormatIndex = iformat;
   234		ctrl->bFrameIndex = iframe;
   235		ctrl->dwFrameInterval = uframe->dw_frame_interval[ival - 1];
   236		ctrl->dwMaxVideoFrameSize =
   237			uframe->frame.dw_max_video_frame_buffer_size;
   238	
   239		if (uvc->video.ep->desc)
 > 240			ctrl->dwMaxPayloadTransferSize =
   241				uvc->video.ep->desc->wMaxPacketSize;
   242		ctrl->bmFramingInfo = 3;
   243		ctrl->bPreferedVersion = 1;
   244		ctrl->bMaxVersion = 1;
   245	}
   246	
   247	static int uvc_events_process_data(struct uvc_device *uvc,
   248					   struct usb_request *req)
   249	{
   250		struct uvc_video *video = &uvc->video;
   251		struct uvc_streaming_control *target;
   252		struct uvc_streaming_control *ctrl;
   253		struct uvcg_frame *uframe;
   254		struct uvcg_format *uformat;
   255	
   256		switch (video->control) {
   257		case UVC_VS_PROBE_CONTROL:
   258			pr_debug("setting probe control, length = %d\n", req->actual);
   259			target = &video->probe;
   260			break;
   261	
   262		case UVC_VS_COMMIT_CONTROL:
   263			pr_debug("setting commit control, length = %d\n", req->actual);
   264			target = &video->commit;
   265			break;
   266	
   267		default:
   268			pr_err("setting unknown control, length = %d\n", req->actual);
   269			return -EOPNOTSUPP;
   270		}
   271	
   272		ctrl = (struct uvc_streaming_control *)req->buf;
   273	
   274		uvc_fill_streaming_control(uvc, target, ctrl->bFrameIndex,
   275				   ctrl->bFormatIndex, ctrl->dwFrameInterval);
   276	
   277		if (video->control == UVC_VS_COMMIT_CONTROL) {
   278			uformat = find_format_by_index(uvc, target->bFormatIndex);
   279			if (!uformat)
   280				return -EINVAL;
   281	
   282			uframe = find_frame_by_index(uvc, uformat, ctrl->bFrameIndex);
   283			if (!uframe)
   284				return -EINVAL;
   285	
   286			spin_lock(&video->frame_lock);
   287	
   288			video->cur_frame = uframe;
   289			video->cur_format = uformat;
   290			video->cur_ival = find_ival_index(uframe, ctrl->dwFrameInterval);
   291	
   292			spin_unlock(&video->frame_lock);
   293		}
   294	
   295		return 0;
   296	}
   297	
   298	static void
   299	uvc_events_process_streaming(struct uvc_device *uvc, uint8_t req, uint8_t cs,
   300				     struct uvc_request_data *resp)
   301	{
   302		struct uvc_streaming_control *ctrl;
   303	
   304		pr_debug("streaming request (req %02x cs %02x)\n", req, cs);
   305	
   306		if (cs != UVC_VS_PROBE_CONTROL && cs != UVC_VS_COMMIT_CONTROL)
   307			return;
   308	
   309		ctrl = (struct uvc_streaming_control *)&resp->data;
   310		resp->length = sizeof(*ctrl);
   311	
   312		switch (req) {
   313		case UVC_SET_CUR:
   314			uvc->video.control = cs;
   315			resp->length = 34;
   316			break;
   317	
   318		case UVC_GET_CUR:
   319			if (cs == UVC_VS_PROBE_CONTROL)
   320				memcpy(ctrl, &uvc->video.probe, sizeof(*ctrl));
   321			else
   322				memcpy(ctrl, &uvc->video.commit, sizeof(*ctrl));
   323			break;
   324	
   325		case UVC_GET_MIN:
   326		case UVC_GET_MAX:
   327		case UVC_GET_DEF:
   328			if (req == UVC_GET_MAX)
   329				uvc_fill_streaming_control(uvc, ctrl, -1, -1, UINT_MAX);
   330			else
   331				uvc_fill_streaming_control(uvc, ctrl, 1, 1, 0);
   332			break;
   333	
   334		case UVC_GET_RES:
   335			memset(ctrl, 0, sizeof(*ctrl));
   336			break;
   337	
   338		case UVC_GET_LEN:
   339			resp->data[0] = 0x00;
   340			resp->data[1] = 0x22;
   341			resp->length = 2;
   342			break;
   343	
   344		case UVC_GET_INFO:
   345			resp->data[0] = 0x03;
   346			resp->length = 1;
   347			break;
   348		}
   349	}
   350	
   351	static int
   352	uvc_events_process_class(struct uvc_device *uvc,
   353				 const struct usb_ctrlrequest *ctrl,
   354				 struct uvc_request_data *resp)
   355	{
   356		if ((ctrl->bRequestType & USB_RECIP_MASK) != USB_RECIP_INTERFACE)
   357			return -EINVAL;
   358	
 > 359		if ((ctrl->wIndex & 0xff) == uvc->control_intf)
   360			return -EOPNOTSUPP;
   361		else if ((ctrl->wIndex & 0xff) == uvc->streaming_intf)
   362			uvc_events_process_streaming(uvc, ctrl->bRequest,
   363						     ctrl->wValue >> 8, resp);
   364	
   365		return 0;
   366	}
   367	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
