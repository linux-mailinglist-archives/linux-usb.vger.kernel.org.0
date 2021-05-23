Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F392B38D7E8
	for <lists+linux-usb@lfdr.de>; Sun, 23 May 2021 02:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhEWAKv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 May 2021 20:10:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:1521 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231453AbhEWAKu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 22 May 2021 20:10:50 -0400
IronPort-SDR: mUgZgJ2ItRiCWADnj51z9U3k60IxBwx5jeI46tPl7zo/nyBhxyUe8IPpxJNPy2DSFVQ6+U3sFT
 7mERszafRN+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9992"; a="287261660"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="287261660"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2021 17:09:24 -0700
IronPort-SDR: AOiEGRn2lYSmGRCXjjFsqGnszVKRfZi29+iuAIk6I+hLtVc/Y+4jTlJxtOizs3ZsGVNKWtjJqf
 QqCbjN/3XkSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="434795415"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 22 May 2021 17:09:22 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lkbgH-0000Z7-RL; Sun, 23 May 2021 00:09:21 +0000
Date:   Sun, 23 May 2021 08:08:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 5cc59c418fde9d02859996707b9d5dfd2941c50b
Message-ID: <60a99d06.ejMuB2U9yILTz5JX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 5cc59c418fde9d02859996707b9d5dfd2941c50b  USB: core: WARN if pipe direction != setup packet direction

Warning in current branch:

drivers/usb/typec/tcpm/tcpci.c:118:5: warning: no previous prototype for 'tcpci_apply_rc' [-Wmissing-prototypes]
drivers/usb/typec/tcpm/tcpci.c:118:5: warning: no previous prototype for function 'tcpci_apply_rc' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- arc-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- arc-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- arm-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- arm-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- arm64-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- arm64-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- arm64-defconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- h8300-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-randconfig-a004-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-randconfig-a004-20210523
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-randconfig-a006-20210523
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-randconfig-a012-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-randconfig-a015-20210523
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-randconfig-r013-20210523
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-randconfig-r033-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- i386-randconfig-s002-20210522
|   |-- drivers-usb-typec-tcpm-tcpci.c:sparse:sparse:symbol-tcpci_apply_rc-was-not-declared.-Should-it-be-static
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- ia64-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- ia64-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- m68k-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- m68k-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- microblaze-randconfig-r024-20210523
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- mips-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- mips-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- nds32-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- nds32-randconfig-p002-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- nios2-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- nios2-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- nios2-randconfig-p001-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- openrisc-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- parisc-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- parisc-randconfig-r022-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- powerpc-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- powerpc-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- riscv-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- riscv-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- riscv-randconfig-r031-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- riscv-randconfig-s031-20210522
|   |-- drivers-usb-typec-tcpm-tcpci.c:sparse:sparse:symbol-tcpci_apply_rc-was-not-declared.-Should-it-be-static
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- s390-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- sh-allmodconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- sh-randconfig-s031-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:sparse:sparse:symbol-tcpci_apply_rc-was-not-declared.-Should-it-be-static
|-- sparc-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- sparc-randconfig-r025-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- sparc64-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- sparc64-randconfig-s032-20210522
|   |-- drivers-usb-typec-tcpm-tcpci.c:sparse:sparse:symbol-tcpci_apply_rc-was-not-declared.-Should-it-be-static
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- x86_64-allyesconfig
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- x86_64-randconfig-a015-20210523
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
|-- x86_64-randconfig-r024-20210523
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc
`-- xtensa-allyesconfig
    `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-tcpci_apply_rc

clang_recent_errors
|-- riscv-randconfig-r023-20210522
|   `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-function-tcpci_apply_rc
`-- x86_64-randconfig-r033-20210523
    `-- drivers-usb-typec-tcpm-tcpci.c:warning:no-previous-prototype-for-function-tcpci_apply_rc

elapsed time: 756m

configs tested: 178
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       mainstone_defconfig
sh                   sh7724_generic_defconfig
sparc                       sparc64_defconfig
mips                           ci20_defconfig
sh                        edosk7705_defconfig
arm                             pxa_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
m68k                          amiga_defconfig
powerpc                     ppa8548_defconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
powerpc                    adder875_defconfig
m68k                        m5307c3_defconfig
powerpc                 mpc832x_mds_defconfig
mips                        nlm_xlr_defconfig
sh                          rsk7264_defconfig
x86_64                           alldefconfig
powerpc                     pseries_defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
powerpc                     mpc512x_defconfig
arm                          pxa3xx_defconfig
powerpc                          g5_defconfig
sh                ecovec24-romimage_defconfig
xtensa                       common_defconfig
powerpc                     sbc8548_defconfig
mips                  decstation_64_defconfig
sh                        sh7757lcr_defconfig
arc                          axs101_defconfig
sh                          urquell_defconfig
sparc64                             defconfig
mips                         tb0226_defconfig
sh                             shx3_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                           ip27_defconfig
sh                          kfr2r09_defconfig
mips                malta_qemu_32r6_defconfig
arm64                            alldefconfig
powerpc                      obs600_defconfig
arm                      pxa255-idp_defconfig
m68k                            mac_defconfig
powerpc                          allmodconfig
m68k                        m5272c3_defconfig
powerpc                     tqm8541_defconfig
mips                      bmips_stb_defconfig
riscv                               defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
sh                          rsk7203_defconfig
sh                         apsh4a3a_defconfig
arm                             rpc_defconfig
arm                           sunxi_defconfig
powerpc                    amigaone_defconfig
arc                           tb10x_defconfig
arm                        magician_defconfig
mips                       lemote2f_defconfig
um                             i386_defconfig
arm                         palmz72_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                 decstation_r4k_defconfig
mips                      maltaaprp_defconfig
ia64                             allmodconfig
arm                           u8500_defconfig
riscv                    nommu_virt_defconfig
arm                         s5pv210_defconfig
xtensa                              defconfig
arm                          pxa910_defconfig
powerpc                     akebono_defconfig
m68k                        mvme147_defconfig
arm                           tegra_defconfig
arc                     haps_hs_smp_defconfig
arm                         vf610m4_defconfig
h8300                               defconfig
nds32                            alldefconfig
sh                      rts7751r2d1_defconfig
powerpc                     tqm5200_defconfig
microblaze                          defconfig
sh                           se7750_defconfig
arm                           corgi_defconfig
mips                          malta_defconfig
arm                         lubbock_defconfig
mips                         mpc30x_defconfig
x86_64                            allnoconfig
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
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210522
x86_64               randconfig-a006-20210522
x86_64               randconfig-a005-20210522
x86_64               randconfig-a003-20210522
x86_64               randconfig-a004-20210522
x86_64               randconfig-a002-20210522
i386                 randconfig-a001-20210523
i386                 randconfig-a005-20210523
i386                 randconfig-a002-20210523
i386                 randconfig-a003-20210523
i386                 randconfig-a004-20210523
i386                 randconfig-a006-20210523
i386                 randconfig-a001-20210522
i386                 randconfig-a005-20210522
i386                 randconfig-a002-20210522
i386                 randconfig-a004-20210522
i386                 randconfig-a003-20210522
i386                 randconfig-a006-20210522
x86_64               randconfig-a013-20210523
x86_64               randconfig-a014-20210523
x86_64               randconfig-a012-20210523
x86_64               randconfig-a016-20210523
x86_64               randconfig-a015-20210523
x86_64               randconfig-a011-20210523
i386                 randconfig-a016-20210522
i386                 randconfig-a011-20210522
i386                 randconfig-a015-20210522
i386                 randconfig-a012-20210522
i386                 randconfig-a014-20210522
i386                 randconfig-a013-20210522
i386                 randconfig-a016-20210523
i386                 randconfig-a011-20210523
i386                 randconfig-a015-20210523
i386                 randconfig-a012-20210523
i386                 randconfig-a014-20210523
i386                 randconfig-a013-20210523
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210522
x86_64               randconfig-a013-20210522
x86_64               randconfig-a014-20210522
x86_64               randconfig-a012-20210522
x86_64               randconfig-a016-20210522
x86_64               randconfig-a015-20210522
x86_64               randconfig-a011-20210522

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
