Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EED0F701A94
	for <lists+linux-usb@lfdr.de>; Sun, 14 May 2023 00:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjEMWeW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 May 2023 18:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjEMWeU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 May 2023 18:34:20 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 619381FF0
        for <linux-usb@vger.kernel.org>; Sat, 13 May 2023 15:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684017259; x=1715553259;
  h=date:from:to:cc:subject:message-id;
  bh=x0K4lQzQhNILj8xrMYF8bsRpeHG58uGzy4cWNWiuDiw=;
  b=JNKpEqdoaUu238d9Xn1My9POwuiSbX3qIYPrBTcHMc1qZ/cSTPYFdNqP
   OEZKG+LeXdYh9H0mfZKAibY3Nb//2JwJVYcXsf+7PXcnHId9Ou5r9hFHu
   scWYu8NcpJDr4RtX362O/srdUDgCAe8iIRWHMN26J8mggaf9KTj6G07uM
   u7YZcVtxR1cDKsPl4UH4/vTKzr450iwSXGhyKrZwvf47uo+VwgxLWXc5c
   oQgIvQT/ZCSEpmwvk6iYtzLBPTOE/7DFiK+CuYKT4PlfO9a8e1loJSCYM
   MD/RBvf1smow6cwinSNfhLo1FbY0LriGaz01EItZFDInt3gsNbaOxOfPS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="414377503"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="414377503"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 15:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="1030447840"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="1030447840"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 May 2023 15:34:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pxxoe-0005hw-3A;
        Sat, 13 May 2023 22:34:16 +0000
Date:   Sun, 14 May 2023 06:34:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a4422ff221429c600c3dc5d0394fb3738b89d040
Message-ID: <20230513223412._fnxZ%lkp@intel.com>
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
branch HEAD: a4422ff221429c600c3dc5d0394fb3738b89d040  usb: typec: qcom: Add Qualcomm PMIC Type-C driver

elapsed time: 727m

configs tested: 153
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230511   gcc  
alpha                randconfig-r014-20230513   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230513   gcc  
arc                  randconfig-r016-20230513   gcc  
arc                  randconfig-r031-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arc                  randconfig-r043-20230511   gcc  
arc                  randconfig-r043-20230513   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                  randconfig-r006-20230513   gcc  
arm                  randconfig-r033-20230509   clang
arm                  randconfig-r046-20230509   gcc  
arm                  randconfig-r046-20230511   clang
arm                  randconfig-r046-20230513   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230513   clang
arm64                               defconfig   gcc  
arm64                randconfig-r032-20230511   clang
arm64                randconfig-r035-20230511   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230511   gcc  
csky                 randconfig-r015-20230509   gcc  
csky                 randconfig-r032-20230509   gcc  
hexagon              randconfig-r004-20230509   clang
hexagon              randconfig-r005-20230509   clang
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
ia64                             alldefconfig   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r035-20230509   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                 randconfig-r002-20230511   gcc  
m68k                 randconfig-r003-20230513   gcc  
microblaze   buildonly-randconfig-r004-20230513   gcc  
microblaze           randconfig-r004-20230513   gcc  
microblaze           randconfig-r014-20230511   gcc  
microblaze           randconfig-r033-20230513   gcc  
microblaze           randconfig-r036-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230513   gcc  
mips         buildonly-randconfig-r002-20230513   gcc  
mips                     decstation_defconfig   gcc  
mips                 randconfig-r003-20230509   clang
mips                 randconfig-r015-20230511   clang
mips                 randconfig-r032-20230513   gcc  
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230511   gcc  
nios2                randconfig-r005-20230513   gcc  
openrisc             randconfig-r002-20230513   gcc  
openrisc             randconfig-r006-20230509   gcc  
openrisc             randconfig-r013-20230513   gcc  
openrisc             randconfig-r031-20230511   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r014-20230509   gcc  
parisc               randconfig-r031-20230513   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc      buildonly-randconfig-r003-20230513   gcc  
powerpc                     kilauea_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc              randconfig-r006-20230511   clang
powerpc              randconfig-r016-20230511   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230511   clang
riscv                randconfig-r034-20230511   clang
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230511   gcc  
riscv                randconfig-r042-20230513   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230513   gcc  
s390                 randconfig-r033-20230511   clang
s390                 randconfig-r034-20230509   gcc  
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230511   gcc  
s390                 randconfig-r044-20230513   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230513   gcc  
sh                   randconfig-r002-20230509   gcc  
sh                   randconfig-r013-20230511   gcc  
sh                   randconfig-r035-20230513   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230509   gcc  
sparc                randconfig-r012-20230509   gcc  
sparc64              randconfig-r001-20230513   gcc  
sparc64              randconfig-r016-20230509   gcc  
um                               alldefconfig   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r001-20230509   gcc  
xtensa               randconfig-r012-20230511   gcc  
xtensa               randconfig-r012-20230513   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
