Return-Path: <linux-usb+bounces-8700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A988949E3
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 05:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41F5B286897
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 03:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7990D14F65;
	Tue,  2 Apr 2024 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMVNHrnt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C82E14AAD
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 03:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712028318; cv=none; b=f4tNbUH2ueBAVNH3CgkgGN3jTv7SU3ShaOzNW5ZptoyI6kDnAhwdJDC+bpPgjIXaWd8cXjur+vqRSe8zHEyeF/NzHIcmwnLgo0CvgYsUJuvFqDEeSYj7CW24lOldwZqPQctzJ2n3v2hyDjNvJj6pRy+ixDmMyZubBF1GZS/IjKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712028318; c=relaxed/simple;
	bh=z0dPn9/Ne0ASgXaVstHjdC5jWUCVAZzfVV56oV0Kmts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EZS8NE7fuZoN5e93R2Yik0hdO59MpBfKHQvfoyoMGrhnuoYD6t0SyGGzCu+1rl2QnHV0qmlXXq4dhXObqyqtZ2QR3KEtLe9f14BSJQoILxyqwXJDKjucrSAlpXAI5759bUen59ZAdo2ccZf1pkrzI3bGqcpoXnVYyEKYCcS9EHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMVNHrnt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712028316; x=1743564316;
  h=date:from:to:cc:subject:message-id;
  bh=z0dPn9/Ne0ASgXaVstHjdC5jWUCVAZzfVV56oV0Kmts=;
  b=NMVNHrntQtW86JX5JMl6sOHHR4RVs5Cuxmg4HHlysc3mzJwykbKMta8K
   3W8n1gDkgqR2cwYOvoTb1cYVzFMZwEXxCWipzfInQ/eFN2RD2LRJfWshU
   MwPfBmd7BbSftl8+hnt7KI5yHc7IRWpwXneu8qWbCgI0DJ+SBBuhGc/2n
   mQXuyVhr7PQCu3LXdKisNyXVA93Kag1FvAXkYPMAqc0SJH7WoafzW6ET/
   wYjqSDKDGeRyER2x9XpJxA2ll/+gxGrEbfsjhlf8zdVcxaCdAWjFpLIM6
   cSqWANeT+euMa/2AYWv7oN+5i2WeVDkllfgzVN+giMGOJS6sp6EW765XT
   w==;
X-CSE-ConnectionGUID: eRhZZHEOQu2gl0c+BdP3cQ==
X-CSE-MsgGUID: PPU2XkP7TG6l8VJ2Jk/xHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7043854"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7043854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 20:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="17974457"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Apr 2024 20:25:14 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrUls-0000pt-1J;
	Tue, 02 Apr 2024 03:25:12 +0000
Date: Tue, 02 Apr 2024 11:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 5bab5dc780c9ed0c69fc2f828015532acf4a7848
Message-ID: <202404021131.3dluOQIZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 5bab5dc780c9ed0c69fc2f828015532acf4a7848  Merge 6.9-rc2 into usb-next

elapsed time: 727m

configs tested: 197
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
arc                        nsimosci_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240402   gcc  
arc                   randconfig-002-20240402   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                                 defconfig   clang
arm                       multi_v4t_defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                        mvebu_v7_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240402   gcc  
arm                   randconfig-002-20240402   clang
arm                   randconfig-003-20240402   clang
arm                   randconfig-004-20240402   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240402   clang
arm64                 randconfig-002-20240402   clang
arm64                 randconfig-003-20240402   clang
arm64                 randconfig-004-20240402   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240402   gcc  
csky                  randconfig-002-20240402   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240402   clang
hexagon               randconfig-002-20240402   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240402   gcc  
i386         buildonly-randconfig-002-20240402   gcc  
i386         buildonly-randconfig-003-20240402   clang
i386         buildonly-randconfig-004-20240402   clang
i386         buildonly-randconfig-005-20240402   clang
i386         buildonly-randconfig-006-20240402   clang
i386                                defconfig   clang
i386                  randconfig-001-20240402   gcc  
i386                  randconfig-002-20240402   clang
i386                  randconfig-003-20240402   clang
i386                  randconfig-004-20240402   clang
i386                  randconfig-005-20240402   clang
i386                  randconfig-006-20240402   clang
i386                  randconfig-011-20240402   gcc  
i386                  randconfig-012-20240402   clang
i386                  randconfig-013-20240402   clang
i386                  randconfig-014-20240402   clang
i386                  randconfig-015-20240402   gcc  
i386                  randconfig-016-20240402   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240402   gcc  
loongarch             randconfig-002-20240402   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                            gpr_defconfig   clang
mips                      loongson3_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240402   gcc  
nios2                 randconfig-002-20240402   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240402   gcc  
parisc                randconfig-002-20240402   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                        fsp2_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240402   clang
powerpc               randconfig-002-20240402   gcc  
powerpc               randconfig-003-20240402   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc64             randconfig-001-20240402   gcc  
powerpc64             randconfig-002-20240402   gcc  
powerpc64             randconfig-003-20240402   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240402   clang
riscv                 randconfig-002-20240402   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240402   gcc  
s390                  randconfig-002-20240402   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                    randconfig-001-20240402   gcc  
sh                    randconfig-002-20240402   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240402   gcc  
sparc64               randconfig-002-20240402   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240402   gcc  
um                    randconfig-002-20240402   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240402   clang
x86_64       buildonly-randconfig-002-20240402   clang
x86_64       buildonly-randconfig-003-20240402   clang
x86_64       buildonly-randconfig-004-20240402   clang
x86_64       buildonly-randconfig-005-20240402   clang
x86_64       buildonly-randconfig-006-20240402   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240402   clang
x86_64                randconfig-002-20240402   clang
x86_64                randconfig-003-20240402   gcc  
x86_64                randconfig-004-20240402   clang
x86_64                randconfig-005-20240402   gcc  
x86_64                randconfig-006-20240402   gcc  
x86_64                randconfig-011-20240402   gcc  
x86_64                randconfig-012-20240402   gcc  
x86_64                randconfig-013-20240402   clang
x86_64                randconfig-014-20240402   gcc  
x86_64                randconfig-015-20240402   clang
x86_64                randconfig-016-20240402   gcc  
x86_64                randconfig-071-20240402   clang
x86_64                randconfig-072-20240402   clang
x86_64                randconfig-073-20240402   clang
x86_64                randconfig-074-20240402   gcc  
x86_64                randconfig-075-20240402   clang
x86_64                randconfig-076-20240402   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240402   gcc  
xtensa                randconfig-002-20240402   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

