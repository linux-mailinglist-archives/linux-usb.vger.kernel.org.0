Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF652CF925
	for <lists+linux-usb@lfdr.de>; Sat,  5 Dec 2020 04:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgLEDM2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 22:12:28 -0500
Received: from mga06.intel.com ([134.134.136.31]:4559 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725967AbgLEDM2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Dec 2020 22:12:28 -0500
IronPort-SDR: zvHAJw6TF5x7unwcyFBz+BeI1lFOtsZQRl7giMgT47MystOdiMqdFOXS7qSTZlUZgLUak8eYZ+
 Eer8v8RXVN8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="235086787"
X-IronPort-AV: E=Sophos;i="5.78,394,1599548400"; 
   d="scan'208";a="235086787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 19:11:47 -0800
IronPort-SDR: jeSFiH1b+uRM5m4nsxOHi7Chxdkvzth/xJpSZVSYQZ0NVTm/fv49BaloDXPsJL7nmJ6GdYBNNk
 3Jfhvv7FEmjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,394,1599548400"; 
   d="scan'208";a="551193656"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Dec 2020 19:11:45 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1klNz6-00003q-ND; Sat, 05 Dec 2020 03:11:44 +0000
Date:   Sat, 05 Dec 2020 11:11:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 a4b98a7512f18534ce33a7e98e49115af59ffa00
Message-ID: <5fcafa6d.wWiA3FtQguBwHhCT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: a4b98a7512f18534ce33a7e98e49115af59ffa00  usb: gadget: f_fs: Use local copy of descriptors for userspace copy

elapsed time: 722m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          amiga_defconfig
sh                          r7785rp_defconfig
sh                         microdev_defconfig
m68k                       m5275evb_defconfig
nios2                            allyesconfig
parisc                generic-64bit_defconfig
powerpc                     sbc8548_defconfig
powerpc                     skiroot_defconfig
sh                          lboxre2_defconfig
powerpc                      ep88xc_defconfig
arm                         bcm2835_defconfig
powerpc                      acadia_defconfig
arm                         assabet_defconfig
powerpc                   motionpro_defconfig
mips                           jazz_defconfig
powerpc                        cell_defconfig
ia64                             alldefconfig
powerpc                     tqm5200_defconfig
arc                         haps_hs_defconfig
arm                           spitz_defconfig
arm                          exynos_defconfig
arm                          pxa3xx_defconfig
openrisc                         alldefconfig
powerpc                      mgcoge_defconfig
arm                         s3c2410_defconfig
openrisc                    or1ksim_defconfig
mips                  maltasmvp_eva_defconfig
arm                        trizeps4_defconfig
arm                        spear3xx_defconfig
powerpc                    amigaone_defconfig
powerpc               mpc834x_itxgp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201204
x86_64               randconfig-a006-20201204
x86_64               randconfig-a002-20201204
x86_64               randconfig-a001-20201204
x86_64               randconfig-a005-20201204
x86_64               randconfig-a003-20201204
i386                 randconfig-a005-20201204
i386                 randconfig-a004-20201204
i386                 randconfig-a001-20201204
i386                 randconfig-a002-20201204
i386                 randconfig-a006-20201204
i386                 randconfig-a003-20201204
i386                 randconfig-a014-20201204
i386                 randconfig-a013-20201204
i386                 randconfig-a011-20201204
i386                 randconfig-a015-20201204
i386                 randconfig-a012-20201204
i386                 randconfig-a016-20201204
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a004-20201205
x86_64               randconfig-a006-20201205
x86_64               randconfig-a002-20201205
x86_64               randconfig-a001-20201205
x86_64               randconfig-a005-20201205
x86_64               randconfig-a003-20201205
x86_64               randconfig-a016-20201204
x86_64               randconfig-a012-20201204
x86_64               randconfig-a014-20201204
x86_64               randconfig-a013-20201204
x86_64               randconfig-a015-20201204
x86_64               randconfig-a011-20201204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
