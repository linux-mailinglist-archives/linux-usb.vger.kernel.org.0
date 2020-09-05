Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0898F25E86D
	for <lists+linux-usb@lfdr.de>; Sat,  5 Sep 2020 16:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgIEOps (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Sep 2020 10:45:48 -0400
Received: from mga01.intel.com ([192.55.52.88]:18302 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728206AbgIEOpd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 5 Sep 2020 10:45:33 -0400
IronPort-SDR: rGFBDs2HwzVmzvta+w6gyWLVhGeDO+AK45k8WzukxMnbyllxQchiLByZoIeBu+RwHhOjOB7IxB
 iElOTy7Q3OmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="175914918"
X-IronPort-AV: E=Sophos;i="5.76,394,1592895600"; 
   d="scan'208";a="175914918"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2020 07:45:28 -0700
IronPort-SDR: JsAQZZbL60iKUWcP98we8hGfSGVFIjMauSZ/S0jH7GNDcPRnepjElwU3IB0lR5idyQW9dP6XES
 sioVKmrmJ2Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,394,1592895600"; 
   d="scan'208";a="316256480"
Received: from lkp-server02.sh.intel.com (HELO c089623da072) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Sep 2020 07:45:26 -0700
Received: from kbuild by c089623da072 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kEZRW-0000F1-3w; Sat, 05 Sep 2020 14:45:26 +0000
Date:   Sat, 05 Sep 2020 22:45:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 5df7ef7d32fec1d6d1c34dbec019b461a12ce870
Message-ID: <5f53a47f.e6L8f8Otd1VehC5n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 5df7ef7d32fec1d6d1c34dbec019b461a12ce870  uas: bump hw_max_sectors to 2048 blocks for SS or faster drives

elapsed time: 1335m

configs tested: 131
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
m68k                            q40_defconfig
m68k                       m5208evb_defconfig
m68k                       m5249evb_defconfig
arm                         mv78xx0_defconfig
sh                        edosk7705_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          atari_defconfig
mips                     loongson1c_defconfig
mips                       bmips_be_defconfig
xtensa                              defconfig
mips                      maltaaprp_defconfig
arm                         axm55xx_defconfig
xtensa                    xip_kc705_defconfig
m68k                                defconfig
powerpc                          allmodconfig
s390                                defconfig
arc                         haps_hs_defconfig
arm                              zx_defconfig
powerpc                      ppc64e_defconfig
arm                      footbridge_defconfig
arm                          iop32x_defconfig
xtensa                       common_defconfig
arm                        mvebu_v5_defconfig
mips                          malta_defconfig
openrisc                 simple_smp_defconfig
arm                         nhk8815_defconfig
sh                          rsk7264_defconfig
powerpc                          allyesconfig
sh                           se7751_defconfig
m68k                          amiga_defconfig
sh                          r7785rp_defconfig
arm                      tct_hammer_defconfig
sh                             sh03_defconfig
mips                      loongson3_defconfig
powerpc                           allnoconfig
alpha                            alldefconfig
mips                        qi_lb60_defconfig
arm                     am200epdkit_defconfig
sh                     sh7710voipgw_defconfig
arm                        multi_v7_defconfig
arm                        mini2440_defconfig
microblaze                    nommu_defconfig
sh                   sh7724_generic_defconfig
ia64                         bigsur_defconfig
arc                     nsimosci_hs_defconfig
arc                              allyesconfig
riscv                             allnoconfig
sh                          landisk_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
powerpc                     skiroot_defconfig
sh                         ecovec24_defconfig
arm                            qcom_defconfig
powerpc                  storcenter_defconfig
xtensa                generic_kc705_defconfig
ia64                          tiger_defconfig
xtensa                           allyesconfig
mips                            ar7_defconfig
mips                           xway_defconfig
m68k                       m5275evb_defconfig
m68k                          sun3x_defconfig
mips                      pistachio_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
openrisc                         alldefconfig
m68k                        stmark2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200905
x86_64               randconfig-a004-20200905
x86_64               randconfig-a003-20200905
x86_64               randconfig-a005-20200905
x86_64               randconfig-a001-20200905
x86_64               randconfig-a002-20200905
i386                 randconfig-a004-20200904
i386                 randconfig-a005-20200904
i386                 randconfig-a006-20200904
i386                 randconfig-a002-20200904
i386                 randconfig-a003-20200904
i386                 randconfig-a001-20200904
x86_64               randconfig-a013-20200904
x86_64               randconfig-a011-20200904
x86_64               randconfig-a016-20200904
x86_64               randconfig-a012-20200904
x86_64               randconfig-a015-20200904
x86_64               randconfig-a014-20200904
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200904
x86_64               randconfig-a004-20200904
x86_64               randconfig-a003-20200904
x86_64               randconfig-a005-20200904
x86_64               randconfig-a001-20200904
x86_64               randconfig-a002-20200904

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
