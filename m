Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7722D429B21
	for <lists+linux-usb@lfdr.de>; Tue, 12 Oct 2021 03:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhJLBqO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 21:46:14 -0400
Received: from mga04.intel.com ([192.55.52.120]:22366 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229565AbhJLBqK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 21:46:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="225785710"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
   d="scan'208";a="225785710"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 18:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
   d="scan'208";a="591543754"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Oct 2021 18:44:04 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ma6po-0002vi-9X; Tue, 12 Oct 2021 01:44:04 +0000
Date:   Tue, 12 Oct 2021 09:43:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 d143d2c76ed6b02cca4a366cb1ed8549c5fc2a32
Message-ID: <6164e849.s0qbrZ1bIKL4vEZ7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d143d2c76ed6b02cca4a366cb1ed8549c5fc2a32  usb: gadget: u_audio.c: Adding Playback Pitch ctl for sync playback

Error/Warning reports:

https://lore.kernel.org/linux-usb/202110120052.NOD3RQfr-lkp@intel.com
https://lore.kernel.org/linux-usb/202110120217.uHSGwfH4-lkp@intel.com

Error/Warning in current branch:

drivers/usb/gadget/function/u_audio.c:589:38: error: variable 'p_pktsize_residue' set but not used [-Werror=unused-but-set-variable]
drivers/usb/gadget/function/u_audio.c:589:45: error: variable 'p_pktsize_residue' set but not used [-Werror=unused-but-set-variable]
u_audio.c:(.text+0x3f6): undefined reference to `__udivdi3'
u_audio.c:(.text+0x60c): undefined reference to `__udivdi3'

possible Error/Warning in current branch (please contact us if interested):

drivers/usb/gadget/function/u_audio.c:589:38: warning: variable 'p_pktsize_residue' set but not used [-Wunused-but-set-variable]
m68k-linux-ld: u_audio.c:(.text+0x440): undefined reference to `__udivdi3'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- arm-allmodconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- arm-randconfig-r003-20211011
|   `-- u_audio.c:(.text):undefined-reference-to-__udivdi3
|-- h8300-allyesconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- m68k-randconfig-r001-20211011
|   `-- m68k-linux-ld:u_audio.c:(.text):undefined-reference-to-__udivdi3
|-- m68k-randconfig-r015-20211011
|   `-- u_audio.c:(.text):undefined-reference-to-__udivdi3
|-- nios2-allyesconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used
`-- xtensa-allyesconfig
    `-- drivers-usb-gadget-function-u_audio.c:error:variable-p_pktsize_residue-set-but-not-used

clang_recent_errors
|-- arm-buildonly-randconfig-r005-20211011
|   `-- drivers-usb-gadget-function-u_audio.c:warning:variable-p_pktsize_residue-set-but-not-used
|-- i386-randconfig-a006-20211011
|   `-- drivers-usb-gadget-function-u_audio.c:warning:variable-p_pktsize_residue-set-but-not-used
`-- x86_64-randconfig-a001-20211011
    `-- drivers-usb-gadget-function-u_audio.c:warning:variable-p_pktsize_residue-set-but-not-used

elapsed time: 826m

configs tested: 107
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20211011
powerpc              randconfig-c003-20211011
powerpc                      obs600_defconfig
powerpc                    gamecube_defconfig
mips                       bmips_be_defconfig
sh                           se7619_defconfig
arm                            mps2_defconfig
powerpc                         ps3_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                ecovec24-romimage_defconfig
sparc                       sparc64_defconfig
sh                        sh7757lcr_defconfig
sh                               j2_defconfig
arm                        realview_defconfig
arm                       versatile_defconfig
arm                             ezx_defconfig
powerpc                 mpc834x_itx_defconfig
xtensa                    xip_kc705_defconfig
mips                     decstation_defconfig
powerpc                      makalu_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
mips                     loongson1b_defconfig
mips                         db1xxx_defconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
arc                  randconfig-r043-20211011
s390                 randconfig-r044-20211011
riscv                randconfig-r042-20211011
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
