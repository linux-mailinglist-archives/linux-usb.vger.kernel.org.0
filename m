Return-Path: <linux-usb+bounces-8975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35626899A19
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 11:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 545681C209EE
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 09:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4785C16087B;
	Fri,  5 Apr 2024 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0qMdLw9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2FD1607BC
	for <linux-usb@vger.kernel.org>; Fri,  5 Apr 2024 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712311063; cv=none; b=bRVKs0jjMkWNNYR0KGHJl8oijfRhtFG9eDBi0U6ntu9rXU9NALYYuvw39Disvf1dyz8jojhugyhXqhRJiWcWb0mAx9UC403oqinO2VdBXlIGhPhG7YuA3j+EYAXOCU1LF5xGpLqOv/R+IxZYPZTqF4iR96b8OUT7CFSnhqIGlCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712311063; c=relaxed/simple;
	bh=macVZJuHDyqVpQo30sr87zeNvhPQX1Xr9l7NNo5F91Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Av8KIs9qkuyF7Ie76XMC9w5EPPXRzYkleZmRfEoPlnXtJcr3McMVQTSXdTAq09Ka1ra6fPrVMj7e9vEUy9CvT+j6HMxKOI5whAKQ+ZHf23BsQKDNl3e1huVTJ0SZ4gBrcfhRvwlD9WwK4T92zrTRJbVqNtum9SAZrPLwoSeYfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0qMdLw9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712311062; x=1743847062;
  h=date:from:to:cc:subject:message-id;
  bh=macVZJuHDyqVpQo30sr87zeNvhPQX1Xr9l7NNo5F91Y=;
  b=Z0qMdLw905f8gOE72la7bJPGHI572L4rwOgTpfXhOFklt5FADepdDGuG
   ZQ246TnmiVei/UuGQmypEZVvgbRcBLugMgvHaINmPP/hEB0O0I5VBSm0B
   PAbxxrG9Xs7VVFPg2CoeqJAQVnAHQ1+ydEfIa8QyL+qriCdQ0we6X+Luf
   Sv+QPvBGJbMUPh6JT/9vrJm5xQJjoxI+C4XwplpTecxvvRV8mCNJYy815
   rK7rOTCEPkerGcfVqhtxIetuTEH0mn1vGbM7JUvbrlqZjE3goBQXIoigO
   jsF4xl3Bmwjh+Lffr7pI1ru6dXjFuFCrvD2Dy/q7jWH/HauM6MeZkyiQX
   g==;
X-CSE-ConnectionGUID: N/ON1ESBT4CGjKD7nEJrsA==
X-CSE-MsgGUID: CVXmE5b6Qt6vT6EuTBgxww==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7479548"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7479548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:57:41 -0700
X-CSE-ConnectionGUID: 52X/HaDoTf6UzEA2y6U3nQ==
X-CSE-MsgGUID: tS1nexEdQp6wI+FBUgezqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19219493"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Apr 2024 02:57:40 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsgKH-00027S-2B;
	Fri, 05 Apr 2024 09:57:37 +0000
Date: Fri, 05 Apr 2024 17:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3295f1b866bfbcabd625511968e8a5c541f9ab32
Message-ID: <202404051757.N16AXT9J-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 3295f1b866bfbcabd625511968e8a5c541f9ab32  usb: misc: uss720: check for incompatible versions of the Belkin F5U002

elapsed time: 1110m

configs tested: 190
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240405   gcc  
arc                   randconfig-002-20240405   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                           imxrt_defconfig   clang
arm                             mxs_defconfig   clang
arm                   randconfig-001-20240405   gcc  
arm                   randconfig-002-20240405   clang
arm                   randconfig-003-20240405   gcc  
arm                   randconfig-004-20240405   clang
arm                           tegra_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                        vexpress_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240405   gcc  
arm64                 randconfig-002-20240405   gcc  
arm64                 randconfig-003-20240405   gcc  
arm64                 randconfig-004-20240405   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240405   gcc  
csky                  randconfig-002-20240405   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240405   clang
hexagon               randconfig-002-20240405   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240405   gcc  
i386         buildonly-randconfig-002-20240405   gcc  
i386         buildonly-randconfig-003-20240405   clang
i386         buildonly-randconfig-004-20240405   gcc  
i386         buildonly-randconfig-005-20240405   clang
i386         buildonly-randconfig-006-20240405   clang
i386                                defconfig   clang
i386                  randconfig-001-20240405   clang
i386                  randconfig-002-20240405   gcc  
i386                  randconfig-003-20240405   clang
i386                  randconfig-004-20240405   clang
i386                  randconfig-005-20240405   clang
i386                  randconfig-006-20240405   gcc  
i386                  randconfig-011-20240405   clang
i386                  randconfig-012-20240405   gcc  
i386                  randconfig-013-20240405   gcc  
i386                  randconfig-014-20240405   gcc  
i386                  randconfig-015-20240405   gcc  
i386                  randconfig-016-20240405   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240405   gcc  
loongarch             randconfig-002-20240405   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   clang
mips                malta_qemu_32r6_defconfig   gcc  
mips                           xway_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240405   gcc  
nios2                 randconfig-002-20240405   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240405   gcc  
parisc                randconfig-002-20240405   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240405   clang
powerpc               randconfig-002-20240405   clang
powerpc               randconfig-003-20240405   clang
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240405   gcc  
powerpc64             randconfig-002-20240405   gcc  
powerpc64             randconfig-003-20240405   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240405   clang
riscv                 randconfig-002-20240405   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240405   clang
s390                  randconfig-002-20240405   gcc  
s390                       zfcpdump_defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240405   gcc  
sh                    randconfig-002-20240405   gcc  
sh                          sdk7786_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240405   gcc  
sparc64               randconfig-002-20240405   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240405   gcc  
um                    randconfig-002-20240405   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240405   clang
x86_64       buildonly-randconfig-002-20240405   clang
x86_64       buildonly-randconfig-003-20240405   gcc  
x86_64       buildonly-randconfig-004-20240405   gcc  
x86_64       buildonly-randconfig-005-20240405   clang
x86_64       buildonly-randconfig-006-20240405   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240405   clang
x86_64                randconfig-002-20240405   clang
x86_64                randconfig-003-20240405   clang
x86_64                randconfig-004-20240405   gcc  
x86_64                randconfig-005-20240405   clang
x86_64                randconfig-006-20240405   gcc  
x86_64                randconfig-011-20240405   clang
x86_64                randconfig-012-20240405   gcc  
x86_64                randconfig-013-20240405   gcc  
x86_64                randconfig-014-20240405   clang
x86_64                randconfig-015-20240405   gcc  
x86_64                randconfig-016-20240405   gcc  
x86_64                randconfig-071-20240405   gcc  
x86_64                randconfig-072-20240405   gcc  
x86_64                randconfig-073-20240405   gcc  
x86_64                randconfig-074-20240405   gcc  
x86_64                randconfig-075-20240405   gcc  
x86_64                randconfig-076-20240405   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240405   gcc  
xtensa                randconfig-002-20240405   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

