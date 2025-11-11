Return-Path: <linux-usb+bounces-30316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D734C4B9D9
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 07:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2AF91895B30
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 06:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0608329BD82;
	Tue, 11 Nov 2025 06:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dj3iK51U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D529B228
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 06:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762841454; cv=none; b=WZUkVa135eSZ5nj5grUocPjf9Eb8ozsU35CX0i+XG9/qTMWHwdiNSFeCfC5EqTrHM+sGNv+9DfcB6onhC/c9EY9V+i1xBw3eKqpiNk2mMDQV1gs6k+94BZ+supoSK0knJLIY6TmGGoMcsFtWbJcLutSqqJ+OYUaQC8ZuKJSlnIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762841454; c=relaxed/simple;
	bh=tWdO3Bd9f43yfta2nQOfgV9zen03nu4zs0+wVkAJ7QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKSxU29dPqaaArXqwfDPbJymblWKyYHXZBzsVPf21OjnokDhjZJ+X/V/N7pU82CDXsF1FmoukgRPkYdlMoXB7z2YNPfN2tgSsK2Txc9FOqgFRh8dAhl5b7P/OGFnUxTgKAFPu/Er6XIz/bvU/WfDNPaQDWaV4n/2tU2XXPrLPcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dj3iK51U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762841453; x=1794377453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tWdO3Bd9f43yfta2nQOfgV9zen03nu4zs0+wVkAJ7QA=;
  b=Dj3iK51U1uKX6h1OQZUuGxsrrFI80RKd4VBSKATcnb7wWymVszl27BX3
   60g1d01sh/xewlMzi/tlkjEb2SePM5XMg2RWbVh3mTpDF/ZRNOqefFoOy
   1NDIYs4EgfUMgf5ZXx2BbsZCCORi7t5lSOeXRoeyDsT2/9Cv42NXFMZCs
   2gLcNiDCl9BF9Anio8rw5B/TtFQZ7l7lw10PgSE5olH051RqrEPyCg0vJ
   6DptP8AV6r23bcYjPFHqHOeuyDVk5V4xQMjW9fwl4BYBZkiTN7hLG4IxA
   uTlYDJiFeel+B2RFRch/qsnt7mF0QpZGGHJjnbvLIITjHcHvshqXOk8pS
   Q==;
X-CSE-ConnectionGUID: 4B4NlBo9SXO4tcpqu04rfQ==
X-CSE-MsgGUID: 9YmvMSdlRYSMNm8MYqaiuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63902409"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="63902409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 22:10:52 -0800
X-CSE-ConnectionGUID: 6U2fAP2nTsOj/F5g6mz8LQ==
X-CSE-MsgGUID: E+u9HCxlR7aTXrxgRWlNgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="219529430"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 22:10:51 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIhaa-0002p9-12;
	Tue, 11 Nov 2025 06:10:48 +0000
Date: Tue, 11 Nov 2025 14:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 12/13] usb: xhci: standardize multi bit-field macros
Message-ID: <202511111300.UAbLCfdg-lkp@intel.com>
References: <20251110151450.635410-13-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110151450.635410-13-niklas.neronin@linux.intel.com>

Hi Niklas,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus tegra/for-next westeri-thunderbolt/next linus/master v6.18-rc5 next-20251110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Neronin/usb-xhci-remove-deprecated-TODO-comment/20251110-233045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20251110151450.635410-13-niklas.neronin%40linux.intel.com
patch subject: [PATCH 12/13] usb: xhci: standardize multi bit-field macros
config: loongarch-randconfig-002-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111300.UAbLCfdg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111300.UAbLCfdg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111300.UAbLCfdg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/loongarch/include/asm/bug.h:61,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from drivers/usb/dwc3/host.c:10:
   drivers/usb/dwc3/host.c: In function 'dwc3_power_off_all_roothub_ports':
>> include/linux/bits.h:47:9: error: called object is not a function or function pointer
      47 |         ((t)(GENMASK_INPUT_CHECK(h, l) +                        \
         |         ^
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/usb/dwc3/../host/xhci-caps.h:12:33: note: in expansion of macro 'GENMASK'
      12 | #define HC_LENGTH               GENMASK(7, 0)
         |                                 ^~~~~~~
   drivers/usb/dwc3/host.c:49:32: note: in expansion of macro 'HC_LENGTH'
      49 |                 op_regs_base = HC_LENGTH(readl(xhci_regs));
         |                                ^~~~~~~~~
>> include/linux/bits.h:47:9: error: called object is not a function or function pointer
      47 |         ((t)(GENMASK_INPUT_CHECK(h, l) +                        \
         |         ^
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/usb/dwc3/../host/xhci-caps.h:24:33: note: in expansion of macro 'GENMASK'
      24 | #define HCS_MAX_PORTS           GENMASK(31, 24)
         |                                 ^~~~~~~
   drivers/usb/dwc3/host.c:51:28: note: in expansion of macro 'HCS_MAX_PORTS'
      51 |                 port_num = HCS_MAX_PORTS(reg);
         |                            ^~~~~~~~~~~~~


vim +47 include/linux/bits.h

31299a5e021124 Vincent Mailhol 2025-03-26  35  
19408200c09485 Vincent Mailhol 2025-03-26  36  /*
19408200c09485 Vincent Mailhol 2025-03-26  37   * Generate a mask for the specified type @t. Additional checks are made to
19408200c09485 Vincent Mailhol 2025-03-26  38   * guarantee the value returned fits in that type, relying on
19408200c09485 Vincent Mailhol 2025-03-26  39   * -Wshift-count-overflow compiler check to detect incompatible arguments.
19408200c09485 Vincent Mailhol 2025-03-26  40   * For example, all these create build errors or warnings:
19408200c09485 Vincent Mailhol 2025-03-26  41   *
19408200c09485 Vincent Mailhol 2025-03-26  42   * - GENMASK(15, 20): wrong argument order
19408200c09485 Vincent Mailhol 2025-03-26  43   * - GENMASK(72, 15): doesn't fit unsigned long
19408200c09485 Vincent Mailhol 2025-03-26  44   * - GENMASK_U32(33, 15): doesn't fit in a u32
19408200c09485 Vincent Mailhol 2025-03-26  45   */
19408200c09485 Vincent Mailhol 2025-03-26  46  #define GENMASK_TYPE(t, h, l)					\
19408200c09485 Vincent Mailhol 2025-03-26 @47  	((t)(GENMASK_INPUT_CHECK(h, l) +			\
19408200c09485 Vincent Mailhol 2025-03-26  48  	     (type_max(t) << (l) &				\
19408200c09485 Vincent Mailhol 2025-03-26  49  	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
19408200c09485 Vincent Mailhol 2025-03-26  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

