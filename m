Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA551BCCB8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 21:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgD1Tum (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 15:50:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:1932 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728474AbgD1Tum (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 15:50:42 -0400
IronPort-SDR: 6ulKnUp8GMucd27qMHf4chZ2eEeSr0hgul3lWEn52yxslnyk/Nl3VPWL+2vSmN9/hfYt7w18JG
 EdPZVsWsUtPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 12:50:40 -0700
IronPort-SDR: +rnp32Dk/SjfaEQSTX46U91cN0hH3K9UJ/L1WwdC3u4zRQzIaMaLrjn4d2qsbs53a2SzdTQPjC
 cW+VDyTCPbHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; 
   d="scan'208";a="249262439"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2020 12:50:39 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jTWFa-000Aip-NH; Wed, 29 Apr 2020 03:50:38 +0800
Date:   Wed, 29 Apr 2020 03:49:52 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 b9cf2cb524338c1257babb212420176e9e22f14a
Message-ID: <5ea888e0.2k8E57DEkxqiBRKI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: b9cf2cb524338c1257babb212420176e9e22f14a  usb: core: hub: use true,false for bool variable

elapsed time: 508m

configs tested: 163
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
csky                                defconfig
sparc64                          allyesconfig
powerpc                             defconfig
ia64                                defconfig
h8300                       h8s-sim_defconfig
mips                         tb0287_defconfig
m68k                             allmodconfig
openrisc                    or1ksim_defconfig
microblaze                      mmu_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
nds32                               defconfig
nds32                             allnoconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
mips                malta_kvm_guest_defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
parisc               randconfig-a001-20200428
m68k                 randconfig-a001-20200428
alpha                randconfig-a001-20200428
nds32                randconfig-a001-20200428
riscv                randconfig-a001-20200428
nios2                randconfig-a001-20200428
h8300                randconfig-a001-20200428
c6x                  randconfig-a001-20200428
sparc64              randconfig-a001-20200428
microblaze           randconfig-a001-20200428
sh                   randconfig-a001-20200428
csky                 randconfig-a001-20200428
s390                 randconfig-a001-20200428
xtensa               randconfig-a001-20200428
openrisc             randconfig-a001-20200428
i386                 randconfig-c002-20200428
i386                 randconfig-c001-20200428
x86_64               randconfig-c001-20200428
i386                 randconfig-c003-20200428
x86_64               randconfig-c003-20200428
x86_64               randconfig-a001-20200428
i386                 randconfig-a003-20200428
x86_64               randconfig-a003-20200428
i386                 randconfig-a002-20200428
i386                 randconfig-a001-20200428
x86_64               randconfig-a002-20200428
x86_64               randconfig-d001-20200428
i386                 randconfig-d002-20200428
i386                 randconfig-d001-20200428
x86_64               randconfig-d003-20200428
i386                 randconfig-d003-20200428
x86_64               randconfig-f002-20200428
i386                 randconfig-f002-20200428
i386                 randconfig-f003-20200428
x86_64               randconfig-f003-20200428
i386                 randconfig-f001-20200428
x86_64               randconfig-f001-20200428
i386                 randconfig-g003-20200428
x86_64               randconfig-g001-20200428
i386                 randconfig-g001-20200428
x86_64               randconfig-g002-20200428
i386                 randconfig-g002-20200428
x86_64               randconfig-g003-20200428
x86_64               randconfig-h001-20200428
i386                 randconfig-h003-20200428
x86_64               randconfig-h003-20200428
x86_64               randconfig-h002-20200428
i386                 randconfig-h001-20200428
i386                 randconfig-h002-20200428
sparc                randconfig-a001-20200428
ia64                 randconfig-a001-20200428
powerpc              randconfig-a001-20200428
arm64                randconfig-a001-20200428
arc                  randconfig-a001-20200428
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
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
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
