Return-Path: <linux-usb+bounces-3996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055EE80DBF4
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 21:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6F0281B28
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 20:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5C45466C;
	Mon, 11 Dec 2023 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7WBCJWc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3743CD
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 12:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702327686; x=1733863686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Ec3jjJ0GmZERXndcFrL3GlDV7DejKmQ2N16/Vt5A/U=;
  b=S7WBCJWcQG7nng3nHrt7U05vW6RApu0ye+OQy92LQzSPdeo+JjnEq2KG
   S0ATDMrRv7w9g1VG3kahRjDdxJlPx2rqEF0RiALVOEbFk009rUuoYpEWC
   Z2+03h1PT2xTb7J/XwQ/uBbxbQa6SgnZOP/+9fpnbNaTwOkXYNX+Dvs7M
   Kk8i/SV4xR/IPZMpHBug3B0OV27qGw3D0ZRCC5/TpDed63VWmsFwVYM2q
   rpMSSJwcF+Sy3ubwvxjYS9cOXoUJjTqvop9LaPpvnL4JZZ6xnUUItTBv9
   u8vugTqT6n1QaHj8OizuqDJKlaE6Ur6CGWh66OZxHoq6uYKtiVTzwON/6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374215388"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="374215388"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 12:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104620209"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1104620209"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Dec 2023 12:48:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCnBd-000IT8-0Q;
	Mon, 11 Dec 2023 20:48:00 +0000
Date: Tue, 12 Dec 2023 04:47:27 +0800
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
Message-ID: <202312120426.lOtrWHIw-lkp@intel.com>
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
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231212/202312120426.lOtrWHIw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120426.lOtrWHIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120426.lOtrWHIw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/usb/gadget/legacy/webcam.c:9:
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:222:15: note: in expansion of macro 'le32_to_cpu'
     222 |         [0] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[0]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_360p_dw_frame_interval[0]')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:222:15: note: in expansion of macro 'le32_to_cpu'
     222 |         [0] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[0]),
         |               ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:223:15: note: in expansion of macro 'le32_to_cpu'
     223 |         [1] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[1]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_360p_dw_frame_interval[1]')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:223:15: note: in expansion of macro 'le32_to_cpu'
     223 |         [1] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[1]),
         |               ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:224:15: note: in expansion of macro 'le32_to_cpu'
     224 |         [2] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[2]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_360p_dw_frame_interval[2]')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:224:15: note: in expansion of macro 'le32_to_cpu'
     224 |         [2] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[2]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: error: initializer element is not constant
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:235:51: note: in expansion of macro 'le16_to_cpu'
     235 |                 .w_width                        = le16_to_cpu(uvc_frame_yuv_360p.wWidth),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: note: (near initialization for 'uvcg_frame_yuv_360p.frame.w_width')
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:235:51: note: in expansion of macro 'le16_to_cpu'
     235 |                 .w_width                        = le16_to_cpu(uvc_frame_yuv_360p.wWidth),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: error: initializer element is not constant
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:236:51: note: in expansion of macro 'le16_to_cpu'
     236 |                 .w_height                       = le16_to_cpu(uvc_frame_yuv_360p.wHeight),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: note: (near initialization for 'uvcg_frame_yuv_360p.frame.w_height')
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:236:51: note: in expansion of macro 'le16_to_cpu'
     236 |                 .w_height                       = le16_to_cpu(uvc_frame_yuv_360p.wHeight),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:237:51: note: in expansion of macro 'le32_to_cpu'
     237 |                 .dw_min_bit_rate                = le32_to_cpu(uvc_frame_yuv_360p.dwMinBitRate),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_min_bit_rate')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:237:51: note: in expansion of macro 'le32_to_cpu'
     237 |                 .dw_min_bit_rate                = le32_to_cpu(uvc_frame_yuv_360p.dwMinBitRate),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:238:51: note: in expansion of macro 'le32_to_cpu'
     238 |                 .dw_max_bit_rate                = le32_to_cpu(uvc_frame_yuv_360p.dwMaxBitRate),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_max_bit_rate')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:238:51: note: in expansion of macro 'le32_to_cpu'
     238 |                 .dw_max_bit_rate                = le32_to_cpu(uvc_frame_yuv_360p.dwMaxBitRate),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:239:51: note: in expansion of macro 'le32_to_cpu'
     239 |                 .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_max_video_frame_buffer_size')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:239:51: note: in expansion of macro 'le32_to_cpu'
     239 |                 .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:240:51: note: in expansion of macro 'le32_to_cpu'
     240 |                 .dw_default_frame_interval      = le32_to_cpu(uvc_frame_yuv_360p.dwDefaultFrameInterval),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_360p.frame.dw_default_frame_interval')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:240:51: note: in expansion of macro 'le32_to_cpu'
     240 |                 .dw_default_frame_interval      = le32_to_cpu(uvc_frame_yuv_360p.dwDefaultFrameInterval),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:267:15: note: in expansion of macro 'le32_to_cpu'
     267 |         [0] = le32_to_cpu(uvc_frame_yuv_720p.dwFrameInterval[0]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_720p_dw_frame_interval[0]')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:267:15: note: in expansion of macro 'le32_to_cpu'
     267 |         [0] = le32_to_cpu(uvc_frame_yuv_720p.dwFrameInterval[0]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: error: initializer element is not constant
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:278:51: note: in expansion of macro 'le16_to_cpu'
     278 |                 .w_width                        = le16_to_cpu(uvc_frame_yuv_720p.wWidth),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: note: (near initialization for 'uvcg_frame_yuv_720p.frame.w_width')
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:278:51: note: in expansion of macro 'le16_to_cpu'
     278 |                 .w_width                        = le16_to_cpu(uvc_frame_yuv_720p.wWidth),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: error: initializer element is not constant
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:279:51: note: in expansion of macro 'le16_to_cpu'
     279 |                 .w_height                       = le16_to_cpu(uvc_frame_yuv_720p.wHeight),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: note: (near initialization for 'uvcg_frame_yuv_720p.frame.w_height')
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:279:51: note: in expansion of macro 'le16_to_cpu'
     279 |                 .w_height                       = le16_to_cpu(uvc_frame_yuv_720p.wHeight),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:280:51: note: in expansion of macro 'le32_to_cpu'
     280 |                 .dw_min_bit_rate                = le32_to_cpu(uvc_frame_yuv_720p.dwMinBitRate),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_min_bit_rate')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:280:51: note: in expansion of macro 'le32_to_cpu'
     280 |                 .dw_min_bit_rate                = le32_to_cpu(uvc_frame_yuv_720p.dwMinBitRate),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:281:51: note: in expansion of macro 'le32_to_cpu'
     281 |                 .dw_max_bit_rate                = le32_to_cpu(uvc_frame_yuv_720p.dwMaxBitRate),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_max_bit_rate')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:281:51: note: in expansion of macro 'le32_to_cpu'
     281 |                 .dw_max_bit_rate                = le32_to_cpu(uvc_frame_yuv_720p.dwMaxBitRate),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:282:51: note: in expansion of macro 'le32_to_cpu'
     282 |                 .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_yuv_720p.dwMaxVideoFrameBufferSize),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_max_video_frame_buffer_size')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:282:51: note: in expansion of macro 'le32_to_cpu'
     282 |                 .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_yuv_720p.dwMaxVideoFrameBufferSize),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:283:51: note: in expansion of macro 'le32_to_cpu'
     283 |                 .dw_default_frame_interval      = le32_to_cpu(uvc_frame_yuv_720p.dwDefaultFrameInterval),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_yuv_720p.frame.dw_default_frame_interval')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:283:51: note: in expansion of macro 'le32_to_cpu'
     283 |                 .dw_default_frame_interval      = le32_to_cpu(uvc_frame_yuv_720p.dwDefaultFrameInterval),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:340:15: note: in expansion of macro 'le32_to_cpu'
     340 |         [0] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[0]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_360p_dw_frame_interval[0]')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:340:15: note: in expansion of macro 'le32_to_cpu'
     340 |         [0] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[0]),
         |               ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:341:15: note: in expansion of macro 'le32_to_cpu'
     341 |         [1] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[1]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_360p_dw_frame_interval[1]')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:341:15: note: in expansion of macro 'le32_to_cpu'
     341 |         [1] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[1]),
         |               ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:342:15: note: in expansion of macro 'le32_to_cpu'
     342 |         [2] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[2]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_360p_dw_frame_interval[2]')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:342:15: note: in expansion of macro 'le32_to_cpu'
     342 |         [2] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[2]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: error: initializer element is not constant
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:353:51: note: in expansion of macro 'le16_to_cpu'
     353 |                 .w_width                        = le16_to_cpu(uvc_frame_mjpg_360p.wWidth),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.w_width')
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:353:51: note: in expansion of macro 'le16_to_cpu'
     353 |                 .w_width                        = le16_to_cpu(uvc_frame_mjpg_360p.wWidth),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: error: initializer element is not constant
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:354:51: note: in expansion of macro 'le16_to_cpu'
     354 |                 .w_height                       = le16_to_cpu(uvc_frame_mjpg_360p.wHeight),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.w_height')
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:354:51: note: in expansion of macro 'le16_to_cpu'
     354 |                 .w_height                       = le16_to_cpu(uvc_frame_mjpg_360p.wHeight),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:355:51: note: in expansion of macro 'le32_to_cpu'
     355 |                 .dw_min_bit_rate                = le32_to_cpu(uvc_frame_mjpg_360p.dwMinBitRate),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.dw_min_bit_rate')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:355:51: note: in expansion of macro 'le32_to_cpu'
     355 |                 .dw_min_bit_rate                = le32_to_cpu(uvc_frame_mjpg_360p.dwMinBitRate),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:356:51: note: in expansion of macro 'le32_to_cpu'
     356 |                 .dw_max_bit_rate                = le32_to_cpu(uvc_frame_mjpg_360p.dwMaxBitRate),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.dw_max_bit_rate')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:356:51: note: in expansion of macro 'le32_to_cpu'
     356 |                 .dw_max_bit_rate                = le32_to_cpu(uvc_frame_mjpg_360p.dwMaxBitRate),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:357:51: note: in expansion of macro 'le32_to_cpu'
     357 |                 .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_mjpg_360p.dwMaxVideoFrameBufferSize),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.dw_max_video_frame_buffer_size')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:357:51: note: in expansion of macro 'le32_to_cpu'
     357 |                 .dw_max_video_frame_buffer_size = le32_to_cpu(uvc_frame_mjpg_360p.dwMaxVideoFrameBufferSize),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:358:51: note: in expansion of macro 'le32_to_cpu'
     358 |                 .dw_default_frame_interval      = le32_to_cpu(uvc_frame_mjpg_360p.dwDefaultFrameInterval),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_360p.frame.dw_default_frame_interval')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:358:51: note: in expansion of macro 'le32_to_cpu'
     358 |                 .dw_default_frame_interval      = le32_to_cpu(uvc_frame_mjpg_360p.dwDefaultFrameInterval),
         |                                                   ^~~~~~~~~~~
>> include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:385:15: note: in expansion of macro 'le32_to_cpu'
     385 |         [0] = le32_to_cpu(uvc_frame_mjpg_720p.dwFrameInterval[0]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_720p_dw_frame_interval[0]')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:385:15: note: in expansion of macro 'le32_to_cpu'
     385 |         [0] = le32_to_cpu(uvc_frame_mjpg_720p.dwFrameInterval[0]),
         |               ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: error: initializer element is not constant
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:396:51: note: in expansion of macro 'le16_to_cpu'
     396 |                 .w_width                        = le16_to_cpu(uvc_frame_mjpg_720p.wWidth),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.w_width')
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:396:51: note: in expansion of macro 'le16_to_cpu'
     396 |                 .w_width                        = le16_to_cpu(uvc_frame_mjpg_720p.wWidth),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: error: initializer element is not constant
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:397:51: note: in expansion of macro 'le16_to_cpu'
     397 |                 .w_height                       = le16_to_cpu(uvc_frame_mjpg_720p.wHeight),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:105:9: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.w_height')
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:397:51: note: in expansion of macro 'le16_to_cpu'
     397 |                 .w_height                       = le16_to_cpu(uvc_frame_mjpg_720p.wHeight),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:398:51: note: in expansion of macro 'le32_to_cpu'
     398 |                 .dw_min_bit_rate                = le32_to_cpu(uvc_frame_mjpg_720p.dwMinBitRate),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: note: (near initialization for 'uvcg_frame_mjpeg_720p.frame.dw_min_bit_rate')
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/usb/gadget/legacy/webcam.c:398:51: note: in expansion of macro 'le32_to_cpu'
     398 |                 .dw_min_bit_rate                = le32_to_cpu(uvc_frame_mjpg_720p.dwMinBitRate),
         |                                                   ^~~~~~~~~~~
   include/uapi/linux/swab.h:118:9: error: initializer element is not constant
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |         ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))


vim +118 include/uapi/linux/swab.h

607ca46e97a1b6 David Howells 2012-10-13  109  
607ca46e97a1b6 David Howells 2012-10-13  110  /**
607ca46e97a1b6 David Howells 2012-10-13  111   * __swab32 - return a byteswapped 32-bit value
607ca46e97a1b6 David Howells 2012-10-13  112   * @x: value to byteswap
607ca46e97a1b6 David Howells 2012-10-13  113   */
7322dd755e7dd3 Arnd Bergmann 2016-05-05  114  #ifdef __HAVE_BUILTIN_BSWAP32__
7322dd755e7dd3 Arnd Bergmann 2016-05-05  115  #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
7322dd755e7dd3 Arnd Bergmann 2016-05-05  116  #else
607ca46e97a1b6 David Howells 2012-10-13  117  #define __swab32(x)				\
d30dfd490f7dc4 Justin Stitt  2022-06-08 @118  	(__u32)(__builtin_constant_p(x) ?	\
607ca46e97a1b6 David Howells 2012-10-13  119  	___constant_swab32(x) :			\
607ca46e97a1b6 David Howells 2012-10-13  120  	__fswab32(x))
7322dd755e7dd3 Arnd Bergmann 2016-05-05  121  #endif
607ca46e97a1b6 David Howells 2012-10-13  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

