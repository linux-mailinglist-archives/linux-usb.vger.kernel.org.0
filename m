Return-Path: <linux-usb+bounces-12903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 304039468AF
	for <lists+linux-usb@lfdr.de>; Sat,  3 Aug 2024 10:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93F5BB21645
	for <lists+linux-usb@lfdr.de>; Sat,  3 Aug 2024 08:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E4614D432;
	Sat,  3 Aug 2024 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZzATSqC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3043398A
	for <linux-usb@vger.kernel.org>; Sat,  3 Aug 2024 08:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722673223; cv=none; b=DKGme8dvxACQF6wBiVS6mHzZRDS66rbacC1h86XS6TfErx9l2le/P+ZZrvLfI2PJKttu95Bubci5OrlP/Ca5Y35aYTLCLnmVY23BQaP8uQF5Z2eN0LuxnZbGQ4Q4+yrfBcxzeoY4rzzXkgD0FQMLW54kQuxAOD56u6wiE0BaWTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722673223; c=relaxed/simple;
	bh=5pF/d4oeNymeHQ4QrcTrGnKpKeNa2Ymd5b7/EyNot5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QUwlYpt9xwVZyMatrApXVMiKInq+iqvhGeakwgWKUZlbL0q+LQOXontxcKWi64iALdl0BptFGcRqgVyNJn2jGFN05WOrfuc6iRH4nIVM1ehrSxug76/U0McslDIROuDJf0K4y7P7/eEFwBpU2BO3jpR4oeiQIeQht3vqZrgFIAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZzATSqC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722673221; x=1754209221;
  h=date:from:to:cc:subject:message-id;
  bh=5pF/d4oeNymeHQ4QrcTrGnKpKeNa2Ymd5b7/EyNot5w=;
  b=lZzATSqCzqr2AHM5d4TeJzFDSJ3Jq845Fca09iA7DwfmXswj/PzkoGY7
   jCq8eYOYz0fwucft9+TsfO+a4LXw5eByAaKtAMoDAXTDeSC5i3SwS4btz
   yOYa59fIBWVHdFpTXTG/LNZFbKu48rF2J2STUOmOKYO5YPBPoiYAJ9+oJ
   mvOHJ5R7+sEWpxcu/k1EIX8BhjplLT3yeK3IilSyNFHxkiOqIW1dKO8J0
   1iIWD1wri1SjUURUK3Ync1SO7jW/E8ODC6P/m3Kc7y62hgS+aiaDhMVpy
   WnaYnlhNRIWR/qfSWFYe07T25AYZ7z01jvdHNybk4FaSErGwZgu0FjkK8
   A==;
X-CSE-ConnectionGUID: rc+XA2+bRyGRODMSGt0moQ==
X-CSE-MsgGUID: 9ziJy2R8RhCcdKKO8k0q/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24484613"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="24484613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 01:20:20 -0700
X-CSE-ConnectionGUID: syWzkAK2Q/GNwh3IeYTPCA==
X-CSE-MsgGUID: 5E14TXBHScqMt9J9UH/3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60038211"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2024 01:20:19 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa9zo-0000Jm-0I;
	Sat, 03 Aug 2024 08:20:13 +0000
Date: Sat, 03 Aug 2024 16:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 ab3de2c7ec91db6a3cf5fc07765852c81ca7d6ef
Message-ID: <202408031656.nmMSZPz4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: ab3de2c7ec91db6a3cf5fc07765852c81ca7d6ef  thunderbolt: Fix memory leaks in {port|retimer}_sb_regs_write()

elapsed time: 1456m

configs tested: 249
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240802   gcc-13.2.0
arc                   randconfig-001-20240803   gcc-13.2.0
arc                   randconfig-002-20240802   gcc-13.2.0
arc                   randconfig-002-20240803   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   clang-20
arm                        clps711x_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                      jornada720_defconfig   clang-20
arm                        keystone_defconfig   clang-20
arm                          moxart_defconfig   clang-20
arm                            mps2_defconfig   clang-20
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                             mxs_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240802   gcc-13.2.0
arm                   randconfig-001-20240803   gcc-13.2.0
arm                   randconfig-002-20240802   gcc-13.2.0
arm                   randconfig-002-20240803   gcc-13.2.0
arm                   randconfig-003-20240802   gcc-13.2.0
arm                   randconfig-003-20240803   gcc-13.2.0
arm                   randconfig-004-20240802   gcc-13.2.0
arm                   randconfig-004-20240803   gcc-13.2.0
arm                        realview_defconfig   gcc-13.2.0
arm                             rpc_defconfig   clang-20
arm                         s3c6400_defconfig   gcc-13.2.0
arm                           sama5_defconfig   clang-20
arm                       spear13xx_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240802   gcc-13.2.0
arm64                 randconfig-001-20240803   gcc-13.2.0
arm64                 randconfig-002-20240802   gcc-13.2.0
arm64                 randconfig-002-20240803   gcc-13.2.0
arm64                 randconfig-003-20240802   gcc-13.2.0
arm64                 randconfig-003-20240803   gcc-13.2.0
arm64                 randconfig-004-20240802   gcc-13.2.0
arm64                 randconfig-004-20240803   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240802   gcc-13.2.0
csky                  randconfig-001-20240803   gcc-13.2.0
csky                  randconfig-002-20240802   gcc-13.2.0
csky                  randconfig-002-20240803   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240802   gcc-13
i386         buildonly-randconfig-001-20240803   clang-18
i386         buildonly-randconfig-002-20240802   gcc-12
i386         buildonly-randconfig-002-20240803   clang-18
i386         buildonly-randconfig-003-20240802   clang-18
i386         buildonly-randconfig-003-20240803   clang-18
i386         buildonly-randconfig-004-20240802   gcc-13
i386         buildonly-randconfig-004-20240803   clang-18
i386         buildonly-randconfig-005-20240802   gcc-12
i386         buildonly-randconfig-005-20240803   clang-18
i386         buildonly-randconfig-006-20240802   clang-18
i386         buildonly-randconfig-006-20240803   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240802   gcc-12
i386                  randconfig-001-20240803   clang-18
i386                  randconfig-002-20240802   gcc-12
i386                  randconfig-002-20240803   clang-18
i386                  randconfig-003-20240802   clang-18
i386                  randconfig-003-20240803   clang-18
i386                  randconfig-004-20240802   gcc-12
i386                  randconfig-004-20240803   clang-18
i386                  randconfig-005-20240802   gcc-12
i386                  randconfig-005-20240803   clang-18
i386                  randconfig-006-20240802   gcc-12
i386                  randconfig-006-20240803   clang-18
i386                  randconfig-011-20240802   clang-18
i386                  randconfig-011-20240803   clang-18
i386                  randconfig-012-20240802   clang-18
i386                  randconfig-012-20240803   clang-18
i386                  randconfig-013-20240802   gcc-12
i386                  randconfig-013-20240803   clang-18
i386                  randconfig-014-20240802   clang-18
i386                  randconfig-014-20240803   clang-18
i386                  randconfig-015-20240802   clang-18
i386                  randconfig-015-20240803   clang-18
i386                  randconfig-016-20240802   gcc-12
i386                  randconfig-016-20240803   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240802   gcc-13.2.0
loongarch             randconfig-001-20240803   gcc-13.2.0
loongarch             randconfig-002-20240802   gcc-13.2.0
loongarch             randconfig-002-20240803   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           gcw0_defconfig   clang-20
mips                           ip22_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   clang-20
mips                    maltaup_xpa_defconfig   clang-20
mips                           mtx1_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240802   gcc-13.2.0
nios2                 randconfig-001-20240803   gcc-13.2.0
nios2                 randconfig-002-20240802   gcc-13.2.0
nios2                 randconfig-002-20240803   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240802   gcc-13.2.0
parisc                randconfig-001-20240803   gcc-13.2.0
parisc                randconfig-002-20240802   gcc-13.2.0
parisc                randconfig-002-20240803   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                      ep88xc_defconfig   clang-20
powerpc                        fsp2_defconfig   clang-20
powerpc                      katmai_defconfig   clang-20
powerpc                     ksi8560_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   clang-20
powerpc               mpc834x_itxgp_defconfig   clang-20
powerpc                      pcm030_defconfig   clang-20
powerpc               randconfig-001-20240802   gcc-13.2.0
powerpc               randconfig-001-20240803   gcc-13.2.0
powerpc               randconfig-003-20240802   gcc-13.2.0
powerpc               randconfig-003-20240803   gcc-13.2.0
powerpc                  storcenter_defconfig   gcc-13.2.0
powerpc                      tqm8xx_defconfig   clang-20
powerpc                        warp_defconfig   gcc-13.2.0
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64                        alldefconfig   clang-20
powerpc64             randconfig-001-20240802   gcc-13.2.0
powerpc64             randconfig-001-20240803   gcc-13.2.0
powerpc64             randconfig-002-20240802   gcc-13.2.0
powerpc64             randconfig-002-20240803   gcc-13.2.0
powerpc64             randconfig-003-20240802   gcc-13.2.0
powerpc64             randconfig-003-20240803   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240802   gcc-13.2.0
riscv                 randconfig-001-20240803   gcc-13.2.0
riscv                 randconfig-002-20240802   gcc-13.2.0
riscv                 randconfig-002-20240803   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240802   gcc-13.2.0
s390                  randconfig-001-20240803   gcc-13.2.0
s390                  randconfig-002-20240802   gcc-13.2.0
s390                  randconfig-002-20240803   gcc-13.2.0
s390                       zfcpdump_defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240802   gcc-13.2.0
sh                    randconfig-001-20240803   gcc-13.2.0
sh                    randconfig-002-20240802   gcc-13.2.0
sh                    randconfig-002-20240803   gcc-13.2.0
sh                          rsk7203_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240802   gcc-13.2.0
sparc64               randconfig-001-20240803   gcc-13.2.0
sparc64               randconfig-002-20240802   gcc-13.2.0
sparc64               randconfig-002-20240803   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240802   gcc-13.2.0
um                    randconfig-001-20240803   gcc-13.2.0
um                    randconfig-002-20240802   gcc-13.2.0
um                    randconfig-002-20240803   gcc-13.2.0
um                           x86_64_defconfig   clang-20
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240803   gcc-12
x86_64       buildonly-randconfig-002-20240803   gcc-12
x86_64       buildonly-randconfig-003-20240803   gcc-12
x86_64       buildonly-randconfig-004-20240803   gcc-12
x86_64       buildonly-randconfig-005-20240803   gcc-12
x86_64       buildonly-randconfig-006-20240803   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240803   gcc-12
x86_64                randconfig-002-20240803   gcc-12
x86_64                randconfig-003-20240803   gcc-12
x86_64                randconfig-004-20240803   gcc-12
x86_64                randconfig-005-20240803   gcc-12
x86_64                randconfig-006-20240803   gcc-12
x86_64                randconfig-011-20240803   gcc-12
x86_64                randconfig-012-20240803   gcc-12
x86_64                randconfig-013-20240803   gcc-12
x86_64                randconfig-014-20240803   gcc-12
x86_64                randconfig-015-20240803   gcc-12
x86_64                randconfig-016-20240803   gcc-12
x86_64                randconfig-071-20240803   gcc-12
x86_64                randconfig-072-20240803   gcc-12
x86_64                randconfig-073-20240803   gcc-12
x86_64                randconfig-074-20240803   gcc-12
x86_64                randconfig-075-20240803   gcc-12
x86_64                randconfig-076-20240803   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240802   gcc-13.2.0
xtensa                randconfig-001-20240803   gcc-13.2.0
xtensa                randconfig-002-20240802   gcc-13.2.0
xtensa                randconfig-002-20240803   gcc-13.2.0
xtensa                         virt_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

