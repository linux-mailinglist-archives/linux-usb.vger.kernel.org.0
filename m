Return-Path: <linux-usb+bounces-3937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450580B393
	for <lists+linux-usb@lfdr.de>; Sat,  9 Dec 2023 11:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8F541C20B12
	for <lists+linux-usb@lfdr.de>; Sat,  9 Dec 2023 10:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DFB125CC;
	Sat,  9 Dec 2023 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTjw1vou"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A150610EF
	for <linux-usb@vger.kernel.org>; Sat,  9 Dec 2023 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702117314; x=1733653314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JoyPvmiD8zPrvDFM3J9U7JTurKggNBLbxCoM/GlAgEk=;
  b=dTjw1vouLIBvUVDlwpffRWKeeZBHoGiwir8vegoRSNbbn+LKO1WjUpi/
   0MV03KdvKJT+scVOJ7RLhq3YyVPrPFu65XHfA5tcpaUELT5wgrtVF+zZK
   wuY3hS3/8rlrfmqsGNS2agMHPqI++WgdTJ3x/DWynBH31XLFSnRnJ5uJg
   UbWJksV1tf4w5gXbvN/2mo+E0GXx2aMZ88FqBAO/8DMjO3sMrFGOL2ay0
   gRLDWff+oaf15YXWToNcN4KbEmwVO/H4uFij0UBmrswhuXk5arC8hOOza
   gR8DmCslUWuwniGqJDizpAVm0yDzK9t0TIGY3kIaIy/ZKYClxOHNvoyHs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1576262"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1576262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 02:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="13760154"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2023 02:21:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBuSx-000FBv-22;
	Sat, 09 Dec 2023 10:21:47 +0000
Date: Sat, 9 Dec 2023 18:20:37 +0800
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
Message-ID: <202312091817.u3BjKBcF-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33cc938e65a98f1d29d0a18403dbbee050dcad9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrzej-Pietrasiewicz/usb-gadget-webcam-Make-g_webcam-loadable-again/20231208-211513
base:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
patch link:    https://lore.kernel.org/r/20231208131342.65671-1-andrzej.p%40collabora.com
patch subject: [PATCH v2] usb: gadget: webcam: Make g_webcam loadable again
config: m68k-randconfig-r132-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091817.u3BjKBcF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091817.u3BjKBcF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091817.u3BjKBcF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/legacy/webcam.c:229:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] w_width @@     got restricted __le16 static const [toplevel] [usertype] wWidth @@
   drivers/usb/gadget/legacy/webcam.c:229:69: sparse:     expected unsigned short [usertype] w_width
   drivers/usb/gadget/legacy/webcam.c:229:69: sparse:     got restricted __le16 static const [toplevel] [usertype] wWidth
>> drivers/usb/gadget/legacy/webcam.c:230:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] w_height @@     got restricted __le16 static const [toplevel] [usertype] wHeight @@
   drivers/usb/gadget/legacy/webcam.c:230:69: sparse:     expected unsigned short [usertype] w_height
   drivers/usb/gadget/legacy/webcam.c:230:69: sparse:     got restricted __le16 static const [toplevel] [usertype] wHeight
>> drivers/usb/gadget/legacy/webcam.c:231:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_min_bit_rate @@     got restricted __le32 static const [toplevel] [usertype] dwMinBitRate @@
   drivers/usb/gadget/legacy/webcam.c:231:69: sparse:     expected unsigned int [usertype] dw_min_bit_rate
   drivers/usb/gadget/legacy/webcam.c:231:69: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMinBitRate
>> drivers/usb/gadget/legacy/webcam.c:232:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_max_bit_rate @@     got restricted __le32 static const [toplevel] [usertype] dwMaxBitRate @@
   drivers/usb/gadget/legacy/webcam.c:232:69: sparse:     expected unsigned int [usertype] dw_max_bit_rate
   drivers/usb/gadget/legacy/webcam.c:232:69: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMaxBitRate
>> drivers/usb/gadget/legacy/webcam.c:233:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_max_video_frame_buffer_size @@     got restricted __le32 static const [toplevel] [usertype] dwMaxVideoFrameBufferSize @@
   drivers/usb/gadget/legacy/webcam.c:233:69: sparse:     expected unsigned int [usertype] dw_max_video_frame_buffer_size
   drivers/usb/gadget/legacy/webcam.c:233:69: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMaxVideoFrameBufferSize
>> drivers/usb/gadget/legacy/webcam.c:234:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_default_frame_interval @@     got restricted __le32 static const [toplevel] [usertype] dwDefaultFrameInterval @@
   drivers/usb/gadget/legacy/webcam.c:234:69: sparse:     expected unsigned int [usertype] dw_default_frame_interval
   drivers/usb/gadget/legacy/webcam.c:234:69: sparse:     got restricted __le32 static const [toplevel] [usertype] dwDefaultFrameInterval
   drivers/usb/gadget/legacy/webcam.c:268:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] w_width @@     got restricted __le16 static const [toplevel] [usertype] wWidth @@
   drivers/usb/gadget/legacy/webcam.c:268:69: sparse:     expected unsigned short [usertype] w_width
   drivers/usb/gadget/legacy/webcam.c:268:69: sparse:     got restricted __le16 static const [toplevel] [usertype] wWidth
   drivers/usb/gadget/legacy/webcam.c:269:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] w_height @@     got restricted __le16 static const [toplevel] [usertype] wHeight @@
   drivers/usb/gadget/legacy/webcam.c:269:69: sparse:     expected unsigned short [usertype] w_height
   drivers/usb/gadget/legacy/webcam.c:269:69: sparse:     got restricted __le16 static const [toplevel] [usertype] wHeight
   drivers/usb/gadget/legacy/webcam.c:270:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_min_bit_rate @@     got restricted __le32 static const [toplevel] [usertype] dwMinBitRate @@
   drivers/usb/gadget/legacy/webcam.c:270:69: sparse:     expected unsigned int [usertype] dw_min_bit_rate
   drivers/usb/gadget/legacy/webcam.c:270:69: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMinBitRate
   drivers/usb/gadget/legacy/webcam.c:271:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_max_bit_rate @@     got restricted __le32 static const [toplevel] [usertype] dwMaxBitRate @@
   drivers/usb/gadget/legacy/webcam.c:271:69: sparse:     expected unsigned int [usertype] dw_max_bit_rate
   drivers/usb/gadget/legacy/webcam.c:271:69: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMaxBitRate
   drivers/usb/gadget/legacy/webcam.c:272:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_max_video_frame_buffer_size @@     got restricted __le32 static const [toplevel] [usertype] dwMaxVideoFrameBufferSize @@
   drivers/usb/gadget/legacy/webcam.c:272:69: sparse:     expected unsigned int [usertype] dw_max_video_frame_buffer_size
   drivers/usb/gadget/legacy/webcam.c:272:69: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMaxVideoFrameBufferSize
   drivers/usb/gadget/legacy/webcam.c:273:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_default_frame_interval @@     got restricted __le32 static const [toplevel] [usertype] dwDefaultFrameInterval @@
   drivers/usb/gadget/legacy/webcam.c:273:69: sparse:     expected unsigned int [usertype] dw_default_frame_interval
   drivers/usb/gadget/legacy/webcam.c:273:69: sparse:     got restricted __le32 static const [toplevel] [usertype] dwDefaultFrameInterval
   drivers/usb/gadget/legacy/webcam.c:337:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] w_width @@     got restricted __le16 static const [toplevel] [usertype] wWidth @@
   drivers/usb/gadget/legacy/webcam.c:337:70: sparse:     expected unsigned short [usertype] w_width
   drivers/usb/gadget/legacy/webcam.c:337:70: sparse:     got restricted __le16 static const [toplevel] [usertype] wWidth
   drivers/usb/gadget/legacy/webcam.c:338:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] w_height @@     got restricted __le16 static const [toplevel] [usertype] wHeight @@
   drivers/usb/gadget/legacy/webcam.c:338:70: sparse:     expected unsigned short [usertype] w_height
   drivers/usb/gadget/legacy/webcam.c:338:70: sparse:     got restricted __le16 static const [toplevel] [usertype] wHeight
   drivers/usb/gadget/legacy/webcam.c:339:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_min_bit_rate @@     got restricted __le32 static const [toplevel] [usertype] dwMinBitRate @@
   drivers/usb/gadget/legacy/webcam.c:339:70: sparse:     expected unsigned int [usertype] dw_min_bit_rate
   drivers/usb/gadget/legacy/webcam.c:339:70: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMinBitRate
   drivers/usb/gadget/legacy/webcam.c:340:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_max_bit_rate @@     got restricted __le32 static const [toplevel] [usertype] dwMaxBitRate @@
   drivers/usb/gadget/legacy/webcam.c:340:70: sparse:     expected unsigned int [usertype] dw_max_bit_rate
   drivers/usb/gadget/legacy/webcam.c:340:70: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMaxBitRate
   drivers/usb/gadget/legacy/webcam.c:341:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_max_video_frame_buffer_size @@     got restricted __le32 static const [toplevel] [usertype] dwMaxVideoFrameBufferSize @@
   drivers/usb/gadget/legacy/webcam.c:341:70: sparse:     expected unsigned int [usertype] dw_max_video_frame_buffer_size
   drivers/usb/gadget/legacy/webcam.c:341:70: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMaxVideoFrameBufferSize
   drivers/usb/gadget/legacy/webcam.c:342:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_default_frame_interval @@     got restricted __le32 static const [toplevel] [usertype] dwDefaultFrameInterval @@
   drivers/usb/gadget/legacy/webcam.c:342:70: sparse:     expected unsigned int [usertype] dw_default_frame_interval
   drivers/usb/gadget/legacy/webcam.c:342:70: sparse:     got restricted __le32 static const [toplevel] [usertype] dwDefaultFrameInterval
   drivers/usb/gadget/legacy/webcam.c:376:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] w_width @@     got restricted __le16 static const [toplevel] [usertype] wWidth @@
   drivers/usb/gadget/legacy/webcam.c:376:70: sparse:     expected unsigned short [usertype] w_width
   drivers/usb/gadget/legacy/webcam.c:376:70: sparse:     got restricted __le16 static const [toplevel] [usertype] wWidth
   drivers/usb/gadget/legacy/webcam.c:377:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] w_height @@     got restricted __le16 static const [toplevel] [usertype] wHeight @@
   drivers/usb/gadget/legacy/webcam.c:377:70: sparse:     expected unsigned short [usertype] w_height
   drivers/usb/gadget/legacy/webcam.c:377:70: sparse:     got restricted __le16 static const [toplevel] [usertype] wHeight
   drivers/usb/gadget/legacy/webcam.c:378:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_min_bit_rate @@     got restricted __le32 static const [toplevel] [usertype] dwMinBitRate @@
   drivers/usb/gadget/legacy/webcam.c:378:70: sparse:     expected unsigned int [usertype] dw_min_bit_rate
   drivers/usb/gadget/legacy/webcam.c:378:70: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMinBitRate
   drivers/usb/gadget/legacy/webcam.c:379:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_max_bit_rate @@     got restricted __le32 static const [toplevel] [usertype] dwMaxBitRate @@
   drivers/usb/gadget/legacy/webcam.c:379:70: sparse:     expected unsigned int [usertype] dw_max_bit_rate
   drivers/usb/gadget/legacy/webcam.c:379:70: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMaxBitRate
   drivers/usb/gadget/legacy/webcam.c:380:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_max_video_frame_buffer_size @@     got restricted __le32 static const [toplevel] [usertype] dwMaxVideoFrameBufferSize @@
   drivers/usb/gadget/legacy/webcam.c:380:70: sparse:     expected unsigned int [usertype] dw_max_video_frame_buffer_size
   drivers/usb/gadget/legacy/webcam.c:380:70: sparse:     got restricted __le32 static const [toplevel] [usertype] dwMaxVideoFrameBufferSize
   drivers/usb/gadget/legacy/webcam.c:381:70: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dw_default_frame_interval @@     got restricted __le32 static const [toplevel] [usertype] dwDefaultFrameInterval @@
   drivers/usb/gadget/legacy/webcam.c:381:70: sparse:     expected unsigned int [usertype] dw_default_frame_interval
   drivers/usb/gadget/legacy/webcam.c:381:70: sparse:     got restricted __le32 static const [toplevel] [usertype] dwDefaultFrameInterval
   drivers/usb/gadget/legacy/webcam.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +229 drivers/usb/gadget/legacy/webcam.c

   220	
   221	static const struct uvcg_frame uvcg_frame_yuv_360p = {
   222		.fmt_type		= UVCG_UNCOMPRESSED,
   223		.frame = {
   224			.b_length			= uvc_frame_yuv_360p.bLength,
   225			.b_descriptor_type		= uvc_frame_yuv_360p.bDescriptorType,
   226			.b_descriptor_subtype		= uvc_frame_yuv_360p.bDescriptorSubType,
   227			.b_frame_index			= uvc_frame_yuv_360p.bFrameIndex,
   228			.bm_capabilities		= uvc_frame_yuv_360p.bmCapabilities,
 > 229			.w_width			= uvc_frame_yuv_360p.wWidth,
 > 230			.w_height			= uvc_frame_yuv_360p.wHeight,
 > 231			.dw_min_bit_rate		= uvc_frame_yuv_360p.dwMinBitRate,
 > 232			.dw_max_bit_rate		= uvc_frame_yuv_360p.dwMaxBitRate,
 > 233			.dw_max_video_frame_buffer_size	= uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize,
 > 234			.dw_default_frame_interval	= uvc_frame_yuv_360p.dwDefaultFrameInterval,
   235			.b_frame_interval_type		= uvc_frame_yuv_360p.bFrameIntervalType,
   236		},
   237		.dw_frame_interval	= (u32 *)uvc_frame_yuv_360p.dwFrameInterval,
   238	};
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

