Return-Path: <linux-usb+bounces-29971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A876C275BD
	for <lists+linux-usb@lfdr.de>; Sat, 01 Nov 2025 03:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B67218990A4
	for <lists+linux-usb@lfdr.de>; Sat,  1 Nov 2025 02:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14130220F5C;
	Sat,  1 Nov 2025 02:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wp7NEX0E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A801DE4C9
	for <linux-usb@vger.kernel.org>; Sat,  1 Nov 2025 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761962936; cv=none; b=aD7ybslJ5vGUR5d21I58ZDLMNROVmmUC7D2vlupCipNwA7hAhXNZG7gO2wpdp6pT5ZwUPye6Uh0+WjC7QntU2z8am+aseMbnISUW/r+h/0Ux+g/0UP9RxCbH9MuO9y8i1PeJ0w8BziwTyasdwmA3JLW//gDJdykLld22c10Td+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761962936; c=relaxed/simple;
	bh=jA52pItuIvaJfELjNgLcSITUf5nQmyiowysKQqYPiaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtgSv1SvGETXq7btTEpb+txbEHHGIFIeD7pNaq2y1gopce7qwE4K5aPiVpEP/i5a4ZPk9+r5N0nn6Iljo9auJV/6v30qo6PSbr0w7PU3k6KctQuv6V+ywsY6QESmcfAT3D2sZ54/T39r+XqIfMT6stYcBcDsH8JaxknCLK27qMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wp7NEX0E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761962935; x=1793498935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jA52pItuIvaJfELjNgLcSITUf5nQmyiowysKQqYPiaM=;
  b=Wp7NEX0EwIZhBDW2EuMv/r9vwOiaPsRoho3kUUocFUVbqCB2Ln2o8L1h
   QX0U4e3FYRgcYHvYBuWDE3jkLyTnuTwFmsDPcYxj4M0bBLLlFy969h+Pc
   XkvHDmMpcR6q8xRLxNbqfNwHTgFocN5LiPWTP/8ecZ8dh0k7rigIXMRdb
   QwhDzxGvVwVLvBi4VWZqWixyIcG2ck1gkRJmQvEqCvfmQspbNnMzcJ3Yl
   1Bgk4qePkn32d5amQ8WQ/IcBzCZpLoHnMb7qNlDSE0uFFSFb6PFuVONi1
   SPu1pGZ0tMjAklUd/32orjS47oGTSHQkNHqKlWdzgaw4xtr9/4LKGlDI7
   A==;
X-CSE-ConnectionGUID: WBu0IRRjT+qHIdgjibW41A==
X-CSE-MsgGUID: 4ZLndLDuQse3dldzvrB/WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75244881"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="75244881"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 19:08:54 -0700
X-CSE-ConnectionGUID: 1ajnwhhxTKa9y1NaZn+8WA==
X-CSE-MsgGUID: yaqeY8EQRkm1d1DBM368VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="217028590"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2025 19:08:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF12w-000Nom-1J;
	Sat, 01 Nov 2025 02:08:50 +0000
Date: Sat, 1 Nov 2025 10:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
	gustavo@embeddedor.com, linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCHv2 1/1] uapi: cdc.h: cleanly provide for more interfaces
 and countries
Message-ID: <202511010928.O8jbJSc1-lkp@intel.com>
References: <20251030132149.2575138-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030132149.2575138-1-oneukum@suse.com>

Hi Oliver,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus staging/staging-testing staging/staging-next staging/staging-linus westeri-thunderbolt/next linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/uapi-cdc-h-cleanly-provide-for-more-interfaces-and-countries/20251030-212514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20251030132149.2575138-1-oneukum%40suse.com
patch subject: [PATCHv2 1/1] uapi: cdc.h: cleanly provide for more interfaces and countries
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251101/202511010928.O8jbJSc1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010928.O8jbJSc1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010928.O8jbJSc1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/usb/cdc.h:109:3: error: type name requires a specifier or qualifier
     109 |                 DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);
         |                 ^
>> ./usr/include/linux/usb/cdc.h:109:28: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     109 |                 DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);
         |                                          ^
         |                                          int
   ./usr/include/linux/usb/cdc.h:122:3: error: type name requires a specifier or qualifier
     122 |                 DECLARE_FLEX_ARRAY(__le16, wCountryCodes);
         |                 ^
   ./usr/include/linux/usb/cdc.h:122:30: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     122 |                 DECLARE_FLEX_ARRAY(__le16, wCountryCodes);
         |                                            ^
         |                                            int
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

