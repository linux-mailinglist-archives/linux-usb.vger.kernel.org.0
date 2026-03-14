Return-Path: <linux-usb+bounces-34799-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCZcG2NvtWm/0QAAu9opvQ
	(envelope-from <linux-usb+bounces-34799-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 15:23:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B928D81B
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 15:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C203302D59C
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 14:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F5437881F;
	Sat, 14 Mar 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms/fE3hD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614E2459C5
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773498205; cv=none; b=go785qjrVScVSL6rPRUywT3WN89dEfgSd7kjnDQl45NO4V6pEXR1hBdHRjjrV5cwY3r2Fc3Bg2P7kKxDa7Ak0n2Jy5U3LDb6hzFnR64DJFgQg3aVkGCI6lNIGl0ujZTWRbqA6T8fIXH5v0OvWYQlwWH0r/IV54Tf9pRniJXOUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773498205; c=relaxed/simple;
	bh=o0Vul3rHe/czJALchV7ezL47RtS9e/n+NUEljySIE/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdONXS8ogyxLYJHrVEM4uKhwt00q5YU3xaf9RHbwVO1MekYN6v0aSuh5SgOCmPc+n5dcaRTcHIvg4UOX9lqefIChzGq8X56bUOHsyQEb76uYtw+U3frO8l9SIuYNwzbQFa7IFpD5Cc/NP5adSm95AfjBNMDkF1Jh0U45q790ubk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms/fE3hD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773498204; x=1805034204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o0Vul3rHe/czJALchV7ezL47RtS9e/n+NUEljySIE/I=;
  b=ms/fE3hDvdWv0o+oRb7wIL/b9y33r6GmgeMTflJ6ubeDUamZt/INYTu2
   vdyHZbBgNNuMMSPbBKJMBr01AaBx2OiGCuFfgwdUDjr5j1WHrG8ZKDqfC
   zGOUDkwdedBNEwProYXp5byDJx0tLgjevESrFk3wxIszjfW4TXpldQrPP
   uV3KlhZAt2IRLi8XPdhcIpQm+ZA9ooXt/OkiV/tg2z+E53AJvkwM284HE
   qf+BKMKyZBZbHk9109PW9lqe4fU4TepBnykBrDAXVW8u0AoeFgD6GjBsp
   Ib+4/Kq7+BL/X8TDzjF7mLlDVxdEk++2KhTglvzJ2v51VpdNXzSaE36qS
   Q==;
X-CSE-ConnectionGUID: OjkrSwE6QJaCWFaDkzBTCQ==
X-CSE-MsgGUID: Zw1CSQVBQWeSp7aCBTxTkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74285971"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74285971"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 07:23:24 -0700
X-CSE-ConnectionGUID: mLZy3ileRTa37ZnWIAqUAQ==
X-CSE-MsgGUID: 8lrTT6bWT0OuCelmti58ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="246505407"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2026 07:23:21 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1Ptf-000000003nh-229B;
	Sat, 14 Mar 2026 14:23:19 +0000
Date: Sat, 14 Mar 2026 15:22:58 +0100
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] usb: xhci: use BIT macro
Message-ID: <202603141541.J7d7NSVo-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34799-lists,linux-usb=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DD3B928D81B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v7.0-rc3 next-20260313]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/usb-xhci-use-BIT-macro/20260314-143843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260312150649.2138749-1-oneukum%40suse.com
patch subject: [PATCH] usb: xhci: use BIT macro
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260314/202603141541.J7d7NSVo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141541.J7d7NSVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141541.J7d7NSVo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci.c:25:
>> drivers/usb/host/xhci.h:2345:4: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
    2321 |                         (info & LAST_CTX_MASK) >> 27,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
   In file included from drivers/usb/early/xhci-dbc.c:26:
>> drivers/usb/early/../host/xhci.h:2345:4: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
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

