Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF824701A99
	for <lists+linux-usb@lfdr.de>; Sun, 14 May 2023 00:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjEMWnW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 May 2023 18:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEMWnU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 May 2023 18:43:20 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6076E1FE6
        for <linux-usb@vger.kernel.org>; Sat, 13 May 2023 15:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684017799; x=1715553799;
  h=date:from:to:cc:subject:message-id;
  bh=R6eXiJTMKkb5d7GC+5pvg4KZfZsnv6QkR9RpKyuOU4Y=;
  b=mSZWiYCT9kjPG7QmoZN+Zp/tv9g6MgrSI4UtCYVPqZcbo3F4MArn7m3C
   7zYGhCBGXKJpSni0skl09B+zCgQl8xUpfg/atUuggrOIOr2z7O4r7enam
   CmYn6dJfsLtb26LcQWwKkqbbcsTEfa3tSvC2eD6xuwEuw4ODQtMSn4TuY
   64224gegcNcq+0/2JjseixBnrlRfdF+EF3ld0ktlBQCRK7GxFyYUs6+qN
   2Qz8laSrHVTeVcJyFKCeEsrgY3P7atlZJo6kS3HTttF17KmWbnwbE/+4D
   d6GTfuVxFCFLYjJazEjBiItAMfcgoHOkFrKPwm1bmlaF9rrNiL5y2HGwa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="437326610"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="437326610"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 15:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="733433888"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="733433888"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 May 2023 15:43:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pxxxN-0005iG-0O;
        Sat, 13 May 2023 22:43:17 +0000
Date:   Sun, 14 May 2023 06:42:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 a398d5eac6984316e71474e25b975688f282379b
Message-ID: <20230513224229.Rz9lf%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: a398d5eac6984316e71474e25b975688f282379b  usb-storage: fix deadlock when a scsi command timeouts more than once

elapsed time: 736m

configs tested: 181
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230513   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230513   gcc  
alpha                randconfig-r013-20230511   gcc  
alpha                randconfig-r021-20230513   gcc  
alpha                randconfig-r026-20230513   gcc  
alpha                randconfig-r036-20230512   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230509   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230513   gcc  
arc                  randconfig-r015-20230512   gcc  
arc                  randconfig-r043-20230509   gcc  
arc                  randconfig-r043-20230511   gcc  
arc                  randconfig-r043-20230513   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                  randconfig-r005-20230511   gcc  
arm                  randconfig-r024-20230513   clang
arm                  randconfig-r046-20230509   gcc  
arm                  randconfig-r046-20230511   clang
arm                  randconfig-r046-20230513   clang
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230509   gcc  
arm64                randconfig-r026-20230509   clang
csky                                defconfig   gcc  
csky                 randconfig-r004-20230509   gcc  
csky                 randconfig-r004-20230513   gcc  
csky                 randconfig-r033-20230509   gcc  
csky                 randconfig-r034-20230511   gcc  
csky                 randconfig-r034-20230512   gcc  
hexagon              randconfig-r024-20230511   clang
hexagon              randconfig-r032-20230511   clang
hexagon              randconfig-r035-20230512   clang
hexagon              randconfig-r041-20230509   clang
hexagon              randconfig-r041-20230511   clang
hexagon              randconfig-r041-20230513   clang
hexagon              randconfig-r045-20230509   clang
hexagon              randconfig-r045-20230511   clang
hexagon              randconfig-r045-20230513   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230513   gcc  
ia64                 randconfig-r014-20230513   gcc  
ia64                 randconfig-r023-20230509   gcc  
ia64                 randconfig-r025-20230509   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r014-20230509   gcc  
loongarch            randconfig-r014-20230512   gcc  
loongarch            randconfig-r035-20230513   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230509   gcc  
m68k         buildonly-randconfig-r002-20230511   gcc  
m68k         buildonly-randconfig-r003-20230513   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230511   gcc  
m68k                 randconfig-r006-20230511   gcc  
m68k                 randconfig-r015-20230511   gcc  
m68k                 randconfig-r031-20230512   gcc  
m68k                 randconfig-r032-20230513   gcc  
microblaze           randconfig-r012-20230511   gcc  
microblaze           randconfig-r023-20230513   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                 randconfig-r015-20230509   gcc  
nios2        buildonly-randconfig-r003-20230511   gcc  
nios2        buildonly-randconfig-r004-20230513   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230513   gcc  
nios2                randconfig-r016-20230511   gcc  
nios2                randconfig-r016-20230513   gcc  
nios2                randconfig-r025-20230511   gcc  
nios2                randconfig-r036-20230511   gcc  
openrisc             randconfig-r011-20230509   gcc  
openrisc             randconfig-r016-20230509   gcc  
openrisc             randconfig-r022-20230509   gcc  
openrisc             randconfig-r033-20230511   gcc  
openrisc             randconfig-r036-20230509   gcc  
parisc       buildonly-randconfig-r001-20230511   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230513   gcc  
parisc               randconfig-r024-20230509   gcc  
parisc               randconfig-r032-20230512   gcc  
parisc               randconfig-r035-20230509   gcc  
parisc               randconfig-r035-20230511   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc      buildonly-randconfig-r005-20230511   gcc  
powerpc      buildonly-randconfig-r005-20230513   gcc  
powerpc                        icon_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                 mpc8540_ads_defconfig   gcc  
powerpc              randconfig-r013-20230509   clang
powerpc              randconfig-r026-20230511   gcc  
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230509   clang
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230511   clang
riscv                randconfig-r012-20230509   clang
riscv                randconfig-r014-20230511   gcc  
riscv                randconfig-r016-20230512   clang
riscv                randconfig-r023-20230511   gcc  
riscv                randconfig-r031-20230511   clang
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230511   gcc  
riscv                randconfig-r042-20230513   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230513   gcc  
s390         buildonly-randconfig-r004-20230509   clang
s390                                defconfig   gcc  
s390                 randconfig-r021-20230509   clang
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230511   gcc  
s390                 randconfig-r044-20230513   gcc  
sh                               allmodconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230509   gcc  
sparc        buildonly-randconfig-r005-20230509   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230511   gcc  
sparc                randconfig-r012-20230512   gcc  
sparc                randconfig-r025-20230513   gcc  
sparc                randconfig-r033-20230512   gcc  
sparc                randconfig-r033-20230513   gcc  
sparc64      buildonly-randconfig-r006-20230511   gcc  
sparc64              randconfig-r022-20230511   gcc  
sparc64              randconfig-r032-20230509   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230511   gcc  
xtensa               randconfig-r004-20230511   gcc  
xtensa               randconfig-r015-20230513   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
