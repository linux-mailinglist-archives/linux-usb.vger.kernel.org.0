Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7209339B41E
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 09:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhFDHk6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 03:40:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:56123 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229973AbhFDHk6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 03:40:58 -0400
IronPort-SDR: Lesbc5OJ7+8lFosjPHcPpEGrLZA86QkVhAyubt0uDW4CJ2uIH9YXzhqK8TgN3zrwAYHDQTeBu7
 4V6NWnIX/vkg==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="201223622"
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; 
   d="scan'208";a="201223622"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 00:39:12 -0700
IronPort-SDR: qJkEX9QsSpXn+HiY8wy5D/iR20j4F595VCpL0wluTtCjOB6t8UjL/tnUuIo/fX3cBbGG/eE4Fn
 ihUy52Glkkyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; 
   d="scan'208";a="618179252"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Jun 2021 00:39:11 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lp4QA-0006n4-JM; Fri, 04 Jun 2021 07:39:10 +0000
Date:   Fri, 04 Jun 2021 15:38:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 8d396bb0a5b62b326f6be7594d8bd46b088296bd
Message-ID: <60b9d87b.ooznIa7mRyHTcago%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 8d396bb0a5b62b326f6be7594d8bd46b088296bd  usb: dwc3: debugfs: Add and remove endpoint dirs dynamically

elapsed time: 724m

configs tested: 267
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
um                           x86_64_defconfig
riscv                            allyesconfig
mips                             allyesconfig
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
powerpc                          allyesconfig
s390                             allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                           allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                            allyesconfig
mips                           ip27_defconfig
powerpc                      pasemi_defconfig
m68k                       m5249evb_defconfig
arm                         lpc32xx_defconfig
nios2                         3c120_defconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
mips                           xway_defconfig
powerpc                       holly_defconfig
sh                   rts7751r2dplus_defconfig
nios2                            alldefconfig
arm                      tct_hammer_defconfig
powerpc                      cm5200_defconfig
mips                       capcella_defconfig
ia64                      gensparse_defconfig
sh                            hp6xx_defconfig
mips                     cu1830-neo_defconfig
arm                        clps711x_defconfig
arc                         haps_hs_defconfig
mips                          rb532_defconfig
arm                          collie_defconfig
h8300                     edosk2674_defconfig
sparc64                          alldefconfig
arm                     am200epdkit_defconfig
arm                        multi_v5_defconfig
um                            kunit_defconfig
mips                         rt305x_defconfig
mips                           mtx1_defconfig
arm                          ep93xx_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     kilauea_defconfig
sh                           se7780_defconfig
powerpc                    amigaone_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                   sh7770_generic_defconfig
m68k                       m5275evb_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                         ps3_defconfig
mips                         tb0287_defconfig
sh                          landisk_defconfig
mips                        maltaup_defconfig
m68k                        m5407c3_defconfig
m68k                        mvme16x_defconfig
arc                    vdk_hs38_smp_defconfig
um                                  defconfig
powerpc                      katmai_defconfig
mips                         mpc30x_defconfig
powerpc                      acadia_defconfig
powerpc64                        alldefconfig
arc                     nsimosci_hs_defconfig
arm                             mxs_defconfig
mips                        bcm47xx_defconfig
m68k                             alldefconfig
arm                         lpc18xx_defconfig
arc                      axs103_smp_defconfig
sh                        dreamcast_defconfig
powerpc                       maple_defconfig
powerpc                   lite5200b_defconfig
arm                      pxa255-idp_defconfig
powerpc                        cell_defconfig
sh                        sh7757lcr_defconfig
sh                         apsh4a3a_defconfig
sparc                       sparc32_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                    sam440ep_defconfig
sh                            titan_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                           rs90_defconfig
m68k                         amcore_defconfig
arm                        cerfcube_defconfig
powerpc                 canyonlands_defconfig
powerpc                      ep88xc_defconfig
sh                               alldefconfig
powerpc64                           defconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                            defconfig
mips                  decstation_64_defconfig
arm                    vt8500_v6_v7_defconfig
arm                            zeus_defconfig
xtensa                generic_kc705_defconfig
m68k                          amiga_defconfig
mips                            gpr_defconfig
powerpc                     mpc5200_defconfig
arm                     davinci_all_defconfig
powerpc                      makalu_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      pcm030_defconfig
arm                           u8500_defconfig
nds32                             allnoconfig
m68k                          hp300_defconfig
powerpc                    gamecube_defconfig
ia64                             allyesconfig
sh                        sh7785lcr_defconfig
powerpc                     tqm8541_defconfig
m68k                       m5208evb_defconfig
arm                           stm32_defconfig
powerpc                      tqm8xx_defconfig
sh                          urquell_defconfig
arm                  colibri_pxa270_defconfig
arm                         cm_x300_defconfig
powerpc                    adder875_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
microblaze                          defconfig
powerpc                 mpc837x_rdb_defconfig
mips                           jazz_defconfig
mips                            ar7_defconfig
powerpc                   currituck_defconfig
arm                          ixp4xx_defconfig
mips                         cobalt_defconfig
arm                        trizeps4_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           sunxi_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc40x_defconfig
arm                          pxa168_defconfig
sh                           se7712_defconfig
powerpc                     rainier_defconfig
arm                         orion5x_defconfig
powerpc                 mpc834x_itx_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc85xx_cds_defconfig
nios2                         10m50_defconfig
mips                         db1xxx_defconfig
openrisc                 simple_smp_defconfig
arm                              alldefconfig
arm                         nhk8815_defconfig
mips                      pic32mzda_defconfig
arm                            mmp2_defconfig
arm                       omap2plus_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                     sequoia_defconfig
m68k                        mvme147_defconfig
arm                       spear13xx_defconfig
mips                     loongson2k_defconfig
arc                              alldefconfig
mips                      pistachio_defconfig
ia64                          tiger_defconfig
arm                         lubbock_defconfig
powerpc                     mpc512x_defconfig
mips                       lemote2f_defconfig
mips                  cavium_octeon_defconfig
sh                         ap325rxa_defconfig
mips                       bmips_be_defconfig
arm                          simpad_defconfig
mips                           ip28_defconfig
sh                          sdk7786_defconfig
arm                       cns3420vb_defconfig
sh                          lboxre2_defconfig
arm                  colibri_pxa300_defconfig
powerpc                       eiger_defconfig
powerpc                      pmac32_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     sbc8548_defconfig
powerpc                     mpc83xx_defconfig
parisc                              defconfig
powerpc                      bamboo_defconfig
powerpc                       ppc64_defconfig
arc                        nsimosci_defconfig
ia64                                defconfig
powerpc                     skiroot_defconfig
mips                 decstation_r4k_defconfig
sh                           se7206_defconfig
powerpc                     tqm8555_defconfig
microblaze                      mmu_defconfig
arm                           corgi_defconfig
arm                           omap1_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
m68k                                defconfig
nios2                               defconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210604
x86_64               randconfig-a004-20210604
x86_64               randconfig-a003-20210604
x86_64               randconfig-a006-20210604
x86_64               randconfig-a005-20210604
x86_64               randconfig-a001-20210604
i386                 randconfig-a003-20210603
i386                 randconfig-a006-20210603
i386                 randconfig-a004-20210603
i386                 randconfig-a001-20210603
i386                 randconfig-a005-20210603
i386                 randconfig-a002-20210603
i386                 randconfig-a003-20210604
i386                 randconfig-a006-20210604
i386                 randconfig-a004-20210604
i386                 randconfig-a001-20210604
i386                 randconfig-a005-20210604
i386                 randconfig-a002-20210604
x86_64               randconfig-a015-20210603
x86_64               randconfig-a011-20210603
x86_64               randconfig-a012-20210603
x86_64               randconfig-a014-20210603
x86_64               randconfig-a016-20210603
x86_64               randconfig-a013-20210603
i386                 randconfig-a015-20210603
i386                 randconfig-a011-20210603
i386                 randconfig-a014-20210603
i386                 randconfig-a012-20210603
i386                 randconfig-a015-20210604
i386                 randconfig-a013-20210604
i386                 randconfig-a016-20210604
i386                 randconfig-a011-20210604
i386                 randconfig-a014-20210604
i386                 randconfig-a012-20210604
i386                 randconfig-a013-20210603
i386                 randconfig-a016-20210603
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210603
x86_64               randconfig-b001-20210604
x86_64               randconfig-a002-20210603
x86_64               randconfig-a004-20210603
x86_64               randconfig-a003-20210603
x86_64               randconfig-a006-20210603
x86_64               randconfig-a005-20210603
x86_64               randconfig-a001-20210603
x86_64               randconfig-a015-20210604
x86_64               randconfig-a011-20210604
x86_64               randconfig-a014-20210604
x86_64               randconfig-a012-20210604
x86_64               randconfig-a016-20210604
x86_64               randconfig-a013-20210604

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
