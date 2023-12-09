Return-Path: <linux-usb+bounces-3938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5456780B3B1
	for <lists+linux-usb@lfdr.de>; Sat,  9 Dec 2023 11:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D8A728103F
	for <lists+linux-usb@lfdr.de>; Sat,  9 Dec 2023 10:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE85134B5;
	Sat,  9 Dec 2023 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8Naa9VT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65194BC
	for <linux-usb@vger.kernel.org>; Sat,  9 Dec 2023 02:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702118547; x=1733654547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aosUpJKuMFxNlIJ4PLGysshgVVjbb0r15RASPFtHmbA=;
  b=d8Naa9VTAzjB8t4K7X5MuOfenVhNX4vFO1p5G6bh/YAUV5KKA8dGKkeq
   63IzyLqoxjm+3vwirQOLeh9Fq24I/qPYCovDG1hxqV9tfxsu68Hx7qmT7
   hxIQekovf70wAwfpfe5l9gq6DMz34Faay+HLLi98+ePktp3eoQ/kI1drK
   UDW/G3YzYq3oZ4gUkYRpp6x5mRX4DxhsjXhZuUgLrafD8PYk67x3lvFZH
   NngS9Tz3lTo1zQhPhg31o/JT/mJu1KCuolcGN7rzpf2pJwCuknK51I3pX
   t6dRbH/2WxsWHVhA7g61kj+b8fwdlnvVDbZ1jXF9cdKjhz+1A/GzderOn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="397297811"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="397297811"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 02:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890451355"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="890451355"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2023 02:42:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBumo-000FF3-14;
	Sat, 09 Dec 2023 10:42:19 +0000
Date: Sat, 9 Dec 2023 18:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	kernel@collabora.com
Subject: Re: [PATCH v2] usb: gadget: webcam: Make g_webcam loadable again
Message-ID: <202312091825.1MSZeBRA-lkp@intel.com>
References: <20231208131342.65671-1-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208131342.65671-1-andrzej.p@collabora.com>

Hi Andrzej,

kernel test robot noticed the following build errors:

[auto build test ERROR on 33cc938e65a98f1d29d0a18403dbbee050dcad9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrzej-Pietrasiewicz/usb-gadget-webcam-Make-g_webcam-loadable-again/20231208-211513
base:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
patch link:    https://lore.kernel.org/r/20231208131342.65671-1-andrzej.p%40collabora.com
patch subject: [PATCH v2] usb: gadget: webcam: Make g_webcam loadable again
config: x86_64-randconfig-r111-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091825.1MSZeBRA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091825.1MSZeBRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091825.1MSZeBRA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/legacy/webcam.c:224:17: error: initializer element is not constant
      .b_length   = uvc_frame_yuv_360p.bLength,
                    ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:224:17: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_length')
   drivers/usb/gadget/legacy/webcam.c:225:25: error: initializer element is not constant
      .b_descriptor_type  = uvc_frame_yuv_360p.bDescriptorType,
                            ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:225:25: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_descriptor_type')
   drivers/usb/gadget/legacy/webcam.c:226:28: error: initializer element is not constant
      .b_descriptor_subtype  = uvc_frame_yuv_360p.bDescriptorSubType,
                               ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:226:28: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_descriptor_subtype')
   drivers/usb/gadget/legacy/webcam.c:227:22: error: initializer element is not constant
      .b_frame_index   = uvc_frame_yuv_360p.bFrameIndex,
                         ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:227:22: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_frame_index')
   drivers/usb/gadget/legacy/webcam.c:228:23: error: initializer element is not constant
      .bm_capabilities  = uvc_frame_yuv_360p.bmCapabilities,
                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:228:23: note: (near initialization for 'uvcg_frame_yuv_360p.frame.bm_capabilities')
   drivers/usb/gadget/legacy/webcam.c:229:16: error: initializer element is not constant
      .w_width   = uvc_frame_yuv_360p.wWidth,
                   ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:229:16: note: (near initialization for 'uvcg_frame_yuv_360p.frame.w_width')
   drivers/usb/gadget/legacy/webcam.c:230:17: error: initializer element is not constant
      .w_height   = uvc_frame_yuv_360p.wHeight,
                    ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:230:17: note: (near initialization for 'uvcg_frame_yuv_360p.frame.w_height')
   drivers/usb/gadget/legacy/webcam.c:231:23: error: initializer element is not constant
      .dw_min_bit_rate  = uvc_frame_yuv_360p.dwMinBitRate,
                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:231:23: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_min_bit_rate')
   drivers/usb/gadget/legacy/webcam.c:232:23: error: initializer element is not constant
      .dw_max_bit_rate  = uvc_frame_yuv_360p.dwMaxBitRate,
                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:232:23: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_max_bit_rate')
   drivers/usb/gadget/legacy/webcam.c:233:37: error: initializer element is not constant
      .dw_max_video_frame_buffer_size = uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize,
                                        ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:233:37: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_max_video_frame_buffer_size')
   drivers/usb/gadget/legacy/webcam.c:234:32: error: initializer element is not constant
      .dw_default_frame_interval = uvc_frame_yuv_360p.dwDefaultFrameInterval,
                                   ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:234:32: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_default_frame_interval')
   drivers/usb/gadget/legacy/webcam.c:235:29: error: initializer element is not constant
      .b_frame_interval_type  = uvc_frame_yuv_360p.bFrameIntervalType,
                                ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:235:29: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_frame_interval_type')
   drivers/usb/gadget/legacy/webcam.c:263:17: error: initializer element is not constant
      .b_length   = uvc_frame_yuv_720p.bLength,
                    ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:263:17: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_length')
   drivers/usb/gadget/legacy/webcam.c:264:25: error: initializer element is not constant
      .b_descriptor_type  = uvc_frame_yuv_720p.bDescriptorType,
                            ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:264:25: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_descriptor_type')
   drivers/usb/gadget/legacy/webcam.c:265:28: error: initializer element is not constant
      .b_descriptor_subtype  = uvc_frame_yuv_720p.bDescriptorSubType,
                               ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:265:28: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_descriptor_subtype')
   drivers/usb/gadget/legacy/webcam.c:266:22: error: initializer element is not constant
      .b_frame_index   = uvc_frame_yuv_720p.bFrameIndex,
                         ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:266:22: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_frame_index')
   drivers/usb/gadget/legacy/webcam.c:267:23: error: initializer element is not constant
      .bm_capabilities  = uvc_frame_yuv_720p.bmCapabilities,
                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:267:23: note: (near initialization for 'uvcg_frame_yuv_720p.frame.bm_capabilities')
   drivers/usb/gadget/legacy/webcam.c:268:16: error: initializer element is not constant
      .w_width   = uvc_frame_yuv_720p.wWidth,
                   ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:268:16: note: (near initialization for 'uvcg_frame_yuv_720p.frame.w_width')
   drivers/usb/gadget/legacy/webcam.c:269:17: error: initializer element is not constant
      .w_height   = uvc_frame_yuv_720p.wHeight,
                    ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:269:17: note: (near initialization for 'uvcg_frame_yuv_720p.frame.w_height')
   drivers/usb/gadget/legacy/webcam.c:270:23: error: initializer element is not constant
      .dw_min_bit_rate  = uvc_frame_yuv_720p.dwMinBitRate,
                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:270:23: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_min_bit_rate')
   drivers/usb/gadget/legacy/webcam.c:271:23: error: initializer element is not constant
      .dw_max_bit_rate  = uvc_frame_yuv_720p.dwMaxBitRate,
                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:271:23: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_max_bit_rate')
   drivers/usb/gadget/legacy/webcam.c:272:37: error: initializer element is not constant
      .dw_max_video_frame_buffer_size = uvc_frame_yuv_720p.dwMaxVideoFrameBufferSize,
                                        ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:272:37: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_max_video_frame_buffer_size')
   drivers/usb/gadget/legacy/webcam.c:273:32: error: initializer element is not constant
      .dw_default_frame_interval = uvc_frame_yuv_720p.dwDefaultFrameInterval,
                                   ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:273:32: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_default_frame_interval')
   drivers/usb/gadget/legacy/webcam.c:274:29: error: initializer element is not constant
      .b_frame_interval_type  = uvc_frame_yuv_720p.bFrameIntervalType,
                                ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:274:29: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_frame_interval_type')
   drivers/usb/gadget/legacy/webcam.c:332:17: error: initializer element is not constant
      .b_length   = uvc_frame_mjpg_360p.bLength,
                    ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:332:17: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.b_length')
   drivers/usb/gadget/legacy/webcam.c:333:25: error: initializer element is not constant


vim +224 drivers/usb/gadget/legacy/webcam.c

   220	
   221	static const struct uvcg_frame uvcg_frame_yuv_360p = {
   222		.fmt_type		= UVCG_UNCOMPRESSED,
   223		.frame = {
 > 224			.b_length			= uvc_frame_yuv_360p.bLength,
   225			.b_descriptor_type		= uvc_frame_yuv_360p.bDescriptorType,
   226			.b_descriptor_subtype		= uvc_frame_yuv_360p.bDescriptorSubType,
   227			.b_frame_index			= uvc_frame_yuv_360p.bFrameIndex,
   228			.bm_capabilities		= uvc_frame_yuv_360p.bmCapabilities,
   229			.w_width			= uvc_frame_yuv_360p.wWidth,
   230			.w_height			= uvc_frame_yuv_360p.wHeight,
   231			.dw_min_bit_rate		= uvc_frame_yuv_360p.dwMinBitRate,
   232			.dw_max_bit_rate		= uvc_frame_yuv_360p.dwMaxBitRate,
   233			.dw_max_video_frame_buffer_size	= uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize,
   234			.dw_default_frame_interval	= uvc_frame_yuv_360p.dwDefaultFrameInterval,
   235			.b_frame_interval_type		= uvc_frame_yuv_360p.bFrameIntervalType,
   236		},
   237		.dw_frame_interval	= (u32 *)uvc_frame_yuv_360p.dwFrameInterval,
   238	};
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

