Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0604C194B58
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 23:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgCZWOl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 18:14:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:39923 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgCZWOl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 18:14:41 -0400
IronPort-SDR: Opw/cC0Y5e9g+7WbR91gmQHypL/4YoI7t52eCg1nTXxIN1fnT9haZv3tQ0avQIgSqJKhcVJkbZ
 QXv1ayaZ47oA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 15:14:40 -0700
IronPort-SDR: 8e2ND5as3CCSXfRMUeVBijnb+HYIqYkOdcbKBG1HKZp2hZ/jIwkquluYDR782MsvcHf1ayD8cR
 dUZtzMZXfWhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,309,1580803200"; 
   d="scan'208";a="250937310"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Mar 2020 15:14:39 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jHalq-0006HR-MH; Fri, 27 Mar 2020 06:14:38 +0800
Date:   Fri, 27 Mar 2020 06:14:01 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 70d8b9e5e63d212019ba3f6823c8ec3d2df87645
Message-ID: <5e7d2929.wJf05ons78D65bkO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 70d8b9e5e63d212019ba3f6823c8ec3d2df87645  usb: cdns3: make signed 1 bit bitfields unsigned

elapsed time: 484m

configs tested: 151
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
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
riscv                    nommu_virt_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
arm64                            allmodconfig
arm                              allmodconfig
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
csky                                defconfig
alpha                               defconfig
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
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
i386                 randconfig-a002-20200326
i386                 randconfig-a001-20200326
x86_64               randconfig-a002-20200326
x86_64               randconfig-a001-20200326
i386                 randconfig-a003-20200326
x86_64               randconfig-a003-20200326
mips                 randconfig-a001-20200326
nds32                randconfig-a001-20200326
m68k                 randconfig-a001-20200326
parisc               randconfig-a001-20200326
alpha                randconfig-a001-20200326
riscv                randconfig-a001-20200326
h8300                randconfig-a001-20200326
microblaze           randconfig-a001-20200326
nios2                randconfig-a001-20200326
c6x                  randconfig-a001-20200326
sparc64              randconfig-a001-20200326
csky                 randconfig-a001-20200326
openrisc             randconfig-a001-20200326
s390                 randconfig-a001-20200326
xtensa               randconfig-a001-20200326
x86_64               randconfig-c003-20200326
x86_64               randconfig-c001-20200326
i386                 randconfig-c002-20200326
x86_64               randconfig-c002-20200326
i386                 randconfig-c003-20200326
i386                 randconfig-c001-20200326
x86_64               randconfig-e001-20200326
x86_64               randconfig-e003-20200326
i386                 randconfig-e002-20200326
i386                 randconfig-e003-20200326
i386                 randconfig-e001-20200326
x86_64               randconfig-e002-20200326
x86_64               randconfig-f001-20200326
x86_64               randconfig-f002-20200326
x86_64               randconfig-f003-20200326
i386                 randconfig-f001-20200326
i386                 randconfig-f002-20200326
i386                 randconfig-f003-20200326
x86_64               randconfig-g001-20200326
x86_64               randconfig-g002-20200326
x86_64               randconfig-g003-20200326
i386                 randconfig-g001-20200326
i386                 randconfig-g002-20200326
i386                 randconfig-g003-20200326
x86_64               randconfig-h002-20200326
x86_64               randconfig-h003-20200326
i386                 randconfig-h003-20200326
i386                 randconfig-h001-20200326
x86_64               randconfig-h001-20200326
i386                 randconfig-h002-20200326
arm                  randconfig-a001-20200326
arm64                randconfig-a001-20200326
ia64                 randconfig-a001-20200326
arc                  randconfig-a001-20200326
sparc                randconfig-a001-20200326
powerpc              randconfig-a001-20200326
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
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
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
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
