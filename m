Return-Path: <linux-usb+bounces-33944-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJeQM/Lmp2mDlgAAu9opvQ
	(envelope-from <linux-usb+bounces-33944-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:01:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B141FC1AC
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D620301953B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 08:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD9F3822BA;
	Wed,  4 Mar 2026 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lD/IM4u8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E0F3659F8;
	Wed,  4 Mar 2026 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611290; cv=none; b=JcVoRUBlkGuYSjzmYlxYIT1PNV6v6vtQMuIKAnlO2dL3SnxMW+km0vdyonuRc3Is1XiROR5EZdL1hvsa5I5XxbNx1Xn6NtsJj9G33eoTvkOEvVOIcG3Rzp42r/XwAx2ldCTOnbkZwFSD0jPF3IKjIN/nXw9fETsSPx+IAH4m3lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611290; c=relaxed/simple;
	bh=l09YXOulxifypgPtgBIgCgzZD3gkUGpkmoES/xGSwy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQxK21jn7p/xd5H/lHso/VjS75rTLVLjHgkHznShkd24PvuMX4J24aUNaF1tCTMVQXdzw5NBaj+mn3yxyZCYvtOLr4wdI6jlDijSjEl0Z8ruJ3UrE8xK48ApsibBXbB7h0fH++QKpx9m4Ztrxjs0mqW2JqGAqtr6R2mRz8OJ6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lD/IM4u8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772611289; x=1804147289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l09YXOulxifypgPtgBIgCgzZD3gkUGpkmoES/xGSwy0=;
  b=lD/IM4u8tAiubAK4azI7sKGVwLzqysVR4/BSAqiZnunZEfC+5x8GIosm
   NOngX1s8tA1THb2Smduj8YrgsiOHtelEGWjH5zL5rZejHx2eNITKaqtcE
   kqSPrQz/tICk98VCUBDXAAzKfRqvDqxww+jLoHMZLIXTkLZmqn3WchGkT
   4cy5GzD686KU7XI0Ki6AGXpSGx7Pwi3aLeGAjFT76pWcJcD5a8TQpzFJr
   v2fX0hUd9oOut5NvP+C68kJjmknWYDrOciTm3Zl137glwynjr9PKX9cef
   Lr1Us7TMkTS4LGfSg4aBWj9V3rBQbXRLZpgPzfc46qT2hVmIML3wDKFpC
   Q==;
X-CSE-ConnectionGUID: QkxxczTRSE61Iy2y5nI1DQ==
X-CSE-MsgGUID: 5arpQp1sS5ywg0bMfSRafw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73538094"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73538094"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 00:01:28 -0800
X-CSE-ConnectionGUID: f09qkhuuTwOM2gsePLypug==
X-CSE-MsgGUID: ACEgKz6LSgurbfjwmO8T9Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2026 00:01:27 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxhAa-000000001eD-2DxC;
	Wed, 04 Mar 2026 08:01:24 +0000
Date: Wed, 4 Mar 2026 09:01:03 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Adamenko <marusik.adamenko@gmail.com>, linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: Re: [PATCH] usb: core: remove unnecessary goto in
 usb_create_newid_files()
Message-ID: <202603040835.L3sNN4Lh-lkp@intel.com>
References: <20260304033418.49357-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304033418.49357-1-marusik.adamenko@gmail.com>
X-Rspamd-Queue-Id: 32B141FC1AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33944-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Action: no action

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.0-rc2 next-20260303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Adamenko/usb-core-remove-unnecessary-goto-in-usb_create_newid_files/20260304-113844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260304033418.49357-1-marusik.adamenko%40gmail.com
patch subject: [PATCH] usb: core: remove unnecessary goto in usb_create_newid_files()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260304/202603040835.L3sNN4Lh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040835.L3sNN4Lh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040835.L3sNN4Lh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/core/driver.c:202:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     202 | }
         | ^
   1 warning generated.


vim +202 drivers/usb/core/driver.c

0c7a2b72746a96 CHENG Renquan      2009-11-22  183  
ed283e9f0a2cc0 Alan Stern         2012-01-24  184  static int usb_create_newid_files(struct usb_driver *usb_drv)
733260ff9c45bd Greg Kroah-Hartman 2005-11-16  185  {
733260ff9c45bd Greg Kroah-Hartman 2005-11-16  186  	int error = 0;
733260ff9c45bd Greg Kroah-Hartman 2005-11-16  187  
ba9dc657af86d0 Greg Kroah-Hartman 2005-11-16  188  	if (usb_drv->no_dynamic_id)
5523ca85805b3e Mark Adamenko      2026-03-03  189  		return error;
ba9dc657af86d0 Greg Kroah-Hartman 2005-11-16  190  
ed283e9f0a2cc0 Alan Stern         2012-01-24  191  	if (usb_drv->probe != NULL) {
49a78b05d5ca1e Yajun Deng         2024-01-04  192  		error = driver_create_file(&usb_drv->driver,
15147ffd57576f Greg Kroah-Hartman 2007-11-28  193  					   &driver_attr_new_id);
ed283e9f0a2cc0 Alan Stern         2012-01-24  194  		if (error == 0) {
49a78b05d5ca1e Yajun Deng         2024-01-04  195  			error = driver_create_file(&usb_drv->driver,
ed283e9f0a2cc0 Alan Stern         2012-01-24  196  					&driver_attr_remove_id);
ed283e9f0a2cc0 Alan Stern         2012-01-24  197  			if (error)
49a78b05d5ca1e Yajun Deng         2024-01-04  198  				driver_remove_file(&usb_drv->driver,
ed283e9f0a2cc0 Alan Stern         2012-01-24  199  						&driver_attr_new_id);
ed283e9f0a2cc0 Alan Stern         2012-01-24  200  		}
ed283e9f0a2cc0 Alan Stern         2012-01-24  201  	}
733260ff9c45bd Greg Kroah-Hartman 2005-11-16 @202  }
733260ff9c45bd Greg Kroah-Hartman 2005-11-16  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

