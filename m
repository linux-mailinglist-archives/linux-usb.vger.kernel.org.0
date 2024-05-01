Return-Path: <linux-usb+bounces-9951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE93E8B8598
	for <lists+linux-usb@lfdr.de>; Wed,  1 May 2024 08:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CA3D1F230E9
	for <lists+linux-usb@lfdr.de>; Wed,  1 May 2024 06:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACB431A60;
	Wed,  1 May 2024 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BML82bAg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922C72744A
	for <linux-usb@vger.kernel.org>; Wed,  1 May 2024 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714545197; cv=none; b=qlDOoDXGQJ+qQ0qjHdP5dunE97ct0K9DAIYPXro3U5vaB64n7fVOoyCvtee9rYqQ87TBZdoG1UYb6RRYQv/V6Tum9rxyf5g535LozjF6a4pNq8w50cqEd9pEpV/Fo0MxNFYFLMWFHKCin4f9LDIYjjHKaL1Dw8tdc8pgTGj+8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714545197; c=relaxed/simple;
	bh=xnq5nnv/A1CiIYgYO6m3OKjM8n63AgO2pkIc7+Mj3fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ps2e7LGXq5BZ1c0lGOIhhpmvO1U0sgXobT7qRSdskF12qwHWXWjoCG6JgObiKTKLgQzglY8HBNZJOYZXe+eiFwJznP1Ydcma0Qi4UO2bSTWEZLj3a7oifre349/iUexBdCm7y3McUIAbMwRfRbry6y61vJr9mv4eZOV7XdUOsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BML82bAg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714545195; x=1746081195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnq5nnv/A1CiIYgYO6m3OKjM8n63AgO2pkIc7+Mj3fA=;
  b=BML82bAg6Uo2JLupLHpUELQ/zOkM5xnq/vx2ZTEnDed3dqmiavq6mcQD
   A8YCmrbyRVW+OUcH5csRZ3/91EFLQRbtNboTr+2TlV513GLLVPKplxk6Q
   GTxRRF8YEXe4IYuZu+WMDZD1Gjrnf/y44NRnoGiHoiapuURxn4Ke/kAAE
   ulwwevaTv1hVMNvaM0eziKI+SDglt0yKDxLRPGaT00VNRFCtE35gioH2N
   rIN6NuXWH5mXIepkfSYUUC7G9ABOl2DCNKMRKXUQepusnqIkdmWHVzf/5
   HHx2d9OfgD1vuLzSvljP/6ONG1RwKfc3FcUKPmrJyF1Y1P1dOrpkBu2Si
   w==;
X-CSE-ConnectionGUID: tsqJ9O8aQCqbCb0yXh3J6w==
X-CSE-MsgGUID: 06fkVoS/Sd6kbLCfZMAu/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10119874"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="10119874"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 23:33:14 -0700
X-CSE-ConnectionGUID: hVU0oOXoS4yRV6mDZOwEZg==
X-CSE-MsgGUID: iyheqARbSW6Qf3UK9nEz0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="31311967"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2024 23:33:13 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s23Wg-0008zN-2q;
	Wed, 01 May 2024 06:33:10 +0000
Date: Wed, 1 May 2024 14:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [usb:usb-testing 17/35] drivers/usb/storage/usb.c:141:21: error:
 incompatible pointer types passing 'unsigned int *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <202405011431.PvaZHpRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   ac6a205c5bef39d65ecd9f5dd2c1d75652c35405
commit: 70d66b8e47e6fa031f541291e9dd3d7f0c44b41e [17/35] usb-storage: Optimize scan delay more precisely
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240501/202405011431.PvaZHpRK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011431.PvaZHpRK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011431.PvaZHpRK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/usb/storage/usb.c:141:21: warning: comparison of distinct pointer types ('typeof ((delay_ms)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
           unsigned int rem = do_div(delay_ms, int_pow(10, ndecimals));
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
           (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
                  ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/usb/storage/usb.c:141:21: error: incompatible pointer types passing 'unsigned int *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
           unsigned int rem = do_div(delay_ms, int_pow(10, ndecimals));
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
                   __rem = __div64_32(&(n), __base);       \
                                      ^~~~
   arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
                                               ^
>> drivers/usb/storage/usb.c:141:21: warning: shift count >= width of type [-Wshift-count-overflow]
           unsigned int rem = do_div(delay_ms, int_pow(10, ndecimals));
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                                  ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   2 warnings and 1 error generated.


vim +141 drivers/usb/storage/usb.c

   123	
   124	/**
   125	 * fixed_point_uint_to_str - format a fixed-point decimal value into a string
   126	 * @val: The integer value to format, scaled by 10^(@ndecimals).
   127	 * @ndecimals: Number of decimal places in the fixed-point value.
   128	 * @str: Where to store the formatted string.
   129	 * @size: The size of buffer for @str.
   130	 *
   131	 * Format a fixed-point decimal value in @val scaled by 10^(@ndecimals)
   132	 * into a string in @str where to store the formatted string.
   133	 * The string trailing fractional part '0' is trimmed.
   134	 *
   135	 * Returns the number of characters written into @str.
   136	 */
   137	static int fixed_point_uint_to_str(unsigned int val, int ndecimals,
   138					   char *str, int size)
   139	{
   140		unsigned int delay_ms = val;
 > 141		unsigned int rem = do_div(delay_ms, int_pow(10, ndecimals));
   142		int len;
   143		char buf[16];
   144	
   145		len = scnprintf(buf, sizeof(buf), "%d", delay_ms);
   146		if (rem) {
   147			char format[8];
   148	
   149			snprintf(format, sizeof(format) - 1, ".%%0%dd", ndecimals);
   150			len += scnprintf(buf + len, sizeof(buf) - len, format, rem);
   151			while (buf[--len] == '0')
   152				buf[len] = '\0';
   153		}
   154		return scnprintf(str, size, "%s\n", buf);
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

