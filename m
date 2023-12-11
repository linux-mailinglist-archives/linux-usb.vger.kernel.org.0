Return-Path: <linux-usb+bounces-3997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA4C80DD99
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 22:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6A42825BB
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 21:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD0C54FB8;
	Mon, 11 Dec 2023 21:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPhas3rM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906D5C4
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 13:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702331659; x=1733867659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mx1RYxwfRPLEiJxj48FPucrep7GtgUWb3PeAgRx38JE=;
  b=ZPhas3rMDs3IqdLK3bPe6Hj0XOtkVEKy9bBjnWEsYlrlrMgT6CphIa0U
   Se5DKC5lEP9hMHdYKp9CJvNr7PuhO8fHcH3WovHw2tBM9MVM/X6mjYHFS
   Nm2Gug/Y6jvECfMV5c40NnafaHXSoYGNEVuw4t83jk+6fTcOuV/O23NRX
   mghWF28SYhJh0Oh1IIPiXu0h3kuPJtUrO7zI6R1BmpQ26Lejw2z6FP/Hq
   prlY/78BPzrTHzE9Cku/mVM9z9oHGRDIEQaVPE0IdCDu25M5ah4pPEQ8K
   Jhb8JzI9vjVN7TiiTguMfxFRRQj1WHjP+GEv8eR7P0jL7utvZfvSE6TuT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1554858"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1554858"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 13:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1020414877"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1020414877"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Dec 2023 13:54:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCoE1-000IVc-04;
	Mon, 11 Dec 2023 21:54:05 +0000
Date: Tue, 12 Dec 2023 05:53:12 +0800
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
Subject: Re: [PATCH v3] usb: gadget: webcam: Make g_webcam loadable again
Message-ID: <202312120517.4yhTyhYY-lkp@intel.com>
References: <20231211123819.76648-1-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211123819.76648-1-andrzej.p@collabora.com>

Hi Andrzej,

kernel test robot noticed the following build errors:

[auto build test ERROR on 33cc938e65a98f1d29d0a18403dbbee050dcad9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrzej-Pietrasiewicz/usb-gadget-webcam-Make-g_webcam-loadable-again/20231211-204453
base:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
patch link:    https://lore.kernel.org/r/20231211123819.76648-1-andrzej.p%40collabora.com
patch subject: [PATCH v3] usb: gadget: webcam: Make g_webcam loadable again
config: i386-randconfig-003-20231212 (https://download.01.org/0day-ci/archive/20231212/202312120517.4yhTyhYY-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120517.4yhTyhYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120517.4yhTyhYY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:436,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:222:8: note: in expansion of macro 'le32_to_cpu'
     [0] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[0]),
           ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_360p_dw_frame_interval[0]')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:222:8: note: in expansion of macro 'le32_to_cpu'
     [0] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[0]),
           ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:223:8: note: in expansion of macro 'le32_to_cpu'
     [1] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[1]),
           ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_360p_dw_frame_interval[1]')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:223:8: note: in expansion of macro 'le32_to_cpu'
     [1] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[1]),
           ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:224:8: note: in expansion of macro 'le32_to_cpu'
     [2] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[2]),
           ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_360p_dw_frame_interval[2]')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:224:8: note: in expansion of macro 'le32_to_cpu'
     [2] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[2]),
           ^~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:230:17: error: initializer element is not constant
      .b_length   = uvc_frame_yuv_360p.bLength,
                    ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:230:17: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_length')
   drivers/usb/gadget/legacy/webcam.c:231:25: error: initializer element is not constant
      .b_descriptor_type  = uvc_frame_yuv_360p.bDescriptorType,
                            ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:231:25: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_descriptor_type')
   drivers/usb/gadget/legacy/webcam.c:232:28: error: initializer element is not constant
      .b_descriptor_subtype  = uvc_frame_yuv_360p.bDescriptorSubType,
                               ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:232:28: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_descriptor_subtype')
   drivers/usb/gadget/legacy/webcam.c:233:22: error: initializer element is not constant
      .b_frame_index   = uvc_frame_yuv_360p.bFrameIndex,
                         ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:233:22: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_frame_index')
   drivers/usb/gadget/legacy/webcam.c:234:23: error: initializer element is not constant
      .bm_capabilities  = uvc_frame_yuv_360p.bmCapabilities,
                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:234:23: note: (near initialization for 'uvcg_frame_yuv_360p.frame.bm_capabilities')
   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:436,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
   include/uapi/linux/byteorder/little_endian.h:37:26: error: initializer element is not constant
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:235:16: note: in expansion of macro 'le16_to_cpu'
      .w_width   = le16_to_cpu(uvc_frame_yuv_360p.wWidth),
                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: note: (near initialization for 'uvcg_frame_yuv_360p.frame.w_width')
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:235:16: note: in expansion of macro 'le16_to_cpu'
      .w_width   = le16_to_cpu(uvc_frame_yuv_360p.wWidth),
                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: error: initializer element is not constant
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:236:17: note: in expansion of macro 'le16_to_cpu'
      .w_height   = le16_to_cpu(uvc_frame_yuv_360p.wHeight),
                    ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: note: (near initialization for 'uvcg_frame_yuv_360p.frame.w_height')
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:236:17: note: in expansion of macro 'le16_to_cpu'
      .w_height   = le16_to_cpu(uvc_frame_yuv_360p.wHeight),
                    ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:237:23: note: in expansion of macro 'le32_to_cpu'
      .dw_min_bit_rate  = le32_to_cpu(uvc_frame_yuv_360p.dwMinBitRate),
                          ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_min_bit_rate')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:237:23: note: in expansion of macro 'le32_to_cpu'
      .dw_min_bit_rate  = le32_to_cpu(uvc_frame_yuv_360p.dwMinBitRate),
                          ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:238:23: note: in expansion of macro 'le32_to_cpu'
      .dw_max_bit_rate  = le32_to_cpu(uvc_frame_yuv_360p.dwMaxBitRate),
                          ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_max_bit_rate')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:238:23: note: in expansion of macro 'le32_to_cpu'
      .dw_max_bit_rate  = le32_to_cpu(uvc_frame_yuv_360p.dwMaxBitRate),
                          ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:239:37: note: in expansion of macro 'le32_to_cpu'
      .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize),
                                        ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_max_video_frame_buffer_size')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:239:37: note: in expansion of macro 'le32_to_cpu'
      .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize),
                                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:240:32: note: in expansion of macro 'le32_to_cpu'
      .dw_default_frame_interval = le32_to_cpu(uvc_frame_yuv_360p.dwDefaultFrameInterval),
                                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_default_frame_interval')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:240:32: note: in expansion of macro 'le32_to_cpu'
      .dw_default_frame_interval = le32_to_cpu(uvc_frame_yuv_360p.dwDefaultFrameInterval),
                                   ^~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:241:29: error: initializer element is not constant
      .b_frame_interval_type  = uvc_frame_yuv_360p.bFrameIntervalType,
                                ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:241:29: note: (near initialization for 'uvcg_frame_yuv_360p.frame.b_frame_interval_type')
   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:436,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:267:8: note: in expansion of macro 'le32_to_cpu'
     [0] = le32_to_cpu(uvc_frame_yuv_720p.dwFrameInterval[0]),
           ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_720p_dw_frame_interval[0]')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:267:8: note: in expansion of macro 'le32_to_cpu'
     [0] = le32_to_cpu(uvc_frame_yuv_720p.dwFrameInterval[0]),
           ^~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:273:17: error: initializer element is not constant
      .b_length   = uvc_frame_yuv_720p.bLength,
                    ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:273:17: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_length')
   drivers/usb/gadget/legacy/webcam.c:274:25: error: initializer element is not constant
      .b_descriptor_type  = uvc_frame_yuv_720p.bDescriptorType,
                            ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:274:25: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_descriptor_type')
   drivers/usb/gadget/legacy/webcam.c:275:28: error: initializer element is not constant
      .b_descriptor_subtype  = uvc_frame_yuv_720p.bDescriptorSubType,
                               ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:275:28: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_descriptor_subtype')
   drivers/usb/gadget/legacy/webcam.c:276:22: error: initializer element is not constant
      .b_frame_index   = uvc_frame_yuv_720p.bFrameIndex,
                         ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:276:22: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_frame_index')
   drivers/usb/gadget/legacy/webcam.c:277:23: error: initializer element is not constant
      .bm_capabilities  = uvc_frame_yuv_720p.bmCapabilities,
                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:277:23: note: (near initialization for 'uvcg_frame_yuv_720p.frame.bm_capabilities')
   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:436,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
   include/uapi/linux/byteorder/little_endian.h:37:26: error: initializer element is not constant
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:278:16: note: in expansion of macro 'le16_to_cpu'
      .w_width   = le16_to_cpu(uvc_frame_yuv_720p.wWidth),
                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: note: (near initialization for 'uvcg_frame_yuv_720p.frame.w_width')
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:278:16: note: in expansion of macro 'le16_to_cpu'
      .w_width   = le16_to_cpu(uvc_frame_yuv_720p.wWidth),
                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: error: initializer element is not constant
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:279:17: note: in expansion of macro 'le16_to_cpu'
      .w_height   = le16_to_cpu(uvc_frame_yuv_720p.wHeight),
                    ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: note: (near initialization for 'uvcg_frame_yuv_720p.frame.w_height')
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:279:17: note: in expansion of macro 'le16_to_cpu'
      .w_height   = le16_to_cpu(uvc_frame_yuv_720p.wHeight),
                    ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:280:23: note: in expansion of macro 'le32_to_cpu'
      .dw_min_bit_rate  = le32_to_cpu(uvc_frame_yuv_720p.dwMinBitRate),
                          ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_min_bit_rate')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:280:23: note: in expansion of macro 'le32_to_cpu'
      .dw_min_bit_rate  = le32_to_cpu(uvc_frame_yuv_720p.dwMinBitRate),
                          ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:281:23: note: in expansion of macro 'le32_to_cpu'
      .dw_max_bit_rate  = le32_to_cpu(uvc_frame_yuv_720p.dwMaxBitRate),
                          ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_max_bit_rate')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:281:23: note: in expansion of macro 'le32_to_cpu'
      .dw_max_bit_rate  = le32_to_cpu(uvc_frame_yuv_720p.dwMaxBitRate),
                          ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:282:37: note: in expansion of macro 'le32_to_cpu'
      .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_yuv_720p.dwMaxVideoFrameBufferSize),
                                        ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_max_video_frame_buffer_size')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:282:37: note: in expansion of macro 'le32_to_cpu'
      .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_yuv_720p.dwMaxVideoFrameBufferSize),
                                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:283:32: note: in expansion of macro 'le32_to_cpu'
      .dw_default_frame_interval = le32_to_cpu(uvc_frame_yuv_720p.dwDefaultFrameInterval),
                                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_default_frame_interval')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:283:32: note: in expansion of macro 'le32_to_cpu'
      .dw_default_frame_interval = le32_to_cpu(uvc_frame_yuv_720p.dwDefaultFrameInterval),
                                   ^~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:284:29: error: initializer element is not constant
      .b_frame_interval_type  = uvc_frame_yuv_720p.bFrameIntervalType,
                                ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:284:29: note: (near initialization for 'uvcg_frame_yuv_720p.frame.b_frame_interval_type')
   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:436,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:340:8: note: in expansion of macro 'le32_to_cpu'
     [0] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[0]),
           ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_360p_dw_frame_interval[0]')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:340:8: note: in expansion of macro 'le32_to_cpu'
     [0] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[0]),
           ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:341:8: note: in expansion of macro 'le32_to_cpu'
     [1] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[1]),
           ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_360p_dw_frame_interval[1]')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:341:8: note: in expansion of macro 'le32_to_cpu'
     [1] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[1]),
           ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:342:8: note: in expansion of macro 'le32_to_cpu'
     [2] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[2]),
           ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_360p_dw_frame_interval[2]')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:342:8: note: in expansion of macro 'le32_to_cpu'
     [2] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[2]),
           ^~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:348:17: error: initializer element is not constant
      .b_length   = uvc_frame_mjpg_360p.bLength,
                    ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:348:17: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.b_length')
   drivers/usb/gadget/legacy/webcam.c:349:25: error: initializer element is not constant
      .b_descriptor_type  = uvc_frame_mjpg_360p.bDescriptorType,
                            ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:349:25: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.b_descriptor_type')
   drivers/usb/gadget/legacy/webcam.c:350:28: error: initializer element is not constant
      .b_descriptor_subtype  = uvc_frame_mjpg_360p.bDescriptorSubType,
                               ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:350:28: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.b_descriptor_subtype')
   drivers/usb/gadget/legacy/webcam.c:351:22: error: initializer element is not constant
      .b_frame_index   = uvc_frame_mjpg_360p.bFrameIndex,
                         ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:351:22: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.b_frame_index')
   drivers/usb/gadget/legacy/webcam.c:352:23: error: initializer element is not constant
      .bm_capabilities  = uvc_frame_mjpg_360p.bmCapabilities,
                          ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:352:23: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.bm_capabilities')
   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:436,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
   include/uapi/linux/byteorder/little_endian.h:37:26: error: initializer element is not constant
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:353:16: note: in expansion of macro 'le16_to_cpu'
      .w_width   = le16_to_cpu(uvc_frame_mjpg_360p.wWidth),
                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.w_width')
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:353:16: note: in expansion of macro 'le16_to_cpu'
      .w_width   = le16_to_cpu(uvc_frame_mjpg_360p.wWidth),
                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: error: initializer element is not constant
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:354:17: note: in expansion of macro 'le16_to_cpu'
      .w_height   = le16_to_cpu(uvc_frame_mjpg_360p.wHeight),
                    ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.w_height')
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:354:17: note: in expansion of macro 'le16_to_cpu'
      .w_height   = le16_to_cpu(uvc_frame_mjpg_360p.wHeight),
                    ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:355:23: note: in expansion of macro 'le32_to_cpu'
      .dw_min_bit_rate  = le32_to_cpu(uvc_frame_mjpg_360p.dwMinBitRate),
                          ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.dw_min_bit_rate')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:355:23: note: in expansion of macro 'le32_to_cpu'
      .dw_min_bit_rate  = le32_to_cpu(uvc_frame_mjpg_360p.dwMinBitRate),
                          ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:356:23: note: in expansion of macro 'le32_to_cpu'
      .dw_max_bit_rate  = le32_to_cpu(uvc_frame_mjpg_360p.dwMaxBitRate),
                          ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.dw_max_bit_rate')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:356:23: note: in expansion of macro 'le32_to_cpu'
      .dw_max_bit_rate  = le32_to_cpu(uvc_frame_mjpg_360p.dwMaxBitRate),
                          ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:357:37: note: in expansion of macro 'le32_to_cpu'
      .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_mjpg_360p.dwMaxVideoFrameBufferSize),
                                        ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.dw_max_video_frame_buffer_size')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:357:37: note: in expansion of macro 'le32_to_cpu'
      .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_mjpg_360p.dwMaxVideoFrameBufferSize),
                                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:358:32: note: in expansion of macro 'le32_to_cpu'
      .dw_default_frame_interval = le32_to_cpu(uvc_frame_mjpg_360p.dwDefaultFrameInterval),
                                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.dw_default_frame_interval')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:358:32: note: in expansion of macro 'le32_to_cpu'
      .dw_default_frame_interval = le32_to_cpu(uvc_frame_mjpg_360p.dwDefaultFrameInterval),
                                   ^~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:359:29: error: initializer element is not constant
      .b_frame_interval_type  = uvc_frame_mjpg_360p.bFrameIntervalType,
                                ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:359:29: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.b_frame_interval_type')
   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:436,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
>> include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:385:8: note: in expansion of macro 'le32_to_cpu'
     [0] = le32_to_cpu(uvc_frame_mjpg_720p.dwFrameInterval[0]),
           ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_720p_dw_frame_interval[0]')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:385:8: note: in expansion of macro 'le32_to_cpu'
     [0] = le32_to_cpu(uvc_frame_mjpg_720p.dwFrameInterval[0]),
           ^~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:391:17: error: initializer element is not constant
      .b_length   = uvc_frame_mjpg_720p.bLength,
                    ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:391:17: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.b_length')
   drivers/usb/gadget/legacy/webcam.c:392:25: error: initializer element is not constant
      .b_descriptor_type  = uvc_frame_mjpg_720p.bDescriptorType,
                            ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:392:25: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.b_descriptor_type')
   drivers/usb/gadget/legacy/webcam.c:393:28: error: initializer element is not constant
      .b_descriptor_subtype  = uvc_frame_mjpg_720p.bDescriptorSubType,
                               ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:393:28: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.b_descriptor_subtype')
   drivers/usb/gadget/legacy/webcam.c:394:22: error: initializer element is not constant
      .b_frame_index   = uvc_frame_mjpg_720p.bFrameIndex,
                         ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:394:22: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.b_frame_index')
   drivers/usb/gadget/legacy/webcam.c:395:23: error: initializer element is not constant
      .bm_capabilities  = uvc_frame_mjpg_720p.bmCapabilities,
                          ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:395:23: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.bm_capabilities')
   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:436,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
   include/uapi/linux/byteorder/little_endian.h:37:26: error: initializer element is not constant
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:396:16: note: in expansion of macro 'le16_to_cpu'
      .w_width   = le16_to_cpu(uvc_frame_mjpg_720p.wWidth),
                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.w_width')
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:396:16: note: in expansion of macro 'le16_to_cpu'
      .w_width   = le16_to_cpu(uvc_frame_mjpg_720p.wWidth),
                   ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: error: initializer element is not constant
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:397:17: note: in expansion of macro 'le16_to_cpu'
      .w_height   = le16_to_cpu(uvc_frame_mjpg_720p.wHeight),
                    ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:26: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.w_height')
    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                             ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:397:17: note: in expansion of macro 'le16_to_cpu'
      .w_height   = le16_to_cpu(uvc_frame_mjpg_720p.wHeight),
                    ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:398:23: note: in expansion of macro 'le32_to_cpu'
      .dw_min_bit_rate  = le32_to_cpu(uvc_frame_mjpg_720p.dwMinBitRate),
                          ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.dw_min_bit_rate')
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
    #define le32_to_cpu __le32_to_cpu
                        ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:398:23: note: in expansion of macro 'le32_to_cpu'
      .dw_min_bit_rate  = le32_to_cpu(uvc_frame_mjpg_720p.dwMinBitRate),
                          ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:26: error: initializer element is not constant
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))


vim +35 include/uapi/linux/byteorder/little_endian.h

5921e6f8809b16 David Howells 2012-10-13  15  
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_htonl(x) ((__force __be32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_ntohl(x) ___constant_swab32((__force __be32)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_htons(x) ((__force __be16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_ntohs(x) ___constant_swab16((__force __be16)(x))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_cpu_to_le16(x) ((__force __le16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_le16_to_cpu(x) ((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  31  #define __constant_be16_to_cpu(x) ___constant_swab16((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  32  #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  33  #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  34  #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13 @35  #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  39  #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  43  #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

