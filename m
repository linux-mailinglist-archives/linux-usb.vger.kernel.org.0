Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C383E180203
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 16:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgCJPiL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 11:38:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:58672 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726892AbgCJPiL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 11:38:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 08:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; 
   d="scan'208";a="260826501"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Mar 2020 08:38:08 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jBgxL-0002u0-A6; Tue, 10 Mar 2020 23:38:07 +0800
Date:   Tue, 10 Mar 2020 23:37:13 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8e567ed9e244f6af2ecfd22a7204612ec361d334
Message-ID: <5e67b429.gc7MSII/1CbJVQsS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 8e567ed9e244f6af2ecfd22a7204612ec361d334  Merge 5.6-rc5 into usb-next

elapsed time: 500m

configs tested: 177
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
sparc                            allyesconfig
sparc64                          allyesconfig
i386                                defconfig
openrisc                 simple_smp_defconfig
s390                             allmodconfig
riscv                               defconfig
alpha                               defconfig
nds32                               defconfig
parisc                generic-64bit_defconfig
sh                  sh7785lcr_32bit_defconfig
ia64                             alldefconfig
openrisc                    or1ksim_defconfig
sparc64                           allnoconfig
sh                                allnoconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                             allnoconfig
csky                                defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200310
x86_64               randconfig-a002-20200310
x86_64               randconfig-a003-20200310
i386                 randconfig-a001-20200310
i386                 randconfig-a002-20200310
i386                 randconfig-a003-20200310
riscv                randconfig-a001-20200309
m68k                 randconfig-a001-20200309
alpha                randconfig-a001-20200309
mips                 randconfig-a001-20200309
nds32                randconfig-a001-20200309
parisc               randconfig-a001-20200309
xtensa               randconfig-a001-20200310
openrisc             randconfig-a001-20200310
csky                 randconfig-a001-20200310
sh                   randconfig-a001-20200310
s390                 randconfig-a001-20200310
x86_64               randconfig-b001-20200309
x86_64               randconfig-b002-20200309
x86_64               randconfig-b003-20200309
i386                 randconfig-b001-20200309
i386                 randconfig-b002-20200309
i386                 randconfig-b003-20200309
x86_64               randconfig-b001-20200310
x86_64               randconfig-b002-20200310
x86_64               randconfig-b003-20200310
i386                 randconfig-b001-20200310
i386                 randconfig-b002-20200310
i386                 randconfig-b003-20200310
x86_64               randconfig-c001-20200310
x86_64               randconfig-c002-20200310
x86_64               randconfig-c003-20200310
i386                 randconfig-c001-20200310
i386                 randconfig-c002-20200310
i386                 randconfig-c003-20200310
i386                 randconfig-c002-20200309
i386                 randconfig-c003-20200309
x86_64               randconfig-c001-20200309
x86_64               randconfig-c002-20200309
x86_64               randconfig-c003-20200309
i386                 randconfig-c001-20200309
x86_64               randconfig-d001-20200310
x86_64               randconfig-d002-20200310
x86_64               randconfig-d003-20200310
i386                 randconfig-d001-20200310
i386                 randconfig-d002-20200310
i386                 randconfig-d003-20200310
x86_64               randconfig-e001-20200310
x86_64               randconfig-e002-20200310
x86_64               randconfig-e003-20200310
i386                 randconfig-e001-20200310
i386                 randconfig-e002-20200310
i386                 randconfig-e003-20200310
x86_64               randconfig-f001-20200310
x86_64               randconfig-f002-20200310
x86_64               randconfig-f003-20200310
i386                 randconfig-f001-20200310
i386                 randconfig-f002-20200310
i386                 randconfig-f003-20200310
x86_64               randconfig-g001-20200310
x86_64               randconfig-g002-20200310
x86_64               randconfig-g003-20200310
i386                 randconfig-g001-20200310
i386                 randconfig-g002-20200310
i386                 randconfig-g003-20200310
x86_64               randconfig-g003-20200309
i386                 randconfig-g001-20200309
i386                 randconfig-g003-20200309
x86_64               randconfig-g001-20200309
x86_64               randconfig-g002-20200309
i386                 randconfig-g002-20200309
x86_64               randconfig-h001-20200310
i386                 randconfig-h001-20200310
x86_64               randconfig-h002-20200310
x86_64               randconfig-h003-20200310
i386                 randconfig-h002-20200310
i386                 randconfig-h003-20200310
arc                  randconfig-a001-20200310
ia64                 randconfig-a001-20200310
arm                  randconfig-a001-20200310
arm64                randconfig-a001-20200310
sparc                randconfig-a001-20200310
powerpc              randconfig-a001-20200310
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             alldefconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                             defconfig
um                           x86_64_defconfig
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
