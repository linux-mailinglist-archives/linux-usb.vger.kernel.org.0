Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC27B3B39D1
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jun 2021 01:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhFXXsp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Jun 2021 19:48:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:32504 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229585AbhFXXso (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Jun 2021 19:48:44 -0400
IronPort-SDR: n73yUfUnktOrRcICxD6RhdcIxqJ2s4vxbmm9uWM1Zcd6F98dSM9Rz+xf6uaG4ywLlN4nXNpiC4
 IjxePmDe1FPQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="204570385"
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; 
   d="scan'208";a="204570385"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 16:46:24 -0700
IronPort-SDR: bN1LXcdq2Omin092N0IznTQY0ECfR6AfkostwWAWKVd6eqlSjt7eyNzjOmjJtq3ei+B1r7kXLX
 HMPcP66x+FtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; 
   d="scan'208";a="424254387"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Jun 2021 16:46:23 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lwZ38-0006p1-EK; Thu, 24 Jun 2021 23:46:22 +0000
Date:   Fri, 25 Jun 2021 07:45:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 8e9910c5ad97aa9479ab19e6535065522d6a0f08
Message-ID: <60d51930.VydjCz/ezz8DwyAV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 8e9910c5ad97aa9479ab19e6535065522d6a0f08  Merge tag 'usb-serial-5.14-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 726m

configs tested: 165
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             rpc_defconfig
arm                        magician_defconfig
mips                      maltasmvp_defconfig
powerpc                      ppc44x_defconfig
mips                     decstation_defconfig
arm                       aspeed_g5_defconfig
mips                     loongson1c_defconfig
sh                        dreamcast_defconfig
sh                        sh7785lcr_defconfig
arm                         axm55xx_defconfig
nios2                         10m50_defconfig
powerpc                       holly_defconfig
powerpc                      makalu_defconfig
arc                        nsimosci_defconfig
sparc64                          alldefconfig
arm                        keystone_defconfig
mips                          ath79_defconfig
powerpc                     akebono_defconfig
xtensa                generic_kc705_defconfig
riscv                             allnoconfig
openrisc                    or1ksim_defconfig
ia64                             allmodconfig
mips                         rt305x_defconfig
sh                           se7206_defconfig
nios2                            alldefconfig
powerpc                 mpc8540_ads_defconfig
mips                malta_qemu_32r6_defconfig
arm                       aspeed_g4_defconfig
powerpc                     tqm8540_defconfig
ia64                      gensparse_defconfig
arm                       spear13xx_defconfig
powerpc                        fsp2_defconfig
powerpc                     tqm8555_defconfig
xtensa                       common_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  cadence_csp_defconfig
sh                        edosk7760_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                        m5307c3_defconfig
m68k                         amcore_defconfig
xtensa                          iss_defconfig
arm                       multi_v4t_defconfig
m68k                          amiga_defconfig
powerpc                     sequoia_defconfig
arm                          badge4_defconfig
sh                   rts7751r2dplus_defconfig
arc                          axs103_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7722_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     ep8248e_defconfig
arm                        clps711x_defconfig
sh                           se7343_defconfig
m68k                        m5272c3_defconfig
arm                           sunxi_defconfig
nios2                         3c120_defconfig
sh                          rsk7269_defconfig
mips                      malta_kvm_defconfig
sh                   secureedge5410_defconfig
arm                        multi_v7_defconfig
mips                           gcw0_defconfig
arc                        vdk_hs38_defconfig
sh                          rsk7203_defconfig
m68k                          sun3x_defconfig
powerpc                       maple_defconfig
arm                           corgi_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     sbc8548_defconfig
arm                         palmz72_defconfig
m68k                        mvme147_defconfig
arm                          ixp4xx_defconfig
arm                          pxa910_defconfig
powerpc                     ppa8548_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                               defconfig
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
i386                 randconfig-a002-20210623
i386                 randconfig-a001-20210623
i386                 randconfig-a003-20210623
i386                 randconfig-a006-20210623
i386                 randconfig-a005-20210623
i386                 randconfig-a004-20210623
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a011-20210623
i386                 randconfig-a014-20210623
i386                 randconfig-a013-20210623
i386                 randconfig-a015-20210623
i386                 randconfig-a012-20210623
i386                 randconfig-a016-20210623
i386                 randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-b001-20210624
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
