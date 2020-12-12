Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E072D8432
	for <lists+linux-usb@lfdr.de>; Sat, 12 Dec 2020 05:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438049AbgLLEBp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 23:01:45 -0500
Received: from mga03.intel.com ([134.134.136.65]:55893 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbgLLEB3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Dec 2020 23:01:29 -0500
IronPort-SDR: /P16rtuHlRq+MhQXPXjuQgCtZ6I3kTm9YOh55ffjFWnfSqD+Cu0XACK/LuToKHCmJHJXBSdOgB
 FeLDL4Trxing==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="174638851"
X-IronPort-AV: E=Sophos;i="5.78,413,1599548400"; 
   d="scan'208";a="174638851"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 20:00:48 -0800
IronPort-SDR: wZRJl4LU9j7G0Zp8MZumEV4jR8CGFdTuPbwJzkjvbcGNXDh8aK/VGwSwoOo4nRlq5ShOd9pO9V
 sM13idwS7SmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,413,1599548400"; 
   d="scan'208";a="334526331"
Received: from lkp-server01.sh.intel.com (HELO ecc0cebe68d1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2020 20:00:47 -0800
Received: from kbuild by ecc0cebe68d1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1knw5O-0001DW-Ep; Sat, 12 Dec 2020 04:00:46 +0000
Date:   Sat, 12 Dec 2020 12:00:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a256e24021bf7ceedd29fe65eb45c7adfffffad2
Message-ID: <5fd44054.JNIAyMjtzcO+W/p2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: a256e24021bf7ceedd29fe65eb45c7adfffffad2  usb: phy: convert comma to semicolon

elapsed time: 721m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 linkstation_defconfig
sh                         apsh4a3a_defconfig
arm                           omap1_defconfig
powerpc                     mpc512x_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
openrisc                            defconfig
arm                            pleb_defconfig
ia64                             allyesconfig
arm                          collie_defconfig
arm                           sunxi_defconfig
parisc                generic-32bit_defconfig
m68k                       m5275evb_defconfig
arm                          exynos_defconfig
sh                           se7343_defconfig
arm                      integrator_defconfig
arm                            qcom_defconfig
sh                          rsk7264_defconfig
mips                     cu1000-neo_defconfig
powerpc                        cell_defconfig
arm                      jornada720_defconfig
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
powerpc                       holly_defconfig
powerpc                 mpc832x_rdb_defconfig
parisc                              defconfig
xtensa                    smp_lx200_defconfig
arm                        mvebu_v7_defconfig
sh                             shx3_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
sh                        apsh4ad0a_defconfig
m68k                        m5272c3_defconfig
mips                   sb1250_swarm_defconfig
arm                         socfpga_defconfig
arm                          moxart_defconfig
arm                         s3c6400_defconfig
arm                       aspeed_g4_defconfig
arc                         haps_hs_defconfig
powerpc                        warp_defconfig
parisc                           alldefconfig
powerpc                    klondike_defconfig
mips                      loongson3_defconfig
arm                       spear13xx_defconfig
arm                        trizeps4_defconfig
nios2                         10m50_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                      bamboo_defconfig
riscv                               defconfig
powerpc                     ppa8548_defconfig
sh                             sh03_defconfig
powerpc                      chrp32_defconfig
mips                           gcw0_defconfig
m68k                       bvme6000_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc8560_ads_defconfig
arm                         assabet_defconfig
nds32                               defconfig
ia64                                defconfig
powerpc                  mpc885_ads_defconfig
mips                           xway_defconfig
powerpc                      cm5200_defconfig
arm                      footbridge_defconfig
mips                      pistachio_defconfig
mips                      maltaaprp_defconfig
arm                        keystone_defconfig
ia64                            zx1_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
xtensa                         virt_defconfig
xtensa                generic_kc705_defconfig
sparc                            allyesconfig
powerpc                          g5_defconfig
powerpc                      pasemi_defconfig
sh                           se7619_defconfig
arm                         mv78xx0_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
xtensa                           allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20201209
i386                 randconfig-a005-20201209
i386                 randconfig-a001-20201209
i386                 randconfig-a002-20201209
i386                 randconfig-a006-20201209
i386                 randconfig-a003-20201209
x86_64               randconfig-a016-20201209
x86_64               randconfig-a012-20201209
x86_64               randconfig-a013-20201209
x86_64               randconfig-a014-20201209
x86_64               randconfig-a015-20201209
x86_64               randconfig-a011-20201209
i386                 randconfig-a013-20201209
i386                 randconfig-a014-20201209
i386                 randconfig-a011-20201209
i386                 randconfig-a015-20201209
i386                 randconfig-a012-20201209
i386                 randconfig-a016-20201209
i386                 randconfig-a014-20201211
i386                 randconfig-a013-20201211
i386                 randconfig-a012-20201211
i386                 randconfig-a011-20201211
i386                 randconfig-a016-20201211
i386                 randconfig-a015-20201211
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201209
x86_64               randconfig-a006-20201209
x86_64               randconfig-a005-20201209
x86_64               randconfig-a001-20201209
x86_64               randconfig-a002-20201209
x86_64               randconfig-a003-20201209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
