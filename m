Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF53471F58
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 03:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbhLMCgi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Dec 2021 21:36:38 -0500
Received: from mga18.intel.com ([134.134.136.126]:37901 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229436AbhLMCgg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 12 Dec 2021 21:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639362996; x=1670898996;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4YjiJZo4bpcu5wVqp6cVgulzsm6GGeKOXCMIAY4ovQo=;
  b=GdCc1IJS7JMHLJqZlTN1+ZnRQ6p2wucvGGx+BnXtz4jFdAE8CPebjEYv
   AY4hd61gTHXhZFn06Yg+hDqkmUvvXxPJJqpQRnkgYACU+tfolD5JfPTJn
   EPCZ7rkgiioH76lQTtHlukSjDAFXiFgkD4gS5Nizi7gcDVWIEXa9bw9pH
   05uWCdb4y0SCg2oKYDNVrB7JHPo7TUfcOBUrXAIX5yRrCkOoYtnVnv8o0
   6CICzBlGMqnyYOH02mWqX+rbytNRrhz24FYTT648S4E4sEuTh1S+VEEIU
   4X0uhmvfP6WAM7qhHUKI5LwscezSsQuc/S9eC/YL8yvixMeL6MGLWnWhv
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="225511500"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="225511500"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2021 18:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="751952526"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2021 18:36:34 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwbCb-0006Ba-Tm; Mon, 13 Dec 2021 02:36:33 +0000
Date:   Mon, 13 Dec 2021 10:36:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ca5737396927afd4d57b133fd2874bbcf3421cdb
Message-ID: <61b6b1ab.cqk1WZcvdCIBWh3X%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ca5737396927afd4d57b133fd2874bbcf3421cdb  usb: core: config: using bit mask instead of individual bits

elapsed time: 727m

configs tested: 203
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                             allyesconfig
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
riscv                            allyesconfig
arm                       omap2plus_defconfig
arc                      axs103_smp_defconfig
xtensa                    smp_lx200_defconfig
nios2                               defconfig
powerpc                    gamecube_defconfig
mips                        bcm47xx_defconfig
m68k                        mvme147_defconfig
arm                           viper_defconfig
arm                          pxa3xx_defconfig
xtensa                    xip_kc705_defconfig
riscv                            alldefconfig
h8300                               defconfig
arm                        trizeps4_defconfig
arc                        nsim_700_defconfig
arm                   milbeaut_m10v_defconfig
arm                         assabet_defconfig
powerpc                     rainier_defconfig
powerpc                       ebony_defconfig
arm                           sama5_defconfig
powerpc                 mpc837x_mds_defconfig
sh                            hp6xx_defconfig
mips                      maltasmvp_defconfig
sh                          r7780mp_defconfig
mips                      pic32mzda_defconfig
m68k                        mvme16x_defconfig
arc                         haps_hs_defconfig
riscv                    nommu_k210_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                          amiga_defconfig
mips                        bcm63xx_defconfig
sh                          urquell_defconfig
sh                          rsk7269_defconfig
arm                      tct_hammer_defconfig
csky                             alldefconfig
sh                           se7721_defconfig
powerpc                     akebono_defconfig
sh                           se7722_defconfig
m68k                          atari_defconfig
arm                             rpc_defconfig
powerpc                     tqm8548_defconfig
powerpc                        icon_defconfig
sh                                  defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                        cell_defconfig
microblaze                          defconfig
powerpc                     mpc5200_defconfig
h8300                       h8s-sim_defconfig
alpha                            alldefconfig
powerpc                         ps3_defconfig
powerpc                 mpc832x_rdb_defconfig
sparc64                          alldefconfig
powerpc                     mpc512x_defconfig
arc                     nsimosci_hs_defconfig
xtensa                          iss_defconfig
mips                        vocore2_defconfig
arc                          axs103_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                      rts7751r2d1_defconfig
openrisc                            defconfig
arm64                            alldefconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                    sam440ep_defconfig
powerpc                     tqm8541_defconfig
mips                           ip27_defconfig
sh                           se7712_defconfig
nios2                            alldefconfig
arm                             mxs_defconfig
sh                   sh7770_generic_defconfig
mips                       bmips_be_defconfig
xtensa                  nommu_kc705_defconfig
arm                         lpc18xx_defconfig
mips                     cu1000-neo_defconfig
m68k                         amcore_defconfig
riscv                             allnoconfig
arm                          collie_defconfig
s390                       zfcpdump_defconfig
arm                         hackkit_defconfig
m68k                       m5249evb_defconfig
sh                           se7780_defconfig
mips                           ip28_defconfig
mips                      bmips_stb_defconfig
sparc                            alldefconfig
arm                      footbridge_defconfig
sh                        apsh4ad0a_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                  storcenter_defconfig
powerpc                       holly_defconfig
powerpc                        warp_defconfig
arm                          imote2_defconfig
ia64                             allmodconfig
mips                      malta_kvm_defconfig
sh                         microdev_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     redwood_defconfig
sh                           se7724_defconfig
arm                           h3600_defconfig
sh                        sh7763rdp_defconfig
arm                        mvebu_v7_defconfig
mips                     loongson1b_defconfig
arm                        realview_defconfig
sh                           se7206_defconfig
mips                     decstation_defconfig
i386                                defconfig
mips                          rb532_defconfig
arm                  randconfig-c002-20211212
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
arc                              allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211212
x86_64               randconfig-a002-20211212
x86_64               randconfig-a003-20211212
x86_64               randconfig-a004-20211212
x86_64               randconfig-a006-20211212
x86_64               randconfig-a005-20211212
i386                 randconfig-a001-20211212
i386                 randconfig-a002-20211212
i386                 randconfig-a005-20211212
i386                 randconfig-a003-20211212
i386                 randconfig-a006-20211212
i386                 randconfig-a004-20211212
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a016-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
arc                  randconfig-r043-20211212
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211212
arm                  randconfig-c002-20211212
riscv                randconfig-c006-20211212
mips                 randconfig-c004-20211212
i386                 randconfig-c001-20211212
s390                 randconfig-c005-20211212
powerpc              randconfig-c003-20211212
x86_64               randconfig-a011-20211212
x86_64               randconfig-a012-20211212
x86_64               randconfig-a014-20211212
x86_64               randconfig-a013-20211212
x86_64               randconfig-a016-20211212
x86_64               randconfig-a015-20211212
i386                 randconfig-a013-20211212
i386                 randconfig-a011-20211212
i386                 randconfig-a016-20211212
i386                 randconfig-a014-20211212
i386                 randconfig-a015-20211212
i386                 randconfig-a012-20211212
hexagon              randconfig-r045-20211212
riscv                randconfig-r042-20211212
s390                 randconfig-r044-20211212
hexagon              randconfig-r041-20211212

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
