Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 296FB786E51
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 13:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241152AbjHXLrV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 07:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235654AbjHXLrL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 07:47:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F351736
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 04:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692877629; x=1724413629;
  h=date:from:to:cc:subject:message-id;
  bh=h/s4wLeMjnk73TFyl9Kvx1TqD7h94/iX1JNlrglD0AA=;
  b=Z8+Nnorb82qKLE5cGkK/Zde0Uo8LBJrqnU6h74rJConIrqFFVNVXoerO
   KOXF8pXSlD7/EJ1XkB/fIvW+Ac3ByilQ18M1D3sqpbQhibZsRwNFQsJk/
   0HUYwmK+M4OAT0R141NbpaCtOEH4K1H2zlUNehqKr+HuIcDzyzH+bAc9a
   R/RrGypE85XkvatYU+04MIrmJdzA7S1Bnpe+tBa3MN5wjSmsiywXcbb/R
   zDkqPLJ+fhv9Sc1zR02zYUbLNPzX5uTClE2AAiKbk7tsvaLkfbQdHmds2
   /YwzvqzdfhcrQRSZyhKNUd02n28kpHMYrhnBfRGARD4EWA9O2MGVVUyhC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438349465"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438349465"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 04:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="737015377"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="737015377"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Aug 2023 04:47:05 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qZ8no-00025w-1m;
        Thu, 24 Aug 2023 11:47:04 +0000
Date:   Thu, 24 Aug 2023 19:46:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 78e0ea4277546debf7e96797ac3b768539cc44f6
Message-ID: <202308241900.9SaRKDm0-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 78e0ea4277546debf7e96797ac3b768539cc44f6  tcpm: Avoid soft reset when partner does not support get_status

elapsed time: 1567m

configs tested: 309
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230824   gcc  
alpha                randconfig-r003-20230824   gcc  
alpha                randconfig-r006-20230824   gcc  
alpha                randconfig-r014-20230823   gcc  
alpha                randconfig-r015-20230824   gcc  
alpha                randconfig-r026-20230823   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20230823   gcc  
arc                   randconfig-001-20230824   gcc  
arc                  randconfig-r011-20230823   gcc  
arc                  randconfig-r013-20230823   gcc  
arc                  randconfig-r023-20230823   gcc  
arc                  randconfig-r023-20230824   gcc  
arc                  randconfig-r025-20230824   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                      integrator_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                   randconfig-001-20230823   clang
arm                   randconfig-001-20230824   gcc  
arm                  randconfig-r001-20230824   clang
arm                  randconfig-r002-20230823   gcc  
arm                  randconfig-r003-20230823   gcc  
arm                  randconfig-r012-20230823   clang
arm                  randconfig-r013-20230824   gcc  
arm                  randconfig-r016-20230824   gcc  
arm                  randconfig-r024-20230824   gcc  
arm                        shmobile_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230824   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230823   gcc  
csky                 randconfig-r011-20230824   gcc  
csky                 randconfig-r012-20230823   gcc  
csky                 randconfig-r014-20230823   gcc  
csky                 randconfig-r015-20230823   gcc  
csky                 randconfig-r021-20230824   gcc  
hexagon               randconfig-001-20230823   clang
hexagon               randconfig-001-20230824   clang
hexagon               randconfig-002-20230823   clang
hexagon               randconfig-002-20230824   clang
hexagon              randconfig-r033-20230824   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230823   clang
i386         buildonly-randconfig-001-20230824   gcc  
i386         buildonly-randconfig-002-20230823   clang
i386         buildonly-randconfig-002-20230824   gcc  
i386         buildonly-randconfig-003-20230823   clang
i386         buildonly-randconfig-003-20230824   gcc  
i386         buildonly-randconfig-004-20230823   clang
i386         buildonly-randconfig-004-20230824   gcc  
i386         buildonly-randconfig-005-20230823   clang
i386         buildonly-randconfig-005-20230824   gcc  
i386         buildonly-randconfig-006-20230823   clang
i386         buildonly-randconfig-006-20230824   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230823   clang
i386                  randconfig-001-20230824   gcc  
i386                  randconfig-002-20230823   clang
i386                  randconfig-002-20230824   gcc  
i386                  randconfig-003-20230823   clang
i386                  randconfig-003-20230824   gcc  
i386                  randconfig-004-20230823   clang
i386                  randconfig-004-20230824   gcc  
i386                  randconfig-005-20230823   clang
i386                  randconfig-005-20230824   gcc  
i386                  randconfig-006-20230823   clang
i386                  randconfig-006-20230824   gcc  
i386                  randconfig-011-20230823   gcc  
i386                  randconfig-011-20230824   clang
i386                  randconfig-012-20230823   gcc  
i386                  randconfig-012-20230824   clang
i386                  randconfig-013-20230823   gcc  
i386                  randconfig-013-20230824   clang
i386                  randconfig-014-20230823   gcc  
i386                  randconfig-014-20230824   clang
i386                  randconfig-015-20230823   gcc  
i386                  randconfig-015-20230824   clang
i386                  randconfig-016-20230823   gcc  
i386                  randconfig-016-20230824   clang
i386                 randconfig-r011-20230823   gcc  
i386                 randconfig-r016-20230823   gcc  
i386                 randconfig-r025-20230823   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230823   gcc  
loongarch             randconfig-001-20230824   gcc  
loongarch            randconfig-r001-20230823   gcc  
loongarch            randconfig-r005-20230824   gcc  
loongarch            randconfig-r006-20230824   gcc  
loongarch            randconfig-r024-20230823   gcc  
loongarch            randconfig-r032-20230823   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r023-20230824   gcc  
m68k                 randconfig-r025-20230823   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r004-20230824   gcc  
microblaze           randconfig-r032-20230824   gcc  
microblaze           randconfig-r034-20230823   gcc  
microblaze           randconfig-r036-20230823   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                 randconfig-r002-20230823   gcc  
mips                 randconfig-r002-20230824   clang
mips                 randconfig-r003-20230824   clang
mips                 randconfig-r006-20230823   gcc  
mips                 randconfig-r012-20230824   gcc  
mips                 randconfig-r014-20230824   gcc  
mips                 randconfig-r021-20230824   gcc  
mips                 randconfig-r024-20230824   gcc  
mips                 randconfig-r025-20230824   gcc  
mips                 randconfig-r031-20230824   clang
mips                 randconfig-r034-20230824   clang
mips                 randconfig-r035-20230824   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230823   gcc  
nios2                randconfig-r022-20230824   gcc  
nios2                randconfig-r024-20230823   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r026-20230824   gcc  
openrisc             randconfig-r031-20230824   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r006-20230823   gcc  
parisc               randconfig-r021-20230823   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc              randconfig-r003-20230823   clang
powerpc              randconfig-r005-20230823   clang
powerpc              randconfig-r031-20230823   clang
powerpc                     tqm8555_defconfig   gcc  
powerpc64            randconfig-r004-20230823   clang
powerpc64            randconfig-r022-20230823   gcc  
powerpc64            randconfig-r036-20230824   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230823   clang
riscv                 randconfig-001-20230824   gcc  
riscv                randconfig-r005-20230824   gcc  
riscv                randconfig-r013-20230823   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230823   gcc  
s390                  randconfig-001-20230824   clang
s390                 randconfig-r001-20230824   gcc  
s390                 randconfig-r034-20230824   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                   randconfig-r014-20230824   gcc  
sh                   randconfig-r016-20230824   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230823   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r003-20230823   gcc  
sparc64              randconfig-r022-20230823   gcc  
sparc64              randconfig-r026-20230823   gcc  
sparc64              randconfig-r033-20230823   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230823   gcc  
um                   randconfig-r014-20230823   clang
um                   randconfig-r022-20230824   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230823   clang
x86_64       buildonly-randconfig-001-20230824   gcc  
x86_64       buildonly-randconfig-002-20230823   clang
x86_64       buildonly-randconfig-002-20230824   gcc  
x86_64       buildonly-randconfig-003-20230823   clang
x86_64       buildonly-randconfig-003-20230824   gcc  
x86_64       buildonly-randconfig-004-20230823   clang
x86_64       buildonly-randconfig-004-20230824   gcc  
x86_64       buildonly-randconfig-005-20230823   clang
x86_64       buildonly-randconfig-005-20230824   gcc  
x86_64       buildonly-randconfig-006-20230823   clang
x86_64       buildonly-randconfig-006-20230824   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230823   gcc  
x86_64                randconfig-001-20230824   clang
x86_64                randconfig-002-20230823   gcc  
x86_64                randconfig-002-20230824   clang
x86_64                randconfig-003-20230823   gcc  
x86_64                randconfig-003-20230824   clang
x86_64                randconfig-004-20230823   gcc  
x86_64                randconfig-004-20230824   clang
x86_64                randconfig-005-20230823   gcc  
x86_64                randconfig-005-20230824   clang
x86_64                randconfig-006-20230823   gcc  
x86_64                randconfig-006-20230824   clang
x86_64                randconfig-011-20230823   clang
x86_64                randconfig-011-20230824   gcc  
x86_64                randconfig-012-20230823   clang
x86_64                randconfig-012-20230824   gcc  
x86_64                randconfig-013-20230823   clang
x86_64                randconfig-013-20230824   gcc  
x86_64                randconfig-014-20230823   clang
x86_64                randconfig-014-20230824   gcc  
x86_64                randconfig-015-20230823   clang
x86_64                randconfig-015-20230824   gcc  
x86_64                randconfig-016-20230823   clang
x86_64                randconfig-016-20230824   gcc  
x86_64                randconfig-071-20230823   clang
x86_64                randconfig-071-20230824   gcc  
x86_64                randconfig-072-20230823   clang
x86_64                randconfig-072-20230824   gcc  
x86_64                randconfig-073-20230823   clang
x86_64                randconfig-073-20230824   gcc  
x86_64                randconfig-074-20230823   clang
x86_64                randconfig-074-20230824   gcc  
x86_64                randconfig-075-20230823   clang
x86_64                randconfig-075-20230824   gcc  
x86_64                randconfig-076-20230823   clang
x86_64                randconfig-076-20230824   gcc  
x86_64               randconfig-r013-20230824   clang
x86_64               randconfig-r035-20230823   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r001-20230823   gcc  
xtensa               randconfig-r004-20230823   gcc  
xtensa               randconfig-r004-20230824   gcc  
xtensa               randconfig-r015-20230823   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
