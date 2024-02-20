Return-Path: <linux-usb+bounces-6810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018585C60A
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 21:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3D8EB21A2E
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 20:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106F014E2FE;
	Tue, 20 Feb 2024 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAunJ8PN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC214AD0F
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708462061; cv=none; b=uAHcXcy1n48OmPlalXMpG3sMMoGLamNeXKts1W02u5ujnsr/VewVTZn4ablNX7SXZcYyp7d5CQp7s2Pv0AUQreLkLvJwhNHGe1NjkdakhXt8gq+/Y2vNeZB9aM1lYT/vgwvIFLWe/wR0p8YTuFIl+hQCzdu1a3jdsp6Vd6whRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708462061; c=relaxed/simple;
	bh=PxFZpUNzu40MycDCQayFKkf2pMbCR5KseLX3vo9KJvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HinyqswHjsenveyuSjy6OKRoxNU+WImtDvoL22lUZlILQjq02XsWRbAhNLwDWs7WsAl44dm46JIdfU2+b1Q/79V0RIz1Ujyq+aCLTTBNqKSoSLDUaR8foz8llN85nC4jrvOWL2ciWa+nXDPbgvYABGTZphzUuE0KtK52Qd22fnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAunJ8PN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708462059; x=1739998059;
  h=date:from:to:cc:subject:message-id;
  bh=PxFZpUNzu40MycDCQayFKkf2pMbCR5KseLX3vo9KJvo=;
  b=EAunJ8PNePp6h5v/M9r5r2yci8olREcSZnEK2ESmiEoRBMJqVoM3F+Yi
   CdkoOxOpxu7w3+CKv3WNQx5YcqPcwDcE6gHauHM77JyBJ0/ppmmM4Vlmy
   REwzO9pAhf8hb+2irqn6zEfVQ14AGEjtm27wKHM9jWF5Z9nnQve9KmvRg
   Xz6YGjVLl0d/omH7n4AiBTkOOc3nJ+ptMWdNB4R0zcs+a8kS/SQk5WUI4
   H9dgECwyJ5EaLF4ssMzrQqYDlwKTaqXJHaWFjBDHGcTHHrNSKx+2bDXWg
   moRGam+MF7gZ9rhTz2+nqABcxvwZy6NrAW9J1MvN3I+w3afCevIg25BK1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2452761"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2452761"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 12:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4925243"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2024 12:47:37 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcX1a-0004oa-1C;
	Tue, 20 Feb 2024 20:47:34 +0000
Date: Wed, 21 Feb 2024 04:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3bf0514dc6f36f81ee11b1becd977cb87b4c90c6
Message-ID: <202402210457.UFcoG9zY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 3bf0514dc6f36f81ee11b1becd977cb87b4c90c6  Revert "xhci: add helper to stop endpoint and wait for completion"

elapsed time: 1458m

configs tested: 195
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
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240220   gcc  
arc                   randconfig-002-20240220   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                      footbridge_defconfig   clang
arm                      jornada720_defconfig   clang
arm                         lpc18xx_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20240220   clang
arm                   randconfig-002-20240220   gcc  
arm                   randconfig-003-20240220   gcc  
arm                   randconfig-004-20240220   gcc  
arm                           sama7_defconfig   clang
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240220   clang
arm64                 randconfig-002-20240220   clang
arm64                 randconfig-003-20240220   clang
arm64                 randconfig-004-20240220   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240220   gcc  
csky                  randconfig-002-20240220   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240220   clang
hexagon               randconfig-002-20240220   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240220   gcc  
i386         buildonly-randconfig-002-20240220   gcc  
i386         buildonly-randconfig-003-20240220   clang
i386         buildonly-randconfig-004-20240220   clang
i386         buildonly-randconfig-005-20240220   gcc  
i386         buildonly-randconfig-006-20240220   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240220   gcc  
i386                  randconfig-002-20240220   gcc  
i386                  randconfig-003-20240220   clang
i386                  randconfig-004-20240220   clang
i386                  randconfig-005-20240220   gcc  
i386                  randconfig-006-20240220   clang
i386                  randconfig-011-20240220   clang
i386                  randconfig-012-20240220   gcc  
i386                  randconfig-013-20240220   gcc  
i386                  randconfig-014-20240220   clang
i386                  randconfig-015-20240220   clang
i386                  randconfig-016-20240220   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240220   gcc  
loongarch             randconfig-002-20240220   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240220   gcc  
nios2                 randconfig-002-20240220   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240220   gcc  
parisc                randconfig-002-20240220   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc               randconfig-001-20240220   gcc  
powerpc               randconfig-002-20240220   clang
powerpc               randconfig-003-20240220   clang
powerpc                     skiroot_defconfig   clang
powerpc64             randconfig-001-20240220   gcc  
powerpc64             randconfig-002-20240220   gcc  
powerpc64             randconfig-003-20240220   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240220   clang
riscv                 randconfig-002-20240220   clang
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240220   gcc  
s390                  randconfig-002-20240220   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240220   gcc  
sh                    randconfig-002-20240220   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240220   gcc  
sparc64               randconfig-002-20240220   gcc  
um                               alldefconfig   clang
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240220   gcc  
um                    randconfig-002-20240220   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240220   clang
x86_64       buildonly-randconfig-002-20240220   clang
x86_64       buildonly-randconfig-003-20240220   gcc  
x86_64       buildonly-randconfig-004-20240220   clang
x86_64       buildonly-randconfig-005-20240220   gcc  
x86_64       buildonly-randconfig-006-20240220   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240220   gcc  
x86_64                randconfig-002-20240220   gcc  
x86_64                randconfig-003-20240220   gcc  
x86_64                randconfig-004-20240220   clang
x86_64                randconfig-005-20240220   clang
x86_64                randconfig-006-20240220   gcc  
x86_64                randconfig-011-20240220   gcc  
x86_64                randconfig-012-20240220   clang
x86_64                randconfig-013-20240220   clang
x86_64                randconfig-014-20240220   gcc  
x86_64                randconfig-015-20240220   clang
x86_64                randconfig-016-20240220   gcc  
x86_64                randconfig-071-20240220   clang
x86_64                randconfig-072-20240220   clang
x86_64                randconfig-073-20240220   clang
x86_64                randconfig-074-20240220   clang
x86_64                randconfig-075-20240220   clang
x86_64                randconfig-076-20240220   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240220   gcc  
xtensa                randconfig-002-20240220   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

