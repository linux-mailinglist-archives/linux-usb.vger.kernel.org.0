Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCEFE30996D
	for <lists+linux-usb@lfdr.de>; Sun, 31 Jan 2021 01:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbhAaAgg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jan 2021 19:36:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:49724 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230360AbhAaAgf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Jan 2021 19:36:35 -0500
IronPort-SDR: 5CqK/R+SzakeCr83YWQy/uc8wWIHemqFwlDBa/FRHVBZcJD5x4I5W9JRnfrOd4Pr3XY/UnczN8
 Lcv0DQtmD49g==
X-IronPort-AV: E=McAfee;i="6000,8403,9880"; a="244643287"
X-IronPort-AV: E=Sophos;i="5.79,389,1602572400"; 
   d="scan'208";a="244643287"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2021 16:35:54 -0800
IronPort-SDR: /tzJJyGN7fDIqql3DvbdoYAt0lLLfjUzBsbjn1UQjU/izHAu0MornBFdgZYOZEYoFGQsBnnNqN
 psyknKO4RCbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,389,1602572400"; 
   d="scan'208";a="431622795"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Jan 2021 16:35:52 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l60iW-00058G-AO; Sun, 31 Jan 2021 00:35:52 +0000
Date:   Sun, 31 Jan 2021 08:35:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 045aef3acf38a490a741ba7bbfdc0d2cfa19d480
Message-ID: <6015fb40.RAQTcVxjsFuYTKpR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 045aef3acf38a490a741ba7bbfdc0d2cfa19d480  Merge tag 'usb-serial-5.11-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 722m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                       maple_defconfig
sh                          sdk7786_defconfig
mips                          malta_defconfig
mips                           ip22_defconfig
arc                          axs101_defconfig
powerpc                 mpc8540_ads_defconfig
sh                               j2_defconfig
arm                          ep93xx_defconfig
sh                        dreamcast_defconfig
h8300                       h8s-sim_defconfig
mips                  maltasmvp_eva_defconfig
arm                            xcep_defconfig
sparc                       sparc32_defconfig
mips                  decstation_64_defconfig
powerpc                   bluestone_defconfig
c6x                        evmc6457_defconfig
sh                          r7785rp_defconfig
mips                       bmips_be_defconfig
powerpc                     tqm8548_defconfig
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
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
x86_64               randconfig-a004-20210130
x86_64               randconfig-a002-20210130
x86_64               randconfig-a001-20210130
x86_64               randconfig-a005-20210130
x86_64               randconfig-a006-20210130
x86_64               randconfig-a003-20210130
i386                 randconfig-a005-20210130
i386                 randconfig-a003-20210130
i386                 randconfig-a002-20210130
i386                 randconfig-a001-20210130
i386                 randconfig-a004-20210130
i386                 randconfig-a006-20210130
i386                 randconfig-a013-20210130
i386                 randconfig-a011-20210130
i386                 randconfig-a015-20210130
i386                 randconfig-a012-20210130
i386                 randconfig-a014-20210130
i386                 randconfig-a016-20210130
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210130
x86_64               randconfig-a011-20210130
x86_64               randconfig-a014-20210130
x86_64               randconfig-a016-20210130
x86_64               randconfig-a012-20210130
x86_64               randconfig-a013-20210130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
