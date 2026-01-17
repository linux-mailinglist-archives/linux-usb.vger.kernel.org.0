Return-Path: <linux-usb+bounces-32449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C001D38D8A
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 10:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40A74301F7C0
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 09:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068A633508E;
	Sat, 17 Jan 2026 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDJNm6SQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D32D238F
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768643876; cv=none; b=ehat6Xf0qPo2wvywHK4dejVAnCW8+MLL/EV8TnzeXNLmbBwEQERl3djveypeIl7nNphwO1m8/tVx4rwm8ma2wCYsfvKd88JFWQaZ8rwlVNBBWXuQQeOioOPNqkDwo7ozEO3+OTU4V15aF0GfLvbG7ChKzT0N2waFjWCTRBdb1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768643876; c=relaxed/simple;
	bh=9d33CAOA2jberSNN424IucCTRv3DdHzTTiegCnuP0LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYY2qQE2pKD/+kveV8nADa4EgFWhBMJKgWAD7CT3Um4KnBXwekWhdOMuAWLSLJFfhvOal0bvaKwRXTqg9D/Y1iZyoBNdO8vZHnYJPb7hi/jeCNr8pTgNV2fYaVFRSIUdZF92ZRXI8mTUhTXonLllAFaysfVoWOx09UqfkAVF090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDJNm6SQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768643875; x=1800179875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9d33CAOA2jberSNN424IucCTRv3DdHzTTiegCnuP0LY=;
  b=ZDJNm6SQ4s/Jg/9Pv5O6GAHyJA/RuihX1YKrZfJMrN1CFMpslSCL87xy
   GC2XwK3DjGgXySF7DNWUllzKFPg/smfhurKCyKttFbRQz1Ew0LP+FtV+t
   zeLsyi3JAmmJTvg4y9kAIU1GtCrc6HlxE+6ccxzFSKuht0Mzgfx5sgYQI
   Fug5g/X1yi7mbYrpJMlH6M1bhyftaRI66nVVQJ0NQqezL1/yxi87Jr0qr
   pydoOrKWbfZVmiSID8UnL91GKtojM80YyrEOHupc50ot2GkoMrby+T8HX
   GGNkpuZ5vLAp/v8+SpEiGi9/RpsKBKEUwbVs9tF/yOTv7L4wTVwhsdSA8
   A==;
X-CSE-ConnectionGUID: I6tICzCSQZildF42zumyCQ==
X-CSE-MsgGUID: z4OTNFpeTzuelfaZXjOTyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69675349"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69675349"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 01:57:52 -0800
X-CSE-ConnectionGUID: pRsc6wiBRfm6q9vZYzzaLA==
X-CSE-MsgGUID: 6l+sN7kfQzqgb7/qDT0Ing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205724829"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2026 01:57:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh33z-00000000Lk0-25zJ;
	Sat, 17 Jan 2026 09:57:47 +0000
Date: Sat, 17 Jan 2026 17:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: raoxu <raoxu@uniontech.com>, mathias.nyman@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, raoxu@uniontech.com,
	zhanjun@uniontech.com, kenny@panix.com
Subject: Re: [PATCH v8] usb:xhci:route device to secondary interrupters
Message-ID: <202601171743.omq3DpnM-lkp@intel.com>
References: <E0F2AF44A50D04EB+20260116054611.4086487-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E0F2AF44A50D04EB+20260116054611.4086487-1-raoxu@uniontech.com>

Hi raoxu,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/raoxu/usb-xhci-route-device-to-secondary-interrupters/20260116-134911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/E0F2AF44A50D04EB%2B20260116054611.4086487-1-raoxu%40uniontech.com
patch subject: [PATCH v8] usb:xhci:route device to secondary interrupters
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260117/202601171743.omq3DpnM-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171743.omq3DpnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171743.omq3DpnM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xhci_msix_set_handler_data" [drivers/usb/host/xhci-pci.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

