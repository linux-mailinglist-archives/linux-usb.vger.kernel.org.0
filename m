Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB819318A53
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 13:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhBKMVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 07:21:32 -0500
Received: from mga12.intel.com ([192.55.52.136]:27202 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231816AbhBKMSb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Feb 2021 07:18:31 -0500
IronPort-SDR: aEJ/JbKgJP0AaV3VghK70YGvBAm7wgjrL3BbEbdu9JD69v3aCHLkPQeouvsksa7RRAf1s6RZyu
 fLQhrJe7xmQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="161374614"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="scan'208";a="161374614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 04:17:25 -0800
IronPort-SDR: 8T3P8YHvAsLKZcP+AnJ49J0TVE2ggf400+Pzg20ohMBoJUPZzjgxnGhokAaqbAfHWXeJs3tl7X
 4aaQfftQkbTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="scan'208";a="578786307"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Feb 2021 04:17:23 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lAAuR-0003m3-7o; Thu, 11 Feb 2021 12:17:23 +0000
Date:   Thu, 11 Feb 2021 20:16:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 1ebe718bb48278105816ba03a0408ecc2d6cf47f
Message-ID: <6025202f.CnzEZSOWHxamBqJr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1ebe718bb48278105816ba03a0408ecc2d6cf47f  usb: quirks: add quirk to start video capture on ELMO L-12F document camera reliable

elapsed time: 721m

configs tested: 168
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
sh                          rsk7203_defconfig
sparc                               defconfig
mips                      bmips_stb_defconfig
arm                              alldefconfig
openrisc                         alldefconfig
arm                         bcm2835_defconfig
powerpc                    klondike_defconfig
c6x                         dsk6455_defconfig
mips                          malta_defconfig
powerpc                        cell_defconfig
m68k                       m5249evb_defconfig
powerpc                     sbc8548_defconfig
sh                            shmin_defconfig
arm                          pxa168_defconfig
powerpc                    sam440ep_defconfig
sh                        apsh4ad0a_defconfig
mips                 decstation_r4k_defconfig
sh                                  defconfig
powerpc                     powernv_defconfig
arm                         palmz72_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
openrisc                    or1ksim_defconfig
powerpc                      pasemi_defconfig
sh                         apsh4a3a_defconfig
sh                          rsk7201_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc64                           defconfig
mips                           xway_defconfig
mips                            e55_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        nlm_xlp_defconfig
xtensa                         virt_defconfig
arm                        magician_defconfig
mips                           ip32_defconfig
powerpc                     tqm8540_defconfig
sh                          kfr2r09_defconfig
nios2                         10m50_defconfig
arc                        nsimosci_defconfig
powerpc                  mpc885_ads_defconfig
arc                         haps_hs_defconfig
arm                          prima2_defconfig
powerpc                          g5_defconfig
m68k                          amiga_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     tqm8555_defconfig
mips                        bcm63xx_defconfig
sh                           se7721_defconfig
arm                          gemini_defconfig
powerpc                     taishan_defconfig
arm                    vt8500_v6_v7_defconfig
arm                        realview_defconfig
arm                          badge4_defconfig
sh                         microdev_defconfig
ia64                         bigsur_defconfig
mips                         tb0287_defconfig
powerpc                    socrates_defconfig
mips                            ar7_defconfig
powerpc                          allmodconfig
powerpc                         ps3_defconfig
powerpc                      walnut_defconfig
powerpc                    mvme5100_defconfig
mips                     loongson1c_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                          allyesconfig
m68k                        m5407c3_defconfig
powerpc                     ep8248e_defconfig
mips                        omega2p_defconfig
sh                           se7750_defconfig
sh                        sh7763rdp_defconfig
m68k                       m5275evb_defconfig
sparc64                          alldefconfig
powerpc                 mpc836x_mds_defconfig
nios2                            alldefconfig
mips                           ip27_defconfig
powerpc                      katmai_defconfig
arm                           tegra_defconfig
xtensa                       common_defconfig
arm                             pxa_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                           se7751_defconfig
powerpc                     sequoia_defconfig
ia64                      gensparse_defconfig
m68k                             alldefconfig
m68k                         apollo_defconfig
m68k                       bvme6000_defconfig
mips                           ci20_defconfig
m68k                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
x86_64               randconfig-a016-20210211
x86_64               randconfig-a013-20210211
x86_64               randconfig-a012-20210211
x86_64               randconfig-a015-20210211
x86_64               randconfig-a014-20210211
x86_64               randconfig-a011-20210211
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
