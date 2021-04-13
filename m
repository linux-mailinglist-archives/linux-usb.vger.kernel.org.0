Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4214135D499
	for <lists+linux-usb@lfdr.de>; Tue, 13 Apr 2021 02:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238407AbhDMA7Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 20:59:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:54513 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237775AbhDMA7Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 20:59:24 -0400
IronPort-SDR: +jiZv5kNZ10f4pcmh5jOyZEhaPunyVoImz/dxZuOEDGdatReooplhZ805h1G8xM79y6rf3j//o
 UCJihrh5LAYA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="174408794"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="174408794"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 17:59:04 -0700
IronPort-SDR: IuKVexypUynDJLZ4nDbE5K2c7syS41C2D+F91sdeH5gBlNTaTq9nqIIEsdmROz15dbEMbrQ51m
 JeJy8EUZW4Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="460387836"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Apr 2021 17:59:02 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lW7OQ-0000j1-0X; Tue, 13 Apr 2021 00:59:02 +0000
Date:   Tue, 13 Apr 2021 08:58:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 5bdb080f9603c5db51597ee7bda457a153106a9a
Message-ID: <6074ecaf.v2hRqW8cfQtJiA/U%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 5bdb080f9603c5db51597ee7bda457a153106a9a  Revert "usb: Link the ports to the connectors they are attached to"

elapsed time: 728m

configs tested: 199
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
riscv                            allyesconfig
i386                             allyesconfig
powerpc                        fsp2_defconfig
i386                                defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                                defconfig
nds32                            alldefconfig
powerpc                 mpc834x_itx_defconfig
arc                                 defconfig
sh                         apsh4a3a_defconfig
arm                   milbeaut_m10v_defconfig
arm                         nhk8815_defconfig
mips                         tb0219_defconfig
mips                           mtx1_defconfig
m68k                       m5249evb_defconfig
mips                          malta_defconfig
arm                          pxa168_defconfig
arc                          axs103_defconfig
arc                          axs101_defconfig
arc                         haps_hs_defconfig
arm                           stm32_defconfig
mips                             allmodconfig
mips                           ci20_defconfig
sh                        sh7757lcr_defconfig
sh                             espt_defconfig
sparc                       sparc32_defconfig
arm                          simpad_defconfig
powerpc                        icon_defconfig
openrisc                         alldefconfig
mips                          rm200_defconfig
powerpc                     skiroot_defconfig
arm                            mps2_defconfig
powerpc                      pcm030_defconfig
arm                         mv78xx0_defconfig
arm                          exynos_defconfig
arm                       multi_v4t_defconfig
mips                           ip22_defconfig
arm                         s3c6400_defconfig
arm                            mmp2_defconfig
m68k                       m5275evb_defconfig
powerpc                     mpc512x_defconfig
arm                           sunxi_defconfig
ia64                          tiger_defconfig
powerpc                     tqm8555_defconfig
arm                             pxa_defconfig
xtensa                generic_kc705_defconfig
arm                       imx_v6_v7_defconfig
xtensa                    smp_lx200_defconfig
sparc64                          alldefconfig
arm                        spear3xx_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    ge_imp3a_defconfig
arm                        trizeps4_defconfig
sh                          urquell_defconfig
powerpc                 linkstation_defconfig
mips                      malta_kvm_defconfig
arm                             rpc_defconfig
powerpc                      ppc64e_defconfig
arm                        oxnas_v6_defconfig
arm                           sama5_defconfig
sh                        edosk7760_defconfig
sparc64                             defconfig
powerpc                     tqm8548_defconfig
powerpc                        cell_defconfig
sh                          rsk7201_defconfig
sh                   sh7724_generic_defconfig
sh                             sh03_defconfig
arm                         s5pv210_defconfig
powerpc                     tqm8540_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltaaprp_defconfig
arc                      axs103_smp_defconfig
mips                         db1xxx_defconfig
arm                         s3c2410_defconfig
mips                      loongson3_defconfig
mips                           jazz_defconfig
powerpc                     powernv_defconfig
sh                          r7785rp_defconfig
powerpc                      arches_defconfig
powerpc                      makalu_defconfig
mips                         rt305x_defconfig
arm                        vexpress_defconfig
arm                         orion5x_defconfig
sh                          landisk_defconfig
powerpc                      bamboo_defconfig
xtensa                              defconfig
mips                 decstation_r4k_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7712_defconfig
powerpc                     tqm8541_defconfig
xtensa                         virt_defconfig
arm                      pxa255-idp_defconfig
arm                         assabet_defconfig
sh                                  defconfig
sparc                       sparc64_defconfig
arm                        magician_defconfig
arc                              alldefconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      obs600_defconfig
mips                      bmips_stb_defconfig
sh                           sh2007_defconfig
sh                           se7619_defconfig
arm                          pxa910_defconfig
powerpc                       maple_defconfig
um                                allnoconfig
m68k                         apollo_defconfig
arm                        multi_v5_defconfig
nios2                            alldefconfig
arm                            qcom_defconfig
mips                        bcm63xx_defconfig
arm                          imote2_defconfig
m68k                        m5307c3_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                       cns3420vb_defconfig
arm                            dove_defconfig
mips                            e55_defconfig
powerpc                     pq2fads_defconfig
sh                           se7751_defconfig
m68k                          amiga_defconfig
arm                         vf610m4_defconfig
arm                         lpc32xx_defconfig
h8300                            alldefconfig
mips                           ip27_defconfig
mips                     loongson1c_defconfig
arm                          iop32x_defconfig
sh                           se7343_defconfig
powerpc                  iss476-smp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210412
i386                 randconfig-a001-20210412
i386                 randconfig-a006-20210412
i386                 randconfig-a005-20210412
i386                 randconfig-a004-20210412
i386                 randconfig-a002-20210412
x86_64               randconfig-a014-20210412
x86_64               randconfig-a015-20210412
x86_64               randconfig-a011-20210412
x86_64               randconfig-a013-20210412
x86_64               randconfig-a012-20210412
x86_64               randconfig-a016-20210412
i386                 randconfig-a015-20210412
i386                 randconfig-a014-20210412
i386                 randconfig-a013-20210412
i386                 randconfig-a012-20210412
i386                 randconfig-a016-20210412
i386                 randconfig-a011-20210412
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests
x86_64                      rhel-8.3-kbuiltin

clang tested configs:
x86_64               randconfig-a003-20210412
x86_64               randconfig-a002-20210412
x86_64               randconfig-a001-20210412
x86_64               randconfig-a005-20210412
x86_64               randconfig-a006-20210412
x86_64               randconfig-a004-20210412

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
