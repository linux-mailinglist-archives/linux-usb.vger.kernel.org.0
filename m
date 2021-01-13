Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0065A2F552D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 00:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbhAMXXj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 18:23:39 -0500
Received: from mga03.intel.com ([134.134.136.65]:5247 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729460AbhAMXWe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Jan 2021 18:22:34 -0500
IronPort-SDR: cGAnyFKIzSQH1IYI0iP3F9wrktQ3Wb79gkToys3hqyBhnSUBCPOqymClcZB8HrnRS6hWCq7lsr
 s8g3/2QJdWSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="178371975"
X-IronPort-AV: E=Sophos;i="5.79,345,1602572400"; 
   d="scan'208";a="178371975"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 14:59:51 -0800
IronPort-SDR: DsAHsZNI8Zzms6kJqxw3z04vic86mkBlCq4tZG1lfMOYE7o4gKdkKbXj5aFgQkC/KOTAU7osvd
 F8avldu8lbvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,345,1602572400"; 
   d="scan'208";a="404979365"
Received: from lkp-server01.sh.intel.com (HELO d5d1a9a2c6bb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2021 14:59:50 -0800
Received: from kbuild by d5d1a9a2c6bb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzp7F-0000Ok-Uq; Wed, 13 Jan 2021 22:59:49 +0000
Date:   Thu, 14 Jan 2021 06:59:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 67004e130aafad4c9e0ad3fff9cf67227b6347be
Message-ID: <5fff7b55.aHOqaICoJqj5dVov%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 67004e130aafad4c9e0ad3fff9cf67227b6347be  ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove USB_EHCI_TEGRA

elapsed time: 723m

configs tested: 123
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                          ath25_defconfig
mips                            gpr_defconfig
arm                       multi_v4t_defconfig
m68k                        stmark2_defconfig
powerpc                      pasemi_defconfig
mips                       rbtx49xx_defconfig
c6x                              alldefconfig
sparc                            alldefconfig
powerpc                      ppc64e_defconfig
sh                   sh7770_generic_defconfig
powerpc                         wii_defconfig
arm                        magician_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                  colibri_pxa300_defconfig
powerpc                  mpc866_ads_defconfig
um                           x86_64_defconfig
mips                          malta_defconfig
ia64                             allyesconfig
sh                           se7724_defconfig
mips                         bigsur_defconfig
mips                        bcm47xx_defconfig
c6x                        evmc6457_defconfig
powerpc                    amigaone_defconfig
arc                     haps_hs_smp_defconfig
csky                                defconfig
um                            kunit_defconfig
parisc                              defconfig
mips                           xway_defconfig
arm                           u8500_defconfig
sh                           se7343_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7785lcr_defconfig
mips                     cu1830-neo_defconfig
powerpc                     tqm5200_defconfig
riscv                    nommu_virt_defconfig
mips                      maltasmvp_defconfig
arc                        nsimosci_defconfig
mips                         tb0287_defconfig
m68k                            q40_defconfig
arm                        mini2440_defconfig
arm                      integrator_defconfig
sh                   sh7724_generic_defconfig
sh                           se7751_defconfig
powerpc                     rainier_defconfig
powerpc                     taishan_defconfig
arc                              alldefconfig
arm                        spear3xx_defconfig
powerpc                      tqm8xx_defconfig
mips                      pic32mzda_defconfig
arm                     am200epdkit_defconfig
sh                         ecovec24_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210113
x86_64               randconfig-a004-20210113
x86_64               randconfig-a001-20210113
x86_64               randconfig-a005-20210113
x86_64               randconfig-a003-20210113
x86_64               randconfig-a002-20210113
i386                 randconfig-a002-20210113
i386                 randconfig-a005-20210113
i386                 randconfig-a006-20210113
i386                 randconfig-a003-20210113
i386                 randconfig-a001-20210113
i386                 randconfig-a004-20210113
i386                 randconfig-a012-20210113
i386                 randconfig-a011-20210113
i386                 randconfig-a016-20210113
i386                 randconfig-a013-20210113
i386                 randconfig-a015-20210113
i386                 randconfig-a014-20210113
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210113
x86_64               randconfig-a012-20210113
x86_64               randconfig-a013-20210113
x86_64               randconfig-a016-20210113
x86_64               randconfig-a014-20210113
x86_64               randconfig-a011-20210113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
