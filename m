Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5ECF1C7DE2
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 01:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbgEFXc3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 19:32:29 -0400
Received: from mga11.intel.com ([192.55.52.93]:21643 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727119AbgEFXc3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 May 2020 19:32:29 -0400
IronPort-SDR: R3S+ByBbykYHDRMKfTSAVJCCTa3usoDnbUrq7IVGtsFBHdEnK9PjWDNiWpvbZRnSjPGxjlI+xC
 5HhzJj/wN4Vg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 16:32:28 -0700
IronPort-SDR: W0KrL0+7M8KX1c1Ziz6wdrr7m+A/+36QWbSAnrbol/6haNwS2u8aFSErRCZLpAuNG/J01v1Rks
 OABZBUQz2ZLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,361,1583222400"; 
   d="scan'208";a="260344471"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 May 2020 16:32:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jWTWc-000EDl-9U; Thu, 07 May 2020 07:32:26 +0800
Date:   Thu, 07 May 2020 07:32:09 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 084d7e78467534eedaf0d6c72086a6817023d839
Message-ID: <5eb348f9.ApH3mDF/+4UigloP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 084d7e78467534eedaf0d6c72086a6817023d839  Merge tag 'usb-serial-5.7-rc5' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 481m

configs tested: 161
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
sparc                            allyesconfig
m68k                             allyesconfig
ia64                             allyesconfig
m68k                             allmodconfig
csky                             allyesconfig
riscv                               defconfig
parisc                           allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
m68k                                defconfig
c6x                               allnoconfig
s390                             alldefconfig
ia64                             alldefconfig
m68k                           sun3_defconfig
powerpc                             defconfig
sparc64                          allmodconfig
nds32                               defconfig
s390                                defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
m68k                          multi_defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                       allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
openrisc                         allyesconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          alldefconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
m68k                 randconfig-a001-20200506
mips                 randconfig-a001-20200506
nds32                randconfig-a001-20200506
parisc               randconfig-a001-20200506
alpha                randconfig-a001-20200506
riscv                randconfig-a001-20200506
m68k                 randconfig-a001-20200507
mips                 randconfig-a001-20200507
nds32                randconfig-a001-20200507
parisc               randconfig-a001-20200507
alpha                randconfig-a001-20200507
riscv                randconfig-a001-20200507
h8300                randconfig-a001-20200506
nios2                randconfig-a001-20200506
microblaze           randconfig-a001-20200506
c6x                  randconfig-a001-20200506
sparc64              randconfig-a001-20200506
h8300                randconfig-a001-20200507
nios2                randconfig-a001-20200507
microblaze           randconfig-a001-20200507
c6x                  randconfig-a001-20200507
sparc64              randconfig-a001-20200507
s390                 randconfig-a001-20200506
xtensa               randconfig-a001-20200506
sh                   randconfig-a001-20200506
openrisc             randconfig-a001-20200506
csky                 randconfig-a001-20200506
xtensa               randconfig-a001-20200507
sh                   randconfig-a001-20200507
openrisc             randconfig-a001-20200507
csky                 randconfig-a001-20200507
x86_64               randconfig-a003-20200506
x86_64               randconfig-a001-20200506
x86_64               randconfig-a002-20200506
i386                 randconfig-a001-20200506
i386                 randconfig-a002-20200506
i386                 randconfig-a003-20200506
i386                 randconfig-b003-20200506
i386                 randconfig-b001-20200506
x86_64               randconfig-b001-20200506
x86_64               randconfig-b003-20200506
i386                 randconfig-b002-20200506
x86_64               randconfig-d001-20200507
i386                 randconfig-d003-20200507
i386                 randconfig-d001-20200507
x86_64               randconfig-d003-20200507
x86_64               randconfig-d002-20200507
i386                 randconfig-d002-20200507
i386                 randconfig-e003-20200506
x86_64               randconfig-e003-20200506
x86_64               randconfig-e001-20200506
i386                 randconfig-e002-20200506
i386                 randconfig-e001-20200506
i386                 randconfig-f003-20200506
x86_64               randconfig-f001-20200506
x86_64               randconfig-f003-20200506
x86_64               randconfig-f002-20200506
i386                 randconfig-f001-20200506
i386                 randconfig-f002-20200506
x86_64               randconfig-g003-20200506
i386                 randconfig-g003-20200506
i386                 randconfig-g002-20200506
x86_64               randconfig-g001-20200506
i386                 randconfig-g001-20200506
x86_64               randconfig-g002-20200506
i386                 randconfig-h002-20200506
i386                 randconfig-h001-20200506
i386                 randconfig-h003-20200506
x86_64               randconfig-h002-20200506
x86_64               randconfig-h003-20200506
x86_64               randconfig-h001-20200506
ia64                 randconfig-a001-20200506
arm64                randconfig-a001-20200506
arc                  randconfig-a001-20200506
powerpc              randconfig-a001-20200506
arm                  randconfig-a001-20200506
sparc                randconfig-a001-20200506
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                               allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                               allyesconfig
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
