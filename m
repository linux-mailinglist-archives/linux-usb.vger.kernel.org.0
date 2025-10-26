Return-Path: <linux-usb+bounces-29658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17675C0A1DD
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 03:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D21E3A7D0F
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 02:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133F822B8C5;
	Sun, 26 Oct 2025 02:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTNuKuMh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84EB20C001
	for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 02:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761446002; cv=none; b=rxd5nIC+S8hS/i7o4vMOkVYGqoU/UBdWvhb/m0cwJfuIpxlbjrqjcnxtoSl/QTchWCnLsYxhvSoAX4680Lwn2ZkRaem4Dg09R5rrC7ZGZ9Omp80o8DLkjanaVQKqfGr5CPqXa4YvjVSKRYPow1kWUS+mNqAL73FPZG1E5ZZRXoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761446002; c=relaxed/simple;
	bh=fC1spCueI/1r0IiSbW1ZLyWt4ygH9ax+maonPvZY2Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bujONGP55ouqnfxiFysepQfLb6CYPTA7zmALTCsbqa2/yMWNLmAmqcDIhGMD2mUGa5WgOR1FOG2iwOAAnEbjsFfHt7jwGx/TDNS1Sps/Lj8B3DEzUnwPcMZOrTLn11ICdWv4Dk4sK+sE6iw8V5kyVNrwdyCjmMCgF2mbsqdkYyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTNuKuMh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761446001; x=1792982001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fC1spCueI/1r0IiSbW1ZLyWt4ygH9ax+maonPvZY2Ek=;
  b=kTNuKuMh69O+51udY1WXsHx5kEwzMjwmLjf9C6GaQE5F27/AEIEr0N//
   X+rospy2Nj/Ra4CguJXScRaoWaBz3d4whNTTLe5y+pn2USVfajqx3McpB
   t1tt2nIWmYzMhYnzbsemhV7Gh7K7/yF9vs3wJazCNz6YsA6E07ibs4TdM
   C86/+NBbP5vOKDeDD41zLYRc2bJhnQUzSztNk+I73D52wzx1d1wVJEe7W
   5Vz57g5c36xIbrbA4bFRVPKYV9Chth5Jy3gkEK3C5F7a8aJDvAVqkgV5C
   36d76iCDE/z8IIE1/o9rqueeciVa8pS/upE7JvRakZ8atBhe0QVYIyrxa
   Q==;
X-CSE-ConnectionGUID: BYlGuCzbQFiUfElWibltkg==
X-CSE-MsgGUID: xHSq79MlQTOPlWvTLIZ9hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74247479"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="74247479"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 19:33:20 -0700
X-CSE-ConnectionGUID: ZtCiQpUJTfWSS+IAbW9Fpw==
X-CSE-MsgGUID: BrqiEr+bS4+3HHtqqCOAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="189122670"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Oct 2025 19:33:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCqZI-000Fp7-1d;
	Sun, 26 Oct 2025 02:33:16 +0000
Date: Sun, 26 Oct 2025 10:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, migo.oravec@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFT PATCH] usb: early: xhci-dbc: Try smaller early_ioremap size
 if original size fails
Message-ID: <202510261010.UvV0M6f5-lkp@intel.com>
References: <20251024154157.40800-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024154157.40800-1-mathias.nyman@linux.intel.com>

Hi Mathias,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathias-Nyman/usb-early-xhci-dbc-Try-smaller-early_ioremap-size-if-original-size-fails/20251024-234429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20251024154157.40800-1-mathias.nyman%40linux.intel.com
patch subject: [RFT PATCH] usb: early: xhci-dbc: Try smaller early_ioremap size if original size fails
config: i386-randconfig-004-20251026 (https://download.01.org/0day-ci/archive/20251026/202510261010.UvV0M6f5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261010.UvV0M6f5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261010.UvV0M6f5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/early/xhci-dbc.c:665:55: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     665 |                                 pr_warn("Bad DbC offset 0x%x, max 0x%lx", offset, xdbc.xhci_length);
         |                                                                     ~~~           ^~~~~~~~~~~~~~~~
         |                                                                     %zx
   include/linux/printk.h:565:37: note: expanded from macro 'pr_warn'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +665 drivers/usb/early/xhci-dbc.c

   610	
   611	int __init early_xdbc_parse_parameter(char *s, int keep_early)
   612	{
   613		unsigned long dbgp_num = 0;
   614		u32 bus, dev, func, offset = 0;
   615		u32 val;
   616		char *e;
   617		int ret;
   618	
   619		if (!early_pci_allowed())
   620			return -EPERM;
   621	
   622		early_console_keep = keep_early;
   623	
   624		if (xdbc.xdbc_reg)
   625			return 0;
   626	
   627		if (*s) {
   628		       dbgp_num = simple_strtoul(s, &e, 10);
   629		       if (s == e)
   630			       dbgp_num = 0;
   631		}
   632	
   633		pr_notice("dbgp_num: %lu\n", dbgp_num);
   634	
   635		/* Locate the host controller: */
   636		ret = xdbc_find_dbgp(dbgp_num, &bus, &dev, &func);
   637		if (ret) {
   638			pr_notice("failed to locate xhci host\n");
   639			return -ENODEV;
   640		}
   641	
   642		xdbc.vendor	= read_pci_config_16(bus, dev, func, PCI_VENDOR_ID);
   643		xdbc.device	= read_pci_config_16(bus, dev, func, PCI_DEVICE_ID);
   644		xdbc.bus	= bus;
   645		xdbc.dev	= dev;
   646		xdbc.func	= func;
   647	
   648		/* Map the IO memory: */
   649		xdbc.xhci_base = xdbc_map_pci_mmio(bus, dev, func);
   650		if (!xdbc.xhci_base)
   651			return -EINVAL;
   652	
   653		/* Locate DbC registers: */
   654		if (xdbc.xhci_length == xdbc.xhci_orig_length) {
   655			offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
   656		} else {
   657			/*
   658			 * Mapped mmio size cut short from what xhci needs.
   659			 * Check if this dBc capability is withing the new cut size.
   660			 * DbC capability needs 64 bytes from its capabilty offset.
   661			 */
   662			do {
   663				offset = xhci_find_next_ext_cap(xdbc.xhci_base, offset, 0);
   664				if (!offset || (offset + 64 >= xdbc.xhci_length)) {
 > 665					pr_warn("Bad DbC offset 0x%x, max 0x%lx", offset, xdbc.xhci_length);
   666					offset = 0;
   667					break;
   668				}
   669				pr_warn("Looking for DbC capability at offset 0x%x", offset);
   670				val = readl(xdbc.xhci_base + offset);
   671			} while (XHCI_EXT_CAPS_ID(val) != XHCI_EXT_CAPS_DEBUG);
   672		}
   673	
   674		if (!offset) {
   675			pr_warn("xhci host doesn't support debug capability\n");
   676			early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
   677			xdbc.xhci_base = NULL;
   678			xdbc.xhci_length = 0;
   679	
   680			return -ENODEV;
   681		}
   682		pr_warn("DbC capability found at offset 0x%x", offset);
   683	
   684		xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
   685	
   686		return 0;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

