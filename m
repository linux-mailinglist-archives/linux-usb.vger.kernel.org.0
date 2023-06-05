Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA38E723203
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 23:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232889AbjFEVN4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 17:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbjFEVNp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 17:13:45 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F4DF2
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685999623; x=1717535623;
  h=date:from:to:cc:subject:message-id;
  bh=cG3WhMrDicczssLOuD3U6rt/A88nAbYUbvohMxipIpI=;
  b=JgJ9KYFeqxIrZIA4TsaTTIqAOpZJI5dN8TZehT/WGntv28RlYUbC8M8H
   0IFbjspDkKyNY9CPUIPNoeFQZpo0UwJFxaxBIlpjksHhV697mZt0jsMU7
   Oy+eCwgDamszdbpObEhrXn5kFhugOAOvWuTjYcCpFhhJZLxS+nXYkDNrd
   roSizk9vkQre7LftSVNBcigrCA4LW6nuFpo82W1NKxvQPU1Gn17vszG9r
   Q7SRqarXkKNJkFcv4Oky3UUFGKi6BDBD+BN8GMh1GmJQy7P3Lc0idFINX
   xDl6jPIerh9iedH92ZVBiJ+/H0B62czcrsAu8UU4juSpnm0W3JGY/w9lv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358938002"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="358938002"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 14:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798576335"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="798576335"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 14:13:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q6HVz-0004RX-2u;
        Mon, 05 Jun 2023 21:13:23 +0000
Date:   Tue, 06 Jun 2023 05:12:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 1982b6ea136091eca738583937296c52473ade70
Message-ID: <20230605211256.1qRXK%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 1982b6ea136091eca738583937296c52473ade70  USB: disable all RNDIS protocol drivers

elapsed time: 722m

configs tested: 236
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230605   gcc  
alpha                randconfig-r013-20230605   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230605   gcc  
arc          buildonly-randconfig-r005-20230605   gcc  
arc          buildonly-randconfig-r006-20230605   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r016-20230605   gcc  
arc                  randconfig-r025-20230605   gcc  
arc                  randconfig-r026-20230605   gcc  
arc                  randconfig-r043-20230605   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230605   clang
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r031-20230605   gcc  
arm                  randconfig-r032-20230605   gcc  
arm                  randconfig-r036-20230605   gcc  
arm                  randconfig-r046-20230605   clang
arm                         s5pv210_defconfig   clang
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230605   clang
arm64        buildonly-randconfig-r006-20230605   clang
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230605   clang
arm64                randconfig-r012-20230605   gcc  
arm64                randconfig-r034-20230605   clang
csky         buildonly-randconfig-r001-20230605   gcc  
csky         buildonly-randconfig-r005-20230605   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230605   gcc  
csky                 randconfig-r002-20230605   gcc  
csky                 randconfig-r004-20230605   gcc  
csky                 randconfig-r012-20230605   gcc  
csky                 randconfig-r014-20230605   gcc  
csky                 randconfig-r015-20230605   gcc  
csky                 randconfig-r031-20230605   gcc  
csky                 randconfig-r032-20230605   gcc  
csky                 randconfig-r034-20230605   gcc  
hexagon              randconfig-r004-20230605   clang
hexagon              randconfig-r026-20230605   clang
hexagon              randconfig-r036-20230605   clang
hexagon              randconfig-r041-20230605   clang
hexagon              randconfig-r045-20230605   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230605   clang
i386                 randconfig-i002-20230605   clang
i386                 randconfig-i003-20230605   clang
i386                 randconfig-i004-20230605   clang
i386                 randconfig-i005-20230605   clang
i386                 randconfig-i006-20230605   clang
i386                 randconfig-i011-20230605   gcc  
i386                 randconfig-i012-20230605   gcc  
i386                 randconfig-i013-20230605   gcc  
i386                 randconfig-i014-20230605   gcc  
i386                 randconfig-i015-20230605   gcc  
i386                 randconfig-i016-20230605   gcc  
i386                 randconfig-i051-20230605   clang
i386                 randconfig-i052-20230605   clang
i386                 randconfig-i053-20230605   clang
i386                 randconfig-i054-20230605   clang
i386                 randconfig-i055-20230605   clang
i386                 randconfig-i056-20230605   clang
i386                 randconfig-i061-20230605   clang
i386                 randconfig-i062-20230605   clang
i386                 randconfig-i063-20230605   clang
i386                 randconfig-i064-20230605   clang
i386                 randconfig-i065-20230605   clang
i386                 randconfig-i066-20230605   clang
i386                 randconfig-r011-20230605   gcc  
i386                 randconfig-r021-20230605   gcc  
i386                 randconfig-r022-20230605   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230605   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230606   gcc  
loongarch            randconfig-r016-20230605   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230605   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230606   gcc  
m68k                 randconfig-r023-20230605   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze   buildonly-randconfig-r006-20230605   gcc  
microblaze           randconfig-r001-20230605   gcc  
microblaze           randconfig-r003-20230606   gcc  
microblaze           randconfig-r004-20230605   gcc  
microblaze           randconfig-r006-20230605   gcc  
microblaze           randconfig-r016-20230605   gcc  
microblaze           randconfig-r026-20230605   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230605   gcc  
mips         buildonly-randconfig-r003-20230605   gcc  
mips         buildonly-randconfig-r005-20230605   gcc  
mips                      pic32mzda_defconfig   clang
mips                 randconfig-r003-20230605   gcc  
mips                 randconfig-r012-20230605   clang
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230605   gcc  
nios2                randconfig-r005-20230605   gcc  
nios2                randconfig-r011-20230605   gcc  
nios2                randconfig-r014-20230605   gcc  
nios2                randconfig-r016-20230605   gcc  
nios2                randconfig-r032-20230605   gcc  
nios2                randconfig-r035-20230605   gcc  
openrisc     buildonly-randconfig-r001-20230605   gcc  
openrisc     buildonly-randconfig-r003-20230605   gcc  
openrisc     buildonly-randconfig-r004-20230605   gcc  
openrisc             randconfig-r006-20230605   gcc  
openrisc             randconfig-r013-20230605   gcc  
openrisc             randconfig-r016-20230605   gcc  
parisc       buildonly-randconfig-r003-20230605   gcc  
parisc       buildonly-randconfig-r004-20230605   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230605   gcc  
parisc               randconfig-r012-20230605   gcc  
parisc               randconfig-r014-20230605   gcc  
parisc               randconfig-r015-20230605   gcc  
parisc               randconfig-r025-20230605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230605   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc                    mvme5100_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r005-20230606   gcc  
powerpc              randconfig-r012-20230605   gcc  
powerpc              randconfig-r013-20230605   gcc  
powerpc              randconfig-r014-20230605   gcc  
powerpc              randconfig-r015-20230605   gcc  
powerpc              randconfig-r021-20230605   gcc  
powerpc              randconfig-r025-20230605   gcc  
powerpc              randconfig-r035-20230605   clang
powerpc              randconfig-r036-20230605   clang
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230605   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230605   clang
riscv                randconfig-r006-20230605   clang
riscv                randconfig-r014-20230605   gcc  
riscv                randconfig-r022-20230605   gcc  
riscv                randconfig-r042-20230605   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230605   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230606   gcc  
s390                 randconfig-r015-20230605   gcc  
s390                 randconfig-r016-20230605   gcc  
s390                 randconfig-r035-20230605   clang
s390                 randconfig-r044-20230605   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230605   gcc  
sh           buildonly-randconfig-r004-20230605   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r013-20230605   gcc  
sh                   randconfig-r015-20230605   gcc  
sh                   randconfig-r034-20230605   gcc  
sparc        buildonly-randconfig-r001-20230605   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230605   gcc  
sparc                randconfig-r004-20230605   gcc  
sparc                randconfig-r012-20230605   gcc  
sparc                randconfig-r022-20230605   gcc  
sparc                randconfig-r023-20230605   gcc  
sparc                randconfig-r024-20230605   gcc  
sparc                randconfig-r025-20230605   gcc  
sparc                randconfig-r026-20230605   gcc  
sparc                randconfig-r033-20230605   gcc  
sparc                randconfig-r035-20230605   gcc  
sparc64      buildonly-randconfig-r003-20230605   gcc  
sparc64      buildonly-randconfig-r006-20230605   gcc  
sparc64              randconfig-r011-20230605   gcc  
sparc64              randconfig-r023-20230605   gcc  
sparc64              randconfig-r024-20230605   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230605   clang
x86_64               randconfig-a002-20230605   clang
x86_64               randconfig-a003-20230605   clang
x86_64               randconfig-a004-20230605   clang
x86_64               randconfig-a005-20230605   clang
x86_64               randconfig-a006-20230605   clang
x86_64               randconfig-a011-20230605   gcc  
x86_64               randconfig-a012-20230605   gcc  
x86_64               randconfig-a013-20230605   gcc  
x86_64               randconfig-a014-20230605   gcc  
x86_64               randconfig-a015-20230605   gcc  
x86_64               randconfig-a016-20230605   gcc  
x86_64               randconfig-r005-20230605   clang
x86_64               randconfig-r016-20230605   gcc  
x86_64               randconfig-r021-20230605   gcc  
x86_64               randconfig-r031-20230605   clang
x86_64               randconfig-x051-20230605   gcc  
x86_64               randconfig-x052-20230605   gcc  
x86_64               randconfig-x053-20230605   gcc  
x86_64               randconfig-x054-20230605   gcc  
x86_64               randconfig-x055-20230605   gcc  
x86_64               randconfig-x056-20230605   gcc  
x86_64               randconfig-x061-20230605   gcc  
x86_64               randconfig-x062-20230605   gcc  
x86_64               randconfig-x063-20230605   gcc  
x86_64               randconfig-x064-20230605   gcc  
x86_64               randconfig-x065-20230605   gcc  
x86_64               randconfig-x066-20230605   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa       buildonly-randconfig-r005-20230605   gcc  
xtensa       buildonly-randconfig-r006-20230605   gcc  
xtensa               randconfig-r002-20230605   gcc  
xtensa               randconfig-r004-20230605   gcc  
xtensa               randconfig-r006-20230605   gcc  
xtensa               randconfig-r011-20230605   gcc  
xtensa               randconfig-r013-20230605   gcc  
xtensa               randconfig-r015-20230605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
