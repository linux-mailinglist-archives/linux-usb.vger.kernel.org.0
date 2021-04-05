Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAE7354720
	for <lists+linux-usb@lfdr.de>; Mon,  5 Apr 2021 21:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbhDETZq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 15:25:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:27924 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236232AbhDETZn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Apr 2021 15:25:43 -0400
IronPort-SDR: tWpdpnCi7gSwuHn/c3dIp4qujT3TFoOTC6BGaxTrCBr6GlJW61Nii3LNG8qlmbtYPWoBQfWkS8
 FGv0NDKYsjRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="256895081"
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; 
   d="scan'208";a="256895081"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 12:25:35 -0700
IronPort-SDR: touHsXl4N/r+1qVWDKBImz1cHqF7cQhfl4tugMBt0D0ZDCLyHu8wG9Q6aCJx7rrVWrg7ZEZbCm
 PREI/L2Xol4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; 
   d="scan'208";a="597665619"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Apr 2021 12:25:34 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lTUqr-000Aak-R0; Mon, 05 Apr 2021 19:25:33 +0000
Date:   Tue, 06 Apr 2021 03:24:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f70d436f000101876439ce25527a9939628c9518
Message-ID: <606b6407.3OO6h7flTs8xa37Q%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f70d436f000101876439ce25527a9939628c9518  usb: typec: Declare the typec_class static

elapsed time: 727m

configs tested: 181
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
mips                        workpad_defconfig
xtensa                generic_kc705_defconfig
sh                         microdev_defconfig
arm                            mmp2_defconfig
sparc64                             defconfig
sh                           se7343_defconfig
powerpc                   motionpro_defconfig
arm                         hackkit_defconfig
mips                      pic32mzda_defconfig
arm                     am200epdkit_defconfig
microblaze                      mmu_defconfig
powerpc                     akebono_defconfig
powerpc                    ge_imp3a_defconfig
arm                       mainstone_defconfig
mips                         mpc30x_defconfig
sh                           se7705_defconfig
arm                     davinci_all_defconfig
sh                           se7751_defconfig
sh                           sh2007_defconfig
powerpc                     tqm8540_defconfig
riscv                          rv32_defconfig
mips                         tb0219_defconfig
mips                           mtx1_defconfig
arm                         s5pv210_defconfig
arm                           spitz_defconfig
ia64                             allyesconfig
mips                           gcw0_defconfig
sh                         ap325rxa_defconfig
arm                         at91_dt_defconfig
mips                           jazz_defconfig
mips                             allyesconfig
mips                           rs90_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      obs600_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      cm5200_defconfig
arm                        realview_defconfig
m68k                          hp300_defconfig
arm                         lubbock_defconfig
powerpc                        cell_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                        spear3xx_defconfig
arc                                 defconfig
arm                        spear6xx_defconfig
sh                         apsh4a3a_defconfig
openrisc                            defconfig
sh                             shx3_defconfig
arm                      tct_hammer_defconfig
mips                      malta_kvm_defconfig
powerpc                     skiroot_defconfig
mips                           ci20_defconfig
nios2                               defconfig
sh                               allmodconfig
mips                  cavium_octeon_defconfig
arc                     haps_hs_smp_defconfig
m68k                         apollo_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc837x_mds_defconfig
mips                        nlm_xlp_defconfig
arm                         cm_x300_defconfig
arm                      integrator_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      ep88xc_defconfig
arm                         palmz72_defconfig
openrisc                  or1klitex_defconfig
arm                       aspeed_g5_defconfig
sh                           se7780_defconfig
arm                             pxa_defconfig
sh                        edosk7760_defconfig
powerpc                      ppc40x_defconfig
arm                          ixp4xx_defconfig
sh                           se7721_defconfig
sh                   sh7724_generic_defconfig
m68k                          sun3x_defconfig
mips                      pistachio_defconfig
mips                          ath25_defconfig
sh                          lboxre2_defconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                         alldefconfig
powerpc                     sbc8548_defconfig
mips                      loongson3_defconfig
i386                                defconfig
mips                        omega2p_defconfig
parisc                generic-64bit_defconfig
arm                        neponset_defconfig
riscv                    nommu_k210_defconfig
mips                        qi_lb60_defconfig
powerpc                      pmac32_defconfig
m68k                             alldefconfig
sh                           se7712_defconfig
powerpc                        fsp2_defconfig
powerpc                       ppc64_defconfig
arm                       versatile_defconfig
arc                          axs101_defconfig
um                               alldefconfig
mips                            gpr_defconfig
sh                         ecovec24_defconfig
arm                          simpad_defconfig
s390                       zfcpdump_defconfig
mips                           ip27_defconfig
mips                     cu1000-neo_defconfig
powerpc                     mpc83xx_defconfig
mips                malta_kvm_guest_defconfig
arc                        vdk_hs38_defconfig
arm                            qcom_defconfig
arm                       multi_v4t_defconfig
h8300                     edosk2674_defconfig
powerpc                    klondike_defconfig
mips                          rm200_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210405
i386                 randconfig-a003-20210405
i386                 randconfig-a001-20210405
i386                 randconfig-a004-20210405
i386                 randconfig-a002-20210405
i386                 randconfig-a005-20210405
x86_64               randconfig-a014-20210405
x86_64               randconfig-a015-20210405
x86_64               randconfig-a013-20210405
x86_64               randconfig-a011-20210405
x86_64               randconfig-a012-20210405
x86_64               randconfig-a016-20210405
i386                 randconfig-a014-20210405
i386                 randconfig-a011-20210405
i386                 randconfig-a016-20210405
i386                 randconfig-a012-20210405
i386                 randconfig-a015-20210405
i386                 randconfig-a013-20210405
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210405
x86_64               randconfig-a003-20210405
x86_64               randconfig-a005-20210405
x86_64               randconfig-a001-20210405
x86_64               randconfig-a002-20210405
x86_64               randconfig-a006-20210405

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
