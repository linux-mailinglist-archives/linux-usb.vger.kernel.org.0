Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462B573F04C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 03:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjF0BVs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 21:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjF0BVp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 21:21:45 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F295173C
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828903; x=1719364903;
  h=date:from:to:cc:subject:message-id;
  bh=jdF+0q/251k72WAn/7rmNZHMTQphgtJjwYFaAMEG6Kc=;
  b=coIlHWHzEjYki2Pxfrzpyu3XUu8VVqI5uGiRMsybEHlVP1BS2gasuxeL
   RtfnuuEo2KQMto4OoaGTCk14MACSHqhMGEK9cpFXRjR6xUXaZFsERHnAt
   rXcpXxg0wbDVYjJl/Mu/GKXYin+BUYGzFJ+siJx6JL6MQybIs7LGUTWf1
   rEzOb17c/sV34Hrc+GqRJR3vEv2K5aGyDa7++RfGo5quLUTLd3BOjFW2k
   2CTUezgiZHRaztXFkUHYO/okFXCjjzak7Wc73AIcMOfuu5wz9VgT3IljX
   7ofqSO1IGquA2kKMYxLUxFwcAC3H/axqX9itQ39wBUDY4pwdxUd6EyHEr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="391879476"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="391879476"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="719593139"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="719593139"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jun 2023 18:21:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qDxOn-000BOR-00;
        Tue, 27 Jun 2023 01:21:41 +0000
Date:   Tue, 27 Jun 2023 09:20:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 18af4b5c97915a6daef9de28a30ae1d3786bc2ac
Message-ID: <202306270954.Pp1LzNJi-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 18af4b5c97915a6daef9de28a30ae1d3786bc2ac  usb: host: xhci-plat: Set XHCI_STATE_REMOVING before resuming XHCI HC

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305300608.8CuLyqAL-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
`-- riscv-allyesconfig
    `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead

elapsed time: 5339m

configs tested: 311
configs skipped: 11

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230626   gcc  
alpha                randconfig-r021-20230624   gcc  
alpha                randconfig-r031-20230626   gcc  
alpha                randconfig-r034-20230624   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r043-20230622   gcc  
arc                  randconfig-r043-20230624   gcc  
arc                  randconfig-r043-20230626   gcc  
arc                           tb10x_defconfig   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                          collie_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                      integrator_defconfig   gcc  
arm                          ixp4xx_defconfig   clang
arm                        keystone_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                        neponset_defconfig   clang
arm                       netwinder_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r004-20230623   clang
arm                  randconfig-r026-20230622   clang
arm                  randconfig-r046-20230622   clang
arm                  randconfig-r046-20230624   clang
arm                         s5pv210_defconfig   clang
arm                        shmobile_defconfig   gcc  
arm                       spear13xx_defconfig   clang
arm                        spear3xx_defconfig   clang
arm                           stm32_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230626   gcc  
arm64                randconfig-r022-20230622   gcc  
arm64                randconfig-r036-20230623   gcc  
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230626   gcc  
csky                 randconfig-r006-20230624   gcc  
csky                 randconfig-r013-20230626   gcc  
csky                 randconfig-r014-20230626   gcc  
csky                 randconfig-r016-20230626   gcc  
csky                 randconfig-r021-20230622   gcc  
csky                 randconfig-r025-20230626   gcc  
csky                 randconfig-r026-20230626   gcc  
csky                 randconfig-r034-20230623   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r011-20230622   clang
hexagon              randconfig-r022-20230624   clang
hexagon              randconfig-r041-20230622   clang
hexagon              randconfig-r041-20230624   clang
hexagon              randconfig-r045-20230622   clang
hexagon              randconfig-r045-20230624   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230621   gcc  
i386         buildonly-randconfig-r004-20230624   clang
i386         buildonly-randconfig-r004-20230626   clang
i386         buildonly-randconfig-r005-20230621   gcc  
i386         buildonly-randconfig-r005-20230624   clang
i386         buildonly-randconfig-r005-20230626   clang
i386         buildonly-randconfig-r006-20230621   gcc  
i386         buildonly-randconfig-r006-20230624   clang
i386         buildonly-randconfig-r006-20230626   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230622   clang
i386                 randconfig-i001-20230624   clang
i386                 randconfig-i001-20230626   clang
i386                 randconfig-i002-20230622   clang
i386                 randconfig-i002-20230624   clang
i386                 randconfig-i002-20230626   clang
i386                 randconfig-i003-20230622   clang
i386                 randconfig-i003-20230624   clang
i386                 randconfig-i003-20230626   clang
i386                 randconfig-i004-20230622   clang
i386                 randconfig-i004-20230624   clang
i386                 randconfig-i004-20230626   clang
i386                 randconfig-i005-20230622   clang
i386                 randconfig-i005-20230624   clang
i386                 randconfig-i005-20230626   clang
i386                 randconfig-i006-20230622   clang
i386                 randconfig-i006-20230624   clang
i386                 randconfig-i006-20230626   clang
i386                 randconfig-i011-20230622   gcc  
i386                 randconfig-i011-20230624   gcc  
i386                 randconfig-i011-20230626   gcc  
i386                 randconfig-i012-20230622   gcc  
i386                 randconfig-i012-20230624   gcc  
i386                 randconfig-i012-20230626   gcc  
i386                 randconfig-i013-20230622   gcc  
i386                 randconfig-i013-20230624   gcc  
i386                 randconfig-i013-20230626   gcc  
i386                 randconfig-i014-20230622   gcc  
i386                 randconfig-i014-20230624   gcc  
i386                 randconfig-i014-20230626   gcc  
i386                 randconfig-i015-20230622   gcc  
i386                 randconfig-i015-20230624   gcc  
i386                 randconfig-i015-20230626   gcc  
i386                 randconfig-i016-20230622   gcc  
i386                 randconfig-i016-20230624   gcc  
i386                 randconfig-i016-20230626   gcc  
i386                 randconfig-r005-20230623   gcc  
i386                 randconfig-r023-20230626   gcc  
i386                 randconfig-r024-20230626   gcc  
i386                 randconfig-r032-20230626   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230624   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r005-20230624   gcc  
m68k                 randconfig-r013-20230622   gcc  
m68k                 randconfig-r016-20230622   gcc  
m68k                 randconfig-r023-20230626   gcc  
m68k                 randconfig-r033-20230623   gcc  
m68k                 randconfig-r033-20230626   gcc  
m68k                 randconfig-r036-20230624   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                        bcm47xx_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                     loongson1b_defconfig   gcc  
mips                     loongson2k_defconfig   clang
mips                      malta_kvm_defconfig   clang
mips                      maltaaprp_defconfig   clang
mips                 randconfig-r024-20230624   clang
mips                 randconfig-r033-20230624   gcc  
nios2                         10m50_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230623   gcc  
nios2                randconfig-r011-20230624   gcc  
nios2                randconfig-r015-20230626   gcc  
nios2                randconfig-r022-20230626   gcc  
nios2                randconfig-r032-20230623   gcc  
nios2                randconfig-r035-20230623   gcc  
openrisc             randconfig-r003-20230626   gcc  
openrisc             randconfig-r005-20230626   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r011-20230626   gcc  
parisc               randconfig-r014-20230624   gcc  
parisc               randconfig-r035-20230626   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    amigaone_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                    ge_imp3a_defconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                        icon_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      obs600_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r012-20230626   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r014-20230622   gcc  
riscv                randconfig-r023-20230624   gcc  
riscv                randconfig-r024-20230626   gcc  
riscv                randconfig-r042-20230622   gcc  
riscv                randconfig-r042-20230624   gcc  
riscv                randconfig-r042-20230626   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230624   gcc  
s390                 randconfig-r014-20230626   gcc  
s390                 randconfig-r026-20230624   gcc  
s390                 randconfig-r035-20230626   clang
s390                 randconfig-r044-20230622   gcc  
s390                 randconfig-r044-20230624   gcc  
s390                 randconfig-r044-20230626   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r002-20230624   gcc  
sh                   randconfig-r002-20230626   gcc  
sh                   randconfig-r006-20230623   gcc  
sh                   randconfig-r015-20230622   gcc  
sh                   randconfig-r016-20230626   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230623   gcc  
sparc                randconfig-r004-20230624   gcc  
sparc                randconfig-r015-20230624   gcc  
sparc                randconfig-r025-20230622   gcc  
sparc                randconfig-r032-20230624   gcc  
sparc                randconfig-r032-20230626   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r021-20230626   gcc  
sparc64              randconfig-r023-20230622   gcc  
sparc64              randconfig-r025-20230626   gcc  
sparc64              randconfig-r036-20230626   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r002-20230623   clang
um                   randconfig-r012-20230622   clang
um                   randconfig-r013-20230624   clang
um                   randconfig-r016-20230624   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230621   gcc  
x86_64       buildonly-randconfig-r001-20230624   clang
x86_64       buildonly-randconfig-r001-20230626   clang
x86_64       buildonly-randconfig-r002-20230621   gcc  
x86_64       buildonly-randconfig-r002-20230624   clang
x86_64       buildonly-randconfig-r002-20230626   clang
x86_64       buildonly-randconfig-r003-20230621   gcc  
x86_64       buildonly-randconfig-r003-20230624   clang
x86_64       buildonly-randconfig-r003-20230626   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r001-20230624   clang
x86_64               randconfig-r012-20230626   gcc  
x86_64               randconfig-r035-20230624   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r026-20230626   gcc  
xtensa               randconfig-r031-20230623   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
