Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0954B485F95
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 05:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbiAFEOK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 23:14:10 -0500
Received: from mga18.intel.com ([134.134.136.126]:50328 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232447AbiAFEOG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jan 2022 23:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641442446; x=1672978446;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6JDs8g+SvI46iMmWd7QOvuquV6K/QbW6cDkJEXLQUck=;
  b=mVnalljIIXfVR7wbAw/nLtal9EuiVErun11KfvL2b9QcAer1BbdzBdnw
   lZgKwDUVlN9QOYUsXQm9yWdoJwf6iXkm3f8i+rSWggDq9DBrvYW7u99ZV
   kA+hvTn9VH1uiXsULW3+2a79Tec7XU5LtxWU/2MyC+GtQQ7fUslHP23Vj
   er4vVTT1Crn4h6yInegklohzpA2A+xgk+7w3YEPwNFJQgbGHHri0zGP2T
   6p9g9xxFy9h1NW5IHLVHu3jHMzMxCz+OB4ftuFLg3miqkckMEW8rVlXsj
   4/pwgFUlxKqT6BIwyK+emH5vGRCSNoHnI9Jfz6lMLF1k+LuoU6w1JzRg6
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229400220"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="229400220"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 20:14:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="621382572"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jan 2022 20:14:05 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n5KA8-000HK6-K3; Thu, 06 Jan 2022 04:14:04 +0000
Date:   Thu, 06 Jan 2022 12:13:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 01ec4a2e8f01f027a0f06cad237c935da8d643bf
Message-ID: <61d66c5f.7YW2OF1LWYu0on2g%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 01ec4a2e8f01f027a0f06cad237c935da8d643bf  headers/deps: USB: Optimize <linux/usb/ch9.h> dependencies, remove <linux/device.h>

Warning reports:

https://lore.kernel.org/linux-usb/202112211923.EfvDjyKL-lkp@intel.com

Warning in current branch:

drivers/usb/renesas_usbhs/mod.c:195:13: warning: variable 'intenb0' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
`-- nios2-allyesconfig
    `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used

elapsed time: 732m

configs tested: 120
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220105
powerpc                    klondike_defconfig
parisc                generic-32bit_defconfig
sh                   sh7770_generic_defconfig
powerpc                        warp_defconfig
ia64                         bigsur_defconfig
s390                       zfcpdump_defconfig
sh                      rts7751r2d1_defconfig
arm                          pxa3xx_defconfig
arm                          pxa910_defconfig
riscv                    nommu_k210_defconfig
sh                         ap325rxa_defconfig
powerpc                      tqm8xx_defconfig
h8300                     edosk2674_defconfig
m68k                          amiga_defconfig
arm                          iop32x_defconfig
powerpc                      makalu_defconfig
arc                        nsim_700_defconfig
mips                         mpc30x_defconfig
mips                         cobalt_defconfig
arm                      jornada720_defconfig
mips                           gcw0_defconfig
openrisc                         alldefconfig
m68k                          hp300_defconfig
powerpc                       eiger_defconfig
arc                        nsimosci_defconfig
powerpc                       maple_defconfig
arm                       omap2plus_defconfig
arm64                            alldefconfig
arm                        mini2440_defconfig
sh                        dreamcast_defconfig
sh                          lboxre2_defconfig
s390                          debug_defconfig
sparc64                             defconfig
powerpc                     sequoia_defconfig
sh                         ecovec24_defconfig
arm                           sunxi_defconfig
arm                  randconfig-c002-20220105
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20220105
x86_64               randconfig-a001-20220105
x86_64               randconfig-a004-20220105
x86_64               randconfig-a006-20220105
x86_64               randconfig-a003-20220105
x86_64               randconfig-a002-20220105
i386                 randconfig-a003-20220105
i386                 randconfig-a005-20220105
i386                 randconfig-a004-20220105
i386                 randconfig-a006-20220105
i386                 randconfig-a002-20220105
i386                 randconfig-a001-20220105
s390                 randconfig-r044-20220106
arc                  randconfig-r043-20220106
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                             allnoconfig
x86_64               randconfig-a012-20220105
x86_64               randconfig-a015-20220105
x86_64               randconfig-a014-20220105
x86_64               randconfig-a013-20220105
x86_64               randconfig-a011-20220105
x86_64               randconfig-a016-20220105
i386                 randconfig-a012-20220105
i386                 randconfig-a016-20220105
i386                 randconfig-a015-20220105
i386                 randconfig-a014-20220105
i386                 randconfig-a011-20220105
i386                 randconfig-a013-20220105
hexagon              randconfig-r041-20220105
hexagon              randconfig-r045-20220105
riscv                randconfig-r042-20220105

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
