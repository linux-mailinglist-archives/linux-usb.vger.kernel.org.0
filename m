Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6AE39C491
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 02:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhFEAnS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 20:43:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:3751 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229847AbhFEAnS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 20:43:18 -0400
IronPort-SDR: kcOg57lPWv68X8ECuWOKw/8wrR51Rn+t9cINLSWBy0CpsPFKBbtW/eTdVc6zWpQ7rJxBA8kmOO
 HXFXs1FCPYwg==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="225717475"
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; 
   d="scan'208";a="225717475"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 17:41:31 -0700
IronPort-SDR: aBcx/8/IZJxgIhxve+k/B/bgJ0RICoP+lBGi7Wk7g7gZj5HFuKxPj4F/Fr3NvPZDIT31PfBRPy
 zQnRvPHqpm7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; 
   d="scan'208";a="448446019"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jun 2021 17:41:29 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lpKNV-0007C6-BW; Sat, 05 Jun 2021 00:41:29 +0000
Date:   Sat, 05 Jun 2021 08:40:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 6fc1db5e6211e30fbb1cee8d7925d79d4ed2ae14
Message-ID: <60bac80c.5j7jvNnnOAhRdG+r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 6fc1db5e6211e30fbb1cee8d7925d79d4ed2ae14  usb: gadget: f_fs: Ensure io_completion_wq is idle during unbind

elapsed time: 722m

configs tested: 254
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
arc                              allyesconfig
nios2                            allyesconfig
alpha                            allyesconfig
arm                         hackkit_defconfig
h8300                               defconfig
ia64                      gensparse_defconfig
mips                           ci20_defconfig
s390                                defconfig
powerpc                 mpc837x_rdb_defconfig
mips                     cu1830-neo_defconfig
arm                        clps711x_defconfig
arc                         haps_hs_defconfig
mips                          rb532_defconfig
arm                          collie_defconfig
xtensa                generic_kc705_defconfig
powerpc                      mgcoge_defconfig
mips                          rm200_defconfig
powerpc                        fsp2_defconfig
arm                           stm32_defconfig
mips                         rt305x_defconfig
mips                           mtx1_defconfig
arm                          ep93xx_defconfig
powerpc                     kilauea_defconfig
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
arc                            hsdk_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  colibri_pxa270_defconfig
sh                         ap325rxa_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                         apsh4a3a_defconfig
arm                         mv78xx0_defconfig
sh                         ecovec24_defconfig
powerpc                    adder875_defconfig
powerpc                       ebony_defconfig
sh                        apsh4ad0a_defconfig
arm                        keystone_defconfig
powerpc                    gamecube_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                           gcw0_defconfig
powerpc                      obs600_defconfig
arm                           sama5_defconfig
mips                    maltaup_xpa_defconfig
powerpc                       eiger_defconfig
powerpc                      chrp32_defconfig
arm                           corgi_defconfig
um                               alldefconfig
powerpc                  iss476-smp_defconfig
arm                             mxs_defconfig
m68k                       m5275evb_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
mips                     loongson2k_defconfig
mips                  maltasmvp_eva_defconfig
m68k                         apollo_defconfig
m68k                        mvme16x_defconfig
mips                      maltaaprp_defconfig
nios2                               defconfig
mips                           xway_defconfig
arm                             pxa_defconfig
arm                         s3c6400_defconfig
arc                              alldefconfig
powerpc                      ep88xc_defconfig
sh                               alldefconfig
powerpc64                           defconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                            defconfig
mips                  decstation_64_defconfig
riscv                    nommu_virt_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
powerpc                     mpc5200_defconfig
arm                     davinci_all_defconfig
powerpc                      makalu_defconfig
mips                   sb1250_swarm_defconfig
mips                         tb0287_defconfig
arm                            mmp2_defconfig
sparc                            alldefconfig
mips                           rs90_defconfig
i386                                defconfig
sh                        edosk7705_defconfig
arm                         shannon_defconfig
arm                       omap2plus_defconfig
mips                        qi_lb60_defconfig
powerpc                        warp_defconfig
mips                 decstation_r4k_defconfig
sparc64                             defconfig
arm                       versatile_defconfig
arm                        multi_v5_defconfig
m68k                           sun3_defconfig
powerpc                           allnoconfig
arc                        nsim_700_defconfig
mips                            gpr_defconfig
nds32                            alldefconfig
sh                          rsk7264_defconfig
powerpc                    klondike_defconfig
sh                         microdev_defconfig
arm                         s5pv210_defconfig
ia64                                defconfig
powerpc                     taishan_defconfig
sh                          urquell_defconfig
sh                           se7724_defconfig
mips                        maltaup_defconfig
arm                         lpc32xx_defconfig
m68k                          multi_defconfig
powerpc                      ppc40x_defconfig
h8300                    h8300h-sim_defconfig
powerpc                 canyonlands_defconfig
arm                          pxa168_defconfig
arm                         at91_dt_defconfig
mips                           jazz_defconfig
sh                           se7619_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        dreamcast_defconfig
arm                      integrator_defconfig
arm                            mps2_defconfig
arm                          simpad_defconfig
powerpc                       maple_defconfig
nds32                             allnoconfig
sh                          r7780mp_defconfig
arm                            xcep_defconfig
arm                            qcom_defconfig
arc                 nsimosci_hs_smp_defconfig
riscv                            alldefconfig
powerpc                      katmai_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc834x_mds_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                     sequoia_defconfig
sparc64                          alldefconfig
m68k                        mvme147_defconfig
arm                       spear13xx_defconfig
sh                            titan_defconfig
powerpc                     stx_gp3_defconfig
sh                          rsk7201_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     sbc8548_defconfig
arm                   milbeaut_m10v_defconfig
sh                               allmodconfig
mips                           ip28_defconfig
m68k                       m5208evb_defconfig
sh                          sdk7786_defconfig
arm                       cns3420vb_defconfig
arm                        trizeps4_defconfig
sh                          lboxre2_defconfig
powerpc                      tqm8xx_defconfig
mips                      pic32mzda_defconfig
powerpc                   lite5200b_defconfig
arm                         lubbock_defconfig
powerpc                     mpc83xx_defconfig
powerpc                       holly_defconfig
xtensa                              defconfig
powerpc                     kmeter1_defconfig
mips                         cobalt_defconfig
powerpc                   motionpro_defconfig
m68k                            q40_defconfig
powerpc                     ppa8548_defconfig
mips                           ip22_defconfig
alpha                            alldefconfig
xtensa                          iss_defconfig
mips                       lemote2f_defconfig
xtensa                           allyesconfig
arm                           omap1_defconfig
arm                         nhk8815_defconfig
nios2                         3c120_defconfig
sparc                       sparc32_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
m68k                                defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
x86_64               randconfig-a002-20210604
x86_64               randconfig-a004-20210604
x86_64               randconfig-a003-20210604
x86_64               randconfig-a006-20210604
x86_64               randconfig-a005-20210604
x86_64               randconfig-a001-20210604
i386                 randconfig-a003-20210604
i386                 randconfig-a006-20210604
i386                 randconfig-a004-20210604
i386                 randconfig-a001-20210604
i386                 randconfig-a005-20210604
i386                 randconfig-a002-20210604
i386                 randconfig-a003-20210603
i386                 randconfig-a006-20210603
i386                 randconfig-a004-20210603
i386                 randconfig-a001-20210603
i386                 randconfig-a005-20210603
i386                 randconfig-a002-20210603
x86_64               randconfig-a015-20210603
x86_64               randconfig-a011-20210603
x86_64               randconfig-a012-20210603
x86_64               randconfig-a014-20210603
x86_64               randconfig-a016-20210603
x86_64               randconfig-a013-20210603
i386                 randconfig-a015-20210604
i386                 randconfig-a013-20210604
i386                 randconfig-a016-20210604
i386                 randconfig-a011-20210604
i386                 randconfig-a014-20210604
i386                 randconfig-a012-20210604
i386                 randconfig-a015-20210603
i386                 randconfig-a013-20210603
i386                 randconfig-a011-20210603
i386                 randconfig-a016-20210603
i386                 randconfig-a014-20210603
i386                 randconfig-a012-20210603
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210604
x86_64               randconfig-a015-20210604
x86_64               randconfig-a011-20210604
x86_64               randconfig-a014-20210604
x86_64               randconfig-a012-20210604
x86_64               randconfig-a016-20210604
x86_64               randconfig-a013-20210604

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
