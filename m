Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B274552BC
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 03:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240630AbhKRCba (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 21:31:30 -0500
Received: from mga14.intel.com ([192.55.52.115]:11136 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239637AbhKRCb2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Nov 2021 21:31:28 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="234337991"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="234337991"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 18:28:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="736468951"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2021 18:28:28 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mnXA3-0002ZG-HB; Thu, 18 Nov 2021 02:28:27 +0000
Date:   Thu, 18 Nov 2021 10:27:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 4616dddcfaf75cfbfbff7ce8a468038c697444ce
Message-ID: <6195ba2d.WfcAPhV2LsTc4c5+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 4616dddcfaf75cfbfbff7ce8a468038c697444ce  usb: typec: ucsi: Expose number of alternate modes in partner

elapsed time: 729m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211117
sh                ecovec24-romimage_defconfig
m68k                          multi_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                      jornada720_defconfig
sh                          rsk7269_defconfig
riscv                            alldefconfig
alpha                               defconfig
powerpc                     stx_gp3_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      pasemi_defconfig
mips                           jazz_defconfig
mips                malta_qemu_32r6_defconfig
sparc                       sparc64_defconfig
i386                                defconfig
sh                          kfr2r09_defconfig
riscv                             allnoconfig
mips                          ath79_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    ge_imp3a_defconfig
um                           x86_64_defconfig
sh                   secureedge5410_defconfig
s390                             allmodconfig
mips                      loongson3_defconfig
sh                   sh7724_generic_defconfig
mips                      malta_kvm_defconfig
powerpc                 mpc832x_mds_defconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
sh                          lboxre2_defconfig
powerpc                     akebono_defconfig
powerpc                      chrp32_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                              ul2_defconfig
powerpc                    socrates_defconfig
powerpc                    klondike_defconfig
sh                          sdk7786_defconfig
arm                        mvebu_v5_defconfig
arm                          iop32x_defconfig
mips                      fuloong2e_defconfig
ia64                          tiger_defconfig
csky                             alldefconfig
csky                                defconfig
sh                             espt_defconfig
arm                         lubbock_defconfig
mips                        bcm47xx_defconfig
arm                          simpad_defconfig
um                             i386_defconfig
powerpc                       holly_defconfig
xtensa                              defconfig
arm                            mps2_defconfig
arm                          collie_defconfig
sh                        edosk7705_defconfig
powerpc                      tqm8xx_defconfig
powerpc                  mpc866_ads_defconfig
arm                         s3c6400_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     tqm8560_defconfig
mips                           mtx1_defconfig
parisc                generic-64bit_defconfig
powerpc                     asp8347_defconfig
arm                           stm32_defconfig
arm                        magician_defconfig
arm                         assabet_defconfig
mips                         tb0287_defconfig
powerpc64                           defconfig
powerpc                      acadia_defconfig
arm                       versatile_defconfig
arm                            dove_defconfig
arm                  randconfig-c002-20211117
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211117
x86_64               randconfig-a003-20211117
x86_64               randconfig-a002-20211117
x86_64               randconfig-a001-20211117
x86_64               randconfig-a006-20211117
x86_64               randconfig-a004-20211117
i386                 randconfig-a006-20211117
i386                 randconfig-a003-20211117
i386                 randconfig-a005-20211117
i386                 randconfig-a001-20211117
i386                 randconfig-a004-20211117
i386                 randconfig-a002-20211117
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211117
i386                 randconfig-c001-20211117
arm                  randconfig-c002-20211117
riscv                randconfig-c006-20211117
powerpc              randconfig-c003-20211117
s390                 randconfig-c005-20211117
mips                 randconfig-c004-20211117
x86_64               randconfig-a015-20211117
x86_64               randconfig-a013-20211117
x86_64               randconfig-a011-20211117
x86_64               randconfig-a012-20211117
x86_64               randconfig-a016-20211117
x86_64               randconfig-a014-20211117
i386                 randconfig-a014-20211117
i386                 randconfig-a016-20211117
i386                 randconfig-a012-20211117
i386                 randconfig-a013-20211117
i386                 randconfig-a011-20211117
i386                 randconfig-a015-20211117
hexagon              randconfig-r045-20211117
hexagon              randconfig-r041-20211117
s390                 randconfig-r044-20211117
riscv                randconfig-r042-20211117

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
