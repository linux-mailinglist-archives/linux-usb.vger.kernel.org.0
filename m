Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0248038F7B7
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 03:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbhEYBxF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 21:53:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:12337 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhEYBxF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 21:53:05 -0400
IronPort-SDR: WOQVQ53u+uL4yhwuMS2vSUha7yUTGFuiz6AN2uXhb2eV1pDMgWV33Fx3AgYuX48uCWBSXhpjth
 pTNLModXkk0Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="263282356"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; 
   d="scan'208";a="263282356"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 18:51:35 -0700
IronPort-SDR: Hb/ag8VE8c2a7boHU7Y8SBiL21l91+FsWFmsy+8LPZ/JeuaPCcFzffl7leEPhOMY+nHafekGkG
 OZ/Z78tAGgyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; 
   d="scan'208";a="442315379"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 May 2021 18:51:34 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llMEH-0001Rx-Ol; Tue, 25 May 2021 01:51:33 +0000
Date:   Tue, 25 May 2021 09:51:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 e6809703e164e0e47d99a42084af06a60e386b13
Message-ID: <60ac581e.S/2i/2a5FSFWJYsM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: e6809703e164e0e47d99a42084af06a60e386b13  Merge tag 'thunderbolt-for-v5.13-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 726m

configs tested: 231
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
i386                             allyesconfig
x86_64                           allyesconfig
ia64                             allyesconfig
sparc                            allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                            allyesconfig
arm                         shannon_defconfig
powerpc                      ppc64e_defconfig
arm                         assabet_defconfig
powerpc                       eiger_defconfig
microblaze                      mmu_defconfig
powerpc                     skiroot_defconfig
arm                          pxa3xx_defconfig
x86_64                              defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
h8300                       h8s-sim_defconfig
mips                     loongson2k_defconfig
m68k                       m5249evb_defconfig
arc                    vdk_hs38_smp_defconfig
arm                          collie_defconfig
arm                         at91_dt_defconfig
arm                            lart_defconfig
sh                         apsh4a3a_defconfig
arm                           spitz_defconfig
powerpc                      makalu_defconfig
arm                         cm_x300_defconfig
powerpc                     ep8248e_defconfig
arc                            hsdk_defconfig
um                               alldefconfig
arm                            zeus_defconfig
arm                       mainstone_defconfig
arm                            mps2_defconfig
powerpc                      tqm8xx_defconfig
sh                                  defconfig
arm                          gemini_defconfig
powerpc                 linkstation_defconfig
mips                         tb0226_defconfig
powerpc                          allmodconfig
xtensa                           allyesconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
arm                          ep93xx_defconfig
powerpc                     stx_gp3_defconfig
sh                        sh7757lcr_defconfig
m68k                        mvme16x_defconfig
x86_64                           alldefconfig
arm                  colibri_pxa270_defconfig
mips                         cobalt_defconfig
openrisc                  or1klitex_defconfig
xtensa                    xip_kc705_defconfig
powerpc                       holly_defconfig
sh                          lboxre2_defconfig
mips                        omega2p_defconfig
mips                          malta_defconfig
mips                          rb532_defconfig
riscv             nommu_k210_sdcard_defconfig
openrisc                 simple_smp_defconfig
sh                          rsk7201_defconfig
m68k                        m5407c3_defconfig
mips                      pic32mzda_defconfig
powerpc                     mpc83xx_defconfig
ia64                             alldefconfig
powerpc                  mpc866_ads_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                         microdev_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
xtensa                       common_defconfig
sh                               j2_defconfig
powerpc                      katmai_defconfig
arm                       spear13xx_defconfig
arm                        spear3xx_defconfig
powerpc                         ps3_defconfig
powerpc                     tqm8555_defconfig
mips                       bmips_be_defconfig
parisc                              defconfig
sh                           se7722_defconfig
arm                          badge4_defconfig
mips                         bigsur_defconfig
arm                        mvebu_v7_defconfig
mips                        bcm47xx_defconfig
arm                         lpc18xx_defconfig
openrisc                            defconfig
riscv                               defconfig
sh                           se7705_defconfig
arm                        vexpress_defconfig
mips                  cavium_octeon_defconfig
sparc                               defconfig
csky                             alldefconfig
h8300                    h8300h-sim_defconfig
sh                        edosk7705_defconfig
arm                           h3600_defconfig
sh                        sh7785lcr_defconfig
sh                         ap325rxa_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                         db1xxx_defconfig
sh                        edosk7760_defconfig
sparc64                             defconfig
parisc                generic-32bit_defconfig
sh                   sh7724_generic_defconfig
powerpc                    adder875_defconfig
arm                             mxs_defconfig
riscv                            alldefconfig
um                            kunit_defconfig
sh                           se7750_defconfig
s390                          debug_defconfig
mips                      malta_kvm_defconfig
powerpc                      cm5200_defconfig
powerpc                 canyonlands_defconfig
m68k                           sun3_defconfig
arm                    vt8500_v6_v7_defconfig
arm                       aspeed_g4_defconfig
powerpc                      chrp32_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                            shmin_defconfig
um                                allnoconfig
nios2                         10m50_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                            gpr_defconfig
arm                     eseries_pxa_defconfig
xtensa                    smp_lx200_defconfig
powerpc                      acadia_defconfig
sh                           se7619_defconfig
sh                          sdk7786_defconfig
powerpc                     tqm5200_defconfig
arm                       cns3420vb_defconfig
sparc                            alldefconfig
powerpc                     pseries_defconfig
arm                         palmz72_defconfig
m68k                         apollo_defconfig
powerpc                  mpc885_ads_defconfig
m68k                             alldefconfig
sh                        sh7763rdp_defconfig
sh                   rts7751r2dplus_defconfig
arm                            qcom_defconfig
mips                        qi_lb60_defconfig
mips                        workpad_defconfig
arm                           sama5_defconfig
arm                           h5000_defconfig
arc                              alldefconfig
nds32                            alldefconfig
powerpc                        fsp2_defconfig
arm                       netwinder_defconfig
powerpc                        cell_defconfig
xtensa                         virt_defconfig
alpha                            alldefconfig
powerpc                        warp_defconfig
arm                        multi_v5_defconfig
arm                          simpad_defconfig
x86_64                            allnoconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210524
x86_64               randconfig-a001-20210524
x86_64               randconfig-a006-20210524
x86_64               randconfig-a003-20210524
x86_64               randconfig-a004-20210524
x86_64               randconfig-a002-20210524
i386                 randconfig-a001-20210524
i386                 randconfig-a002-20210524
i386                 randconfig-a005-20210524
i386                 randconfig-a006-20210524
i386                 randconfig-a004-20210524
i386                 randconfig-a003-20210524
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a004-20210525
i386                 randconfig-a011-20210524
i386                 randconfig-a016-20210524
i386                 randconfig-a015-20210524
i386                 randconfig-a012-20210524
i386                 randconfig-a014-20210524
i386                 randconfig-a013-20210524
i386                 randconfig-a011-20210525
i386                 randconfig-a016-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210524
x86_64               randconfig-a013-20210524
x86_64               randconfig-a012-20210524
x86_64               randconfig-a014-20210524
x86_64               randconfig-a016-20210524
x86_64               randconfig-a015-20210524
x86_64               randconfig-a011-20210524

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
