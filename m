Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A826A4620DA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Nov 2021 20:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378742AbhK2Ttm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 14:49:42 -0500
Received: from mga07.intel.com ([134.134.136.100]:34941 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244671AbhK2Trj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Nov 2021 14:47:39 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="299457481"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="299457481"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 11:44:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="511834154"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Nov 2021 11:44:18 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mrmZW-000CGw-0n; Mon, 29 Nov 2021 19:44:18 +0000
Date:   Tue, 30 Nov 2021 03:43:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 4d012040161cba054208555300d9fdf2b8925c34
Message-ID: <61a52d7f.EWM6tc0XWu8OrAEe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 4d012040161cba054208555300d9fdf2b8925c34  Merge 5.16-rc3 into usb-next

elapsed time: 721m

configs tested: 258
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211128
nios2                            alldefconfig
arm                        shmobile_defconfig
mips                      fuloong2e_defconfig
arc                            hsdk_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc832x_mds_defconfig
xtensa                    smp_lx200_defconfig
arm                          iop32x_defconfig
mips                        vocore2_defconfig
powerpc                    ge_imp3a_defconfig
mips                         bigsur_defconfig
riscv                    nommu_virt_defconfig
mips                        bcm47xx_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7269_defconfig
sh                          sdk7780_defconfig
powerpc                   lite5200b_defconfig
powerpc                        warp_defconfig
s390                          debug_defconfig
arm                         axm55xx_defconfig
sh                             espt_defconfig
sh                        apsh4ad0a_defconfig
arm                        multi_v5_defconfig
m68k                           sun3_defconfig
powerpc                     tqm8540_defconfig
um                                  defconfig
sh                 kfr2r09-romimage_defconfig
arm                             mxs_defconfig
arm                         mv78xx0_defconfig
mips                          ath79_defconfig
arm                              alldefconfig
arm                        mini2440_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear3xx_defconfig
arc                          axs103_defconfig
arm                     davinci_all_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
mips                         cobalt_defconfig
sh                           se7619_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                        icon_defconfig
powerpc                     akebono_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                       ebony_defconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
arm                          lpd270_defconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
mips                  decstation_64_defconfig
powerpc                     skiroot_defconfig
powerpc                     kmeter1_defconfig
sparc                               defconfig
arm                        magician_defconfig
arm                          exynos_defconfig
ia64                            zx1_defconfig
mips                         tb0219_defconfig
arm                            qcom_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
powerpc                      makalu_defconfig
arm                             rpc_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                       lemote2f_defconfig
powerpc                  iss476-smp_defconfig
s390                       zfcpdump_defconfig
mips                      pic32mzda_defconfig
sparc64                          alldefconfig
arm                           viper_defconfig
arc                        vdk_hs38_defconfig
arm                            lart_defconfig
mips                         mpc30x_defconfig
powerpc                         ps3_defconfig
powerpc                      ep88xc_defconfig
powerpc                 linkstation_defconfig
mips                           mtx1_defconfig
arm                            dove_defconfig
arm                          pxa168_defconfig
m68k                             alldefconfig
mips                        maltaup_defconfig
arm                            xcep_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        realview_defconfig
powerpc                     taishan_defconfig
arm                         palmz72_defconfig
powerpc                         wii_defconfig
mips                       rbtx49xx_defconfig
sh                          rsk7201_defconfig
arm                         s3c6400_defconfig
sh                          r7785rp_defconfig
xtensa                  nommu_kc705_defconfig
arm                        mvebu_v7_defconfig
x86_64                              defconfig
arm                       versatile_defconfig
microblaze                      mmu_defconfig
arm                         orion5x_defconfig
mips                           ip22_defconfig
arm                       imx_v4_v5_defconfig
sh                                  defconfig
powerpc                      ppc40x_defconfig
arm                      jornada720_defconfig
sh                           se7722_defconfig
mips                        omega2p_defconfig
parisc                           allyesconfig
arc                                 defconfig
powerpc                     redwood_defconfig
powerpc                    socrates_defconfig
arm                     am200epdkit_defconfig
powerpc                     ksi8560_defconfig
powerpc                     tqm8541_defconfig
i386                             alldefconfig
sh                           se7712_defconfig
mips                    maltaup_xpa_defconfig
mips                           ip32_defconfig
mips                           gcw0_defconfig
arm                       imx_v6_v7_defconfig
mips                           rs90_defconfig
arm                           h5000_defconfig
arc                     haps_hs_smp_defconfig
m68k                       bvme6000_defconfig
m68k                        m5307c3_defconfig
arm                           h3600_defconfig
mips                     loongson1c_defconfig
mips                      maltaaprp_defconfig
openrisc                            defconfig
arm                          pcm027_defconfig
mips                 decstation_r4k_defconfig
arm                       omap2plus_defconfig
mips                             allyesconfig
mips                          rb532_defconfig
arm                          simpad_defconfig
m68k                       m5249evb_defconfig
mips                      bmips_stb_defconfig
arm                          ep93xx_defconfig
arm                        neponset_defconfig
arm                         socfpga_defconfig
ia64                          tiger_defconfig
powerpc64                        alldefconfig
arm                   milbeaut_m10v_defconfig
sh                            shmin_defconfig
m68k                        m5272c3_defconfig
arm                        trizeps4_defconfig
powerpc                       maple_defconfig
openrisc                  or1klitex_defconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
sparc                            allyesconfig
mips                     loongson2k_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     ep8248e_defconfig
mips                          malta_defconfig
powerpc                 canyonlands_defconfig
openrisc                 simple_smp_defconfig
arm                         cm_x300_defconfig
arm                         shannon_defconfig
sh                          rsk7203_defconfig
arm                           u8500_defconfig
arm                        cerfcube_defconfig
arm                  randconfig-c002-20211128
ia64                             allmodconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211129
i386                 randconfig-a002-20211129
i386                 randconfig-a006-20211129
i386                 randconfig-a005-20211129
i386                 randconfig-a004-20211129
i386                 randconfig-a003-20211129
x86_64               randconfig-a011-20211128
x86_64               randconfig-a014-20211128
x86_64               randconfig-a012-20211128
x86_64               randconfig-a016-20211128
x86_64               randconfig-a013-20211128
x86_64               randconfig-a015-20211128
i386                 randconfig-a015-20211128
i386                 randconfig-a016-20211128
i386                 randconfig-a013-20211128
i386                 randconfig-a012-20211128
i386                 randconfig-a014-20211128
i386                 randconfig-a011-20211128
arc                  randconfig-r043-20211128
s390                 randconfig-r044-20211128
riscv                randconfig-r042-20211128
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211128
i386                 randconfig-c001-20211128
riscv                randconfig-c006-20211128
arm                  randconfig-c002-20211128
powerpc              randconfig-c003-20211128
x86_64               randconfig-c007-20211128
mips                 randconfig-c004-20211128
x86_64               randconfig-a001-20211128
x86_64               randconfig-a006-20211128
x86_64               randconfig-a003-20211128
x86_64               randconfig-a005-20211128
x86_64               randconfig-a004-20211128
x86_64               randconfig-a002-20211128
i386                 randconfig-a001-20211128
i386                 randconfig-a002-20211128
i386                 randconfig-a006-20211128
i386                 randconfig-a005-20211128
i386                 randconfig-a004-20211128
i386                 randconfig-a003-20211128
i386                 randconfig-a015-20211129
i386                 randconfig-a016-20211129
i386                 randconfig-a013-20211129
i386                 randconfig-a012-20211129
i386                 randconfig-a014-20211129
i386                 randconfig-a011-20211129
hexagon              randconfig-r045-20211129
hexagon              randconfig-r041-20211129
s390                 randconfig-r044-20211129
riscv                randconfig-r042-20211129

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
