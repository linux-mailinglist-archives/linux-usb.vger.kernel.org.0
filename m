Return-Path: <linux-usb+bounces-25235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2579AECB83
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jun 2025 08:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31E07176B44
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jun 2025 06:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559441AAC9;
	Sun, 29 Jun 2025 06:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wm8dHEEC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1A029B0
	for <linux-usb@vger.kernel.org>; Sun, 29 Jun 2025 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751178416; cv=none; b=G3A+qCK6pzjFM9qdgkpR8paGHy57jOYUQUHG7h+9OrhiOM/qV/F/HFtSC7U2aBZxl/wDQ/ufB+Ib+6pyAyW6dR3TpK9AqQv1++Z5hLeMXiL213Mg7L8uvaqiUZbubX4L0CXBx5cjlRLd08AF3AlKuxBmnpmEXKKS+FvwWDcXBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751178416; c=relaxed/simple;
	bh=lLVY7WG0HUwQdmFGoCSFrKWLgQjWBipkB8YIRNkk9uE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EYtWc+sY9t3qeo8xj/045xKUSN8NH7MAHRGBRovbiJ26iw2KHLlEc5822FexYtQAQThZX19oqYBymLp5cF2zUO2vjCQpcXrS/siIVyIgukYDMGAn2iO5nFJUUQxax9Zy7ltmHGsd+3Yp8RyiwrAEvy4fmzHxt/b87jAVPPHogbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wm8dHEEC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751178415; x=1782714415;
  h=date:from:to:cc:subject:message-id;
  bh=lLVY7WG0HUwQdmFGoCSFrKWLgQjWBipkB8YIRNkk9uE=;
  b=Wm8dHEECOVwPL525apCChH90ra5x2TxMmukwersL5LZu9fUMb5FqDtm0
   zzrf0RvNELnY5X+q14WGAShgS8Thw70hPp2v81RSX/wh5lBrHHJ+zwoK7
   h5Z183SOJ1iBON449VH+6gEeMt513sDLsV9KlXgInWZGvuV23WBniVcb6
   N28yGJ00gCl4uOVAeRzpveRIL1JodUW0tCAMgBjiBXbNl7dujrNulYoT2
   0jUv+REX/Ceka80tU4IDFuThXcxI+DdmTEsjA+gacjb31cdmBXzLE9rhH
   RRufXa1HvJPaGK7Ia3w1bJ1xPPMPXT5BdOiHV307mOpo4Ut4Lmy4FtxCB
   w==;
X-CSE-ConnectionGUID: wFEsFpPVRd6QSVXORPqYyA==
X-CSE-MsgGUID: edvWJq9fSwiv9SyS2Cf76A==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53294489"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53294489"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 23:26:54 -0700
X-CSE-ConnectionGUID: QHTEZHk6SYeWmjLWq/rUOA==
X-CSE-MsgGUID: vQuZEWZfRPm1NotNCffTng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="152667555"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jun 2025 23:26:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVlV5-000Xj8-08;
	Sun, 29 Jun 2025 06:26:51 +0000
Date: Sun, 29 Jun 2025 14:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e35a5d814525006f043b29bffd1bbdcb549b23c5
Message-ID: <202506291438.HDxcPfGx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e35a5d814525006f043b29bffd1bbdcb549b23c5  usb: gadget: u_serial: remove some dead code

elapsed time: 895m

configs tested: 139
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250629    gcc-8.5.0
arc                   randconfig-002-20250629    gcc-13.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                           omap1_defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250629    clang-21
arm                   randconfig-002-20250629    gcc-12.4.0
arm                   randconfig-003-20250629    gcc-8.5.0
arm                   randconfig-004-20250629    gcc-12.4.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250629    gcc-13.3.0
arm64                 randconfig-002-20250629    clang-19
arm64                 randconfig-003-20250629    gcc-14.3.0
arm64                 randconfig-004-20250629    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250629    gcc-15.1.0
csky                  randconfig-002-20250629    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250629    clang-21
hexagon               randconfig-002-20250629    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250629    clang-20
i386        buildonly-randconfig-002-20250629    clang-20
i386        buildonly-randconfig-003-20250629    clang-20
i386        buildonly-randconfig-004-20250629    gcc-12
i386        buildonly-randconfig-005-20250629    clang-20
i386        buildonly-randconfig-006-20250629    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250629    gcc-15.1.0
loongarch             randconfig-002-20250629    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-21
mips                         bigsur_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250629    gcc-9.3.0
nios2                 randconfig-002-20250629    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250629    gcc-10.5.0
parisc                randconfig-002-20250629    gcc-14.3.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc               randconfig-001-20250629    clang-21
powerpc               randconfig-002-20250629    gcc-13.3.0
powerpc               randconfig-003-20250629    gcc-11.5.0
powerpc                     redwood_defconfig    clang-21
powerpc64             randconfig-001-20250629    clang-21
powerpc64             randconfig-002-20250629    gcc-8.5.0
powerpc64             randconfig-003-20250629    clang-20
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250629    clang-17
riscv                 randconfig-002-20250629    gcc-13.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250629    clang-21
s390                  randconfig-002-20250629    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250629    gcc-15.1.0
sh                    randconfig-002-20250629    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250629    gcc-10.3.0
sparc                 randconfig-002-20250629    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250629    gcc-8.5.0
sparc64               randconfig-002-20250629    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250629    gcc-11
um                    randconfig-002-20250629    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250629    gcc-12
x86_64      buildonly-randconfig-002-20250629    gcc-12
x86_64      buildonly-randconfig-003-20250629    clang-20
x86_64      buildonly-randconfig-004-20250629    gcc-12
x86_64      buildonly-randconfig-005-20250629    gcc-12
x86_64      buildonly-randconfig-006-20250629    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250629    gcc-8.5.0
xtensa                randconfig-002-20250629    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

