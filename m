Return-Path: <linux-usb+bounces-1935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F57D032D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 22:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ABF21C20C8B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 20:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB87238DFC;
	Thu, 19 Oct 2023 20:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlHRTyqc"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D4E3DFF6
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 20:32:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E16116;
	Thu, 19 Oct 2023 13:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697747552; x=1729283552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OSAcALiopd2/KG7f+4neIMz5XaB38UH5mNVjgH1UBNY=;
  b=TlHRTyqcq6mO0wrRGR6bDidxdaQg7FhT9uMQ9vJ93xpVOF3QWWbs5qDD
   Wt2b9T3vhn1x3acerxcjoaX8ls6P59HGtVwwXPFjfHB+iVh/VePj193Ic
   qENgSH+urelXZ+ViYFdSome0pLfDmfoPZm8rzv7X//Y05vcIXfa3jE8uv
   GO/TSo5unsgZsEI4P7jYJTliFVlaiwy2yzDB0GRw0lGZfm+aqxLt4GT9+
   9qHCShelVBHMuPTcQW61ODFNEeb3oa5rD7qqzU2NsUR4Pg3YmUFMTQlDk
   KWSyxrq0uqmbkqLhxJj1Mwt39/4z1h0xIbTkPGSW/QymLRiqOUA1Fnu2J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366595946"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="366595946"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 13:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="827476366"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="827476366"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2023 13:32:29 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtZgx-0002ZV-0f;
	Thu, 19 Oct 2023 20:32:27 +0000
Date: Fri, 20 Oct 2023 04:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Avichal Rakesh <arakesh@google.com>, dan.scally@ideasonboard.com,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	m.grzeschik@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, etalvala@google.com,
	jchowdhary@google.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 4/4] usb: gadget: uvc: Fix use-after-free for inflight
 usb_requests
Message-ID: <202310200457.GwPPFuHX-lkp@intel.com>
References: <20231019185319.2714000-5-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019185319.2714000-5-arakesh@google.com>

Hi Avichal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.6-rc6 next-20231019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Avichal-Rakesh/usb-gadget-uvc-prevent-use-of-disabled-endpoint/20231020-025512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231019185319.2714000-5-arakesh%40google.com
patch subject: [PATCH v6 4/4] usb: gadget: uvc: Fix use-after-free for inflight usb_requests
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200457.GwPPFuHX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200457.GwPPFuHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200457.GwPPFuHX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/uvc_video.c:231: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Must be called with req_lock held as it modifies the list ureq is held in


vim +231 drivers/usb/gadget/function/uvc_video.c

   225	
   226	/* --------------------------------------------------------------------------
   227	 * Request handling
   228	 */
   229	
   230	/**
 > 231	 * Must be called with req_lock held as it modifies the list ureq is held in
   232	 */
   233	static void
   234	uvc_video_free_request(struct uvc_request *ureq, struct usb_ep *ep)
   235	{
   236		sg_free_table(&ureq->sgt);
   237		if (ureq->req && ep) {
   238			usb_ep_free_request(ep, ureq->req);
   239			ureq->req = NULL;
   240		}
   241	
   242		kfree(ureq->req_buffer);
   243		ureq->req_buffer = NULL;
   244	
   245		if (!list_empty(&ureq->list))
   246			list_del_init(&ureq->list);
   247	
   248		kfree(ureq);
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

