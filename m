Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992EC77C99C
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 10:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbjHOIqE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 04:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235741AbjHOIpn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 04:45:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C21E72
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692089141; x=1723625141;
  h=date:from:to:cc:subject:message-id;
  bh=wuU03MET80Q99JcOVQ6ijrw32kvl7cGWgao79K00Szs=;
  b=chQM4C+wpORP9FoG0f9U+vBQzSGH1QgzKwre73IIxCzj9qrVtTHDzFyI
   c6QC6zkRQlw5Il77P+U8Qizn5efB6vX5faPvVVPK1fxVMTjB0jepUjn+o
   QcHLgYcPb5vVA5REOfEDdLLFCTUNN4n+VmIU4PDh8NE8uUAT+FOjddyX/
   t/T/qRsvDhd0XgF9z1NTDWWHTSTQ4Wq2XXkVjA43DnpmNaJGvQl4RwV/E
   eu9B8T9Tms/fWLQ30lODnc2wdvcxqaB+8WTEMV4PynAb+DtLTTr7uy2T/
   pTM/uqyhwZjaqu18CRWlInGJmfhGpoe+v8RjuNVka57VceL9lPsd4QXOC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403214415"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="403214415"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 01:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064380613"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="1064380613"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 01:45:37 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVpgG-0000nt-2G;
        Tue, 15 Aug 2023 08:45:36 +0000
Date:   Tue, 15 Aug 2023 16:45:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 bbb9e06d2c6435af9c62074ad7048910eeb2e7bc
Message-ID: <202308151620.KeNKOU2j-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: bbb9e06d2c6435af9c62074ad7048910eeb2e7bc  Merge 6.5-rc6 into usb-next

elapsed time: 724m

configs tested: 212
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230815   gcc  
alpha                randconfig-r024-20230815   gcc  
alpha                randconfig-r031-20230815   gcc  
alpha                randconfig-r033-20230815   gcc  
alpha                randconfig-r034-20230815   gcc  
alpha                randconfig-r036-20230815   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230815   gcc  
arc                  randconfig-r024-20230815   gcc  
arc                  randconfig-r043-20230815   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                  randconfig-r011-20230815   clang
arm                  randconfig-r024-20230815   clang
arm                  randconfig-r025-20230815   clang
arm                  randconfig-r034-20230815   gcc  
arm                  randconfig-r046-20230815   clang
arm                           sunxi_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230815   gcc  
arm64                randconfig-r016-20230815   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230815   gcc  
csky                 randconfig-r033-20230815   gcc  
csky                 randconfig-r034-20230815   gcc  
hexagon              randconfig-r014-20230815   clang
hexagon              randconfig-r026-20230815   clang
hexagon              randconfig-r041-20230815   clang
hexagon              randconfig-r045-20230815   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230815   clang
i386         buildonly-randconfig-r005-20230815   clang
i386         buildonly-randconfig-r006-20230815   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230815   clang
i386                 randconfig-i002-20230815   clang
i386                 randconfig-i003-20230815   clang
i386                 randconfig-i004-20230815   clang
i386                 randconfig-i005-20230815   clang
i386                 randconfig-i006-20230815   clang
i386                 randconfig-i011-20230815   gcc  
i386                 randconfig-i012-20230815   gcc  
i386                 randconfig-i013-20230815   gcc  
i386                 randconfig-i014-20230815   gcc  
i386                 randconfig-i015-20230815   gcc  
i386                 randconfig-i016-20230815   gcc  
i386                 randconfig-r004-20230815   clang
i386                 randconfig-r005-20230815   clang
i386                 randconfig-r016-20230815   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230815   gcc  
loongarch            randconfig-r004-20230815   gcc  
loongarch            randconfig-r012-20230815   gcc  
loongarch            randconfig-r013-20230815   gcc  
loongarch            randconfig-r023-20230815   gcc  
loongarch            randconfig-r035-20230815   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r013-20230815   gcc  
m68k                 randconfig-r014-20230815   gcc  
m68k                 randconfig-r015-20230815   gcc  
m68k                 randconfig-r021-20230815   gcc  
m68k                 randconfig-r025-20230815   gcc  
m68k                 randconfig-r031-20230815   gcc  
m68k                 randconfig-r035-20230815   gcc  
m68k                 randconfig-r036-20230815   gcc  
microblaze           randconfig-r015-20230815   gcc  
microblaze           randconfig-r034-20230815   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                     loongson1b_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r031-20230815   gcc  
mips                 randconfig-r032-20230815   gcc  
mips                 randconfig-r036-20230815   gcc  
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230815   gcc  
nios2                randconfig-r015-20230815   gcc  
nios2                randconfig-r023-20230815   gcc  
nios2                randconfig-r031-20230815   gcc  
openrisc             randconfig-r011-20230815   gcc  
openrisc             randconfig-r012-20230815   gcc  
parisc                           alldefconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230815   gcc  
parisc               randconfig-r015-20230815   gcc  
parisc               randconfig-r016-20230815   gcc  
parisc               randconfig-r024-20230815   gcc  
parisc               randconfig-r032-20230815   gcc  
parisc               randconfig-r033-20230815   gcc  
parisc               randconfig-r036-20230815   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                       ebony_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc              randconfig-r002-20230815   clang
powerpc              randconfig-r011-20230815   gcc  
powerpc              randconfig-r023-20230815   gcc  
powerpc              randconfig-r033-20230815   clang
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230815   clang
riscv                randconfig-r002-20230815   clang
riscv                randconfig-r003-20230815   clang
riscv                randconfig-r026-20230815   gcc  
riscv                randconfig-r042-20230815   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230815   clang
s390                 randconfig-r022-20230815   gcc  
s390                 randconfig-r044-20230815   gcc  
sh                               allmodconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r005-20230815   gcc  
sh                   randconfig-r011-20230815   gcc  
sh                   randconfig-r022-20230815   gcc  
sh                   randconfig-r025-20230815   gcc  
sh                   randconfig-r032-20230815   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230815   gcc  
sparc                randconfig-r016-20230815   gcc  
sparc                randconfig-r021-20230815   gcc  
sparc                randconfig-r022-20230815   gcc  
sparc                randconfig-r023-20230815   gcc  
sparc                randconfig-r024-20230815   gcc  
sparc                randconfig-r026-20230815   gcc  
sparc                randconfig-r031-20230815   gcc  
sparc                randconfig-r033-20230815   gcc  
sparc                randconfig-r034-20230815   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r012-20230815   gcc  
sparc64              randconfig-r021-20230815   gcc  
sparc64              randconfig-r032-20230815   gcc  
sparc64              randconfig-r036-20230815   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r014-20230815   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230815   clang
x86_64       buildonly-randconfig-r002-20230815   clang
x86_64       buildonly-randconfig-r003-20230815   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230815   clang
x86_64               randconfig-r013-20230815   gcc  
x86_64               randconfig-r015-20230815   gcc  
x86_64               randconfig-r025-20230815   gcc  
x86_64               randconfig-x001-20230815   gcc  
x86_64               randconfig-x002-20230815   gcc  
x86_64               randconfig-x003-20230815   gcc  
x86_64               randconfig-x004-20230815   gcc  
x86_64               randconfig-x005-20230815   gcc  
x86_64               randconfig-x006-20230815   gcc  
x86_64               randconfig-x011-20230815   clang
x86_64               randconfig-x012-20230815   clang
x86_64               randconfig-x013-20230815   clang
x86_64               randconfig-x014-20230815   clang
x86_64               randconfig-x015-20230815   clang
x86_64               randconfig-x016-20230815   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r014-20230815   gcc  
xtensa               randconfig-r026-20230815   gcc  
xtensa               randconfig-r033-20230815   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
