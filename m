Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213B747C82A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 21:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhLUURh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 15:17:37 -0500
Received: from mga11.intel.com ([192.55.52.93]:5587 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231623AbhLUURh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Dec 2021 15:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640117857; x=1671653857;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eri8pGenN/Lf4Ee8MmCFZA6F3qS1dqQ9zhX3Iat7/qE=;
  b=bC+ZYTQ30rSJosnkk/gKVwS4q6AfN5vj1b1ec/4sbWcO7/uIFnaONzMP
   R3cHZHSFapyi7dPD1dsJkORdra/l8i3s/1dgXK1rr6Z24r8KIn/aKMfTB
   IuRqNPwwVoQnz7arcUsEYjjaIE1uSyYd6ruupTqMcEpUG4/XR/PULQweK
   OjFMHnVZeeKW7l5tQlqiLHQBdZ3h6ptWCDV9ROR645FC8xXG0qUXQOZBP
   7fptmiRtNXWzuKHJv9rZymb2r25NuN1TeqqcU4/pXrcgm+nF3Kq/Ql6GH
   5lIu10kDgTQk0X1tMaw4pshdadIymyNY+PU5QXROfkQOv3O8KcOZQK//N
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="238020507"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="238020507"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 12:17:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="484531201"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Dec 2021 12:17:16 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzlZT-0009Vq-UD; Tue, 21 Dec 2021 20:17:15 +0000
Date:   Wed, 22 Dec 2021 04:17:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 ce1d37cb7697abcc3d892558acd33a1333596534
Message-ID: <61c2363d.gXFGbIQSTW6Q+4XD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ce1d37cb7697abcc3d892558acd33a1333596534  usb: musb: dsps: Use platform_get_irq_byname() to get the interrupt

Warning reports:

https://lore.kernel.org/linux-usb/202112211923.EfvDjyKL-lkp@intel.com

Warning in current branch:

drivers/usb/renesas_usbhs/mod.c:195:13: warning: variable 'intenb0' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- alpha-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arc-randconfig-r043-20211219
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm-defconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm-randconfig-c002-20211220
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm64-defconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- h8300-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- h8300-buildonly-randconfig-r003-20211221
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- ia64-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- nios2-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- riscv-randconfig-r042-20211219
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- s390-randconfig-p002-20211220
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- s390-randconfig-r044-20211219
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- sh-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- sh-randconfig-r035-20211220
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- sparc-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- sparc-randconfig-r021-20211220
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- sparc64-buildonly-randconfig-r003-20211220
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
`-- xtensa-allyesconfig
    `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used

elapsed time: 732m

configs tested: 119
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
mips                        maltaup_defconfig
mips                           ip32_defconfig
um                                  defconfig
mips                       lemote2f_defconfig
arm                        spear3xx_defconfig
sh                      rts7751r2d1_defconfig
arc                     haps_hs_smp_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                       maple_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7712_defconfig
arm                        vexpress_defconfig
mips                       bmips_be_defconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
sh                          urquell_defconfig
sh                             shx3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         at91_dt_defconfig
mips                            ar7_defconfig
powerpc                     tqm8548_defconfig
sh                        sh7785lcr_defconfig
sh                           se7722_defconfig
arm64                            alldefconfig
arm                            pleb_defconfig
arm                            xcep_defconfig
m68k                          amiga_defconfig
arm                        mvebu_v5_defconfig
arm                     am200epdkit_defconfig
mips                          rb532_defconfig
openrisc                 simple_smp_defconfig
nios2                         3c120_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      pmac32_defconfig
arm                  randconfig-c002-20211220
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a005-20211220
x86_64               randconfig-a006-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a001-20211220
x86_64               randconfig-a013-20211221
x86_64               randconfig-a015-20211221
x86_64               randconfig-a014-20211221
x86_64               randconfig-a011-20211221
x86_64               randconfig-a012-20211221
x86_64               randconfig-a016-20211221
arc                  randconfig-r043-20211219
riscv                randconfig-r042-20211219
s390                 randconfig-r044-20211219
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
hexagon              randconfig-r045-20211219
hexagon              randconfig-r041-20211219
hexagon              randconfig-r041-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
