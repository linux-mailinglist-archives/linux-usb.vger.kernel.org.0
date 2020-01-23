Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06C6A1462B0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 08:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgAWH3m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 02:29:42 -0500
Received: from mga02.intel.com ([134.134.136.20]:35614 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgAWH3l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jan 2020 02:29:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jan 2020 23:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; 
   d="scan'208";a="227919949"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Jan 2020 23:29:39 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iuWvr-0005Qf-Cx; Thu, 23 Jan 2020 15:29:39 +0800
Date:   Thu, 23 Jan 2020 15:28:28 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 eb7a3bb8c955b3694e0e0998413ce1563c02f90c
Message-ID: <5e294b1c.Leg3sKIh8N9pUi8/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: eb7a3bb8c955b3694e0e0998413ce1563c02f90c  usb: typec: fusb302: fix "op-sink-microwatt" default that was in mW

elapsed time: 971m

configs tested: 165
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
x86_64               randconfig-e001-20200123
x86_64               randconfig-e002-20200123
x86_64               randconfig-e003-20200123
i386                 randconfig-e001-20200123
i386                 randconfig-e002-20200123
i386                 randconfig-e003-20200123
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
x86_64               randconfig-a001-20200123
x86_64               randconfig-a002-20200123
x86_64               randconfig-a003-20200123
i386                 randconfig-a001-20200123
i386                 randconfig-a002-20200123
i386                 randconfig-a003-20200123
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                           sunxi_defconfig
ia64                              allnoconfig
x86_64               randconfig-h001-20200123
x86_64               randconfig-h002-20200123
x86_64               randconfig-h003-20200123
i386                 randconfig-h001-20200123
i386                 randconfig-h002-20200123
i386                 randconfig-h003-20200123
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
x86_64               randconfig-f001-20200123
x86_64               randconfig-f002-20200123
x86_64               randconfig-f003-20200123
i386                 randconfig-f001-20200123
i386                 randconfig-f002-20200123
i386                 randconfig-f003-20200123
csky                 randconfig-a001-20200123
openrisc             randconfig-a001-20200123
s390                 randconfig-a001-20200123
sh                   randconfig-a001-20200123
xtensa               randconfig-a001-20200123
x86_64               randconfig-d001-20200123
x86_64               randconfig-d002-20200123
x86_64               randconfig-d003-20200123
i386                 randconfig-d001-20200123
i386                 randconfig-d002-20200123
i386                 randconfig-d003-20200123
arc                  randconfig-a001-20200123
arm                  randconfig-a001-20200123
arm64                randconfig-a001-20200123
ia64                 randconfig-a001-20200123
powerpc              randconfig-a001-20200123
sparc                randconfig-a001-20200123
x86_64               randconfig-g001-20200123
x86_64               randconfig-g002-20200123
x86_64               randconfig-g003-20200123
i386                 randconfig-g001-20200123
i386                 randconfig-g002-20200123
i386                 randconfig-g003-20200123
alpha                randconfig-a001-20200123
m68k                 randconfig-a001-20200123
mips                 randconfig-a001-20200123
nds32                randconfig-a001-20200123
parisc               randconfig-a001-20200123
riscv                randconfig-a001-20200123
arm                        shmobile_defconfig
arm                         at91_dt_defconfig
x86_64               randconfig-c001-20200123
x86_64               randconfig-c002-20200123
x86_64               randconfig-c003-20200123
i386                 randconfig-c001-20200123
i386                 randconfig-c002-20200123
i386                 randconfig-c003-20200123
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64               randconfig-b001-20200123
x86_64               randconfig-b002-20200123
x86_64               randconfig-b003-20200123
i386                 randconfig-b001-20200123
i386                 randconfig-b002-20200123
i386                 randconfig-b003-20200123
x86_64                         rhel-7.2-clear
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
c6x                  randconfig-a001-20200123
h8300                randconfig-a001-20200123
microblaze           randconfig-a001-20200123
nios2                randconfig-a001-20200123
sparc64              randconfig-a001-20200123

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
