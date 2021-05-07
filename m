Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E61376A11
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 20:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhEGSf1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 14:35:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:32934 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhEGSf1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 14:35:27 -0400
IronPort-SDR: /OCd1IjKGyUVqC9EoohYVe7uCaFhqCWyrgsvK2LakU35Ykns9Ed4MjM7667NL1K1JMuTJFmvyC
 XPRKqUlh/YWw==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="185918253"
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; 
   d="scan'208";a="185918253"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 11:34:26 -0700
IronPort-SDR: eYvah1ztarOwU+KC1CbePtEoSTrkHBIzmVSz7iU2L48/l6iv2MkWDWrDtrhRbcZtVABUcDSXpB
 sfauqOJN0ZwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; 
   d="scan'208";a="620305535"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 May 2021 11:34:24 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lf5Iu-000BM0-30; Fri, 07 May 2021 18:34:24 +0000
Date:   Sat, 08 May 2021 02:34:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3ac077570a4229f4367f1ea001eba9791806a7ca
Message-ID: <60958825.uZ8tgAwQS0BpoZkE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 3ac077570a4229f4367f1ea001eba9791806a7ca  usb: gadget: fsl_qe_udc: fix implicit-fallthrough warnings

elapsed time: 729m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
mips                          rb532_defconfig
arm                             ezx_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                      maltasmvp_defconfig
powerpc                     mpc5200_defconfig
m68k                          sun3x_defconfig
powerpc                     tqm8555_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      mgcoge_defconfig
mips                           mtx1_defconfig
m68k                            mac_defconfig
sh                      rts7751r2d1_defconfig
arm                         hackkit_defconfig
arm                        shmobile_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                           jazz_defconfig
arm                         axm55xx_defconfig
arm                        clps711x_defconfig
mips                          malta_defconfig
arm                         lubbock_defconfig
powerpc                     tqm8560_defconfig
sh                           se7722_defconfig
arm                       mainstone_defconfig
arm                         nhk8815_defconfig
sh                          sdk7780_defconfig
powerpc                     rainier_defconfig
powerpc                      katmai_defconfig
powerpc                        warp_defconfig
microblaze                      mmu_defconfig
riscv                    nommu_k210_defconfig
sh                           se7751_defconfig
arc                            hsdk_defconfig
mips                        nlm_xlp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                    sam440ep_defconfig
sh                 kfr2r09-romimage_defconfig
mips                         cobalt_defconfig
mips                           ip22_defconfig
arm                              alldefconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210507
x86_64               randconfig-a003-20210507
x86_64               randconfig-a005-20210507
x86_64               randconfig-a002-20210507
x86_64               randconfig-a006-20210507
x86_64               randconfig-a004-20210507
i386                 randconfig-a003-20210507
i386                 randconfig-a006-20210507
i386                 randconfig-a001-20210507
i386                 randconfig-a005-20210507
i386                 randconfig-a004-20210507
i386                 randconfig-a002-20210507
i386                 randconfig-a015-20210507
i386                 randconfig-a013-20210507
i386                 randconfig-a016-20210507
i386                 randconfig-a014-20210507
i386                 randconfig-a012-20210507
i386                 randconfig-a011-20210507
riscv                             allnoconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210507
x86_64               randconfig-a015-20210507
x86_64               randconfig-a012-20210507
x86_64               randconfig-a013-20210507
x86_64               randconfig-a011-20210507
x86_64               randconfig-a016-20210507
x86_64               randconfig-a001-20210506
x86_64               randconfig-a003-20210506
x86_64               randconfig-a005-20210506
x86_64               randconfig-a002-20210506
x86_64               randconfig-a006-20210506
x86_64               randconfig-a004-20210506

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
