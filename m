Return-Path: <linux-usb+bounces-35746-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAJuAvdFzGm+RgYAu9opvQ
	(envelope-from <linux-usb+bounces-35746-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 00:08:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1133724FE
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 00:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46ABF30143F1
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 22:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3AC45BD7B;
	Tue, 31 Mar 2026 22:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTvF7VaV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590243E95B4
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994932; cv=none; b=qFUky8NGTrLsaN4q0x1Gs6deeM7obmC1WWI9OQhhtKkaubJYUdf6yUG+2e38IKlJb71wPydOiRCB20+tByhZ2EqG6ppTqoRG9QDSJXAJk+ozW8ms/QDp2aet7L+0eeiURm6YGRTw5WW62eh4lmznDK2vIWpaRY1loIHDVS+Qfqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994932; c=relaxed/simple;
	bh=zK9zUD5uzq1VcBYKOgMyvNkCuXxfcS51dZ/NleWPfM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ompgFi+wiMHmvELXEji0ul5pTbqCkYzvYn796b1D+BgBAvOXt+QEJaI37fIfo1Ttg7q91Zt63/W86U30uYCXMDKz17SI316i9yyzkVghOvp37brQumnNf394JnN0J7PU9UwdYOHahaxGsX3QlO+btZs4nnzlhTZhEJzCSWkdDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTvF7VaV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774994930; x=1806530930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zK9zUD5uzq1VcBYKOgMyvNkCuXxfcS51dZ/NleWPfM4=;
  b=VTvF7VaV+tCKJpCm7A1M8x3aggBFCJur532kG4Vo9A/689C+xbAZqoqx
   fQ0yW5DkT0Ojhc+B25arHVelVwJzGp3PNd9h9M3yqkrDplaSM4d8YLXGs
   NaR5gOeyupgRvYU/BNxkpmPzYzMr4cNU/BDvcfboX7aLLKyOeyPTDuDph
   Rw1kUqd4WZNhMUQVvCHD8MycYNB4ii1z3oVASp+8e1Jexz5nWVt9/hZt0
   V+n/KWM+Qn3heE9As34QoY7pXhUFgPnb1aahp9ZDND058m4Bk0UfKCatu
   QvST3JA5Tcw9+cz2TLw9Zg8QfHAlQsRKWRqacSwSZBOe/WWAfw4g+bm41
   Q==;
X-CSE-ConnectionGUID: HkLqVWhIQPGX9NvFwhjixg==
X-CSE-MsgGUID: 9psLvMRwQdy4a/PK1rLh+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93417538"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="93417538"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 15:08:50 -0700
X-CSE-ConnectionGUID: PLIi6lHgTPm2/kZ3ZQ83Kg==
X-CSE-MsgGUID: 7SzXoGxzTw+NK/M5aVgYwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="222095554"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2026 15:08:48 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7hGP-000000004LD-0rg9;
	Tue, 31 Mar 2026 22:08:45 +0000
Date: Wed, 1 Apr 2026 06:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] usb: xhci: use BIT macro
Message-ID: <202604010611.oXcU3y6m-lkp@intel.com>
References: <20260312150649.2138749-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312150649.2138749-1-oneukum@suse.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-35746-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 7B1133724FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/usb-xhci-use-BIT-macro/20260314-143843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260312150649.2138749-1-oneukum%40suse.com
patch subject: [PATCH] usb: xhci: use BIT macro
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010611.oXcU3y6m-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010611.oXcU3y6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010611.oXcU3y6m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci.c:25:
>> drivers/usb/host/xhci.h:2345:4: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
    2321 |                         (info & LAST_CTX_MASK) >> 27,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
   In file included from drivers/usb/cdns3/host.c:18:
>> drivers/usb/cdns3/../host/xhci.h:2345:4: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
    2321 |                         (info & LAST_CTX_MASK) >> 27,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2345 drivers/usb/host/xhci.h

90d6d5731da79a Mathias Nyman 2019-04-26  2308  
4843b4b5ec64b8 Mathias Nyman 2021-08-20  2309  static inline const char *xhci_decode_slot_context(char *str,
4843b4b5ec64b8 Mathias Nyman 2021-08-20  2310  		u32 info, u32 info2, u32 tt_info, u32 state)
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2311  {
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2312  	u32 speed;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2313  	u32 hub;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2314  	u32 mtt;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2315  	int ret = 0;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2316  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2317  	speed = info & DEV_SPEED;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2318  	hub = info & DEV_HUB;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2319  	mtt = info & DEV_MTT;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2320  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2321  	ret = sprintf(str, "RS %05x %s%s%s Ctx Entries %d MEL %d us Port# %d/%d",
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2322  			info & ROUTE_STRING_MASK,
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2323  			({ char *s;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2324  			switch (speed) {
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2325  			case SLOT_SPEED_FS:
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2326  				s = "full-speed";
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2327  				break;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2328  			case SLOT_SPEED_LS:
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2329  				s = "low-speed";
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2330  				break;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2331  			case SLOT_SPEED_HS:
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2332  				s = "high-speed";
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2333  				break;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2334  			case SLOT_SPEED_SS:
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2335  				s = "super-speed";
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2336  				break;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2337  			case SLOT_SPEED_SSP:
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2338  				s = "super-speed plus";
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2339  				break;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2340  			default:
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2341  				s = "UNKNOWN speed";
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2342  			} s; }),
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2343  			mtt ? " multi-TT" : "",
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2344  			hub ? " Hub" : "",
19a7d0d65c4a81 Felipe Balbi  2017-04-07 @2345  			(info & LAST_CTX_MASK) >> 27,
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2346  			info2 & MAX_EXIT,
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2347  			DEVINFO_TO_ROOT_HUB_PORT(info2),
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2348  			DEVINFO_TO_MAX_PORTS(info2));
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2349  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2350  	ret += sprintf(str + ret, " [TT Slot %d Port# %d TTT %d Intr %d] Addr %d State %s",
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2351  			tt_info & TT_SLOT, (tt_info & TT_PORT) >> 8,
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2352  			GET_TT_THINK_TIME(tt_info), GET_INTR_TARGET(tt_info),
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2353  			state & DEV_ADDR_MASK,
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2354  			xhci_slot_state_string(GET_SLOT_STATE(state)));
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2355  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2356  	return str;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2357  }
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2358  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

