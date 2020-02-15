Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 625B61600B3
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2020 22:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgBOVbV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Feb 2020 16:31:21 -0500
Received: from mga09.intel.com ([134.134.136.24]:14365 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgBOVbV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 Feb 2020 16:31:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Feb 2020 13:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,446,1574150400"; 
   d="scan'208";a="253004117"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Feb 2020 13:31:19 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j351y-000FNP-Um; Sun, 16 Feb 2020 05:31:18 +0800
Date:   Sun, 16 Feb 2020 05:30:26 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 ca065bf12771078571dec758300631624edc19a2
Message-ID: <5e4862f2.kOCLIp0SqAvP3rOz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-next
branch HEAD: ca065bf12771078571dec758300631624edc19a2  USB: apple-mfi-fastcharge: fix endianess issue in probe

elapsed time: 3263m

configs tested: 267
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
c6x                              allyesconfig
xtensa                          iss_defconfig
parisc                           allyesconfig
csky                                defconfig
nds32                               defconfig
um                                  defconfig
i386                                defconfig
riscv                            allmodconfig
sparc                               defconfig
riscv                            allyesconfig
s390                                defconfig
powerpc                           allnoconfig
i386                              allnoconfig
parisc                generic-32bit_defconfig
riscv                    nommu_virt_defconfig
mips                             allyesconfig
m68k                           sun3_defconfig
nios2                         3c120_defconfig
powerpc                             defconfig
i386                             allyesconfig
mips                      malta_kvm_defconfig
sh                                allnoconfig
parisc                            allnoconfig
powerpc                       ppc64_defconfig
parisc                generic-64bit_defconfig
m68k                       m5475evb_defconfig
microblaze                      mmu_defconfig
ia64                                defconfig
riscv                             allnoconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
mips                             allmodconfig
openrisc                    or1ksim_defconfig
riscv                               defconfig
ia64                              allnoconfig
mips                              allnoconfig
nds32                             allnoconfig
s390                             alldefconfig
sh                  sh7785lcr_32bit_defconfig
s390                          debug_defconfig
m68k                          multi_defconfig
s390                             allmodconfig
s390                              allnoconfig
h8300                    h8300h-sim_defconfig
i386                             alldefconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
h8300                     edosk2674_defconfig
m68k                             allmodconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                    nommu_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                      fuloong2e_defconfig
x86_64               randconfig-a001-20200215
x86_64               randconfig-a002-20200215
x86_64               randconfig-a003-20200215
i386                 randconfig-a001-20200215
i386                 randconfig-a002-20200215
i386                 randconfig-a003-20200215
x86_64               randconfig-a001-20200214
x86_64               randconfig-a002-20200214
x86_64               randconfig-a003-20200214
i386                 randconfig-a001-20200214
i386                 randconfig-a002-20200214
i386                 randconfig-a003-20200214
i386                 randconfig-a003-20200213
x86_64               randconfig-a003-20200213
i386                 randconfig-a001-20200213
x86_64               randconfig-a002-20200213
i386                 randconfig-a002-20200213
x86_64               randconfig-a001-20200213
alpha                randconfig-a001-20200214
m68k                 randconfig-a001-20200214
mips                 randconfig-a001-20200214
nds32                randconfig-a001-20200214
parisc               randconfig-a001-20200214
alpha                randconfig-a001-20200213
m68k                 randconfig-a001-20200213
mips                 randconfig-a001-20200213
nds32                randconfig-a001-20200213
parisc               randconfig-a001-20200213
riscv                randconfig-a001-20200213
c6x                  randconfig-a001-20200213
h8300                randconfig-a001-20200213
microblaze           randconfig-a001-20200213
nios2                randconfig-a001-20200213
sparc64              randconfig-a001-20200213
c6x                  randconfig-a001-20200214
h8300                randconfig-a001-20200214
microblaze           randconfig-a001-20200214
nios2                randconfig-a001-20200214
sparc64              randconfig-a001-20200214
c6x                  randconfig-a001-20200215
h8300                randconfig-a001-20200215
microblaze           randconfig-a001-20200215
nios2                randconfig-a001-20200215
sparc64              randconfig-a001-20200215
csky                 randconfig-a001-20200214
openrisc             randconfig-a001-20200214
s390                 randconfig-a001-20200214
sh                   randconfig-a001-20200214
xtensa               randconfig-a001-20200214
csky                 randconfig-a001-20200213
openrisc             randconfig-a001-20200213
s390                 randconfig-a001-20200213
sh                   randconfig-a001-20200213
xtensa               randconfig-a001-20200213
csky                 randconfig-a001-20200215
openrisc             randconfig-a001-20200215
s390                 randconfig-a001-20200215
sh                   randconfig-a001-20200215
xtensa               randconfig-a001-20200215
x86_64               randconfig-b001-20200213
x86_64               randconfig-b002-20200213
x86_64               randconfig-b003-20200213
i386                 randconfig-b001-20200213
i386                 randconfig-b002-20200213
i386                 randconfig-b003-20200213
x86_64               randconfig-b001-20200214
x86_64               randconfig-b002-20200214
x86_64               randconfig-b003-20200214
i386                 randconfig-b001-20200214
i386                 randconfig-b002-20200214
i386                 randconfig-b003-20200214
x86_64               randconfig-c001-20200213
x86_64               randconfig-c002-20200213
x86_64               randconfig-c003-20200213
i386                 randconfig-c001-20200213
i386                 randconfig-c002-20200213
i386                 randconfig-c003-20200213
x86_64               randconfig-c001-20200214
x86_64               randconfig-c002-20200214
x86_64               randconfig-c003-20200214
i386                 randconfig-c001-20200214
i386                 randconfig-c002-20200214
i386                 randconfig-c003-20200214
x86_64               randconfig-c001-20200215
x86_64               randconfig-c002-20200215
x86_64               randconfig-c003-20200215
i386                 randconfig-c001-20200215
i386                 randconfig-c002-20200215
i386                 randconfig-c003-20200215
x86_64               randconfig-d001-20200213
x86_64               randconfig-d002-20200213
x86_64               randconfig-d003-20200213
i386                 randconfig-d001-20200213
i386                 randconfig-d002-20200213
i386                 randconfig-d003-20200213
x86_64               randconfig-d001-20200214
x86_64               randconfig-d002-20200214
x86_64               randconfig-d003-20200214
i386                 randconfig-d001-20200214
i386                 randconfig-d002-20200214
i386                 randconfig-d003-20200214
x86_64               randconfig-e001-20200213
x86_64               randconfig-e002-20200213
x86_64               randconfig-e003-20200213
i386                 randconfig-e001-20200213
i386                 randconfig-e002-20200213
i386                 randconfig-e003-20200213
x86_64               randconfig-e001-20200214
x86_64               randconfig-e002-20200214
x86_64               randconfig-e003-20200214
i386                 randconfig-e001-20200214
i386                 randconfig-e002-20200214
i386                 randconfig-e003-20200214
x86_64               randconfig-f001-20200214
x86_64               randconfig-f002-20200214
x86_64               randconfig-f003-20200214
i386                 randconfig-f001-20200214
i386                 randconfig-f002-20200214
i386                 randconfig-f003-20200214
x86_64               randconfig-f001-20200213
x86_64               randconfig-f002-20200213
x86_64               randconfig-f003-20200213
i386                 randconfig-f001-20200213
i386                 randconfig-f002-20200213
i386                 randconfig-f003-20200213
x86_64               randconfig-g001-20200213
x86_64               randconfig-g002-20200213
x86_64               randconfig-g003-20200213
i386                 randconfig-g001-20200213
i386                 randconfig-g002-20200213
i386                 randconfig-g003-20200213
x86_64               randconfig-g001-20200214
x86_64               randconfig-g002-20200214
x86_64               randconfig-g003-20200214
i386                 randconfig-g001-20200214
i386                 randconfig-g002-20200214
i386                 randconfig-g003-20200214
x86_64               randconfig-g001-20200215
x86_64               randconfig-g002-20200215
x86_64               randconfig-g003-20200215
i386                 randconfig-g001-20200215
i386                 randconfig-g002-20200215
i386                 randconfig-g003-20200215
x86_64               randconfig-h001-20200214
x86_64               randconfig-h002-20200214
x86_64               randconfig-h003-20200214
i386                 randconfig-h001-20200214
i386                 randconfig-h002-20200214
i386                 randconfig-h003-20200214
x86_64               randconfig-h001-20200213
x86_64               randconfig-h002-20200213
x86_64               randconfig-h003-20200213
i386                 randconfig-h001-20200213
i386                 randconfig-h002-20200213
i386                 randconfig-h003-20200213
arc                  randconfig-a001-20200213
arm                  randconfig-a001-20200213
arm64                randconfig-a001-20200213
ia64                 randconfig-a001-20200213
powerpc              randconfig-a001-20200213
sparc                randconfig-a001-20200213
arc                  randconfig-a001-20200215
arm                  randconfig-a001-20200215
arm64                randconfig-a001-20200215
ia64                 randconfig-a001-20200215
powerpc              randconfig-a001-20200215
sparc                randconfig-a001-20200215
arc                  randconfig-a001-20200214
arm                  randconfig-a001-20200214
arm64                randconfig-a001-20200214
ia64                 randconfig-a001-20200214
powerpc              randconfig-a001-20200214
sparc                randconfig-a001-20200214
riscv                          rv32_defconfig
s390                             allyesconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
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
