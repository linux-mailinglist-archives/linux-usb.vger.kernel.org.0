Return-Path: <linux-usb+bounces-28411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31128B8CC96
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 18:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9A51B23F41
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 16:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFB02FFDC1;
	Sat, 20 Sep 2025 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZDB/MiC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFEE2F7AA1
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758385223; cv=none; b=BSA+yMCQl0eJSgaIqTBeX33cVtSW/SxFCQ+QaB6Fr2tqinUyH2BaD2pngkmlMY/wCyKdMfDSzNrNnBfLErCq4BtPHkhZj4O3m97Df6sXZZ2/1VLtffGDq28MU8F4f4HugeVudydiVEjX+EOITkVO2XodnHgV9hsPeiHV/OxQkTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758385223; c=relaxed/simple;
	bh=tmDhVGySrzTPb7qxXaJVjc3X0b34wNhGQFXxiYXSQs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4I7FHr1cnT0ohJjx33Kudz87aj7MWoQjVEHo9ZBlAOYW6kjbxQZqnT2AFiHRdjUGbHmyKQrsyzFOWPwyOWgDZ8IGys6Pf79mwbfNYiQWmPdNpNBNmlY7DZIo89X+FcYaXTVF4qwxPVAW+F7LhlF1sbhEgEZXxCWbPgeN/0OoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZDB/MiC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758385222; x=1789921222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tmDhVGySrzTPb7qxXaJVjc3X0b34wNhGQFXxiYXSQs8=;
  b=aZDB/MiCnpkAyBBOr2Fc1+HzAH5Cx2MCZ3TTISdQKoM/38atTDxWBu86
   CPbDFlBZzydC9I5tgqLO83AjWoQ+c1qapHQlGplVr9NM4M2VDccmTh04F
   3m1SF2BDtyuAvKvNrXtLBg7ZBi07tKcqxvCAYHN+OFelbZ5aigfhh+bhz
   uPnu3AZVJQghWfSiMnAt1FEeuOl0jRDa6e4UPl1vsU0HMac3MJyXJBe9/
   D5BNhzFxp4OcTAspZhjtjGeJuej1NRh5VdiGocWeekcQkbofNO8rKA2Mz
   evi1Ulwhi5QiGiIWn363TEUODj6gDwEDcjdRZpye3Oc1Rx2LKkrL9XGUi
   g==;
X-CSE-ConnectionGUID: AlGY2VP4SI+2v5YgXBbr7w==
X-CSE-MsgGUID: N20Bef6uT/uMvCx2SBDG2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="72136080"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="72136080"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 09:20:21 -0700
X-CSE-ConnectionGUID: L1zjDzA5St20Mj11PKoPCA==
X-CSE-MsgGUID: v+QynPI/T2Gcbu893Khi7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="176146560"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Sep 2025 09:20:20 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v00Jt-0005W7-0r;
	Sat, 20 Sep 2025 16:20:17 +0000
Date: Sun, 21 Sep 2025 00:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH v2 5/8] usb: xhci: add PORTSC read function
Message-ID: <202509210017.WFJqvNsz-lkp@intel.com>
References: <20250917125850.3380560-6-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917125850.3380560-6-niklas.neronin@linux.intel.com>

Hi Niklas,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-linus]
[also build test ERROR on tegra/for-next westeri-thunderbolt/next linus/master v6.17-rc6]
[cannot apply to usb/usb-testing usb/usb-next next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Neronin/usb-xhci-correct-indentation-for-PORTSC-tracing-function/20250917-211828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
patch link:    https://lore.kernel.org/r/20250917125850.3380560-6-niklas.neronin%40linux.intel.com
patch subject: [PATCH v2 5/8] usb: xhci: add PORTSC read function
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250921/202509210017.WFJqvNsz-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509210017.WFJqvNsz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509210017.WFJqvNsz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xhci_get_portsc" [drivers/usb/host/xhci-pci.ko] undefined!
ERROR: modpost: "xhci_set_portsc" [drivers/usb/host/xhci-pci.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

