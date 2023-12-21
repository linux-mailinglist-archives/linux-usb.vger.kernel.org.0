Return-Path: <linux-usb+bounces-4481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387981AFFB
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 09:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 088D2282F22
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 08:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04DE156E4;
	Thu, 21 Dec 2023 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVqi4QgZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002815AC3
	for <linux-usb@vger.kernel.org>; Thu, 21 Dec 2023 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703145942; x=1734681942;
  h=date:from:to:cc:subject:message-id;
  bh=x0yUTrbwn+Lt8xJi/MOG3MxNfZixDBGRtZPnYaklxNg=;
  b=RVqi4QgZU9XdJKnOw/sy8P2Zbgzzu8UgFGcQWIt5hBKqPXTv0IEjGoPK
   EEyQqe9nYlOmKB/iCPvhm10eo6QvHhd69gwv9W1qmqbVbGnTVWSVqjYQf
   JRSLc99fk0hg5rIcR1tgVGO34+kobqD41NDGsfgnkqcS0T8A0w1LsONJK
   eeq7D1Gu9yaRE/yRISkhmj3kHnV4FMmRoVks5maVRZP+OegnaaaiVLsdU
   F7iRoEJrb3mrxgiqoQNrYiUAY1/xMKxWo4kxRF0UbWw+YO31dATraRuZD
   kR6qqFu5ybfQHn96jZ9/0C3pDU6S3LcdVJfzxRDCCNLkokfoZD5lCUEqW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="395666512"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="395666512"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 00:05:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805531589"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="805531589"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Dec 2023 00:05:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGE3d-00087K-1v;
	Thu, 21 Dec 2023 08:05:29 +0000
Date: Thu, 21 Dec 2023 16:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8be0c877fb3b671dac0cf56d1f1f9e65f9a9fb81
Message-ID: <202312211608.ghm1Lf2k-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 8be0c877fb3b671dac0cf56d1f1f9e65f9a9fb81  thunderbolt: make tb_bus_type const

elapsed time: 1462m

configs tested: 177
configs skipped: 2

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
arc                   randconfig-001-20231221   gcc  
arc                   randconfig-002-20231221   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   clang
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20231221   clang
arm                   randconfig-002-20231221   clang
arm                   randconfig-003-20231221   clang
arm                   randconfig-004-20231221   clang
arm                        vexpress_defconfig   clang
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231221   clang
arm64                 randconfig-002-20231221   clang
arm64                 randconfig-003-20231221   clang
arm64                 randconfig-004-20231221   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231221   gcc  
csky                  randconfig-002-20231221   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231221   clang
hexagon               randconfig-002-20231221   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231220   gcc  
i386         buildonly-randconfig-002-20231220   gcc  
i386         buildonly-randconfig-003-20231220   gcc  
i386         buildonly-randconfig-004-20231220   gcc  
i386         buildonly-randconfig-005-20231220   gcc  
i386         buildonly-randconfig-006-20231220   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231220   gcc  
i386                  randconfig-002-20231220   gcc  
i386                  randconfig-003-20231220   gcc  
i386                  randconfig-004-20231220   gcc  
i386                  randconfig-005-20231220   gcc  
i386                  randconfig-006-20231220   gcc  
i386                  randconfig-011-20231220   clang
i386                  randconfig-012-20231220   clang
i386                  randconfig-013-20231220   clang
i386                  randconfig-014-20231220   clang
i386                  randconfig-015-20231220   clang
i386                  randconfig-016-20231220   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231221   gcc  
loongarch             randconfig-002-20231221   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                  decstation_64_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231221   gcc  
nios2                 randconfig-002-20231221   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231221   gcc  
parisc                randconfig-002-20231221   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20231221   clang
powerpc               randconfig-002-20231221   clang
powerpc               randconfig-003-20231221   clang
powerpc64             randconfig-001-20231221   clang
powerpc64             randconfig-002-20231221   clang
powerpc64             randconfig-003-20231221   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231221   clang
riscv                 randconfig-002-20231221   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231221   gcc  
s390                  randconfig-002-20231221   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231221   gcc  
sh                    randconfig-002-20231221   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231221   gcc  
sparc64               randconfig-002-20231221   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231221   clang
um                    randconfig-002-20231221   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231221   clang
x86_64       buildonly-randconfig-002-20231221   clang
x86_64       buildonly-randconfig-003-20231221   clang
x86_64       buildonly-randconfig-004-20231221   clang
x86_64       buildonly-randconfig-005-20231221   clang
x86_64       buildonly-randconfig-006-20231221   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231221   gcc  
x86_64                randconfig-002-20231221   gcc  
x86_64                randconfig-003-20231221   gcc  
x86_64                randconfig-004-20231221   gcc  
x86_64                randconfig-005-20231221   gcc  
x86_64                randconfig-006-20231221   gcc  
x86_64                randconfig-011-20231221   clang
x86_64                randconfig-012-20231221   clang
x86_64                randconfig-013-20231221   clang
x86_64                randconfig-014-20231221   clang
x86_64                randconfig-015-20231221   clang
x86_64                randconfig-016-20231221   clang
x86_64                randconfig-071-20231221   clang
x86_64                randconfig-072-20231221   clang
x86_64                randconfig-073-20231221   clang
x86_64                randconfig-074-20231221   clang
x86_64                randconfig-075-20231221   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231221   gcc  
xtensa                randconfig-002-20231221   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

