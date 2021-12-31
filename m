Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBA94821D6
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 04:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242614AbhLaDfr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 22:35:47 -0500
Received: from mga07.intel.com ([134.134.136.100]:56934 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229590AbhLaDfo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Dec 2021 22:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640921744; x=1672457744;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=npPLlYjj+pp02i5loC/PBd6wF52sMtUW0+4X7CiJ23c=;
  b=hdR9BSAhAjhlpaDNSk9N6IcV7fzoeEjWpWvRP8P/Szd9wQFjHdSvvbZz
   1e8mogt22DkEXgq5BEK8IV3MqDVdmINRh1n/+of4+vO1bYPEoA4QVZSmr
   cCOiCJAmFW2R8GM2eKikRbysnwoOQIib7xrUNAdGfnopQwOxiv+MLMQIO
   7eYTkfnRGymAKNXiQJ+JQaBhrlPuKYOhJ2ZnXYf0czz+yBe7MWOLWEOMC
   gTe5q1Aan1kXiGyjfl/Yrq9Tc9wKATL5QZjDz23lk/PiHiliLjFZhDmBL
   GEQO2A0lE2ehuBwLjTrXlLJ41aYIWmrjsJ32IUXpHPt2MspMTamgezz7k
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="305127943"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; 
   d="scan'208";a="305127943"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2021 19:35:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; 
   d="scan'208";a="524604900"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Dec 2021 19:35:41 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n38hg-000Au3-Dp; Fri, 31 Dec 2021 03:35:40 +0000
Date:   Fri, 31 Dec 2021 11:34:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 db3e8244bd1c46f5a416fd1e6821036ecc59884a
Message-ID: <61ce7a62.xEgJVj/THkYJglZS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: db3e8244bd1c46f5a416fd1e6821036ecc59884a  usb: dwc2: Simplify a bitmap declaration

Warning reports:

https://lore.kernel.org/linux-usb/202112211923.EfvDjyKL-lkp@intel.com

Warning in current branch:

drivers/usb/renesas_usbhs/mod.c:195:13: warning: variable 'intenb0' set but not used [-Wunused-but-set-variable]

possible Warning in current branch (please contact us if interested):

include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 2 has type 'struct gpio_desc *' [-Wformat=]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-at91_dt_defconfig
|   `-- include-linux-kern_levels.h:warning:format-d-expects-argument-of-type-int-but-argument-has-type-struct-gpio_desc
`-- parisc-allyesconfig
    `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used

elapsed time: 725m

configs tested: 173
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-c001-20211229
i386                 randconfig-c001-20211230
sh                             sh03_defconfig
sh                   secureedge5410_defconfig
powerpc                 canyonlands_defconfig
sh                            hp6xx_defconfig
arc                        nsimosci_defconfig
arm                            hisi_defconfig
riscv                             allnoconfig
mips                       lemote2f_defconfig
powerpc                     ppa8548_defconfig
powerpc                      makalu_defconfig
sh                           se7780_defconfig
sh                          landisk_defconfig
sh                   sh7724_generic_defconfig
riscv                            alldefconfig
arm                         vf610m4_defconfig
ia64                            zx1_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                          sdk7780_defconfig
powerpc                    mvme5100_defconfig
ia64                        generic_defconfig
mips                          rm200_defconfig
powerpc                      pmac32_defconfig
powerpc                     kilauea_defconfig
sh                          lboxre2_defconfig
mips                        bcm63xx_defconfig
sh                                  defconfig
mips                     loongson2k_defconfig
openrisc                         alldefconfig
csky                                defconfig
powerpc                      walnut_defconfig
powerpc                       ppc64_defconfig
mips                         mpc30x_defconfig
arm                        cerfcube_defconfig
mips                          ath25_defconfig
sh                          rsk7203_defconfig
arm                      footbridge_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                            e55_defconfig
powerpc                     ksi8560_defconfig
h8300                       h8s-sim_defconfig
powerpc                          g5_defconfig
arm                           spitz_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          pxa168_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                   lite5200b_defconfig
h8300                               defconfig
parisc                           allyesconfig
arm                         nhk8815_defconfig
mips                           ip28_defconfig
xtensa                         virt_defconfig
arm                         bcm2835_defconfig
powerpc                     tqm8540_defconfig
arm                         orion5x_defconfig
powerpc                    adder875_defconfig
mips                         bigsur_defconfig
mips                      malta_kvm_defconfig
powerpc                     asp8347_defconfig
ia64                             allyesconfig
um                               alldefconfig
mips                            gpr_defconfig
m68k                           sun3_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                    ge_imp3a_defconfig
mips                           mtx1_defconfig
sh                ecovec24-romimage_defconfig
arm                        mini2440_defconfig
xtensa                           alldefconfig
sh                            migor_defconfig
sparc64                          alldefconfig
xtensa                  cadence_csp_defconfig
arm                        spear3xx_defconfig
arc                              allyesconfig
arm                        spear6xx_defconfig
arc                         haps_hs_defconfig
powerpc                     ep8248e_defconfig
sh                        sh7785lcr_defconfig
sh                           se7750_defconfig
m68k                       m5475evb_defconfig
arm                           sama5_defconfig
sh                          sdk7786_defconfig
parisc                generic-64bit_defconfig
riscv                            allmodconfig
powerpc                     powernv_defconfig
mips                        qi_lb60_defconfig
arm                        mvebu_v7_defconfig
arm                  randconfig-c002-20211230
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20211230
x86_64               randconfig-a015-20211230
x86_64               randconfig-a012-20211230
x86_64               randconfig-a011-20211230
x86_64               randconfig-a016-20211230
x86_64               randconfig-a014-20211230
i386                 randconfig-a016-20211230
i386                 randconfig-a011-20211230
i386                 randconfig-a012-20211230
i386                 randconfig-a013-20211230
i386                 randconfig-a014-20211230
i386                 randconfig-a015-20211230
arc                  randconfig-r043-20211230
riscv                randconfig-r042-20211230
s390                 randconfig-r044-20211230
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20211230
x86_64               randconfig-a001-20211230
x86_64               randconfig-a003-20211230
x86_64               randconfig-a006-20211230
x86_64               randconfig-a004-20211230
x86_64               randconfig-a005-20211230
i386                 randconfig-a001-20211230
i386                 randconfig-a005-20211230
i386                 randconfig-a004-20211230
i386                 randconfig-a002-20211230
i386                 randconfig-a006-20211230
i386                 randconfig-a003-20211230
x86_64               randconfig-a015-20211228
x86_64               randconfig-a014-20211228
x86_64               randconfig-a013-20211228
x86_64               randconfig-a012-20211228
x86_64               randconfig-a011-20211228
x86_64               randconfig-a016-20211228
hexagon              randconfig-r041-20211230
hexagon              randconfig-r045-20211230

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
