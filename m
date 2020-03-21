Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2261818E3F0
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2020 20:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgCUTXU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Mar 2020 15:23:20 -0400
Received: from mga11.intel.com ([192.55.52.93]:55040 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727428AbgCUTXU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Mar 2020 15:23:20 -0400
IronPort-SDR: kyZikxAmC2jj6zqdI1tiAzmbA/l1gYS++6ndnJROUeZKcd+uefj1LZA7A9YUOLw98Qq7arg7FR
 3gBKOUh+nu6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2020 12:23:19 -0700
IronPort-SDR: 5ow58yQFBje/Sx62LcdQYYQryDi2dnjQI2EuymL2u9w0jevbLzGZkXU94xZfxIDPtfgXl0pYrh
 e5QssABXqZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,289,1580803200"; 
   d="scan'208";a="249208238"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Mar 2020 12:23:18 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jFjiH-0007zi-Bd; Sun, 22 Mar 2020 03:23:17 +0800
Date:   Sun, 22 Mar 2020 03:22:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e79220db6349344b6e770f0cae7e26d8636c1440
Message-ID: <5e76696f.16N8IjDXj3urS2fH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: e79220db6349344b6e770f0cae7e26d8636c1440  Merge tag 'phy-for-5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-next

elapsed time: 484m

configs tested: 182
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
ia64                             alldefconfig
um                                  defconfig
riscv                          rv32_defconfig
h8300                    h8300h-sim_defconfig
mips                              allnoconfig
parisc                generic-64bit_defconfig
ia64                             allyesconfig
nds32                               defconfig
i386                              allnoconfig
parisc                            allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200321
x86_64               randconfig-a002-20200321
x86_64               randconfig-a003-20200321
i386                 randconfig-a001-20200321
i386                 randconfig-a002-20200321
i386                 randconfig-a003-20200321
mips                 randconfig-a001-20200321
nds32                randconfig-a001-20200321
m68k                 randconfig-a001-20200321
parisc               randconfig-a001-20200321
alpha                randconfig-a001-20200321
riscv                randconfig-a001-20200321
h8300                randconfig-a001-20200321
microblaze           randconfig-a001-20200321
nios2                randconfig-a001-20200321
c6x                  randconfig-a001-20200321
sparc64              randconfig-a001-20200321
s390                 randconfig-a001-20200321
xtensa               randconfig-a001-20200321
csky                 randconfig-a001-20200321
openrisc             randconfig-a001-20200321
sh                   randconfig-a001-20200321
i386                 randconfig-b003-20200321
i386                 randconfig-b001-20200321
x86_64               randconfig-b003-20200321
i386                 randconfig-b002-20200321
x86_64               randconfig-b002-20200321
x86_64               randconfig-b001-20200321
x86_64               randconfig-c003-20200321
i386                 randconfig-c002-20200321
x86_64               randconfig-c001-20200321
x86_64               randconfig-c002-20200321
i386                 randconfig-c003-20200321
i386                 randconfig-c001-20200321
x86_64               randconfig-d001-20200321
x86_64               randconfig-d002-20200321
x86_64               randconfig-d003-20200321
i386                 randconfig-d001-20200321
i386                 randconfig-d002-20200321
i386                 randconfig-d003-20200321
x86_64               randconfig-d001-20200322
x86_64               randconfig-d002-20200322
x86_64               randconfig-d003-20200322
i386                 randconfig-d001-20200322
i386                 randconfig-d002-20200322
i386                 randconfig-d003-20200322
x86_64               randconfig-e001-20200321
i386                 randconfig-e002-20200321
x86_64               randconfig-e003-20200321
i386                 randconfig-e003-20200321
x86_64               randconfig-e002-20200321
i386                 randconfig-e001-20200321
x86_64               randconfig-f001-20200321
x86_64               randconfig-f002-20200321
x86_64               randconfig-f003-20200321
i386                 randconfig-f001-20200321
i386                 randconfig-f002-20200321
i386                 randconfig-f003-20200321
x86_64               randconfig-g001-20200321
x86_64               randconfig-g002-20200321
x86_64               randconfig-g003-20200321
i386                 randconfig-g001-20200321
i386                 randconfig-g002-20200321
i386                 randconfig-g003-20200321
x86_64               randconfig-g001-20200322
x86_64               randconfig-g002-20200322
x86_64               randconfig-g003-20200322
i386                 randconfig-g001-20200322
i386                 randconfig-g002-20200322
i386                 randconfig-g003-20200322
x86_64               randconfig-h001-20200321
x86_64               randconfig-h002-20200321
x86_64               randconfig-h003-20200321
i386                 randconfig-h001-20200321
i386                 randconfig-h002-20200321
i386                 randconfig-h003-20200321
arm                  randconfig-a001-20200321
arm64                randconfig-a001-20200321
ia64                 randconfig-a001-20200321
powerpc              randconfig-a001-20200321
arc                  randconfig-a001-20200322
arm                  randconfig-a001-20200322
arm64                randconfig-a001-20200322
ia64                 randconfig-a001-20200322
powerpc              randconfig-a001-20200322
sparc                randconfig-a001-20200322
sparc                randconfig-a001-20200321
arc                  randconfig-a001-20200321
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
