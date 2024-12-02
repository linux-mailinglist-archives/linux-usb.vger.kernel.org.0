Return-Path: <linux-usb+bounces-17985-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E740B9DF8D7
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 03:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 221C3B20F81
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 02:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E6D18EAB;
	Mon,  2 Dec 2024 02:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fR3filKq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1ACF9E6
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 02:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733105449; cv=none; b=iJOE2De6XVE3oAwNeTS5TuTovhJcWjHnGY9aL+j09mXBJwcR8EbCBqMmwvdyqVHu8bAs7eb0jBTbsfVikNUqXIZe2jbpIoQVbxgvNtfUL+0Ufrv1vV2tRgWdzeM5bdV83hSWngfGVvogIsjGB//SHhI18em2LM3bXYiZgjbss8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733105449; c=relaxed/simple;
	bh=CZ6Li/V+9N/9xRauFydLKTnAmM+2LGX1HWImU9Ep3k8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eDKybyWvMSp1GR8etAbJJ3Q5E7GicW2IAWRKcncrChfFruccsQHafkGXkEb0sw2cqccFbYma7+revnn2nZuURJb0Awhcti/kV06Szi5/GU6srxhgDUixfTuPt2KooOFOUFhCmQ2hsawaUwCBFYtQSjWflol8AwkCbtnui+xgrl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fR3filKq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733105448; x=1764641448;
  h=date:from:to:cc:subject:message-id;
  bh=CZ6Li/V+9N/9xRauFydLKTnAmM+2LGX1HWImU9Ep3k8=;
  b=fR3filKqXIpe/5HP6SqWT0Aq8i2QI0xGMbs9NjX9lQ8nPNE6O7Ut+IDD
   PHMAAjWs+puZp9bNU22t2JdAy6s6diMyTVBfkgkupdlBFzImC/9vgijhC
   buWRCVCxJtAKTdtfdqFEoCKQJ3Ou9d4MOHkYRfsHM7NymLvYpEq6PESrg
   eua+khPTYyk28VGzVN2nDHml9S0vy8yQNi7o6Kd5efQfUL39tIXgvgN8p
   YuLYVpA0Ib7ZGAG980KzIaowBlwnYhTQ7gMmYzkXbs9lXrvXLfVtOw4V9
   /OSzQ6Qbq7B9RE0bvlTpC4LLREK3+cpcHU/aRXRiZdTYrKGkYbwRrO9V7
   A==;
X-CSE-ConnectionGUID: yQBJCPnmTW63ly/WO19eiA==
X-CSE-MsgGUID: R93oCsvpQciM0m8mLKQF/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44632072"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="44632072"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 18:10:47 -0800
X-CSE-ConnectionGUID: BdhzEpykQR+vq2KxbjlV9A==
X-CSE-MsgGUID: WcEVU7zMRWKyYjSp6awGJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97045022"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Dec 2024 18:10:46 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHvtb-000217-20;
	Mon, 02 Dec 2024 02:10:43 +0000
Date: Mon, 02 Dec 2024 10:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 a38f6bf588903069e185d4997acbcae69d41f39e
Message-ID: <202412021029.81VUxxD2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: a38f6bf588903069e185d4997acbcae69d41f39e  USB: disable all RNDIS protocol drivers

elapsed time: 721m

configs tested: 132
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    clang-20
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    clang-14
arc                   randconfig-001-20241201    gcc-13.2.0
arc                   randconfig-002-20241201    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-14
arm                          exynos_defconfig    clang-20
arm                           imxrt_defconfig    clang-20
arm                        mvebu_v5_defconfig    clang-20
arm                       netwinder_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241201    clang-20
arm                   randconfig-002-20241201    gcc-14.2.0
arm                   randconfig-003-20241201    clang-20
arm                   randconfig-004-20241201    clang-20
arm                           sunxi_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241201    clang-15
arm64                 randconfig-002-20241201    clang-20
arm64                 randconfig-003-20241201    gcc-14.2.0
arm64                 randconfig-004-20241201    clang-20
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241201    gcc-12
i386        buildonly-randconfig-002-20241201    clang-19
i386        buildonly-randconfig-003-20241201    clang-19
i386        buildonly-randconfig-004-20241201    gcc-12
i386        buildonly-randconfig-005-20241201    clang-19
i386        buildonly-randconfig-006-20241201    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    clang-14
m68k                       m5475evb_defconfig    clang-20
m68k                        mvme16x_defconfig    clang-20
m68k                        stmark2_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                           ip27_defconfig    clang-14
mips                           jazz_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-20
mips                        maltaup_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           alldefconfig    clang-14
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                    gamecube_defconfig    clang-20
powerpc                      katmai_defconfig    clang-20
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-20
powerpc                     skiroot_defconfig    clang-14
powerpc                    socrates_defconfig    clang-20
powerpc                     tqm8555_defconfig    clang-20
powerpc                         wii_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64                        alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                             i386_defconfig    clang-20
um                           x86_64_defconfig    clang-15
x86_64      buildonly-randconfig-001-20241201    clang-19
x86_64      buildonly-randconfig-002-20241201    gcc-12
x86_64      buildonly-randconfig-003-20241201    gcc-12
x86_64      buildonly-randconfig-004-20241201    clang-19
x86_64      buildonly-randconfig-005-20241201    clang-19
x86_64      buildonly-randconfig-006-20241201    gcc-12
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

