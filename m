Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DCB16A28C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 10:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgBXJjq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 04:39:46 -0500
Received: from mga07.intel.com ([134.134.136.100]:27843 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbgBXJjq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Feb 2020 04:39:46 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 01:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; 
   d="scan'208";a="237264983"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Feb 2020 01:39:41 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j6ADE-000GT8-57; Mon, 24 Feb 2020 17:39:40 +0800
Date:   Mon, 24 Feb 2020 17:39:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 6bc3f3979edce0b11deb685a4c817abb7d74b227
Message-ID: <5e5399bf.7iRCqW8hykswir97%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 6bc3f3979edce0b11deb685a4c817abb7d74b227  USB: Replace zero-length array with flexible-array member

elapsed time: 850m

configs tested: 192
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
sh                          rsk7269_defconfig
mips                             allyesconfig
nds32                             allnoconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
s390                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200223
x86_64               randconfig-a002-20200223
i386                 randconfig-a002-20200223
x86_64               randconfig-a003-20200223
i386                 randconfig-a001-20200223
i386                 randconfig-a003-20200223
alpha                randconfig-a001-20200223
m68k                 randconfig-a001-20200223
mips                 randconfig-a001-20200223
nds32                randconfig-a001-20200223
parisc               randconfig-a001-20200223
nds32                randconfig-a001-20200224
mips                 randconfig-a001-20200224
riscv                randconfig-a001-20200224
parisc               randconfig-a001-20200224
alpha                randconfig-a001-20200224
m68k                 randconfig-a001-20200224
nios2                randconfig-a001-20200223
c6x                  randconfig-a001-20200223
h8300                randconfig-a001-20200223
microblaze           randconfig-a001-20200223
sparc64              randconfig-a001-20200223
c6x                  randconfig-a001-20200224
h8300                randconfig-a001-20200224
microblaze           randconfig-a001-20200224
nios2                randconfig-a001-20200224
sparc64              randconfig-a001-20200224
openrisc             randconfig-a001-20200223
sh                   randconfig-a001-20200223
s390                 randconfig-a001-20200223
xtensa               randconfig-a001-20200223
csky                 randconfig-a001-20200223
x86_64               randconfig-b001-20200224
x86_64               randconfig-b002-20200224
x86_64               randconfig-b003-20200224
i386                 randconfig-b001-20200224
i386                 randconfig-b002-20200224
i386                 randconfig-b003-20200224
x86_64               randconfig-b001-20200223
x86_64               randconfig-b002-20200223
x86_64               randconfig-b003-20200223
i386                 randconfig-b001-20200223
i386                 randconfig-b002-20200223
i386                 randconfig-b003-20200223
i386                 randconfig-c003-20200223
i386                 randconfig-c001-20200223
x86_64               randconfig-c001-20200223
x86_64               randconfig-c003-20200223
x86_64               randconfig-c002-20200223
i386                 randconfig-c002-20200223
i386                 randconfig-d002-20200224
x86_64               randconfig-d002-20200224
x86_64               randconfig-d003-20200224
i386                 randconfig-d001-20200224
x86_64               randconfig-d001-20200224
i386                 randconfig-d003-20200224
x86_64               randconfig-e002-20200223
i386                 randconfig-e001-20200223
x86_64               randconfig-e003-20200223
i386                 randconfig-e003-20200223
x86_64               randconfig-e001-20200223
i386                 randconfig-e002-20200223
x86_64               randconfig-e001-20200224
x86_64               randconfig-e002-20200224
x86_64               randconfig-e003-20200224
i386                 randconfig-e001-20200224
i386                 randconfig-e002-20200224
i386                 randconfig-e003-20200224
x86_64               randconfig-f003-20200224
x86_64               randconfig-f002-20200224
x86_64               randconfig-f001-20200224
i386                 randconfig-f001-20200224
i386                 randconfig-f003-20200224
i386                 randconfig-f002-20200224
x86_64               randconfig-f001-20200223
x86_64               randconfig-f002-20200223
x86_64               randconfig-f003-20200223
i386                 randconfig-f001-20200223
i386                 randconfig-f002-20200223
i386                 randconfig-f003-20200223
x86_64               randconfig-g001-20200223
i386                 randconfig-g002-20200223
i386                 randconfig-g003-20200223
i386                 randconfig-g001-20200223
x86_64               randconfig-g003-20200223
x86_64               randconfig-g002-20200223
x86_64               randconfig-h001-20200223
x86_64               randconfig-h002-20200223
x86_64               randconfig-h003-20200223
i386                 randconfig-h001-20200223
i386                 randconfig-h002-20200223
i386                 randconfig-h003-20200223
arm64                randconfig-a001-20200223
ia64                 randconfig-a001-20200223
powerpc              randconfig-a001-20200223
arm                  randconfig-a001-20200223
arc                  randconfig-a001-20200223
sparc                randconfig-a001-20200223
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                              allnoconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
sh                               allmodconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
