Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D6E30F2DD
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 13:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbhBDMIM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 07:08:12 -0500
Received: from mga09.intel.com ([134.134.136.24]:29459 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235701AbhBDMII (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Feb 2021 07:08:08 -0500
IronPort-SDR: /Su0nYOQyq5+qvVBcUKa63H9LEo/cF8xAMn+2Is0H1KpeZXNOOT9d3bCbBqnqfsZl+J0hcek/b
 pSTdS0CF+Reg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="181373432"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="181373432"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 04:07:24 -0800
IronPort-SDR: JoSqfV22HCU5B++YX9Q9/WYYXgf9cevg189zu5GeVZvojl5fdie8nT8snnsTsv4koih30nfFxy
 Grj6L874Aq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="433896986"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2021 04:07:23 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l7dPu-0000wy-P2; Thu, 04 Feb 2021 12:07:22 +0000
Date:   Thu, 04 Feb 2021 20:06:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 d021e0694d77ee3cdc5d3fca2c8d53ae7575499a
Message-ID: <601be359.rWSJ0KMuhrDmlMRy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d021e0694d77ee3cdc5d3fca2c8d53ae7575499a  doc: devicetree: bindings: usb: Change descibe to describe in usbmisc-imx.txt

Error/Warning reports:

https://lore.kernel.org/linux-usb/202102032303.xnvdBAo2-lkp@intel.com

Error/Warning in current branch:

drivers/platform/chrome/cros_ec_typec.c:778:8: error: 'CABLE_ATYPE' undeclared (first use in this function); did you mean 'CABLE_CTYPE'?
drivers/platform/chrome/cros_ec_typec.c:781:8: error: 'CABLE_BTYPE' undeclared (first use in this function); did you mean 'CABLE_CTYPE'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   |-- drivers-platform-chrome-cros_ec_typec.c:error:CABLE_ATYPE-undeclared-(first-use-in-this-function)
|   `-- drivers-platform-chrome-cros_ec_typec.c:error:CABLE_BTYPE-undeclared-(first-use-in-this-function)
|-- c6x-allyesconfig
|   |-- drivers-platform-chrome-cros_ec_typec.c:error:CABLE_ATYPE-undeclared-(first-use-in-this-function)
|   `-- drivers-platform-chrome-cros_ec_typec.c:error:CABLE_BTYPE-undeclared-(first-use-in-this-function)
`-- x86_64-allyesconfig
    |-- drivers-platform-chrome-cros_ec_typec.c:error:CABLE_ATYPE-undeclared-(first-use-in-this-function)
    `-- drivers-platform-chrome-cros_ec_typec.c:error:CABLE_BTYPE-undeclared-(first-use-in-this-function)

elapsed time: 723m

configs tested: 120
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                       ebony_defconfig
m68k                             allmodconfig
riscv                             allnoconfig
arm                       multi_v4t_defconfig
sh                              ul2_defconfig
arm                         socfpga_defconfig
arm64                            alldefconfig
riscv                    nommu_virt_defconfig
mips                           ip32_defconfig
c6x                        evmc6474_defconfig
sh                           se7751_defconfig
sh                            migor_defconfig
sh                          r7785rp_defconfig
mips                       rbtx49xx_defconfig
m68k                            mac_defconfig
powerpc                     tqm8548_defconfig
arm                            mps2_defconfig
sh                           se7705_defconfig
arm                        mvebu_v5_defconfig
powerpc                      ppc64e_defconfig
i386                                defconfig
h8300                               defconfig
powerpc                 mpc836x_rdk_defconfig
nios2                               defconfig
powerpc                  mpc866_ads_defconfig
h8300                     edosk2674_defconfig
sh                          rsk7201_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    sam440ep_defconfig
arm                     davinci_all_defconfig
powerpc                     ep8248e_defconfig
c6x                         dsk6455_defconfig
powerpc                     tqm8560_defconfig
sh                  sh7785lcr_32bit_defconfig
s390                          debug_defconfig
mips                         bigsur_defconfig
arm                          lpd270_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210202
i386                 randconfig-a005-20210202
i386                 randconfig-a003-20210202
i386                 randconfig-a006-20210202
i386                 randconfig-a002-20210202
i386                 randconfig-a004-20210202
i386                 randconfig-a001-20210204
i386                 randconfig-a005-20210204
i386                 randconfig-a003-20210204
i386                 randconfig-a006-20210204
i386                 randconfig-a002-20210204
i386                 randconfig-a004-20210204
x86_64               randconfig-a013-20210202
x86_64               randconfig-a014-20210202
x86_64               randconfig-a015-20210202
x86_64               randconfig-a016-20210202
x86_64               randconfig-a011-20210202
x86_64               randconfig-a012-20210202
i386                 randconfig-a013-20210202
i386                 randconfig-a016-20210202
i386                 randconfig-a014-20210202
i386                 randconfig-a012-20210202
i386                 randconfig-a015-20210202
i386                 randconfig-a011-20210202
i386                 randconfig-a013-20210203
i386                 randconfig-a016-20210203
i386                 randconfig-a014-20210203
i386                 randconfig-a012-20210203
i386                 randconfig-a015-20210203
i386                 randconfig-a011-20210203
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210202
x86_64               randconfig-a001-20210202
x86_64               randconfig-a005-20210202
x86_64               randconfig-a002-20210202
x86_64               randconfig-a004-20210202
x86_64               randconfig-a003-20210202

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
