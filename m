Return-Path: <linux-usb+bounces-12033-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F539291B0
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2024 10:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 774EF1C20FD9
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2024 08:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38B43D982;
	Sat,  6 Jul 2024 08:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXlSEwLc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A312E71
	for <linux-usb@vger.kernel.org>; Sat,  6 Jul 2024 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720252957; cv=none; b=EFA+OZ/A/4HZmQ+8VdkNns7leqPfGAlPfJbJ+rmx1qPtIEvvaMsaCUfxnvjlqy4gxKWscit1EjvEH8ShcPlvy7xNI9um9G9k6+XQiOHVPkrWryhmuD5Oj8myLnDo4p1aPH1yi3sNMZOx+MbZjCFGww1UYqW6JQWSqyqdd3ATtFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720252957; c=relaxed/simple;
	bh=mI9RBblyxYvR0Cu1bgrDPEuXhY8OUSeyiL0QSxlQ7iE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FOABpHikOmF9FGCXMXSbkiDhTBu37i6yFwj4W2DvP1f9vGrxTDdiVa2U7mx09UF/aZiuVBCAZmE+qdSQkwe7PLYNEidM9MgRnYcNoSEf5gA/kxHkW7V5LNvWfFG7MYGhNNMSGvzKiQUoz80+b8rbHbjgvv+MGmIu1IjxN+yIRfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXlSEwLc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720252954; x=1751788954;
  h=date:from:to:cc:subject:message-id;
  bh=mI9RBblyxYvR0Cu1bgrDPEuXhY8OUSeyiL0QSxlQ7iE=;
  b=bXlSEwLcSeUDbzFurylbJAY2RX8x8ZvZScguJT1DWH+ctx83WKCl//1Z
   7g8oPOyuPBQdnGHFC9QdwdLr49bDfpCYvPrYkrY57X5u7eVkw/ivLVFG+
   YSwWWvau7ItKRrPf/liQZgvnM/95j632hs6mlIsgb+o+2/Jyjs89MjSKF
   DYv2zGvz5ZA6HRcZalzKF7KQwMaA6DMcEOoflzivYC96CcAawouHfYFAq
   vZtax+FNZBywXYJWmcuJPAe45fy8Ny66HYua6wMV2Nz84IF9o2EpFGOtO
   gBVY5vCM+BjIJhzz1x4iSrJyUq9jkOpnoAAOtoYu3rHwFMqHIaNIktTEB
   Q==;
X-CSE-ConnectionGUID: ipRD5qiUTre6LQoSdxVzVg==
X-CSE-MsgGUID: bC4B3hDNTqaDbUM9jmwHkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17656639"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="17656639"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 01:02:33 -0700
X-CSE-ConnectionGUID: qf5KMscxSQujQ0Us1TbSUg==
X-CSE-MsgGUID: 19p/HeLATQG+wnuvGb88AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="46817184"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jul 2024 01:02:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ0NK-000TUK-1w;
	Sat, 06 Jul 2024 08:02:30 +0000
Date: Sat, 06 Jul 2024 16:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 6d3c721e686ea6c59e18289b400cc95c76e927e0
Message-ID: <202407061607.dtkLqeOD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 6d3c721e686ea6c59e18289b400cc95c76e927e0  usb: gadget: configfs: Prevent OOB read/write in usb_string_copy()

elapsed time: 1399m

configs tested: 250
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240706   gcc-13.2.0
arc                   randconfig-002-20240706   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                       multi_v4t_defconfig   gcc-13.2.0
arm                   randconfig-001-20240706   gcc-13.2.0
arm                   randconfig-002-20240706   gcc-13.2.0
arm                   randconfig-003-20240706   gcc-13.2.0
arm                   randconfig-004-20240706   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm                          sp7021_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240706   gcc-13.2.0
arm64                 randconfig-002-20240706   gcc-13.2.0
arm64                 randconfig-003-20240706   clang-16
arm64                 randconfig-003-20240706   gcc-13.2.0
arm64                 randconfig-004-20240706   clang-19
arm64                 randconfig-004-20240706   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240706   gcc-13.2.0
csky                  randconfig-002-20240706   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240706   clang-19
hexagon               randconfig-002-20240706   clang-15
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240705   gcc-13
i386         buildonly-randconfig-001-20240706   clang-18
i386         buildonly-randconfig-002-20240705   gcc-9
i386         buildonly-randconfig-002-20240706   clang-18
i386         buildonly-randconfig-003-20240705   gcc-11
i386         buildonly-randconfig-003-20240706   clang-18
i386         buildonly-randconfig-004-20240705   clang-18
i386         buildonly-randconfig-004-20240706   clang-18
i386         buildonly-randconfig-005-20240705   clang-18
i386         buildonly-randconfig-005-20240706   clang-18
i386         buildonly-randconfig-006-20240705   clang-18
i386         buildonly-randconfig-006-20240706   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240705   gcc-13
i386                  randconfig-001-20240706   clang-18
i386                  randconfig-002-20240705   clang-18
i386                  randconfig-002-20240706   clang-18
i386                  randconfig-003-20240705   gcc-11
i386                  randconfig-003-20240706   clang-18
i386                  randconfig-004-20240705   gcc-13
i386                  randconfig-004-20240706   clang-18
i386                  randconfig-005-20240705   clang-18
i386                  randconfig-005-20240706   clang-18
i386                  randconfig-006-20240705   clang-18
i386                  randconfig-006-20240706   clang-18
i386                  randconfig-011-20240705   gcc-13
i386                  randconfig-011-20240706   clang-18
i386                  randconfig-012-20240705   gcc-13
i386                  randconfig-012-20240706   clang-18
i386                  randconfig-013-20240705   clang-18
i386                  randconfig-013-20240706   clang-18
i386                  randconfig-014-20240705   gcc-8
i386                  randconfig-014-20240706   clang-18
i386                  randconfig-015-20240705   gcc-10
i386                  randconfig-015-20240706   clang-18
i386                  randconfig-016-20240705   clang-18
i386                  randconfig-016-20240706   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240706   gcc-13.2.0
loongarch             randconfig-002-20240706   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          amiga_defconfig   gcc-13.2.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-13.2.0
mips                  decstation_64_defconfig   gcc-13.2.0
mips                      fuloong2e_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-13.2.0
mips                      loongson3_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                       rbtx49xx_defconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240706   gcc-13.2.0
nios2                 randconfig-002-20240706   gcc-13.2.0
openrisc                         allmodconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                    or1ksim_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240706   gcc-13.2.0
parisc                randconfig-002-20240706   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-13.2.0
powerpc                     asp8347_defconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   gcc-13.2.0
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240706   gcc-13.2.0
powerpc               randconfig-002-20240706   gcc-13.2.0
powerpc               randconfig-003-20240706   clang-19
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240706   gcc-13.2.0
powerpc64             randconfig-002-20240706   gcc-13.2.0
powerpc64             randconfig-003-20240706   clang-19
powerpc64             randconfig-003-20240706   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240706   gcc-13.2.0
riscv                 randconfig-002-20240706   gcc-13.2.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240706   gcc-13.2.0
s390                  randconfig-002-20240706   clang-19
s390                  randconfig-002-20240706   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                ecovec24-romimage_defconfig   gcc-13.2.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                          r7785rp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240706   gcc-13.2.0
sh                    randconfig-002-20240706   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7722_defconfig   gcc-13.2.0
sh                           se7724_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                        sh7785lcr_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                            allyesconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240706   gcc-13.2.0
sparc64               randconfig-002-20240706   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240706   clang-19
um                    randconfig-001-20240706   gcc-13.2.0
um                    randconfig-002-20240706   gcc-13
um                    randconfig-002-20240706   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240706   clang-18
x86_64       buildonly-randconfig-002-20240706   clang-18
x86_64       buildonly-randconfig-003-20240706   clang-18
x86_64       buildonly-randconfig-004-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   gcc-13
x86_64       buildonly-randconfig-006-20240706   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240706   clang-18
x86_64                randconfig-001-20240706   gcc-9
x86_64                randconfig-002-20240706   clang-18
x86_64                randconfig-003-20240706   clang-18
x86_64                randconfig-004-20240706   clang-18
x86_64                randconfig-005-20240706   clang-18
x86_64                randconfig-006-20240706   clang-18
x86_64                randconfig-011-20240706   clang-18
x86_64                randconfig-012-20240706   clang-18
x86_64                randconfig-013-20240706   clang-18
x86_64                randconfig-014-20240706   clang-18
x86_64                randconfig-015-20240706   clang-18
x86_64                randconfig-016-20240706   clang-18
x86_64                randconfig-071-20240706   clang-18
x86_64                randconfig-072-20240706   clang-18
x86_64                randconfig-073-20240706   clang-18
x86_64                randconfig-074-20240706   clang-18
x86_64                randconfig-075-20240706   clang-18
x86_64                randconfig-076-20240706   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                           allyesconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240706   gcc-13.2.0
xtensa                randconfig-002-20240706   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

