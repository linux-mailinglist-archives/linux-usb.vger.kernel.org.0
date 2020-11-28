Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA1F2C6E48
	for <lists+linux-usb@lfdr.de>; Sat, 28 Nov 2020 02:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731202AbgK1BvS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 20:51:18 -0500
Received: from mga01.intel.com ([192.55.52.88]:6896 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731347AbgK1BuY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Nov 2020 20:50:24 -0500
IronPort-SDR: Olgh4FFqHFLmR5BTTimPzXA4ePRYC8UF8mOMOJw9GSJhR7YouE2k4atkUIaWE6/wErb0bkbjPN
 6PpJG42u4Eog==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="190612286"
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; 
   d="scan'208";a="190612286"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 17:50:11 -0800
IronPort-SDR: yik0CsWIq/LIQ7dw4O6Gtq++M9oHGB2CuWT0MtTikd2EOor2JePXa4Yk+m+/AUb2SZ3qU4Qgzw
 V8Mtyi/1kwnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; 
   d="scan'208";a="548213202"
Received: from lkp-server01.sh.intel.com (HELO b5888d13d5a5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Nov 2020 17:50:10 -0800
Received: from kbuild by b5888d13d5a5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kipNJ-0000Eg-Km; Sat, 28 Nov 2020 01:50:09 +0000
Date:   Sat, 28 Nov 2020 09:49:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 484cfbe5fb61469a5f5a276258a8b3973164b56f
Message-ID: <5fc1acb2.I789ozGeSi6bvkDn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 484cfbe5fb61469a5f5a276258a8b3973164b56f  usb: typec: stusb160x: fix power-opmode property with typec-power-opmode

elapsed time: 723m

configs tested: 140
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip28_defconfig
m68k                         amcore_defconfig
arm                          collie_defconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                         mv78xx0_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         lpc18xx_defconfig
mips                         db1xxx_defconfig
arc                         haps_hs_defconfig
mips                        workpad_defconfig
nds32                             allnoconfig
powerpc                      arches_defconfig
mips                            gpr_defconfig
m68k                           sun3_defconfig
sh                         ap325rxa_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
mips                        omega2p_defconfig
xtensa                       common_defconfig
powerpc                     kilauea_defconfig
sh                           se7206_defconfig
arm                        keystone_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          imote2_defconfig
arm                            qcom_defconfig
m68k                          atari_defconfig
arm                           omap1_defconfig
mips                      pistachio_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                     loongson1c_defconfig
alpha                               defconfig
arm                         s3c2410_defconfig
powerpc                        cell_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                  cadence_csp_defconfig
arm                       aspeed_g5_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
powerpc                     skiroot_defconfig
nds32                               defconfig
powerpc                      ppc40x_defconfig
arm                            dove_defconfig
arm                      jornada720_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         cm_x300_defconfig
mips                          malta_defconfig
arm                          pxa168_defconfig
openrisc                 simple_smp_defconfig
sh                                  defconfig
ia64                      gensparse_defconfig
mips                         rt305x_defconfig
sh                             sh03_defconfig
sparc64                             defconfig
arm                  colibri_pxa300_defconfig
arm                           corgi_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
mips                           ip22_defconfig
sh                           se7722_defconfig
powerpc                 linkstation_defconfig
arm                        oxnas_v6_defconfig
riscv                          rv32_defconfig
sh                          rsk7201_defconfig
h8300                       h8s-sim_defconfig
arm                          pxa3xx_defconfig
ia64                             alldefconfig
sh                           se7721_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
x86_64               randconfig-a015-20201127
x86_64               randconfig-a011-20201127
x86_64               randconfig-a014-20201127
x86_64               randconfig-a016-20201127
x86_64               randconfig-a012-20201127
x86_64               randconfig-a013-20201127
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201127
x86_64               randconfig-a003-20201127
x86_64               randconfig-a004-20201127
x86_64               randconfig-a005-20201127
x86_64               randconfig-a002-20201127
x86_64               randconfig-a001-20201127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
