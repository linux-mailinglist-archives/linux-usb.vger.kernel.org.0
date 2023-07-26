Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59864763D15
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 18:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjGZQ7c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 12:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjGZQ73 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 12:59:29 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4FC26A4
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 09:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690390768; x=1721926768;
  h=date:from:to:cc:subject:message-id;
  bh=DfcmCoyTOCbUiZhNuUypGThwspQSJyHbz0n0HO/178Q=;
  b=Tmhrh4m9Sw//WYDQbTagEyblv46AUvFhP5xC0hBrR71TbVgA4gYpEUbo
   w7FFSFqaPARb/s2xytvxJExWEdvoLpm8tUo2jZ0iFXJwsOmulBIRcRn0p
   +3fmuO/e9HsvfyKR/w2aNo1+k2chjHTjAwliKmsjipBMlovoSgqYXusYa
   ueGUDgFF0UuIrbJoW8wo5u0r03M5iTTuJJFGzRl7l42VAPHm8narFyGGw
   FnK58G8exkFfIz+yCZJj2yZgGQOwWyOPNbsX3ikW9xMw/PPA96d71HjSz
   Qs3NKD7jAGpesqaLYR/X9800qUtCdVGuziRvGBrlyeoXSlMm/cV2CDWvi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431874443"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="431874443"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057304162"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="1057304162"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 09:59:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOhpH-00017v-2h;
        Wed, 26 Jul 2023 16:57:51 +0000
Date:   Thu, 27 Jul 2023 00:56:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a85ff0db48c372063988f2072a07bd361ce9c4ef
Message-ID: <202307270029.KlZEJ2Fo-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: a85ff0db48c372063988f2072a07bd361ce9c4ef  usb: gadget: midi2: More flexible MIDI 1.0 configuration

elapsed time: 727m

configs tested: 172
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r024-20230726   gcc  
alpha                randconfig-r031-20230726   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r006-20230726   gcc  
arc                  randconfig-r024-20230726   gcc  
arc                  randconfig-r035-20230726   gcc  
arc                  randconfig-r043-20230726   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230726   clang
arm                  randconfig-r013-20230726   gcc  
arm                  randconfig-r014-20230726   gcc  
arm                  randconfig-r032-20230726   clang
arm                  randconfig-r046-20230726   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230726   gcc  
arm64                randconfig-r013-20230726   clang
arm64                randconfig-r025-20230726   clang
csky                                defconfig   gcc  
hexagon              randconfig-r022-20230726   clang
hexagon              randconfig-r023-20230726   clang
hexagon              randconfig-r036-20230726   clang
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230726   gcc  
i386         buildonly-randconfig-r005-20230726   gcc  
i386         buildonly-randconfig-r006-20230726   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230726   gcc  
i386                 randconfig-i002-20230726   gcc  
i386                 randconfig-i003-20230726   gcc  
i386                 randconfig-i004-20230726   gcc  
i386                 randconfig-i005-20230726   gcc  
i386                 randconfig-i006-20230726   gcc  
i386                 randconfig-i011-20230726   clang
i386                 randconfig-i012-20230726   clang
i386                 randconfig-i013-20230726   clang
i386                 randconfig-i014-20230726   clang
i386                 randconfig-i015-20230726   clang
i386                 randconfig-i016-20230726   clang
i386                 randconfig-r006-20230726   gcc  
i386                 randconfig-r011-20230726   clang
i386                 randconfig-r016-20230726   clang
i386                 randconfig-r021-20230726   clang
i386                 randconfig-r026-20230726   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230726   gcc  
loongarch            randconfig-r006-20230726   gcc  
loongarch            randconfig-r015-20230726   gcc  
loongarch            randconfig-r016-20230726   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230726   gcc  
m68k                 randconfig-r002-20230726   gcc  
m68k                 randconfig-r004-20230726   gcc  
m68k                 randconfig-r012-20230726   gcc  
m68k                 randconfig-r014-20230726   gcc  
m68k                 randconfig-r021-20230726   gcc  
m68k                 randconfig-r026-20230726   gcc  
m68k                 randconfig-r035-20230726   gcc  
microblaze           randconfig-r001-20230726   gcc  
microblaze           randconfig-r006-20230726   gcc  
microblaze           randconfig-r014-20230726   gcc  
microblaze           randconfig-r032-20230726   gcc  
microblaze           randconfig-r034-20230726   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230726   clang
mips                 randconfig-r015-20230726   gcc  
mips                 randconfig-r035-20230726   clang
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230726   gcc  
nios2                randconfig-r004-20230726   gcc  
nios2                randconfig-r011-20230726   gcc  
nios2                randconfig-r015-20230726   gcc  
nios2                randconfig-r022-20230726   gcc  
openrisc             randconfig-r005-20230726   gcc  
openrisc             randconfig-r022-20230726   gcc  
openrisc             randconfig-r025-20230726   gcc  
openrisc             randconfig-r026-20230726   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r003-20230726   gcc  
parisc               randconfig-r012-20230726   gcc  
parisc               randconfig-r014-20230726   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc              randconfig-r005-20230726   gcc  
powerpc              randconfig-r006-20230726   gcc  
powerpc              randconfig-r013-20230726   clang
powerpc              randconfig-r032-20230726   gcc  
powerpc              randconfig-r036-20230726   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230726   gcc  
riscv                randconfig-r005-20230726   gcc  
riscv                randconfig-r016-20230726   clang
riscv                randconfig-r033-20230726   gcc  
riscv                randconfig-r036-20230726   gcc  
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230726   gcc  
s390                 randconfig-r014-20230726   clang
s390                 randconfig-r023-20230726   clang
s390                 randconfig-r034-20230726   gcc  
s390                 randconfig-r044-20230726   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230726   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230726   gcc  
sparc                randconfig-r024-20230726   gcc  
sparc                randconfig-r033-20230726   gcc  
sparc64              randconfig-r013-20230726   gcc  
sparc64              randconfig-r023-20230726   gcc  
sparc64              randconfig-r025-20230726   gcc  
sparc64              randconfig-r031-20230726   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r012-20230726   gcc  
um                   randconfig-r034-20230726   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230726   gcc  
x86_64       buildonly-randconfig-r002-20230726   gcc  
x86_64       buildonly-randconfig-r003-20230726   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230726   gcc  
x86_64               randconfig-r005-20230726   gcc  
x86_64               randconfig-x001-20230726   clang
x86_64               randconfig-x002-20230726   clang
x86_64               randconfig-x003-20230726   clang
x86_64               randconfig-x004-20230726   clang
x86_64               randconfig-x005-20230726   clang
x86_64               randconfig-x006-20230726   clang
x86_64               randconfig-x011-20230726   gcc  
x86_64               randconfig-x012-20230726   gcc  
x86_64               randconfig-x013-20230726   gcc  
x86_64               randconfig-x014-20230726   gcc  
x86_64               randconfig-x015-20230726   gcc  
x86_64               randconfig-x016-20230726   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230726   gcc  
xtensa               randconfig-r023-20230726   gcc  
xtensa               randconfig-r031-20230726   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
