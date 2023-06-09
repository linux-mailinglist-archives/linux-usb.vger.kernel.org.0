Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA22572A55E
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 23:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbjFIVbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 17:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbjFIVbu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 17:31:50 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5460F1AE
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 14:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686346309; x=1717882309;
  h=date:from:to:cc:subject:message-id;
  bh=U8M9Cs1zp0xvpzsq5HEeZyrlRdNz0gL71QQpYx6D6GQ=;
  b=bliVDONLU6gBRZsY+/gP/BK2bj3im8PGQ/Zc8+j+BLa5OV2S9oGFkeEY
   ShF86ohSSZnZ8o3PNTvYn3BtamgRT4VMYJ0B/OznLoloSs2LFOtt7biWQ
   XpEQa7/eoacOmltz0ipdacFnYS0XRDH9zoRi9AlHV810IouEzTbX9UuKB
   RWkCfxxYkqV6l2BlPxQ3LDVzaRLbEfQ+dOhVe+IiHOnyYuAOQJdeWWFI5
   A/5dSS4FIn4cugkUYx+Sy+3fa7wsWrYfHMR2C7NQDrpezo/uclmmN2e/K
   8riyT8tpp0bxzZUpP/SgkgQczpQIQlkAutYghRbJaYO/7RTnwwjuIEuJ/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="423571465"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="423571465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 14:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="660894502"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="660894502"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Jun 2023 14:31:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q7jhy-0009QG-35;
        Fri, 09 Jun 2023 21:31:46 +0000
Date:   Sat, 10 Jun 2023 05:31:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 53ba2e16957b01eb7858e3ee5a3a8187a2892f15
Message-ID: <202306100542.Cfw7xQEn-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 53ba2e16957b01eb7858e3ee5a3a8187a2892f15  thunderbolt: Disable CL states when a DMA tunnel is established

elapsed time: 728m

configs tested: 170
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230608   gcc  
alpha                randconfig-r033-20230608   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230608   gcc  
arc                  randconfig-r021-20230608   gcc  
arc                  randconfig-r043-20230608   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r006-20230608   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                  randconfig-r001-20230608   clang
arm                  randconfig-r005-20230608   clang
arm                  randconfig-r006-20230608   clang
arm                  randconfig-r011-20230608   gcc  
arm                  randconfig-r021-20230608   gcc  
arm                  randconfig-r026-20230608   gcc  
arm                  randconfig-r046-20230608   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230608   clang
csky         buildonly-randconfig-r002-20230608   gcc  
csky         buildonly-randconfig-r006-20230608   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230608   gcc  
csky                 randconfig-r026-20230608   gcc  
csky                 randconfig-r034-20230608   gcc  
hexagon      buildonly-randconfig-r001-20230608   clang
hexagon              randconfig-r006-20230608   clang
hexagon              randconfig-r015-20230608   clang
hexagon              randconfig-r041-20230608   clang
hexagon              randconfig-r045-20230608   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230608   gcc  
i386                 randconfig-i002-20230608   gcc  
i386                 randconfig-i003-20230608   gcc  
i386                 randconfig-i004-20230608   gcc  
i386                 randconfig-i005-20230608   gcc  
i386                 randconfig-i006-20230608   gcc  
i386                 randconfig-i011-20230608   clang
i386                 randconfig-i012-20230608   clang
i386                 randconfig-i013-20230608   clang
i386                 randconfig-i014-20230608   clang
i386                 randconfig-i015-20230608   clang
i386                 randconfig-i016-20230608   clang
i386                 randconfig-i051-20230608   gcc  
i386                 randconfig-i052-20230608   gcc  
i386                 randconfig-i053-20230608   gcc  
i386                 randconfig-i054-20230608   gcc  
i386                 randconfig-i055-20230608   gcc  
i386                 randconfig-i056-20230608   gcc  
i386                 randconfig-i061-20230608   gcc  
i386                 randconfig-i062-20230608   gcc  
i386                 randconfig-i063-20230608   gcc  
i386                 randconfig-i064-20230608   gcc  
i386                 randconfig-i065-20230608   gcc  
i386                 randconfig-i066-20230608   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230608   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230608   gcc  
loongarch            randconfig-r026-20230608   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230608   gcc  
m68k                 randconfig-r013-20230608   gcc  
microblaze           randconfig-r025-20230608   gcc  
microblaze           randconfig-r036-20230608   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                     cu1000-neo_defconfig   clang
mips                          malta_defconfig   clang
mips                 randconfig-r001-20230608   clang
mips                 randconfig-r023-20230608   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230608   gcc  
openrisc     buildonly-randconfig-r002-20230608   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r012-20230608   gcc  
openrisc             randconfig-r014-20230608   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r005-20230608   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230608   gcc  
parisc               randconfig-r016-20230608   gcc  
parisc               randconfig-r032-20230608   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc              randconfig-r002-20230608   gcc  
powerpc              randconfig-r004-20230608   gcc  
powerpc              randconfig-r034-20230608   gcc  
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv        buildonly-randconfig-r003-20230608   clang
riscv        buildonly-randconfig-r004-20230608   clang
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r031-20230608   gcc  
riscv                randconfig-r036-20230608   gcc  
riscv                randconfig-r042-20230608   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r033-20230608   gcc  
s390                 randconfig-r044-20230608   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230608   gcc  
sh                   randconfig-r004-20230608   gcc  
sh                   randconfig-r022-20230608   gcc  
sh                   randconfig-r035-20230608   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230608   gcc  
sparc64              randconfig-r001-20230608   gcc  
sparc64              randconfig-r006-20230608   gcc  
sparc64              randconfig-r013-20230608   gcc  
sparc64              randconfig-r021-20230608   gcc  
sparc64              randconfig-r032-20230608   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230608   gcc  
x86_64               randconfig-a002-20230608   gcc  
x86_64               randconfig-a003-20230608   gcc  
x86_64               randconfig-a004-20230608   gcc  
x86_64               randconfig-a005-20230608   gcc  
x86_64               randconfig-a006-20230608   gcc  
x86_64               randconfig-a011-20230608   clang
x86_64               randconfig-a012-20230608   clang
x86_64               randconfig-a013-20230608   clang
x86_64               randconfig-a014-20230608   clang
x86_64               randconfig-a015-20230608   clang
x86_64               randconfig-a016-20230608   clang
x86_64               randconfig-r002-20230608   gcc  
x86_64               randconfig-r022-20230608   clang
x86_64               randconfig-x051-20230608   clang
x86_64               randconfig-x052-20230608   clang
x86_64               randconfig-x053-20230608   clang
x86_64               randconfig-x054-20230608   clang
x86_64               randconfig-x055-20230608   clang
x86_64               randconfig-x056-20230608   clang
x86_64               randconfig-x061-20230608   clang
x86_64               randconfig-x062-20230608   clang
x86_64               randconfig-x063-20230608   clang
x86_64               randconfig-x064-20230608   clang
x86_64               randconfig-x065-20230608   clang
x86_64               randconfig-x066-20230608   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r031-20230608   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
