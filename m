Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B432375D44
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 00:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhEFW5O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 18:57:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:45761 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230283AbhEFW5N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 18:57:13 -0400
IronPort-SDR: M52jxbaWs9rhh2byOTe2Q/nVt8Wuhx/dSeytXOfTAxTGow2S6gOAd44iY1XuqH/kHbi4yk387I
 spbo8id94H+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="284047476"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="284047476"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 15:56:14 -0700
IronPort-SDR: mU0PijRhHi6ULJxs5qK3UXt/iGboeyqvhAEmCwbVHbIfAYMhJPrAEt9grm7UkbBUSHG30aydC+
 tz+LA1JQkCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="430969585"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 May 2021 15:56:13 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lemui-000Aut-Pw; Thu, 06 May 2021 22:56:12 +0000
Date:   Fri, 07 May 2021 06:56:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 83a9d2a05296bf5a5fee13206dc4499a40978908
Message-ID: <60947407.neMGYOOtlDZNi49m%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 83a9d2a05296bf5a5fee13206dc4499a40978908  usb: isp1760: hcd: refactor mempool config and setup

Warning reports:

https://lore.kernel.org/linux-usb/202105062308.oMWocSH3-lkp@intel.com
https://lore.kernel.org/linux-usb/202105062309.R5efCyjE-lkp@intel.com
https://lore.kernel.org/linux-usb/202105062318.xxK3ju2U-lkp@intel.com

Warning in current branch:

drivers/usb/isp1760/isp1760-core.c:163:41: warning: variable 'base' is uninitialized when used here [-Wuninitialized]
drivers/usb/isp1760/isp1760-core.c:182:41: warning: variable 'base' is uninitialized when used here [-Wuninitialized]
drivers/usb/isp1760/isp1760-regs.h:286:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- alpha-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- alpha-randconfig-r025-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arc-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arc-randconfig-r016-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arc-randconfig-r023-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arc-randconfig-r036-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arm-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arm-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arm-defconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arm64-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- arm64-defconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- csky-randconfig-r024-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- h8300-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- h8300-randconfig-r036-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- h8300-randconfig-s032-20210506
|   `-- drivers-usb-isp1760-isp1760-hcd.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-usb_hcd-hcd-got-void-noderef-__iomem-regs
|-- i386-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- i386-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- i386-randconfig-a001-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- i386-randconfig-a005-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- i386-randconfig-a013-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- i386-randconfig-a015-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- ia64-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- ia64-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- ia64-randconfig-r023-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- m68k-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- m68k-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- microblaze-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- mips-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- mips-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- mips-randconfig-s031-20210506
|   |-- drivers-usb-isp1760-isp1760-hcd.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-usb_hcd-hcd-got-void-noderef-__iomem-regs
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- nds32-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- nds32-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- nds32-randconfig-r001-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- nios2-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- openrisc-randconfig-r012-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- openrisc-randconfig-r031-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- parisc-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- parisc-randconfig-r004-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- parisc-randconfig-r031-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- powerpc-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- powerpc-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- powerpc64-randconfig-p002-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- riscv-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- riscv-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- s390-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- sh-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- sparc-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- sparc-randconfig-r032-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- sparc64-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- sparc64-randconfig-r024-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- x86_64-allmodconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- x86_64-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- x86_64-randconfig-a015-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- x86_64-randconfig-r013-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- x86_64-randconfig-r015-20210506
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- x86_64-randconfig-s022-20210506
|   |-- drivers-usb-isp1760-isp1760-hcd.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-usb_hcd-hcd-got-void-noderef-__iomem-regs
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
|-- xtensa-allyesconfig
|   `-- include-linux-regmap.h:warning:initialized-field-overwritten
`-- xtensa-randconfig-r026-20210506
    `-- include-linux-regmap.h:warning:initialized-field-overwritten

clang_recent_errors
|-- arm64-randconfig-r002-20210506
|   |-- drivers-usb-isp1760-isp1760-core.c:warning:variable-base-is-uninitialized-when-used-here
|   `-- drivers-usb-isp1760-isp1760-regs.h:warning:initializer-overrides-prior-initialization-of-this-subobject
|-- arm64-randconfig-r034-20210506
|   |-- drivers-usb-isp1760-isp1760-core.c:warning:variable-base-is-uninitialized-when-used-here
|   `-- drivers-usb-isp1760-isp1760-regs.h:warning:initializer-overrides-prior-initialization-of-this-subobject
|-- riscv-randconfig-r006-20210506
|   |-- drivers-usb-isp1760-isp1760-core.c:warning:variable-base-is-uninitialized-when-used-here
|   `-- drivers-usb-isp1760-isp1760-regs.h:warning:initializer-overrides-prior-initialization-of-this-subobject
|-- x86_64-randconfig-a001-20210506
|   |-- drivers-usb-isp1760-isp1760-core.c:warning:variable-base-is-uninitialized-when-used-here
|   `-- drivers-usb-isp1760-isp1760-regs.h:warning:initializer-overrides-prior-initialization-of-this-subobject
`-- x86_64-randconfig-a006-20210506
    |-- drivers-usb-isp1760-isp1760-core.c:warning:variable-base-is-uninitialized-when-used-here
    `-- drivers-usb-isp1760-isp1760-regs.h:warning:initializer-overrides-prior-initialization-of-this-subobject

elapsed time: 725m

configs tested: 142
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
mips                     cu1830-neo_defconfig
x86_64                           alldefconfig
mips                        jmr3927_defconfig
sparc                       sparc64_defconfig
arm                       mainstone_defconfig
powerpc                     pq2fads_defconfig
arm                        keystone_defconfig
um                               alldefconfig
s390                                defconfig
powerpc                    ge_imp3a_defconfig
sh                          rsk7203_defconfig
sh                          polaris_defconfig
arm                        shmobile_defconfig
mips                        nlm_xlr_defconfig
arm                          lpd270_defconfig
mips                        omega2p_defconfig
sh                     sh7710voipgw_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
sh                           se7751_defconfig
riscv                            alldefconfig
powerpc                      ppc40x_defconfig
mips                          ath25_defconfig
sh                                  defconfig
arm                         at91_dt_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     tqm8560_defconfig
mips                           ip22_defconfig
powerpc                     redwood_defconfig
mips                      malta_kvm_defconfig
arm                       cns3420vb_defconfig
arm                         mv78xx0_defconfig
arm                          exynos_defconfig
sparc                       sparc32_defconfig
sh                ecovec24-romimage_defconfig
arm                          pcm027_defconfig
microblaze                          defconfig
mips                        bcm63xx_defconfig
powerpc                     tqm8541_defconfig
powerpc                       ebony_defconfig
powerpc                     taishan_defconfig
powerpc                     ksi8560_defconfig
powerpc                     powernv_defconfig
powerpc                     asp8347_defconfig
mips                      loongson3_defconfig
mips                       rbtx49xx_defconfig
sh                           se7343_defconfig
powerpc                 mpc834x_mds_defconfig
arm                            mps2_defconfig
mips                         tb0219_defconfig
mips                malta_qemu_32r6_defconfig
mips                        bcm47xx_defconfig
mips                       lemote2f_defconfig
sh                   rts7751r2dplus_defconfig
arm                  colibri_pxa300_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                        mvebu_v5_defconfig
mips                    maltaup_xpa_defconfig
xtensa                  audio_kc705_defconfig
arm                          pxa168_defconfig
powerpc                    sam440ep_defconfig
sh                 kfr2r09-romimage_defconfig
mips                         cobalt_defconfig
arm                              alldefconfig
x86_64                            allnoconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210506
i386                 randconfig-a006-20210506
i386                 randconfig-a001-20210506
i386                 randconfig-a005-20210506
i386                 randconfig-a004-20210506
i386                 randconfig-a002-20210506
x86_64               randconfig-a014-20210506
x86_64               randconfig-a015-20210506
x86_64               randconfig-a012-20210506
x86_64               randconfig-a013-20210506
x86_64               randconfig-a011-20210506
x86_64               randconfig-a016-20210506
i386                 randconfig-a015-20210506
i386                 randconfig-a013-20210506
i386                 randconfig-a016-20210506
i386                 randconfig-a014-20210506
i386                 randconfig-a012-20210506
i386                 randconfig-a011-20210506
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
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
x86_64               randconfig-a001-20210506
x86_64               randconfig-a003-20210506
x86_64               randconfig-a005-20210506
x86_64               randconfig-a002-20210506
x86_64               randconfig-a006-20210506
x86_64               randconfig-a004-20210506

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
