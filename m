Return-Path: <linux-usb+bounces-2325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869A87DAC72
	for <lists+linux-usb@lfdr.de>; Sun, 29 Oct 2023 13:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21077B20E32
	for <lists+linux-usb@lfdr.de>; Sun, 29 Oct 2023 12:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8CBCA6D;
	Sun, 29 Oct 2023 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOjofjxf"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E98B66B
	for <linux-usb@vger.kernel.org>; Sun, 29 Oct 2023 12:31:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87735C1
	for <linux-usb@vger.kernel.org>; Sun, 29 Oct 2023 05:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698582661; x=1730118661;
  h=date:from:to:cc:subject:message-id;
  bh=lF2q5f9UBJPN7aUSVY3WVukGCt+touKWtZdE2X5uIPI=;
  b=DOjofjxfvjAcc+pXeyLV6NyUFY+6g8B+JfKblqL+rbhsvmUF4cNEeODp
   /4SFF/5O21bJb3bli9FXmp7rjusYIIw3KwS/0EguEoQ23Qe/aa4GqGhl5
   dMLX8yjVT5egnOughzypd19tvTHOrfqo+nc6/GqAIKJJbkCHSZUFAk7pp
   7TSLeFXiO/5kboYmT7sG84Za6iL6Lyku5rZaC0TB3MJgEr9OQCmJyIWcl
   AJlLUTk0Y+izr9R3w5OWeSPC1NxyZ0osTVyTEbGc6Gkgsq9kcFF5RgTkh
   eqkOkm2KE3mcNOU+dMAIM7v11t/cW0ycR1cWj9WsIn+pUHXQmB+GIVRJL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="789102"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="789102"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 05:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="8089524"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Oct 2023 05:30:44 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qx4wT-000CYl-1U;
	Sun, 29 Oct 2023 12:30:57 +0000
Date: Sun, 29 Oct 2023 20:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 c70793fb7632a153862ee9060e6d48131469a29c
Message-ID: <202310292054.LePXV8Vb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c70793fb7632a153862ee9060e6d48131469a29c  usb: gadget: uvc: Add missing initialization of ssp config descriptor

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-klondike_defconfig
    |-- arch-powerpc-lib-sstep.c:error:variable-rc-set-but-not-used
    `-- arch-powerpc-lib-sstep.c:error:variable-suffix-set-but-not-used

elapsed time: 1547m

configs tested: 158
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231028   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231028   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          alldefconfig   clang
i386         buildonly-randconfig-001-20231028   gcc  
i386         buildonly-randconfig-002-20231028   gcc  
i386         buildonly-randconfig-003-20231028   gcc  
i386         buildonly-randconfig-004-20231028   gcc  
i386         buildonly-randconfig-005-20231028   gcc  
i386         buildonly-randconfig-006-20231028   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231028   gcc  
i386                  randconfig-002-20231028   gcc  
i386                  randconfig-003-20231028   gcc  
i386                  randconfig-004-20231028   gcc  
i386                  randconfig-005-20231028   gcc  
i386                  randconfig-006-20231028   gcc  
i386                  randconfig-011-20231028   gcc  
i386                  randconfig-012-20231028   gcc  
i386                  randconfig-013-20231028   gcc  
i386                  randconfig-014-20231028   gcc  
i386                  randconfig-015-20231028   gcc  
i386                  randconfig-016-20231028   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231028   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                       ebony_defconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                     tqm8548_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc64                           defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231028   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231028   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231028   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231028   gcc  
x86_64       buildonly-randconfig-002-20231028   gcc  
x86_64       buildonly-randconfig-003-20231028   gcc  
x86_64       buildonly-randconfig-004-20231028   gcc  
x86_64       buildonly-randconfig-005-20231028   gcc  
x86_64       buildonly-randconfig-006-20231028   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231028   gcc  
x86_64                randconfig-002-20231028   gcc  
x86_64                randconfig-003-20231028   gcc  
x86_64                randconfig-004-20231028   gcc  
x86_64                randconfig-005-20231028   gcc  
x86_64                randconfig-006-20231028   gcc  
x86_64                randconfig-011-20231028   gcc  
x86_64                randconfig-012-20231028   gcc  
x86_64                randconfig-013-20231028   gcc  
x86_64                randconfig-014-20231028   gcc  
x86_64                randconfig-015-20231028   gcc  
x86_64                randconfig-016-20231028   gcc  
x86_64                randconfig-071-20231028   gcc  
x86_64                randconfig-072-20231028   gcc  
x86_64                randconfig-073-20231028   gcc  
x86_64                randconfig-074-20231028   gcc  
x86_64                randconfig-075-20231028   gcc  
x86_64                randconfig-076-20231028   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

