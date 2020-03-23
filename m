Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E91F318F845
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2020 16:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgCWPK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Mar 2020 11:10:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:3323 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgCWPK1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Mar 2020 11:10:27 -0400
IronPort-SDR: GeXYBLjwUli7UemcDF787kh/KqA9Ylas27g+hASDae3+cJgcxH9E8I9J2blCYpQJ/wysXq48DK
 VYPmX7lIV1Yg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 08:10:26 -0700
IronPort-SDR: dI4V0iGSi/Z8oDWA5UZwzMDvBAAxAwhxsJdYfVWHCCuM7qux/xi7sDkm7wnQKTU6ouQBk/2ilI
 1FlNOONUVc9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; 
   d="scan'208";a="235243342"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Mar 2020 08:10:25 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jGOie-0009WC-PB; Mon, 23 Mar 2020 23:10:24 +0800
Date:   Mon, 23 Mar 2020 23:09:37 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d2e971d884e7b7e65162788b8f3b7801cd8bc137
Message-ID: <5e78d131.WcFQUAwCMV8PAPMs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: d2e971d884e7b7e65162788b8f3b7801cd8bc137  Merge 5.6-rc7 into usb-next

elapsed time: 482m

configs tested: 167
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
ia64                                defconfig
powerpc                             defconfig
i386                              allnoconfig
ia64                             allyesconfig
riscv                               defconfig
s390                              allnoconfig
h8300                       h8s-sim_defconfig
i386                             allyesconfig
m68k                       m5475evb_defconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
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
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200323
x86_64               randconfig-a002-20200323
x86_64               randconfig-a003-20200323
i386                 randconfig-a001-20200323
i386                 randconfig-a002-20200323
i386                 randconfig-a003-20200323
alpha                randconfig-a001-20200323
m68k                 randconfig-a001-20200323
mips                 randconfig-a001-20200323
nds32                randconfig-a001-20200323
parisc               randconfig-a001-20200323
riscv                randconfig-a001-20200323
c6x                  randconfig-a001-20200323
h8300                randconfig-a001-20200323
microblaze           randconfig-a001-20200323
nios2                randconfig-a001-20200323
sparc64              randconfig-a001-20200323
h8300                randconfig-a001-20200322
microblaze           randconfig-a001-20200322
nios2                randconfig-a001-20200322
c6x                  randconfig-a001-20200322
sparc64              randconfig-a001-20200322
csky                 randconfig-a001-20200323
openrisc             randconfig-a001-20200323
s390                 randconfig-a001-20200323
sh                   randconfig-a001-20200323
xtensa               randconfig-a001-20200323
i386                 randconfig-b003-20200323
i386                 randconfig-b001-20200323
x86_64               randconfig-b003-20200323
i386                 randconfig-b002-20200323
x86_64               randconfig-b002-20200323
x86_64               randconfig-b001-20200323
x86_64               randconfig-c001-20200323
x86_64               randconfig-c002-20200323
x86_64               randconfig-c003-20200323
i386                 randconfig-c001-20200323
i386                 randconfig-c002-20200323
i386                 randconfig-c003-20200323
x86_64               randconfig-d001-20200323
x86_64               randconfig-d002-20200323
x86_64               randconfig-d003-20200323
i386                 randconfig-d001-20200323
i386                 randconfig-d002-20200323
i386                 randconfig-d003-20200323
x86_64               randconfig-e001-20200323
x86_64               randconfig-e002-20200323
x86_64               randconfig-e003-20200323
i386                 randconfig-e001-20200323
i386                 randconfig-e002-20200323
i386                 randconfig-e003-20200323
i386                 randconfig-f001-20200323
i386                 randconfig-f003-20200323
i386                 randconfig-f002-20200323
x86_64               randconfig-f002-20200323
x86_64               randconfig-f001-20200323
i386                 randconfig-g003-20200323
i386                 randconfig-g001-20200323
i386                 randconfig-g002-20200323
x86_64               randconfig-g001-20200323
x86_64               randconfig-g003-20200323
x86_64               randconfig-h001-20200323
x86_64               randconfig-h002-20200323
x86_64               randconfig-h003-20200323
i386                 randconfig-h001-20200323
i386                 randconfig-h002-20200323
i386                 randconfig-h003-20200323
arm                  randconfig-a001-20200323
powerpc              randconfig-a001-20200323
arm64                randconfig-a001-20200323
ia64                 randconfig-a001-20200323
sparc                randconfig-a001-20200323
arc                  randconfig-a001-20200323
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
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
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
