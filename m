Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F3427971D
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 07:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgIZFgJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 01:36:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:26287 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726311AbgIZFgJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 26 Sep 2020 01:36:09 -0400
IronPort-SDR: aEPLnlH8Z7jgbjSJpD1PoOH77fcITCRI4VO6XGQNHM8EXUm6dbmtc1/xKC2ijI6XVPgoNNRILc
 GL2SjJjEHzZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="159043464"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="159043464"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 19:57:56 -0700
IronPort-SDR: dRpyYES4nngo6O0TFG9CbiU726er/0RiFUe8EejVc3BwrTA7BFRtSXmd9b7Gcq+0teE/XiLEo9
 +JAUL2ufWaWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="293136090"
Received: from lkp-server01.sh.intel.com (HELO 2dda29302fe3) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2020 19:57:55 -0700
Received: from kbuild by 2dda29302fe3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kM0PK-0000M2-Hd; Sat, 26 Sep 2020 02:57:54 +0000
Date:   Sat, 26 Sep 2020 10:57:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 3fce39601a1a34d940cf62858ee01ed9dac5d459
Message-ID: <5f6eae28.LTiLjTAD/9nhphi2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 3fce39601a1a34d940cf62858ee01ed9dac5d459  usbcore/driver: Accommodate usbip

elapsed time: 720m

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
powerpc                 mpc836x_rdk_defconfig
arm                         hackkit_defconfig
arc                            hsdk_defconfig
powerpc                         wii_defconfig
sh                           se7619_defconfig
powerpc                     kmeter1_defconfig
mips                           gcw0_defconfig
powerpc                    ge_imp3a_defconfig
m68k                       m5208evb_defconfig
sh                          sdk7786_defconfig
powerpc                        fsp2_defconfig
powerpc                       holly_defconfig
arm                        multi_v5_defconfig
sh                         ecovec24_defconfig
sh                          rsk7264_defconfig
mips                    maltaup_xpa_defconfig
arm                         lpc32xx_defconfig
powerpc                     tqm8548_defconfig
powerpc                   bluestone_defconfig
arc                     haps_hs_smp_defconfig
sh                          r7785rp_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
h8300                            alldefconfig
sh                          landisk_defconfig
sh                            titan_defconfig
xtensa                    smp_lx200_defconfig
arm                       versatile_defconfig
powerpc                     stx_gp3_defconfig
sh                           se7780_defconfig
arm                         at91_dt_defconfig
m68k                        m5307c3_defconfig
mips                      bmips_stb_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
powerpc                        icon_defconfig
mips                         tb0287_defconfig
mips                         db1xxx_defconfig
arm                            dove_defconfig
mips                         rt305x_defconfig
arm                            pleb_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            mmp2_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                         virt_defconfig
sh                                  defconfig
sh                           se7724_defconfig
arm                            hisi_defconfig
ia64                                defconfig
mips                        jmr3927_defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g4_defconfig
powerpc                     ksi8560_defconfig
arm                            mps2_defconfig
um                            kunit_defconfig
csky                                defconfig
powerpc               mpc834x_itxgp_defconfig
sparc                            alldefconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
mips                        nlm_xlp_defconfig
powerpc                       maple_defconfig
arm                        mvebu_v5_defconfig
c6x                         dsk6455_defconfig
mips                         mpc30x_defconfig
sh                            migor_defconfig
microblaze                          defconfig
sh                          rsk7269_defconfig
powerpc                      acadia_defconfig
powerpc                        cell_defconfig
sh                           se7721_defconfig
arm                      tct_hammer_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
mips                          ath79_defconfig
ia64                             allmodconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200925
i386                 randconfig-a006-20200925
i386                 randconfig-a003-20200925
i386                 randconfig-a004-20200925
i386                 randconfig-a005-20200925
i386                 randconfig-a001-20200925
x86_64               randconfig-a011-20200925
x86_64               randconfig-a013-20200925
x86_64               randconfig-a014-20200925
x86_64               randconfig-a015-20200925
x86_64               randconfig-a012-20200925
x86_64               randconfig-a016-20200925
i386                 randconfig-a012-20200925
i386                 randconfig-a014-20200925
i386                 randconfig-a016-20200925
i386                 randconfig-a013-20200925
i386                 randconfig-a011-20200925
i386                 randconfig-a015-20200925
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200925
x86_64               randconfig-a003-20200925
x86_64               randconfig-a004-20200925
x86_64               randconfig-a002-20200925
x86_64               randconfig-a006-20200925
x86_64               randconfig-a001-20200925
x86_64               randconfig-a011-20200926
x86_64               randconfig-a013-20200926
x86_64               randconfig-a014-20200926
x86_64               randconfig-a015-20200926
x86_64               randconfig-a012-20200926
x86_64               randconfig-a016-20200926

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
