Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119F72F436C
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 05:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbhAME5D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 23:57:03 -0500
Received: from mga06.intel.com ([134.134.136.31]:35372 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbhAME5D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 23:57:03 -0500
IronPort-SDR: uRXsmnXe27M8BFkuxUigx9tufjXf2HCX6RL/1H2BLK4CqkSKk+ddYxU09WAdST+1pWfzI9fgdh
 gavPTXj9japA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="239691503"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="239691503"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 20:56:21 -0800
IronPort-SDR: f4Cg263CW9b9K1QY8pMB33VdXw775meaS24dSIAk+Sfjl00448uouq6vv2q8qZi4gbwKLaEE+4
 IQKqFvMBsMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="381701287"
Received: from lkp-server01.sh.intel.com (HELO d5d1a9a2c6bb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Jan 2021 20:56:20 -0800
Received: from kbuild by d5d1a9a2c6bb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzYCi-00003q-63; Wed, 13 Jan 2021 04:56:20 +0000
Date:   Wed, 13 Jan 2021 12:56:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 4e0dcf62ab4cf917d0cbe751b8bf229a065248d4
Message-ID: <5ffe7d72.0+7UjUM+h/tD3hOT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 4e0dcf62ab4cf917d0cbe751b8bf229a065248d4  usb: gadget: aspeed: fix stop dma register setting.

elapsed time: 725m

configs tested: 148
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
powerpc                       maple_defconfig
arm                              zx_defconfig
mips                            e55_defconfig
arm                       spear13xx_defconfig
sh                               alldefconfig
mips                     cu1000-neo_defconfig
arm                       cns3420vb_defconfig
mips                 decstation_r4k_defconfig
powerpc                    adder875_defconfig
powerpc                    socrates_defconfig
powerpc                       holly_defconfig
arm                          lpd270_defconfig
m68k                          amiga_defconfig
mips                        qi_lb60_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc836x_mds_defconfig
sh                           se7780_defconfig
arm                          moxart_defconfig
powerpc                      arches_defconfig
arm                             rpc_defconfig
arc                        nsimosci_defconfig
m68k                          multi_defconfig
mips                  cavium_octeon_defconfig
riscv                            alldefconfig
arc                            hsdk_defconfig
arm                            xcep_defconfig
powerpc                     ksi8560_defconfig
arm                           corgi_defconfig
sh                          r7785rp_defconfig
powerpc                       eiger_defconfig
m68k                            mac_defconfig
powerpc                     tqm8548_defconfig
mips                malta_kvm_guest_defconfig
sh                          rsk7264_defconfig
arm                         vf610m4_defconfig
riscv                               defconfig
powerpc                      ep88xc_defconfig
sh                        apsh4ad0a_defconfig
mips                       rbtx49xx_defconfig
arm                            qcom_defconfig
sh                ecovec24-romimage_defconfig
arm                          tango4_defconfig
mips                          ath25_defconfig
sh                           sh2007_defconfig
arm                        spear6xx_defconfig
arm                         s3c6400_defconfig
powerpc                     pseries_defconfig
arc                              alldefconfig
arc                     nsimosci_hs_defconfig
powerpc                     rainier_defconfig
m68k                         amcore_defconfig
arm                         lubbock_defconfig
h8300                            alldefconfig
arm                         orion5x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210113
x86_64               randconfig-a001-20210113
x86_64               randconfig-a005-20210113
x86_64               randconfig-a003-20210113
x86_64               randconfig-a002-20210113
x86_64               randconfig-a006-20210113
i386                 randconfig-a002-20210113
i386                 randconfig-a005-20210113
i386                 randconfig-a006-20210113
i386                 randconfig-a003-20210113
i386                 randconfig-a001-20210113
i386                 randconfig-a004-20210113
i386                 randconfig-a002-20210112
i386                 randconfig-a005-20210112
i386                 randconfig-a006-20210112
i386                 randconfig-a003-20210112
i386                 randconfig-a001-20210112
i386                 randconfig-a004-20210112
x86_64               randconfig-a015-20210112
x86_64               randconfig-a012-20210112
x86_64               randconfig-a013-20210112
x86_64               randconfig-a016-20210112
x86_64               randconfig-a014-20210112
x86_64               randconfig-a011-20210112
i386                 randconfig-a012-20210112
i386                 randconfig-a011-20210112
i386                 randconfig-a016-20210112
i386                 randconfig-a013-20210112
i386                 randconfig-a015-20210112
i386                 randconfig-a014-20210112
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a004-20210112
x86_64               randconfig-a001-20210112
x86_64               randconfig-a005-20210112
x86_64               randconfig-a003-20210112
x86_64               randconfig-a002-20210112
x86_64               randconfig-a006-20210112
x86_64               randconfig-a015-20210113
x86_64               randconfig-a012-20210113
x86_64               randconfig-a013-20210113
x86_64               randconfig-a016-20210113
x86_64               randconfig-a014-20210113
x86_64               randconfig-a011-20210113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
