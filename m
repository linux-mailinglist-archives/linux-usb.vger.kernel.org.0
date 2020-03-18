Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D1118A1F4
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2020 18:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCRRtm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Mar 2020 13:49:42 -0400
Received: from mga12.intel.com ([192.55.52.136]:30663 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbgCRRtm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Mar 2020 13:49:42 -0400
IronPort-SDR: 1Fw1dxVXTUjWOop9E6gP3ThrsYIMv+Yc2NZ7E3VmTUs8cmRBc7Nq0oSFL8D5rWg2NTVNPjTu42
 8dFpD2WZTmEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2020 10:49:39 -0700
IronPort-SDR: MmouI4a/jUpsBKH3v4VMVwmh5ailnajT2s5LA2J0rOznNmuYai3HLhH6xTFxpoBbY8qE5J/RAk
 hBChiyfAIk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; 
   d="scan'208";a="355777406"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2020 10:49:38 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jEcp0-000IiW-42; Thu, 19 Mar 2020 01:49:38 +0800
Date:   Thu, 19 Mar 2020 01:48:53 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 2866ce8696167de300e27d50d521b5f671bab5d4
Message-ID: <5e725f05.5nEmdfRXFzBPU5KW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 2866ce8696167de300e27d50d521b5f671bab5d4  Merge tag 'usb-serial-5.6-rc7' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 484m

configs tested: 164
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
nios2                         3c120_defconfig
s390                             allmodconfig
i386                              allnoconfig
mips                             allyesconfig
nios2                         10m50_defconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
mips                      fuloong2e_defconfig
m68k                             allmodconfig
riscv                    nommu_virt_defconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
mips                         64r6el_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200318
x86_64               randconfig-a002-20200318
x86_64               randconfig-a003-20200318
i386                 randconfig-a001-20200318
i386                 randconfig-a002-20200318
i386                 randconfig-a003-20200318
alpha                randconfig-a001-20200318
m68k                 randconfig-a001-20200318
mips                 randconfig-a001-20200318
nds32                randconfig-a001-20200318
parisc               randconfig-a001-20200318
riscv                randconfig-a001-20200318
h8300                randconfig-a001-20200318
sparc64              randconfig-a001-20200318
c6x                  randconfig-a001-20200318
nios2                randconfig-a001-20200318
microblaze           randconfig-a001-20200318
xtensa               randconfig-a001-20200318
csky                 randconfig-a001-20200318
openrisc             randconfig-a001-20200318
sh                   randconfig-a001-20200318
s390                 randconfig-a001-20200318
x86_64               randconfig-b001-20200318
x86_64               randconfig-b002-20200318
x86_64               randconfig-b003-20200318
i386                 randconfig-b001-20200318
i386                 randconfig-b002-20200318
i386                 randconfig-b003-20200318
x86_64               randconfig-c001-20200318
x86_64               randconfig-c002-20200318
x86_64               randconfig-c003-20200318
i386                 randconfig-c001-20200318
i386                 randconfig-c002-20200318
i386                 randconfig-c003-20200318
x86_64               randconfig-d001-20200318
x86_64               randconfig-d002-20200318
x86_64               randconfig-d003-20200318
i386                 randconfig-d001-20200318
i386                 randconfig-d002-20200318
i386                 randconfig-d003-20200318
x86_64               randconfig-e001-20200318
x86_64               randconfig-e002-20200318
x86_64               randconfig-e003-20200318
i386                 randconfig-e001-20200318
i386                 randconfig-e002-20200318
i386                 randconfig-e003-20200318
x86_64               randconfig-f001-20200318
x86_64               randconfig-f002-20200318
x86_64               randconfig-f003-20200318
i386                 randconfig-f001-20200318
i386                 randconfig-f002-20200318
i386                 randconfig-f003-20200318
x86_64               randconfig-g001-20200318
x86_64               randconfig-g002-20200318
x86_64               randconfig-g003-20200318
i386                 randconfig-g001-20200318
i386                 randconfig-g002-20200318
i386                 randconfig-g003-20200318
x86_64               randconfig-h001-20200318
x86_64               randconfig-h002-20200318
x86_64               randconfig-h003-20200318
i386                 randconfig-h001-20200318
i386                 randconfig-h002-20200318
i386                 randconfig-h003-20200318
arc                  randconfig-a001-20200318
arm                  randconfig-a001-20200318
arm64                randconfig-a001-20200318
ia64                 randconfig-a001-20200318
powerpc              randconfig-a001-20200318
sparc                randconfig-a001-20200318
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
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
