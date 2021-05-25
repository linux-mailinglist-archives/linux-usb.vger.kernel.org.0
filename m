Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E05B390BA9
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 23:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhEYVlq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 17:41:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:41426 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230421AbhEYVlq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 17:41:46 -0400
IronPort-SDR: UBejZgyo4JlN407znaiZUv6tOYxrx04+kuN87dyOUrV+KbtlcOaEjDVCzv6OLGc2cOVOAY+JBr
 I375AHwfogGA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="266205940"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="266205940"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 14:40:11 -0700
IronPort-SDR: 3sru83LYpCDEi6ivABL2QrjCRz13de8RGj4Gw/gaJ5K3oNg/zjkxajsg0HV8nNR5ir7uWtXyiu
 8mQcFXw2jPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="471438492"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 May 2021 14:40:09 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llemW-0001pX-HO; Tue, 25 May 2021 21:40:08 +0000
Date:   Wed, 26 May 2021 05:39:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 a7f2e9272aff1ccfe0fc801dab1d5a7a1c6b7ed2
Message-ID: <60ad6e7c.q0U1WWg21ia77XfF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: a7f2e9272aff1ccfe0fc801dab1d5a7a1c6b7ed2  xhci: Fix 5.12 regression of missing xHC cache clearing command after a Stall

elapsed time: 733m

configs tested: 246
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
arm                        clps711x_defconfig
sh                          kfr2r09_defconfig
powerpc                     rainier_defconfig
mips                         mpc30x_defconfig
um                               alldefconfig
mips                      malta_kvm_defconfig
arc                            hsdk_defconfig
arm                        realview_defconfig
powerpc                        cell_defconfig
mips                       lemote2f_defconfig
powerpc                        icon_defconfig
parisc                generic-64bit_defconfig
mips                     loongson1c_defconfig
arm                   milbeaut_m10v_defconfig
sh                        apsh4ad0a_defconfig
mips                          ath79_defconfig
xtensa                generic_kc705_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
powerpc                 mpc834x_mds_defconfig
riscv                            allmodconfig
arm                         cm_x300_defconfig
sh                   sh7724_generic_defconfig
sh                             sh03_defconfig
openrisc                            defconfig
x86_64                           alldefconfig
powerpc                     mpc83xx_defconfig
arc                          axs101_defconfig
mips                           xway_defconfig
mips                        omega2p_defconfig
powerpc                     tqm8548_defconfig
sh                        sh7785lcr_defconfig
sh                         microdev_defconfig
arm                          ep93xx_defconfig
x86_64                            allnoconfig
mips                      maltasmvp_defconfig
powerpc                      ppc44x_defconfig
sh                           se7206_defconfig
sh                          sdk7786_defconfig
sh                            titan_defconfig
x86_64                              defconfig
openrisc                    or1ksim_defconfig
powerpc                      ppc40x_defconfig
sh                        dreamcast_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     mpc512x_defconfig
powerpc                     ksi8560_defconfig
mips                     decstation_defconfig
ia64                            zx1_defconfig
h8300                            alldefconfig
arm                            mmp2_defconfig
powerpc                       ppc64_defconfig
mips                      loongson3_defconfig
mips                        nlm_xlp_defconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8555_defconfig
arm                          simpad_defconfig
h8300                       h8s-sim_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    mvme5100_defconfig
mips                       rbtx49xx_defconfig
alpha                            alldefconfig
um                           x86_64_defconfig
arm                         s3c6400_defconfig
powerpc                      pasemi_defconfig
csky                             alldefconfig
powerpc                       holly_defconfig
powerpc                 mpc8315_rdb_defconfig
arc                        vdk_hs38_defconfig
arc                     haps_hs_smp_defconfig
arm                          pcm027_defconfig
arm                        mvebu_v5_defconfig
powerpc                       eiger_defconfig
mips                      fuloong2e_defconfig
sh                         apsh4a3a_defconfig
sparc                            alldefconfig
arm                            hisi_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
um                            kunit_defconfig
arm                          collie_defconfig
powerpc                   motionpro_defconfig
powerpc64                           defconfig
um                             i386_defconfig
sparc64                             defconfig
arm                        multi_v7_defconfig
nds32                            alldefconfig
sh                   secureedge5410_defconfig
powerpc                      bamboo_defconfig
microblaze                          defconfig
arm                            mps2_defconfig
arm                            pleb_defconfig
arm                       multi_v4t_defconfig
powerpc                     ppa8548_defconfig
arm                    vt8500_v6_v7_defconfig
xtensa                         virt_defconfig
mips                     cu1830-neo_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     taishan_defconfig
sh                         ap325rxa_defconfig
x86_64                           allyesconfig
mips                       bmips_be_defconfig
um                                allnoconfig
m68k                        m5307c3_defconfig
ia64                          tiger_defconfig
arm                        vexpress_defconfig
riscv                    nommu_k210_defconfig
powerpc                     tqm8541_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                       capcella_defconfig
arm                           spitz_defconfig
arm                        spear6xx_defconfig
powerpc                  storcenter_defconfig
arm                           tegra_defconfig
arm                          pxa910_defconfig
arm                           stm32_defconfig
sh                          landisk_defconfig
mips                      maltaaprp_defconfig
powerpc                      ppc6xx_defconfig
arm                     am200epdkit_defconfig
powerpc                       maple_defconfig
mips                        jmr3927_defconfig
arm                           viper_defconfig
arm                         hackkit_defconfig
mips                           mtx1_defconfig
powerpc                 mpc8560_ads_defconfig
mips                        maltaup_defconfig
arc                           tb10x_defconfig
xtensa                  nommu_kc705_defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
m68k                       m5249evb_defconfig
riscv                             allnoconfig
arm                     davinci_all_defconfig
powerpc                      mgcoge_defconfig
nds32                             allnoconfig
powerpc                          g5_defconfig
arm                           u8500_defconfig
sh                          lboxre2_defconfig
powerpc                      pcm030_defconfig
mips                           jazz_defconfig
arm                        keystone_defconfig
arm                         orion5x_defconfig
arc                        nsimosci_defconfig
m68k                            q40_defconfig
powerpc                    klondike_defconfig
sh                          rsk7203_defconfig
parisc                generic-32bit_defconfig
i386                                defconfig
powerpc                 mpc837x_rdb_defconfig
s390                       zfcpdump_defconfig
arm                       imx_v4_v5_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                        m5272c3_defconfig
mips                            e55_defconfig
arm                      tct_hammer_defconfig
xtensa                    smp_lx200_defconfig
arm                            xcep_defconfig
m68k                          multi_defconfig
parisc                           alldefconfig
m68k                          sun3x_defconfig
mips                   sb1250_swarm_defconfig
sh                           se7705_defconfig
m68k                        mvme16x_defconfig
arm                             rpc_defconfig
riscv             nommu_k210_sdcard_defconfig
sparc                            allyesconfig
mips                           rs90_defconfig
arm64                            alldefconfig
sh                        edosk7705_defconfig
m68k                         apollo_defconfig
arm                      pxa255-idp_defconfig
powerpc                 canyonlands_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a004-20210525
x86_64               randconfig-a013-20210525
x86_64               randconfig-a012-20210525
x86_64               randconfig-a014-20210525
x86_64               randconfig-a016-20210525
x86_64               randconfig-a015-20210525
x86_64               randconfig-a011-20210525
i386                 randconfig-a011-20210525
i386                 randconfig-a016-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210525
x86_64               randconfig-a005-20210525
x86_64               randconfig-a006-20210525
x86_64               randconfig-a001-20210525
x86_64               randconfig-a003-20210525
x86_64               randconfig-a004-20210525
x86_64               randconfig-a002-20210525

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
