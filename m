Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3718B179F81
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 06:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgCEFrI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 00:47:08 -0500
Received: from mga17.intel.com ([192.55.52.151]:26507 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgCEFrI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 00:47:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 21:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; 
   d="scan'208";a="240696261"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Mar 2020 21:47:04 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j9jLb-00069k-Je; Thu, 05 Mar 2020 13:47:03 +0800
Date:   Thu, 05 Mar 2020 13:46:43 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 6701adfa9693bd20b89f2cce57754ced2c18ed3b
Message-ID: <5e609243.30fYG4V17TO761eq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 6701adfa9693bd20b89f2cce57754ced2c18ed3b  usb: typec: driver for Intel PMC mux control

elapsed time: 1170m

configs tested: 211
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
s390                             alldefconfig
csky                                defconfig
m68k                             allmodconfig
mips                              allnoconfig
ia64                             allmodconfig
ia64                              allnoconfig
sh                          rsk7269_defconfig
parisc                generic-32bit_defconfig
s390                              allnoconfig
sh                  sh7785lcr_32bit_defconfig
s390                          debug_defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
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
powerpc                           allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200304
x86_64               randconfig-a002-20200304
x86_64               randconfig-a003-20200304
i386                 randconfig-a001-20200304
i386                 randconfig-a002-20200304
i386                 randconfig-a003-20200304
x86_64               randconfig-a001-20200305
x86_64               randconfig-a002-20200305
x86_64               randconfig-a003-20200305
i386                 randconfig-a001-20200305
i386                 randconfig-a002-20200305
i386                 randconfig-a003-20200305
alpha                randconfig-a001-20200304
m68k                 randconfig-a001-20200304
mips                 randconfig-a001-20200304
nds32                randconfig-a001-20200304
parisc               randconfig-a001-20200304
riscv                randconfig-a001-20200304
alpha                randconfig-a001-20200305
m68k                 randconfig-a001-20200305
mips                 randconfig-a001-20200305
nds32                randconfig-a001-20200305
parisc               randconfig-a001-20200305
riscv                randconfig-a001-20200305
c6x                  randconfig-a001-20200304
h8300                randconfig-a001-20200304
microblaze           randconfig-a001-20200304
nios2                randconfig-a001-20200304
sparc64              randconfig-a001-20200304
c6x                  randconfig-a001-20200305
h8300                randconfig-a001-20200305
microblaze           randconfig-a001-20200305
nios2                randconfig-a001-20200305
sparc64              randconfig-a001-20200305
csky                 randconfig-a001-20200304
openrisc             randconfig-a001-20200304
s390                 randconfig-a001-20200304
sh                   randconfig-a001-20200304
xtensa               randconfig-a001-20200304
x86_64               randconfig-b001-20200304
x86_64               randconfig-b002-20200304
x86_64               randconfig-b003-20200304
i386                 randconfig-b001-20200304
i386                 randconfig-b002-20200304
i386                 randconfig-b003-20200304
x86_64               randconfig-b001-20200305
x86_64               randconfig-b002-20200305
x86_64               randconfig-b003-20200305
i386                 randconfig-b001-20200305
i386                 randconfig-b002-20200305
i386                 randconfig-b003-20200305
x86_64               randconfig-c001-20200305
x86_64               randconfig-c002-20200305
x86_64               randconfig-c003-20200305
i386                 randconfig-c001-20200305
i386                 randconfig-c002-20200305
i386                 randconfig-c003-20200305
x86_64               randconfig-c001-20200304
x86_64               randconfig-c002-20200304
x86_64               randconfig-c003-20200304
i386                 randconfig-c001-20200304
i386                 randconfig-c002-20200304
i386                 randconfig-c003-20200304
x86_64               randconfig-d001-20200304
x86_64               randconfig-d002-20200304
x86_64               randconfig-d003-20200304
i386                 randconfig-d001-20200304
i386                 randconfig-d002-20200304
i386                 randconfig-d003-20200304
x86_64               randconfig-e001-20200304
x86_64               randconfig-e002-20200304
x86_64               randconfig-e003-20200304
i386                 randconfig-e001-20200304
i386                 randconfig-e002-20200304
i386                 randconfig-e003-20200304
x86_64               randconfig-e001-20200305
x86_64               randconfig-e002-20200305
x86_64               randconfig-e003-20200305
i386                 randconfig-e001-20200305
i386                 randconfig-e002-20200305
i386                 randconfig-e003-20200305
x86_64               randconfig-f001-20200304
x86_64               randconfig-f002-20200304
x86_64               randconfig-f003-20200304
i386                 randconfig-f001-20200304
i386                 randconfig-f002-20200304
i386                 randconfig-f003-20200304
x86_64               randconfig-g001-20200304
x86_64               randconfig-g002-20200304
x86_64               randconfig-g003-20200304
i386                 randconfig-g001-20200304
i386                 randconfig-g002-20200304
i386                 randconfig-g003-20200304
x86_64               randconfig-h001-20200305
x86_64               randconfig-h002-20200305
x86_64               randconfig-h003-20200305
i386                 randconfig-h001-20200305
i386                 randconfig-h002-20200305
i386                 randconfig-h003-20200305
x86_64               randconfig-h001-20200304
x86_64               randconfig-h002-20200304
x86_64               randconfig-h003-20200304
i386                 randconfig-h001-20200304
i386                 randconfig-h002-20200304
i386                 randconfig-h003-20200304
arc                  randconfig-a001-20200304
ia64                 randconfig-a001-20200304
sparc                randconfig-a001-20200304
arm                  randconfig-a001-20200304
arm64                randconfig-a001-20200304
powerpc              randconfig-a001-20200304
arc                  randconfig-a001-20200305
arm                  randconfig-a001-20200305
arm64                randconfig-a001-20200305
ia64                 randconfig-a001-20200305
powerpc              randconfig-a001-20200305
sparc                randconfig-a001-20200305
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
