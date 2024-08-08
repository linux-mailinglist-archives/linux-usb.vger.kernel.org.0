Return-Path: <linux-usb+bounces-13221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9F94B6EA
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 08:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86881285420
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 06:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088A7186289;
	Thu,  8 Aug 2024 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4IosIkc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33845228
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 06:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723099672; cv=none; b=WJ3HkMeM/woFvupMl1juNgT0+xVOtCeF5CVZC8O8Xp/NHaranjjc4dNg4ijFx7T5HJueuozfr0WUto13/Lzz6piolw+QD+FDFFe5CsFMc3+p4up/l8lG/EZHldOJOHdmnKIF8swv0mL93krumDqU0mYnzVrpuWXELLkiY9N/NAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723099672; c=relaxed/simple;
	bh=jA0y7WxGp89bt04WkwQMCd+z0rFDINSuXg1WNk0GKLU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FmmvMX63O3rlw2CNKdSHKXGaN7kgFMiFm/gxMP9CdV4JZxDInLXfywW4S6fctwy7lFfyD2etetoadbpk+COfmtGSADCYF++2CTStNdCA4PTVWJN6ysoPNaM6JCLvfXgw/Dd2/xXcpYzQsUBs87c2jj4j15DqkjeenK7m411oMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4IosIkc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723099670; x=1754635670;
  h=date:from:to:cc:subject:message-id;
  bh=jA0y7WxGp89bt04WkwQMCd+z0rFDINSuXg1WNk0GKLU=;
  b=A4IosIkcP3RDaIaVsW3C+/JHLxxd7yNu+7nWdzVQy7G0/Or4z2Dp+aOh
   tGCMDC9UDd4f9i7K8fJD5+rJ+f/4kZ++QMT/w/XYJ+5QRScY5UZAruW7d
   Ahsw1aakBk4tkAnLgkSbJVbAkJIejpX8tgd8gfiWLCs3Yh2nA3pxejaVD
   KLFE4yWjU0tFh4y4E6a84nUk4YbTxFycYvhxdp9Ymg4EQ5iwwr5GBz/G+
   vxyBCUuyrDoM1h2uof9UtNY7c2/PmOe2TbjmOnegBDmBIfQcwq2zt0kTL
   y4rDvANxsORv2zkCVsmgn7otzs6ghdH7dwo59FUPuaSkkkmySR659ZMsB
   g==;
X-CSE-ConnectionGUID: X104e+7FRA64Z8J1WaG0Sw==
X-CSE-MsgGUID: vsSB4f+RQQelwXK0aE2lDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43726582"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="43726582"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 23:47:50 -0700
X-CSE-ConnectionGUID: h3Q0th8oQ8mJycbkOFQBGQ==
X-CSE-MsgGUID: 4yw4RROIS+2Im2ilGpNV7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57080772"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2024 23:47:49 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbww6-0005zW-2Y;
	Thu, 08 Aug 2024 06:47:46 +0000
Date: Thu, 08 Aug 2024 14:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 65ba8cef0416816b912c04850fc2468329994353
Message-ID: <202408081414.luti3XK2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 65ba8cef0416816b912c04850fc2468329994353  usb: typec: ucsi: Fix a deadlock in ucsi_send_command_common()

elapsed time: 1124m

configs tested: 219
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240808   gcc-13.2.0
arc                   randconfig-002-20240808   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          moxart_defconfig   gcc-14.1.0
arm                        neponset_defconfig   gcc-13.2.0
arm                   randconfig-001-20240808   gcc-13.2.0
arm                   randconfig-002-20240808   gcc-13.2.0
arm                   randconfig-003-20240808   gcc-13.2.0
arm                   randconfig-004-20240808   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                           stm32_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240808   gcc-13.2.0
arm64                 randconfig-002-20240808   gcc-13.2.0
arm64                 randconfig-003-20240808   gcc-13.2.0
arm64                 randconfig-004-20240808   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240808   gcc-13.2.0
csky                  randconfig-002-20240808   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             alldefconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240807   clang-18
i386         buildonly-randconfig-001-20240808   clang-18
i386         buildonly-randconfig-002-20240807   clang-18
i386         buildonly-randconfig-002-20240808   clang-18
i386         buildonly-randconfig-003-20240807   gcc-12
i386         buildonly-randconfig-003-20240808   clang-18
i386         buildonly-randconfig-004-20240807   clang-18
i386         buildonly-randconfig-004-20240808   clang-18
i386         buildonly-randconfig-005-20240807   clang-18
i386         buildonly-randconfig-005-20240808   clang-18
i386         buildonly-randconfig-006-20240807   gcc-12
i386         buildonly-randconfig-006-20240808   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240807   gcc-12
i386                  randconfig-001-20240808   clang-18
i386                  randconfig-002-20240807   clang-18
i386                  randconfig-002-20240808   clang-18
i386                  randconfig-003-20240807   clang-18
i386                  randconfig-003-20240808   clang-18
i386                  randconfig-004-20240807   gcc-12
i386                  randconfig-004-20240808   clang-18
i386                  randconfig-005-20240807   gcc-12
i386                  randconfig-005-20240808   clang-18
i386                  randconfig-006-20240807   clang-18
i386                  randconfig-006-20240808   clang-18
i386                  randconfig-011-20240807   clang-18
i386                  randconfig-011-20240808   clang-18
i386                  randconfig-012-20240807   gcc-11
i386                  randconfig-012-20240808   clang-18
i386                  randconfig-013-20240807   clang-18
i386                  randconfig-013-20240808   clang-18
i386                  randconfig-014-20240807   clang-18
i386                  randconfig-014-20240808   clang-18
i386                  randconfig-015-20240807   clang-18
i386                  randconfig-015-20240808   clang-18
i386                  randconfig-016-20240807   gcc-12
i386                  randconfig-016-20240808   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240808   gcc-13.2.0
loongarch             randconfig-002-20240808   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-14.1.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                        bcm47xx_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-14.1.0
mips                     decstation_defconfig   gcc-14.1.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
mips                   sb1250_swarm_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240808   gcc-13.2.0
nios2                 randconfig-002-20240808   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240808   gcc-13.2.0
parisc                randconfig-002-20240808   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240808   gcc-13.2.0
powerpc               randconfig-002-20240808   gcc-13.2.0
powerpc                     skiroot_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240808   gcc-13.2.0
powerpc64             randconfig-002-20240808   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240808   gcc-13.2.0
riscv                 randconfig-002-20240808   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240808   gcc-13.2.0
s390                  randconfig-002-20240808   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240808   gcc-13.2.0
sh                    randconfig-002-20240808   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-14.1.0
sh                           se7705_defconfig   gcc-14.1.0
sh                           se7721_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240808   gcc-13.2.0
sparc64               randconfig-002-20240808   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240808   gcc-13.2.0
um                    randconfig-002-20240808   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240808   gcc-12
x86_64       buildonly-randconfig-002-20240808   gcc-12
x86_64       buildonly-randconfig-003-20240808   gcc-12
x86_64       buildonly-randconfig-004-20240808   gcc-12
x86_64       buildonly-randconfig-005-20240808   gcc-12
x86_64       buildonly-randconfig-006-20240808   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240808   gcc-12
x86_64                randconfig-002-20240808   gcc-12
x86_64                randconfig-003-20240808   gcc-12
x86_64                randconfig-004-20240808   gcc-12
x86_64                randconfig-005-20240808   gcc-12
x86_64                randconfig-006-20240808   gcc-12
x86_64                randconfig-011-20240808   gcc-12
x86_64                randconfig-012-20240808   gcc-12
x86_64                randconfig-013-20240808   gcc-12
x86_64                randconfig-014-20240808   gcc-12
x86_64                randconfig-015-20240808   gcc-12
x86_64                randconfig-016-20240808   gcc-12
x86_64                randconfig-071-20240808   gcc-12
x86_64                randconfig-072-20240808   gcc-12
x86_64                randconfig-073-20240808   gcc-12
x86_64                randconfig-074-20240808   gcc-12
x86_64                randconfig-075-20240808   gcc-12
x86_64                randconfig-076-20240808   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240808   gcc-13.2.0
xtensa                randconfig-002-20240808   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

