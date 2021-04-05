Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C5835471F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Apr 2021 21:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhDETZp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 15:25:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:15523 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236224AbhDETZm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Apr 2021 15:25:42 -0400
IronPort-SDR: pfwK50nHgtiMVlTU5RIsdUbhywLbnzgD6FSotUX0flZE0x9OtaLx1uTpXLtB+fI031hSlcbtkX
 GACnwd96dsHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="213257258"
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; 
   d="scan'208";a="213257258"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 12:25:35 -0700
IronPort-SDR: nwGNuM3mMfOkBpU0JUKqWJlbrS8DxOef1W9Fv8ENrqhS+IDdORNMLBxef37mIRwgYPRN7PKb7W
 A8DGcR54QwNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; 
   d="scan'208";a="529520954"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Apr 2021 12:25:34 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lTUqr-000Aah-QQ; Mon, 05 Apr 2021 19:25:33 +0000
Date:   Tue, 06 Apr 2021 03:24:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 de800f290dfaa341f22acac22bc454ea2bbf8f71
Message-ID: <606b640a.IN91lUz62Dk0P+bz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: de800f290dfaa341f22acac22bc454ea2bbf8f71  Merge 5.12-rc6 into usb-next

elapsed time: 727m

configs tested: 187
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
arm                             pxa_defconfig
mips                           gcw0_defconfig
sparc                       sparc32_defconfig
h8300                    h8300h-sim_defconfig
ia64                      gensparse_defconfig
arm                            mps2_defconfig
mips                        workpad_defconfig
xtensa                generic_kc705_defconfig
sh                         microdev_defconfig
arm                            mmp2_defconfig
sparc64                             defconfig
sh                           se7343_defconfig
powerpc                     akebono_defconfig
powerpc                    ge_imp3a_defconfig
arm                       mainstone_defconfig
mips                         mpc30x_defconfig
powerpc                     mpc5200_defconfig
powerpc                     tqm5200_defconfig
arm                      pxa255-idp_defconfig
sh                          lboxre2_defconfig
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
sh                         ap325rxa_defconfig
arm                         at91_dt_defconfig
mips                           jazz_defconfig
mips                             allyesconfig
mips                           rs90_defconfig
m68k                          hp300_defconfig
arm                         lubbock_defconfig
powerpc                        cell_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                        spear3xx_defconfig
powerpc                    sam440ep_defconfig
arm                           h3600_defconfig
powerpc                     ep8248e_defconfig
arm                        cerfcube_defconfig
mips                      loongson3_defconfig
mips                   sb1250_swarm_defconfig
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
sh                        edosk7760_defconfig
powerpc                      ppc40x_defconfig
arm                          ixp4xx_defconfig
sh                           se7721_defconfig
sh                   sh7724_generic_defconfig
m68k                          sun3x_defconfig
arm                     am200epdkit_defconfig
mips                      pistachio_defconfig
mips                          ath25_defconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                         alldefconfig
powerpc                     sbc8548_defconfig
mips                        omega2p_defconfig
parisc                generic-64bit_defconfig
arm                        neponset_defconfig
arm                            hisi_defconfig
powerpc                     mpc512x_defconfig
arm                          simpad_defconfig
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
s390                       zfcpdump_defconfig
sh                 kfr2r09-romimage_defconfig
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
i386                                defconfig
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
