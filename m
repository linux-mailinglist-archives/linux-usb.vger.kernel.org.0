Return-Path: <linux-usb+bounces-12840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C09839448A5
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 11:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E5081F29094
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 09:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D88F16FF39;
	Thu,  1 Aug 2024 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lgile9nR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D6AEEB3
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505289; cv=none; b=LDftskXRPkOtpL45/AHLGe9915Nes/puNlaeY9UOJyc3O8MIjJTSTkR+Uz8pA6rsCyJ3bgWcQBJP573+UfvwP93bzRXkwgut3xJGAM41qiD6xuh8V6q3cBcrI7mmuujCAg3il3oEsd4/Z86e3sRcrRgILghL4E9cXXrWsExmQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505289; c=relaxed/simple;
	bh=qgRCw1fcxwm62V7QEQWthn0FhZL/5tKb3HufKI9l6T8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=URDGbYU+Brl+FQm1p+qYdMzyoUCDOpmiCOmLZqzyUG+dlOQhp82R/b1y0ZhcENLFL+evTyrjsMN0deXnPle1C2nwFDhJomIGhYyoPgRFMwE0Teqj3fYi2rQWLxI7kknHXrTn9wG0sIEwA/MG2PcvaiCP71Q/obC0h84idyGuYCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lgile9nR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722505287; x=1754041287;
  h=date:from:to:cc:subject:message-id;
  bh=qgRCw1fcxwm62V7QEQWthn0FhZL/5tKb3HufKI9l6T8=;
  b=Lgile9nRnKqwnzeSjPdVaTajcgz6FjwyvAISHqzvzCdzXFTGZ058sYSu
   F+w7UuOlPUlE4WUBXjZviQbKzOyT+diHjFUoiBRLmoWv+pLiwrXbKIGMo
   kEV2MOgZgG8OnTK0skw8HvzeVj8GwOQfMISkARMb9qlmnrItCyAMk6M7E
   /G64YUnq7xYne6DE1HYwwUXan0Q3jNEBYMq4y7AFNZtWoDyS2F6C0z/dQ
   YUEwTpRHK7bDvdGpA9+AInhuz8yraK46bY7GMi6oTi5bd219kpOPlOAZa
   md5iaPuhlTvDPneZ2KcjI4V9UDjzAFmOVOtl7RujR/+jzMB5xYkayK7mf
   A==;
X-CSE-ConnectionGUID: OlpCmP0bR5SBei9ZGrSR0w==
X-CSE-MsgGUID: vBG4vOS3RBeousTAatjw+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20131583"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20131583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:41:27 -0700
X-CSE-ConnectionGUID: C7qPDYT2SPy6G15NuYqGkQ==
X-CSE-MsgGUID: ab0M08/zSn+RvV2cMRXAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="54954456"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Aug 2024 02:41:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZSJH-000vQR-0k;
	Thu, 01 Aug 2024 09:41:23 +0000
Date: Thu, 01 Aug 2024 17:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 b1dad2f091382b0049c72dab8153779248fa8016
Message-ID: <202408011703.8LLYDtg3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: b1dad2f091382b0049c72dab8153779248fa8016  usb: typec: tipd: Delete extra semi-colon

elapsed time: 1452m

configs tested: 221
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240801   gcc-13.2.0
arc                   randconfig-002-20240801   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-14.1.0
arm                             pxa_defconfig   gcc-14.1.0
arm                   randconfig-001-20240801   gcc-13.2.0
arm                   randconfig-002-20240801   gcc-13.2.0
arm                   randconfig-003-20240801   gcc-13.2.0
arm                   randconfig-004-20240801   gcc-13.2.0
arm                          sp7021_defconfig   clang-20
arm                          sp7021_defconfig   gcc-13.2.0
arm                        spear3xx_defconfig   clang-16
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240801   gcc-13.2.0
arm64                 randconfig-002-20240801   gcc-13.2.0
arm64                 randconfig-003-20240801   gcc-13.2.0
arm64                 randconfig-004-20240801   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240801   gcc-13.2.0
csky                  randconfig-002-20240801   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-001-20240801   gcc-9
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-002-20240801   gcc-9
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-003-20240801   gcc-9
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-004-20240801   gcc-9
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-005-20240801   gcc-9
i386         buildonly-randconfig-006-20240731   clang-18
i386         buildonly-randconfig-006-20240801   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-001-20240801   gcc-9
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-002-20240801   gcc-9
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-003-20240801   gcc-9
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-004-20240801   gcc-9
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-005-20240801   gcc-9
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-006-20240801   gcc-9
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-011-20240801   gcc-9
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-012-20240801   gcc-9
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-013-20240801   gcc-9
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-014-20240801   gcc-9
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-015-20240801   gcc-9
i386                  randconfig-016-20240731   clang-18
i386                  randconfig-016-20240801   gcc-9
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240801   gcc-13.2.0
loongarch             randconfig-002-20240801   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                          atari_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                        bcm47xx_defconfig   clang-16
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-14.1.0
mips                     loongson1b_defconfig   clang-16
mips                     loongson1c_defconfig   clang-20
mips                          malta_defconfig   clang-20
mips                        maltaup_defconfig   gcc-14.1.0
mips                           mtx1_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240801   gcc-13.2.0
nios2                 randconfig-002-20240801   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240801   gcc-13.2.0
parisc                randconfig-002-20240801   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   clang-20
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                       holly_defconfig   gcc-13.2.0
powerpc                  iss476-smp_defconfig   clang-20
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig   clang-16
powerpc                  mpc866_ads_defconfig   clang-16
powerpc                      pcm030_defconfig   clang-16
powerpc                      pcm030_defconfig   gcc-14.1.0
powerpc                         ps3_defconfig   clang-16
powerpc               randconfig-001-20240801   gcc-13.2.0
powerpc               randconfig-002-20240801   gcc-13.2.0
powerpc               randconfig-003-20240801   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                  storcenter_defconfig   clang-16
powerpc                  storcenter_defconfig   clang-20
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8548_defconfig   clang-20
powerpc                         wii_defconfig   clang-16
powerpc64             randconfig-001-20240801   gcc-13.2.0
powerpc64             randconfig-002-20240801   gcc-13.2.0
powerpc64             randconfig-003-20240801   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-16
riscv                    nommu_virt_defconfig   clang-16
riscv                 randconfig-001-20240801   gcc-13.2.0
riscv                 randconfig-002-20240801   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240801   gcc-13.2.0
s390                  randconfig-002-20240801   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         apsh4a3a_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                    randconfig-001-20240801   gcc-13.2.0
sh                    randconfig-002-20240801   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-14.1.0
sh                           se7751_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240801   gcc-13.2.0
sparc64               randconfig-002-20240801   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240801   gcc-13.2.0
um                    randconfig-002-20240801   gcc-13.2.0
um                           x86_64_defconfig   clang-20
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240801   clang-18
x86_64       buildonly-randconfig-002-20240801   clang-18
x86_64       buildonly-randconfig-003-20240801   clang-18
x86_64       buildonly-randconfig-004-20240801   clang-18
x86_64       buildonly-randconfig-005-20240801   clang-18
x86_64       buildonly-randconfig-006-20240801   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240801   clang-18
x86_64                randconfig-002-20240801   clang-18
x86_64                randconfig-003-20240801   clang-18
x86_64                randconfig-004-20240801   clang-18
x86_64                randconfig-005-20240801   clang-18
x86_64                randconfig-006-20240801   clang-18
x86_64                randconfig-011-20240801   clang-18
x86_64                randconfig-012-20240801   clang-18
x86_64                randconfig-013-20240801   clang-18
x86_64                randconfig-014-20240801   clang-18
x86_64                randconfig-015-20240801   clang-18
x86_64                randconfig-016-20240801   clang-18
x86_64                randconfig-071-20240801   clang-18
x86_64                randconfig-072-20240801   clang-18
x86_64                randconfig-073-20240801   clang-18
x86_64                randconfig-074-20240801   clang-18
x86_64                randconfig-075-20240801   clang-18
x86_64                randconfig-076-20240801   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                           alldefconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240801   gcc-13.2.0
xtensa                randconfig-002-20240801   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

