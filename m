Return-Path: <linux-usb+bounces-14691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0497A96D131
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 10:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2831D1C21C57
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 08:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40279193419;
	Thu,  5 Sep 2024 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNZz5tDK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42A31925B0
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 08:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523448; cv=none; b=Wz6EFERIHwPg8ux16uGVvXHrPq3Z0+JhDtEi5OcBm/2pUGxUjGclw3inHG13sfTnJrD5A47rzBw2qpMBjdh/1+4Os6Bm82yIF/3tYy68y/noMNhaO6TeWK7eYKIDlM2i6Mmqb2Cm45x1VgMvMCs+izrFww/DgrUzBf3bsKDnXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523448; c=relaxed/simple;
	bh=fz8+siYXglxlWnmdjU55HWapuXHV02y4qc+KjTOoTkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TLVArkUOjTIFqYlnKNrY47K5wJif0ckmMlwJcllgQYshyjYik0WrvgkokT6QF+xysF8GFd+WAcMcviyASmEuWh41/DGviHnWmWWYCxWv0MU2VcoeFgJvI2rzR4MGPIzkdTJ/Ph8+KZuITSHKzZoYmdYrbfE8awuO6Oz7YEyoSPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNZz5tDK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725523447; x=1757059447;
  h=date:from:to:cc:subject:message-id;
  bh=fz8+siYXglxlWnmdjU55HWapuXHV02y4qc+KjTOoTkM=;
  b=dNZz5tDK67/hBAeVIUJaZGiTG+vTtJXtjq7W7QXYQ9gz5ARSvppWlUsI
   0J2k3UbW5oW/jf6dJscj/joUviBk9OuEDwOUL/VNwyBPpY1yKKJiS3ZOt
   qra/ZseFMWJb75Fw/AE+aMVmxTnWLPqPsbz0CCQm48cvmThylATW9KcIq
   NzMaqu6XTtVOvwr395q0QZw3mlEqOJxqSWJBo7mEFFQPwrCs3PuruskmQ
   oiFT1geHbmED8IhDSIsaI8CLnTRtA0gUN27Mcg9/D11G0kvC47SW/543o
   ACMozGuaaGk6ChC0Nt7GFAUGwUWTz0TPSaQyjwULgmrVW0VuIMwMd+Fcd
   w==;
X-CSE-ConnectionGUID: yrb9p1vERJ2SXBcpROP1ww==
X-CSE-MsgGUID: jVtAKaDvRsWRgdGewEpOfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24368237"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24368237"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:04:07 -0700
X-CSE-ConnectionGUID: 8+leS/H6QNSvcdwmmWnEAA==
X-CSE-MsgGUID: 2yNuiAaBSlmxNkdATkdU0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65235866"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Sep 2024 01:04:05 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm7TH-00095e-0x;
	Thu, 05 Sep 2024 08:04:03 +0000
Date: Thu, 05 Sep 2024 16:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 87eb3cb4ec619299cd5572e1d5eb68aef4074ac2
Message-ID: <202409051628.MajZKuYH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 87eb3cb4ec619299cd5572e1d5eb68aef4074ac2  usb: typec: ucsi: Fix cable registration

elapsed time: 2206m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              alldefconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240905   gcc-13.2.0
arc                   randconfig-002-20240905   gcc-13.2.0
arm                               allnoconfig   clang-20
arm                   randconfig-001-20240905   clang-14
arm                   randconfig-002-20240905   clang-20
arm                   randconfig-003-20240905   clang-20
arm                   randconfig-004-20240905   gcc-14.1.0
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240905   clang-20
arm64                 randconfig-002-20240905   gcc-14.1.0
arm64                 randconfig-003-20240905   clang-20
arm64                 randconfig-004-20240905   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240905   gcc-14.1.0
csky                  randconfig-002-20240905   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon               randconfig-001-20240905   clang-20
hexagon               randconfig-002-20240905   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240904   clang-18
i386         buildonly-randconfig-002-20240904   gcc-12
i386         buildonly-randconfig-003-20240904   clang-18
i386         buildonly-randconfig-004-20240904   clang-18
i386         buildonly-randconfig-005-20240904   clang-18
i386         buildonly-randconfig-006-20240904   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240904   clang-18
i386                  randconfig-002-20240904   clang-18
i386                  randconfig-003-20240904   clang-18
i386                  randconfig-004-20240904   clang-18
i386                  randconfig-005-20240904   gcc-12
i386                  randconfig-006-20240904   gcc-12
i386                  randconfig-011-20240904   clang-18
i386                  randconfig-012-20240904   clang-18
i386                  randconfig-013-20240904   gcc-12
i386                  randconfig-014-20240904   clang-18
i386                  randconfig-015-20240904   clang-18
i386                  randconfig-016-20240904   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240905   gcc-14.1.0
loongarch             randconfig-002-20240905   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240905   gcc-14.1.0
nios2                 randconfig-002-20240905   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                randconfig-001-20240905   gcc-14.1.0
parisc                randconfig-002-20240905   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc               randconfig-002-20240905   clang-20
powerpc64             randconfig-001-20240905   gcc-14.1.0
powerpc64             randconfig-002-20240905   gcc-14.1.0
powerpc64             randconfig-003-20240905   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                 randconfig-001-20240905   gcc-14.1.0
riscv                 randconfig-002-20240905   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                  randconfig-001-20240905   clang-20
s390                  randconfig-002-20240905   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                    randconfig-001-20240905   gcc-14.1.0
sh                    randconfig-002-20240905   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64               randconfig-001-20240905   gcc-14.1.0
sparc64               randconfig-002-20240905   gcc-14.1.0
um                                allnoconfig   clang-17
um                    randconfig-001-20240905   gcc-12
um                    randconfig-002-20240905   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240905   gcc-12
x86_64       buildonly-randconfig-002-20240905   clang-18
x86_64       buildonly-randconfig-003-20240905   gcc-12
x86_64       buildonly-randconfig-004-20240905   clang-18
x86_64       buildonly-randconfig-005-20240905   clang-18
x86_64       buildonly-randconfig-006-20240905   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240905   clang-18
x86_64                randconfig-002-20240905   gcc-12
x86_64                randconfig-003-20240905   clang-18
x86_64                randconfig-004-20240905   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240905   gcc-14.1.0
xtensa                randconfig-002-20240905   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

