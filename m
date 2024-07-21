Return-Path: <linux-usb+bounces-12293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 735DF938360
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2024 07:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97C311C20A0F
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2024 05:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AE44400;
	Sun, 21 Jul 2024 05:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaYSOdgq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203C1FBA
	for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 05:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721538970; cv=none; b=POC6VbkaG3dDSK9n983OGcAQudxYURCEvzLzI0CGSJd8cMEpCOS2JyR/tlQIgIxiUN6OfQQApr6yBNEdDVFvWteAgruppc+LJjyCg+iFA5AbiJ6jxi9I+WxtDNhFb2O3hAKJlGIHNuhMXa3AjLxmioaXS641pl9+jrmqyLfISVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721538970; c=relaxed/simple;
	bh=oooNnXdN7MUv/eADzGa1p7KYA5RNBqURioFK9LQ5I6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VJATL2o9+R2VlBLGe4OKD50D7dIBpHAx1KjxEhSUTG1Pb3+fdH1xqWo/lAeoIisvH4UwdYmKSiXbWlp9y3R1U3r/c7AFyCfRypZPJCi4IoO1GOavZitSQfox3J4/cUxg4Vg6Hx6skSYZXONVXSHrpUUeVzBT5st2wGCRoDj7EFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaYSOdgq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721538968; x=1753074968;
  h=date:from:to:cc:subject:message-id;
  bh=oooNnXdN7MUv/eADzGa1p7KYA5RNBqURioFK9LQ5I6U=;
  b=gaYSOdgqHy9xotzsU4pDiToXaE3WwL4s3rzTDB0tdOpEL+UVzdecT9MA
   PDGJgDtfTJ95pttZ3Dbq7zSif4o9/lpKUNyVYTNJf4j/4ggfXS1JCm/Z5
   2zO88ZxYbs8rL/Z7Iek5OgdJjjoUwMv7YSDOScEQj40BIUGv/AV7cOuDl
   AZD2jzYZfDyYH6mp7U5cSYnLsP23UPTWShHfRv3jbeSlxtHTjEQVqbU7K
   ALBC1NsoAi1UqnhD4aCik4AaafvJrpo6PCVpWb0W69y1LAmzcvj9OIreR
   vDz+5TwXSJu5mUzIeeQ9tsSxjp/1ujMOMtx7gMAWiYX2gU/bruecwabab
   g==;
X-CSE-ConnectionGUID: QWRVk79QSxek3s98rmgAeg==
X-CSE-MsgGUID: MDwfu4CwRB6tx9zB5Qszxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="29785199"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="29785199"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 22:16:07 -0700
X-CSE-ConnectionGUID: LHnYyVPnSf26Uty50868PQ==
X-CSE-MsgGUID: VdpFMJ1WR3mBw/rkDhPTlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="88977931"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jul 2024 22:16:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVOvT-000jxK-1r;
	Sun, 21 Jul 2024 05:16:03 +0000
Date: Sun, 21 Jul 2024 13:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 0470c778e6779e54a45ac9f21f1f703361630e19
Message-ID: <202407211319.IZi0Xlhu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 0470c778e6779e54a45ac9f21f1f703361630e19  USB: disable all RNDIS protocol drivers

elapsed time: 1346m

configs tested: 288
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240720   gcc-13.2.0
arc                   randconfig-001-20240721   gcc-13.2.0
arc                   randconfig-002-20240720   gcc-13.2.0
arc                   randconfig-002-20240721   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                     am200epdkit_defconfig   gcc-14.1.0
arm                       aspeed_g4_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                       multi_v4t_defconfig   clang-19
arm                        multi_v7_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                             mxs_defconfig   gcc-14.1.0
arm                   randconfig-001-20240720   clang-15
arm                   randconfig-001-20240721   gcc-13.2.0
arm                   randconfig-002-20240720   gcc-14.1.0
arm                   randconfig-002-20240721   gcc-13.2.0
arm                   randconfig-003-20240720   gcc-14.1.0
arm                   randconfig-003-20240721   gcc-13.2.0
arm                   randconfig-004-20240720   gcc-14.1.0
arm                   randconfig-004-20240721   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-14.1.0
arm                           sama5_defconfig   gcc-13.2.0
arm                           u8500_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240720   gcc-14.1.0
arm64                 randconfig-001-20240721   gcc-13.2.0
arm64                 randconfig-002-20240720   clang-17
arm64                 randconfig-002-20240721   gcc-13.2.0
arm64                 randconfig-003-20240720   gcc-14.1.0
arm64                 randconfig-003-20240721   gcc-13.2.0
arm64                 randconfig-004-20240720   clang-19
arm64                 randconfig-004-20240721   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240720   gcc-14.1.0
csky                  randconfig-001-20240721   gcc-13.2.0
csky                  randconfig-002-20240720   gcc-14.1.0
csky                  randconfig-002-20240721   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240720   clang-16
hexagon               randconfig-002-20240720   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240720   clang-18
i386         buildonly-randconfig-002-20240720   gcc-13
i386         buildonly-randconfig-003-20240720   gcc-13
i386         buildonly-randconfig-004-20240720   clang-18
i386         buildonly-randconfig-005-20240720   clang-18
i386         buildonly-randconfig-006-20240720   gcc-11
i386                                defconfig   clang-18
i386                  randconfig-001-20240720   gcc-7
i386                  randconfig-002-20240720   clang-18
i386                  randconfig-003-20240720   clang-18
i386                  randconfig-004-20240720   clang-18
i386                  randconfig-005-20240720   gcc-13
i386                  randconfig-006-20240720   gcc-11
i386                  randconfig-011-20240720   gcc-13
i386                  randconfig-012-20240720   gcc-13
i386                  randconfig-013-20240720   gcc-13
i386                  randconfig-014-20240720   gcc-13
i386                  randconfig-015-20240720   gcc-12
i386                  randconfig-016-20240720   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240720   gcc-14.1.0
loongarch             randconfig-001-20240721   gcc-13.2.0
loongarch             randconfig-002-20240720   gcc-14.1.0
loongarch             randconfig-002-20240721   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-14.1.0
m68k                       m5275evb_defconfig   gcc-14.1.0
m68k                        m5407c3_defconfig   gcc-14.1.0
m68k                            mac_defconfig   gcc-14.1.0
m68k                          sun3x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath25_defconfig   gcc-13.2.0
mips                          ath25_defconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   gcc-14.1.0
mips                           ci20_defconfig   clang-19
mips                           gcw0_defconfig   gcc-13.2.0
mips                           mtx1_defconfig   gcc-14.1.0
mips                        omega2p_defconfig   clang-19
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240720   gcc-14.1.0
nios2                 randconfig-001-20240721   gcc-13.2.0
nios2                 randconfig-002-20240720   gcc-14.1.0
nios2                 randconfig-002-20240721   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240720   gcc-14.1.0
parisc                randconfig-001-20240721   gcc-13.2.0
parisc                randconfig-002-20240720   gcc-14.1.0
parisc                randconfig-002-20240721   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   gcc-14.1.0
powerpc                     ep8248e_defconfig   gcc-14.1.0
powerpc                 mpc837x_rdb_defconfig   gcc-14.1.0
powerpc                     mpc83xx_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240720   clang-19
powerpc               randconfig-001-20240721   gcc-13.2.0
powerpc               randconfig-002-20240720   clang-19
powerpc               randconfig-002-20240721   gcc-13.2.0
powerpc               randconfig-003-20240720   gcc-14.1.0
powerpc               randconfig-003-20240721   gcc-13.2.0
powerpc                    sam440ep_defconfig   gcc-14.1.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   clang-19
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-14.1.0
powerpc                     tqm8560_defconfig   gcc-14.1.0
powerpc                      tqm8xx_defconfig   clang-19
powerpc64             randconfig-001-20240720   clang-19
powerpc64             randconfig-001-20240721   gcc-13.2.0
powerpc64             randconfig-002-20240720   clang-19
powerpc64             randconfig-002-20240721   gcc-13.2.0
powerpc64             randconfig-003-20240720   gcc-14.1.0
powerpc64             randconfig-003-20240721   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-19
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240720   clang-19
riscv                 randconfig-001-20240721   gcc-13.2.0
riscv                 randconfig-002-20240720   gcc-14.1.0
riscv                 randconfig-002-20240721   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240720   gcc-14.1.0
s390                  randconfig-001-20240721   gcc-13.2.0
s390                  randconfig-002-20240720   clang-15
s390                  randconfig-002-20240721   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-13.2.0
sh                        apsh4ad0a_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-14.1.0
sh                            migor_defconfig   gcc-14.1.0
sh                          r7780mp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240720   gcc-14.1.0
sh                    randconfig-001-20240721   gcc-13.2.0
sh                    randconfig-002-20240720   gcc-14.1.0
sh                    randconfig-002-20240721   gcc-13.2.0
sh                           se7750_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                          urquell_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240720   gcc-14.1.0
sparc64               randconfig-001-20240721   gcc-13.2.0
sparc64               randconfig-002-20240720   gcc-14.1.0
sparc64               randconfig-002-20240721   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-19
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240720   gcc-13
um                    randconfig-001-20240721   gcc-13.2.0
um                    randconfig-002-20240720   clang-15
um                    randconfig-002-20240721   gcc-13.2.0
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240720   clang-18
x86_64       buildonly-randconfig-001-20240721   clang-18
x86_64       buildonly-randconfig-002-20240720   gcc-13
x86_64       buildonly-randconfig-002-20240721   clang-18
x86_64       buildonly-randconfig-003-20240720   clang-18
x86_64       buildonly-randconfig-003-20240721   clang-18
x86_64       buildonly-randconfig-004-20240720   clang-18
x86_64       buildonly-randconfig-004-20240721   clang-18
x86_64       buildonly-randconfig-005-20240720   gcc-13
x86_64       buildonly-randconfig-005-20240721   clang-18
x86_64       buildonly-randconfig-006-20240720   gcc-13
x86_64       buildonly-randconfig-006-20240721   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240720   clang-18
x86_64                randconfig-001-20240721   clang-18
x86_64                randconfig-002-20240720   gcc-13
x86_64                randconfig-002-20240721   clang-18
x86_64                randconfig-003-20240720   clang-18
x86_64                randconfig-003-20240721   clang-18
x86_64                randconfig-004-20240720   clang-18
x86_64                randconfig-004-20240721   clang-18
x86_64                randconfig-005-20240720   clang-18
x86_64                randconfig-005-20240721   clang-18
x86_64                randconfig-006-20240720   gcc-13
x86_64                randconfig-006-20240721   clang-18
x86_64                randconfig-011-20240720   gcc-13
x86_64                randconfig-011-20240721   clang-18
x86_64                randconfig-012-20240720   clang-18
x86_64                randconfig-012-20240721   clang-18
x86_64                randconfig-013-20240720   gcc-13
x86_64                randconfig-013-20240721   clang-18
x86_64                randconfig-014-20240720   clang-18
x86_64                randconfig-014-20240721   clang-18
x86_64                randconfig-015-20240720   gcc-13
x86_64                randconfig-015-20240721   clang-18
x86_64                randconfig-016-20240720   gcc-13
x86_64                randconfig-016-20240721   clang-18
x86_64                randconfig-071-20240720   clang-18
x86_64                randconfig-071-20240721   clang-18
x86_64                randconfig-072-20240720   gcc-13
x86_64                randconfig-072-20240721   clang-18
x86_64                randconfig-073-20240720   gcc-13
x86_64                randconfig-073-20240721   clang-18
x86_64                randconfig-074-20240720   gcc-9
x86_64                randconfig-074-20240721   clang-18
x86_64                randconfig-075-20240720   gcc-13
x86_64                randconfig-075-20240721   clang-18
x86_64                randconfig-076-20240720   clang-18
x86_64                randconfig-076-20240721   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240720   gcc-14.1.0
xtensa                randconfig-001-20240721   gcc-13.2.0
xtensa                randconfig-002-20240720   gcc-14.1.0
xtensa                randconfig-002-20240721   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

