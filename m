Return-Path: <linux-usb+bounces-35732-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHD4IlPay2k2MAYAu9opvQ
	(envelope-from <linux-usb+bounces-35732-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 16:29:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507F36AF77
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 16:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4641E31549EC
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 14:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE4F3ED5A9;
	Tue, 31 Mar 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjoZvDLI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD443DFC69
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966965; cv=none; b=sseLxYO/qzsofvEYNSexKqms1MESqR7mnN/hYCgkAF5xmkAKMU4IYcm+SRkPzXNF0B1TEoy+JWWS1lEx5Ixye4T9cnJFxMnN8DcQgNE9da2G1oKWoRQSlqj6eCtUuZnSDUkLjFxfxjv4x/Lr+CTlELaAWB1VDEhnG/ZxREagz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966965; c=relaxed/simple;
	bh=2wVXg0YhxcSWzldECi3WqZ9XLDeBtugpJGC12C7e/Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qY1Kk2CIcarauonnSsSGKGmaBN2iX3smjf9wc/6ishFaMQsRAtoQPR+YJiuMvwP+8KoWJwmaodvHCo3osc77fxKtKIuL3mVJJErZ+qYzqtzE1m9z5SuSuprQgnq11lnCEj/kCgElNVMDZn3EOTaenWx7T/I92MIOxQBNGMccu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjoZvDLI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774966964; x=1806502964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2wVXg0YhxcSWzldECi3WqZ9XLDeBtugpJGC12C7e/Ng=;
  b=LjoZvDLIocnFifIPYrihUjY8btJoB7N+xN7CTmpzrF4o678EjM2UUbU6
   hhWddhWtdQ+dZTLbspw17TEtZ7BhAtado1BuYAe9Zfjt3ZeuO3GnUWLGG
   dXFXBSilewWP2RbNOHJ+2YLM/TuyTR3AKJ9+ve7a57B8Mcm88VV4+PKbq
   xOFA3m4p4Teq/PCr2Cr8RYdjuBrjcAEB3SVpsTh2+dPFEiy61v/35SnU1
   37LetaYA9WuMbqaHEjwZcSTIA1qBhT3Zvgqz9iH6d+rpxXiWntdR+/S03
   lP32fgBoL9xhDdkven6TsuWZNqlA/b9e6ggxxuW6McpGyFWgSsiaBXAa8
   Q==;
X-CSE-ConnectionGUID: /LNxH+q4QnWRQidezzfJQw==
X-CSE-MsgGUID: Yfemh3pVQ/emhDdhxbywpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76172929"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76172929"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:22:44 -0700
X-CSE-ConnectionGUID: KYMIUNp4S2eWldhW2MWt1w==
X-CSE-MsgGUID: C96qvNeTS/Sg0sVM3BE1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223078703"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2026 07:22:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ZzK-000000002l1-34Ea;
	Tue, 31 Mar 2026 14:22:38 +0000
Date: Tue, 31 Mar 2026 22:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] usb: xhci: use BIT macro
Message-ID: <202603312226.4Rkqoq6u-lkp@intel.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35732-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,git-scm.com:url,01.org:url]
X-Rspamd-Queue-Id: 0507F36AF77
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603312226.4Rkqoq6u-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312226.4Rkqoq6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312226.4Rkqoq6u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci.c:25:
   drivers/usb/host/xhci.h: In function 'xhci_decode_slot_context':
>> drivers/usb/host/xhci.h:2321:57: warning: format '%d' expects argument of type 'int', but argument 7 has type 'long unsigned int' [-Wformat=]
    2321 |         ret = sprintf(str, "RS %05x %s%s%s Ctx Entries %d MEL %d us Port# %d/%d",
         |                                                        ~^
         |                                                         |
         |                                                         int
         |                                                        %ld
   ......
    2345 |                         (info & LAST_CTX_MASK) >> 27,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
         |                                                |
         |                                                long unsigned int
--
   In file included from drivers/usb/cdns3/host.c:18:
   drivers/usb/cdns3/../host/xhci.h: In function 'xhci_decode_slot_context':
>> drivers/usb/cdns3/../host/xhci.h:2321:57: warning: format '%d' expects argument of type 'int', but argument 7 has type 'long unsigned int' [-Wformat=]
    2321 |         ret = sprintf(str, "RS %05x %s%s%s Ctx Entries %d MEL %d us Port# %d/%d",
         |                                                        ~^
         |                                                         |
         |                                                         int
         |                                                        %ld
   ......
    2345 |                         (info & LAST_CTX_MASK) >> 27,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
         |                                                |
         |                                                long unsigned int


vim +2321 drivers/usb/host/xhci.h

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
19a7d0d65c4a81 Felipe Balbi  2017-04-07 @2321  	ret = sprintf(str, "RS %05x %s%s%s Ctx Entries %d MEL %d us Port# %d/%d",
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
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2345  			(info & LAST_CTX_MASK) >> 27,
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

