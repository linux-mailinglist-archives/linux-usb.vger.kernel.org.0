Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98511141F34
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 18:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbgASRcD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 12:32:03 -0500
Received: from mga14.intel.com ([192.55.52.115]:48193 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727007AbgASRcD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jan 2020 12:32:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jan 2020 09:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,338,1574150400"; 
   d="scan'208";a="258460687"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2020 09:31:57 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1itEQX-000Iey-Ix; Mon, 20 Jan 2020 01:31:57 +0800
Date:   Mon, 20 Jan 2020 01:31:24 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 42bbdd99221bac206dde2b5e87098177fcd2a48e
Message-ID: <5e24926c.e+c4e6lLXXtChVDq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-next
branch HEAD: 42bbdd99221bac206dde2b5e87098177fcd2a48e  phy: ti: j721e-wiz: Fix build error without CONFIG_OF_ADDRESS

elapsed time: 2345m

configs tested: 169
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

x86_64               randconfig-g001-20200119
x86_64               randconfig-g002-20200119
x86_64               randconfig-g003-20200119
i386                 randconfig-g001-20200119
i386                 randconfig-g002-20200119
i386                 randconfig-g003-20200119
x86_64               randconfig-c001-20200119
x86_64               randconfig-c002-20200119
x86_64               randconfig-c003-20200119
i386                 randconfig-c001-20200119
i386                 randconfig-c002-20200119
i386                 randconfig-c003-20200119
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
x86_64               randconfig-f001-20200119
x86_64               randconfig-f002-20200119
x86_64               randconfig-f003-20200119
i386                 randconfig-f001-20200119
i386                 randconfig-f002-20200119
i386                 randconfig-f003-20200119
microblaze                      mmu_defconfig
um                             i386_defconfig
x86_64               randconfig-e001-20200119
x86_64               randconfig-e002-20200119
x86_64               randconfig-e003-20200119
i386                 randconfig-e001-20200119
i386                 randconfig-e002-20200119
i386                 randconfig-e003-20200119
arm                              allmodconfig
arm64                            allmodconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
x86_64               randconfig-h001-20200119
x86_64               randconfig-h002-20200119
x86_64               randconfig-h003-20200119
i386                 randconfig-h001-20200119
i386                 randconfig-h002-20200119
i386                 randconfig-h003-20200119
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
arc                  randconfig-a001-20200119
arm                  randconfig-a001-20200119
arm64                randconfig-a001-20200119
ia64                 randconfig-a001-20200119
powerpc              randconfig-a001-20200119
sparc                randconfig-a001-20200119
sparc                            allyesconfig
x86_64               randconfig-b001-20200119
x86_64               randconfig-b002-20200119
x86_64               randconfig-b003-20200119
i386                 randconfig-b001-20200119
i386                 randconfig-b002-20200119
i386                 randconfig-b003-20200119
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                  randconfig-a001-20200119
h8300                randconfig-a001-20200119
microblaze           randconfig-a001-20200119
nios2                randconfig-a001-20200119
sparc64              randconfig-a001-20200119
csky                 randconfig-a001-20200119
openrisc             randconfig-a001-20200119
s390                 randconfig-a001-20200119
sh                   randconfig-a001-20200119
xtensa               randconfig-a001-20200119
x86_64               randconfig-d001-20200119
x86_64               randconfig-d002-20200119
x86_64               randconfig-d003-20200119
i386                 randconfig-d001-20200119
i386                 randconfig-d002-20200119
i386                 randconfig-d003-20200119
sh                  sh7785lcr_32bit_defconfig
x86_64               randconfig-a001-20200119
x86_64               randconfig-a002-20200119
x86_64               randconfig-a003-20200119
i386                 randconfig-a001-20200119
i386                 randconfig-a002-20200119
i386                 randconfig-a003-20200119
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
um                                  defconfig
um                           x86_64_defconfig
alpha                randconfig-a001-20200119
m68k                 randconfig-a001-20200119
mips                 randconfig-a001-20200119
nds32                randconfig-a001-20200119
parisc               randconfig-a001-20200119
riscv                randconfig-a001-20200119
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
c6x                  randconfig-a001-20200120
h8300                randconfig-a001-20200120
microblaze           randconfig-a001-20200120
nios2                randconfig-a001-20200120
sparc64              randconfig-a001-20200120

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
