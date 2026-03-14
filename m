Return-Path: <linux-usb+bounces-34800-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BVq1Iv5xtWlr0gAAu9opvQ
	(envelope-from <linux-usb+bounces-34800-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 15:34:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E671628D84E
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 15:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD749302DB76
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 14:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A5F4204E;
	Sat, 14 Mar 2026 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3JekrBA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4D1DF271
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773498867; cv=none; b=F70HbER/wlalSoR/EYpvoT9n5K+gpsVgHmj98Mvc1YxTnxvaJZ8Qr/XvCzlHSk0vog1C/VCm32UHW2Aoij5DFK2u/EL4xeEK4Pj9ge1qPPwFKoT/Mc1Uwp8/3lktaI8EdzDbxph8IuLtoAPg4jzn5jrCif8Ck97y/yXNXNr8qCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773498867; c=relaxed/simple;
	bh=i+5F0X4GdMf0hoHxC/NMH3qX+G/5Z3OYrDb/IE2ew7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjLDHkj8KA4iKCWIp0g27C3u7tOhu4LtkoqpfavXZnzUUBS355XvEt/EElr5a1Pp+7tUhugdlg+V69EYgDeJdqLulR/t8e4LBDpnKrn6DLPhu0rZC+5WFqJ+fYcweZ0FUHE5plaXuNLhC8b014VqVg3tAlNFEpGQz4hcjb0Lkdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3JekrBA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773498865; x=1805034865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i+5F0X4GdMf0hoHxC/NMH3qX+G/5Z3OYrDb/IE2ew7o=;
  b=A3JekrBATfzeoEkN/T3bEN1XxWVbVZgnVnh8MZkGaqLJ7YW7OA1ZqGCi
   waDzOKUtjz2uMOQGxuMHz0c71YnnniVEF4f4HRhmwoREcoe4bsxHtBpLA
   Xroty2Xb6p1TkksBl6ai7pWQqUyd/Zek39HsFsNf8oGKEM0WXZzfNHoiX
   ywreyMww/PcJqWR5hHP9YxGj65VF5DXHOfZ74zu6DeHnBvNjmrOqH/OLR
   uIejrTbWNGQw/ueJyQIFeBvm8TKe5814LI6FcSBg6eawfEzvpMwTEQX9P
   CzOoOyqe+gV3F4j2SM8HaFe148r/tRt0/1xRgMAQ1qq7qNc/mIaiI64sz
   Q==;
X-CSE-ConnectionGUID: nV0I/O+pSQivquBCYNocQg==
X-CSE-MsgGUID: siWVzS5PTXeUrvPyFepZhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74698856"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74698856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 07:34:24 -0700
X-CSE-ConnectionGUID: qZeezkm0RVymfnk+noLZDg==
X-CSE-MsgGUID: rnkCghDgRjm+jZLCmehZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="220505586"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Mar 2026 07:34:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1Q4J-000000003nt-2ieg;
	Sat, 14 Mar 2026 14:34:19 +0000
Date: Sat, 14 Mar 2026 15:33:27 +0100
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] usb: xhci: use BIT macro
Message-ID: <202603141518.Qeu41mKO-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34800-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: E671628D84E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus next-20260313]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/usb-xhci-use-BIT-macro/20260314-143843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260312150649.2138749-1-oneukum%40suse.com
patch subject: [PATCH] usb: xhci: use BIT macro
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260314/202603141518.Qeu41mKO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141518.Qeu41mKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141518.Qeu41mKO-lkp@intel.com/

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

