Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58C51D2103
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 23:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgEMV2b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 17:28:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:2216 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728591AbgEMV2b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 17:28:31 -0400
IronPort-SDR: 2OsvhaWQukA/w7D9B464O1HC56x8UfBkm4bpJITzezA2LZGRvj48244cQZ/72sFnrmZKBbOeFg
 5Nh22owtGUOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 14:28:30 -0700
IronPort-SDR: YNHjthlLSEFQmPLG4EN72cQxecoYgcDnumBO39LXjzgcMBi+6APF22ww9f3OKYbDElBZMePuIh
 gEgL3axFEZ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,389,1583222400"; 
   d="scan'208";a="437657215"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 May 2020 14:28:29 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jYyvU-0002TO-I4; Thu, 14 May 2020 05:28:28 +0800
Date:   Thu, 14 May 2020 05:27:54 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c33f4f24b888236b725a9972e0fe5ac6575c68ec
Message-ID: <5ebc665a.THgjsbdWkyXa3243%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: c33f4f24b888236b725a9972e0fe5ac6575c68ec  usb: host: Add ability to build new Broadcom STB USB drivers

elapsed time: 535m

configs tested: 132
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
sparc                            allyesconfig
m68k                             allyesconfig
h8300                     edosk2674_defconfig
mips                     decstation_defconfig
sh                          rsk7201_defconfig
mips                          rm200_defconfig
riscv                    nommu_virt_defconfig
mips                      pistachio_defconfig
xtensa                           alldefconfig
sh                           se7722_defconfig
openrisc                         alldefconfig
arm                        cerfcube_defconfig
arm                         assabet_defconfig
sh                          sdk7786_defconfig
arm                            hisi_defconfig
arm                          exynos_defconfig
arm                            mps2_defconfig
sh                ecovec24-romimage_defconfig
arc                            hsdk_defconfig
arm                          iop32x_defconfig
riscv                             allnoconfig
arm                          moxart_defconfig
sh                               allmodconfig
sh                             espt_defconfig
arm                            xcep_defconfig
microblaze                          defconfig
arm                         orion5x_defconfig
m68k                       m5475evb_defconfig
arm                         s3c2410_defconfig
c6x                               allnoconfig
sh                   rts7751r2dplus_defconfig
arc                          axs101_defconfig
mips                     loongson1c_defconfig
c6x                        evmc6472_defconfig
um                               alldefconfig
arm                        clps711x_defconfig
powerpc                    adder875_defconfig
parisc                generic-64bit_defconfig
arm                        vexpress_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200513
i386                 randconfig-a005-20200513
i386                 randconfig-a003-20200513
i386                 randconfig-a001-20200513
i386                 randconfig-a004-20200513
i386                 randconfig-a002-20200513
x86_64               randconfig-a005-20200513
x86_64               randconfig-a003-20200513
x86_64               randconfig-a006-20200513
x86_64               randconfig-a004-20200513
x86_64               randconfig-a001-20200513
x86_64               randconfig-a002-20200513
i386                 randconfig-a012-20200513
i386                 randconfig-a016-20200513
i386                 randconfig-a014-20200513
i386                 randconfig-a011-20200513
i386                 randconfig-a013-20200513
i386                 randconfig-a015-20200513
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
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
