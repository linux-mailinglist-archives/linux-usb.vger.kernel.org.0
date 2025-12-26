Return-Path: <linux-usb+bounces-31769-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B19CDE670
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 08:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4761A300789B
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 07:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DD9218ADD;
	Fri, 26 Dec 2025 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bltLYqhF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C494C6D
	for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766732644; cv=none; b=mrUFo70ssALbMTaQ9QpRh3vE+VYKMg6Sbqg5+sx62gFUDmxvbs9KONoMhQ81s0abC5KcYQRXM3saREHyyGTE7XBMdUebeHd6sFhLwWds7YAd5CjqwFVbcv0pi6VXOCiWWT0UHbk6NWAwPOhTws37O1HpDKJKxZkaCBdPIh/HP04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766732644; c=relaxed/simple;
	bh=CO0ZQBO9B3Osu+iICAMntoQDeK3svOqsZ1Nmdz2mnJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNnZAC6nKvf6tO4r3LmJNCuwBkUjidZpJqNPTP7aWE5nKG9USz4bPoWF/zUW0BGR1YqLNiD6xQn38PpIQfunth8OzfU/4y+O+yasgrLfQfJWhANQshOCT66f3SyDMoA48Frwh7silq7e2N+j4OS66JZTUo9McfJSgsSiA5sKbUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bltLYqhF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766732643; x=1798268643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CO0ZQBO9B3Osu+iICAMntoQDeK3svOqsZ1Nmdz2mnJY=;
  b=bltLYqhFkqSJxdPDpcCOTOJU2FhsPPXv68j9539zsw1QmFwQmsjisOo/
   LfeBlgP6G7Vp7e2QEQoqAf9pucuiElSHADsTxzbkob9iMhMaKmBtVyXIo
   z6UP8mDUePVPO81IXYHlHScSVgTRgczdk0Fr20nNzYNUQ74+o0yQrMUAG
   ZmEV0YjovtrcVarWfuCmx94nKNQGS7iLZwHwfNxTkWy5wIUJ4k12ZOju/
   c//rBSvKRptoBQsCtCVNEh101XpfZjFHPRvE6Fav58TeuxFIhYRH/Fl5w
   NlavP31lQA4/ijhEK4kGzvqsSV/3D+TZ9OV8fAjpxVcASDqDDZUxydSsI
   g==;
X-CSE-ConnectionGUID: ELnEPXP+TRuF0/5Hq6ppHg==
X-CSE-MsgGUID: WwF+pca7SByauv0WHRrLHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68572437"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68572437"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 23:04:02 -0800
X-CSE-ConnectionGUID: vIe4gbZwTWmYV+vbn2ywMw==
X-CSE-MsgGUID: 9n12lWHgQoiq7eO+tnlQWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="199578807"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Dec 2025 23:03:57 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ1re-000000004pR-1irn;
	Fri, 26 Dec 2025 07:03:54 +0000
Date: Fri, 26 Dec 2025 15:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: raoxu <raoxu@uniontech.com>, mathias.nyman@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, raoxu@uniontech.com,
	zhanjun@uniontech.com, kenny@panix.com
Subject: Re: [PATCH V4] usb:xhci:route device to secondary interrupters
Message-ID: <202512261413.g63ggW37-lkp@intel.com>
References: <B857856CEAB5DF94+20251223101929.202681-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B857856CEAB5DF94+20251223101929.202681-1-raoxu@uniontech.com>

Hi raoxu,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.18]
[also build test ERROR on linus/master next-20251219]
[cannot apply to usb/usb-testing usb/usb-next usb/usb-linus v6.19-rc2 v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/raoxu/usb-xhci-route-device-to-secondary-interrupters/20251223-183611
base:   v6.18
patch link:    https://lore.kernel.org/r/B857856CEAB5DF94%2B20251223101929.202681-1-raoxu%40uniontech.com
patch subject: [PATCH V4] usb:xhci:route device to secondary interrupters
config: xtensa-randconfig-r072-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261413.g63ggW37-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261413.g63ggW37-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261413.g63ggW37-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/usb/host/xhci-pci.c: In function 'xhci_try_enable_msi':
>> include/linux/compiler_types.h:602:38: error: call to '__compiletime_assert_412' declared with attribute error: min(xhci->nvecs - 1, xhci->secondary_irqs_alloc) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:583:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:602:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   drivers/usb/host/xhci-pci.c:250:29: note: in expansion of macro 'min'
      request_secondary_intrs = min(xhci->nvecs - 1, xhci->secondary_irqs_alloc);
                                ^~~
--
   In file included from <command-line>:
   xhci-pci.c: In function 'xhci_try_enable_msi':
>> include/linux/compiler_types.h:602:38: error: call to '__compiletime_assert_412' declared with attribute error: min(xhci->nvecs - 1, xhci->secondary_irqs_alloc) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:583:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:602:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   xhci-pci.c:250:29: note: in expansion of macro 'min'
      request_secondary_intrs = min(xhci->nvecs - 1, xhci->secondary_irqs_alloc);
                                ^~~


vim +/__compiletime_assert_412 +602 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  588  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  589  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  590  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  591  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  592  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  593   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  594   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  595   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  596   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  597   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  598   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  599   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  600   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  601  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @602  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

