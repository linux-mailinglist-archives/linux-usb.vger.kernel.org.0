Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C8B319893
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 04:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhBLDG1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 22:06:27 -0500
Received: from mga03.intel.com ([134.134.136.65]:19703 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhBLDG0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Feb 2021 22:06:26 -0500
IronPort-SDR: Zm6BAwK55tYs3aW3X0djFsfFFEKjqXfuanljis4Ws2uD5i+FKQszpnA89GzOMI+D1eg1aqQVIa
 WJOZ3FBBtUmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="182429487"
X-IronPort-AV: E=Sophos;i="5.81,172,1610438400"; 
   d="scan'208";a="182429487"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 19:05:43 -0800
IronPort-SDR: XjCfJJL05U3bdqBK/vmLsOvfD2550Pesxaf0rio59YCPah2lfUEXkj0hLU7XEvPaB5yj9aZ/nh
 NMq06EBVNZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,172,1610438400"; 
   d="scan'208";a="422315905"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2021 19:05:41 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lAOm4-0004JZ-KV; Fri, 12 Feb 2021 03:05:40 +0000
Date:   Fri, 12 Feb 2021 11:05:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 7a1e838d0cdce7d09a0bd81d45c7b5a660e71ac7
Message-ID: <6025f081.9HL6VlbFC0f2MEdi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 7a1e838d0cdce7d09a0bd81d45c7b5a660e71ac7  usb: misc: usb3503: Fix logic in usb3503_init()

elapsed time: 730m

configs tested: 148
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
alpha                            alldefconfig
arc                     haps_hs_smp_defconfig
sh                               j2_defconfig
powerpc                      ppc64e_defconfig
arm                       netwinder_defconfig
powerpc                         ps3_defconfig
h8300                     edosk2674_defconfig
arm                          moxart_defconfig
arm                             rpc_defconfig
mips                         mpc30x_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    ge_imp3a_defconfig
m68k                          atari_defconfig
mips                      bmips_stb_defconfig
powerpc                     stx_gp3_defconfig
arm                           sunxi_defconfig
sh                           se7705_defconfig
m68k                          hp300_defconfig
powerpc                 linkstation_defconfig
sh                            migor_defconfig
mips                      maltasmvp_defconfig
mips                     cu1830-neo_defconfig
mips                         tb0219_defconfig
sh                          rsk7264_defconfig
arm                            u300_defconfig
mips                         rt305x_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm5200_defconfig
sh                     sh7710voipgw_defconfig
mips                      maltaaprp_defconfig
powerpc                     redwood_defconfig
arm                          exynos_defconfig
arc                          axs101_defconfig
powerpc                 mpc8540_ads_defconfig
mips                      malta_kvm_defconfig
s390                          debug_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                       holly_defconfig
powerpc                     kmeter1_defconfig
sh                                  defconfig
powerpc                     taishan_defconfig
powerpc                       eiger_defconfig
arm                          pxa910_defconfig
powerpc                    sam440ep_defconfig
powerpc                  mpc885_ads_defconfig
c6x                        evmc6457_defconfig
openrisc                            defconfig
arm                           omap1_defconfig
arm                         shannon_defconfig
powerpc                      chrp32_defconfig
arc                        vdk_hs38_defconfig
arm                         vf610m4_defconfig
sparc                       sparc32_defconfig
mips                            e55_defconfig
powerpc                      pcm030_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
powerpc                     tqm8548_defconfig
microblaze                          defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
x86_64               randconfig-a016-20210211
x86_64               randconfig-a013-20210211
x86_64               randconfig-a012-20210211
x86_64               randconfig-a015-20210211
x86_64               randconfig-a014-20210211
x86_64               randconfig-a011-20210211
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210211
x86_64               randconfig-a002-20210211
x86_64               randconfig-a001-20210211
x86_64               randconfig-a004-20210211
x86_64               randconfig-a005-20210211
x86_64               randconfig-a006-20210211
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
