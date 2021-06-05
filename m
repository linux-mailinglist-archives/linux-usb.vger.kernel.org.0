Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F125E39C493
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 02:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhFEAnT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 20:43:19 -0400
Received: from mga01.intel.com ([192.55.52.88]:3751 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230185AbhFEAnS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 20:43:18 -0400
IronPort-SDR: LejG4q+Jel2hH8qKK7LHVM+xY1Bfjblcxsx7gw0vDt7MW/Pu0e1qIg73CN19x8s76mOojBweIQ
 Y6gYmVOvucSQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="225717477"
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; 
   d="scan'208";a="225717477"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 17:41:31 -0700
IronPort-SDR: 9Ob7bNiP3/yWs7R2f6MwU6FIiRaVsvE7x/h2/V6VX2VDZ0G8+X+kznQB/XJe594ODDTB9Aac2z
 roDkOp/d8daQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; 
   d="scan'208";a="618429348"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Jun 2021 17:41:30 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lpKNV-0007CF-Cy; Sat, 05 Jun 2021 00:41:29 +0000
Date:   Sat, 05 Jun 2021 08:40:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 87191ca9f90244d4e003fbe5c77390b5e585a5ef
Message-ID: <60bac809.ttRXEcivTeN9trQe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 87191ca9f90244d4e003fbe5c77390b5e585a5ef  USB: UDC: Implement udc_async_callbacks in net2272

elapsed time: 721m

configs tested: 227
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     cu1830-neo_defconfig
arm                        clps711x_defconfig
arc                         haps_hs_defconfig
mips                          rb532_defconfig
arm                          collie_defconfig
mips                         rt305x_defconfig
mips                           mtx1_defconfig
arm                          ep93xx_defconfig
powerpc                     kilauea_defconfig
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
arc                            hsdk_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  colibri_pxa270_defconfig
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
nios2                               defconfig
mips                           xway_defconfig
powerpc                          allmodconfig
arm                             pxa_defconfig
arm                         s3c6400_defconfig
mips                          rm200_defconfig
arc                              alldefconfig
ia64                      gensparse_defconfig
powerpc                      ep88xc_defconfig
sh                               alldefconfig
powerpc64                           defconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                            defconfig
mips                  decstation_64_defconfig
riscv                    nommu_virt_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
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
nds32                            alldefconfig
sh                          rsk7264_defconfig
powerpc                    klondike_defconfig
sh                         microdev_defconfig
arm                         s5pv210_defconfig
arm                         hackkit_defconfig
ia64                                defconfig
powerpc                     taishan_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                         apsh4a3a_defconfig
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
m68k                         apollo_defconfig
arm                            xcep_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                     sequoia_defconfig
sparc64                          alldefconfig
m68k                        mvme147_defconfig
arm                       spear13xx_defconfig
sh                         ap325rxa_defconfig
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
xtensa                         virt_defconfig
sh                           se7724_defconfig
sh                          sdk7780_defconfig
arm                            lart_defconfig
arm                          pxa910_defconfig
arc                        nsimosci_defconfig
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
arm                         mv78xx0_defconfig
xtensa                          iss_defconfig
mips                       lemote2f_defconfig
mips                      maltaaprp_defconfig
riscv                    nommu_k210_defconfig
nios2                         3c120_defconfig
powerpc                        fsp2_defconfig
sparc                       sparc32_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
m68k                                defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
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
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
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
