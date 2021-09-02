Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A03A3FEA49
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 09:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243987AbhIBH63 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 03:58:29 -0400
Received: from mga18.intel.com ([134.134.136.126]:54339 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243731AbhIBH63 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Sep 2021 03:58:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="206146025"
X-IronPort-AV: E=Sophos;i="5.84,371,1620716400"; 
   d="scan'208";a="206146025"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 00:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,371,1620716400"; 
   d="scan'208";a="602210817"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2021 00:57:27 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mLhbC-0008kW-Kq; Thu, 02 Sep 2021 07:57:26 +0000
Date:   Thu, 02 Sep 2021 15:57:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 1b4f3dfb4792f03b139edf10124fcbeb44e608e6
Message-ID: <613083df.mnxtTx8UcSHXAGAd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1b4f3dfb4792f03b139edf10124fcbeb44e608e6  Merge tag 'usb-serial-5.15-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 799m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210831
i386                 randconfig-c001-20210901
powerpc                 mpc8540_ads_defconfig
sh                          sdk7786_defconfig
arm                            xcep_defconfig
arm                          ep93xx_defconfig
xtensa                         virt_defconfig
riscv                            alldefconfig
m68k                          sun3x_defconfig
sh                            hp6xx_defconfig
s390                                defconfig
arm                         cm_x300_defconfig
arm                           corgi_defconfig
mips                           jazz_defconfig
powerpc                      acadia_defconfig
arm                          moxart_defconfig
arm                          pxa168_defconfig
sh                        edosk7705_defconfig
mips                   sb1250_swarm_defconfig
sh                        edosk7760_defconfig
powerpc                 mpc832x_rdb_defconfig
ia64                        generic_defconfig
nios2                         3c120_defconfig
sh                          urquell_defconfig
mips                        maltaup_defconfig
arm                          pxa910_defconfig
powerpc                  iss476-smp_defconfig
sh                          rsk7269_defconfig
mips                     decstation_defconfig
arm                           spitz_defconfig
powerpc                     tqm8540_defconfig
mips                            e55_defconfig
arm                            mps2_defconfig
mips                           ip28_defconfig
mips                        omega2p_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7343_defconfig
powerpc                      pasemi_defconfig
arm                           h3600_defconfig
mips                  decstation_64_defconfig
ia64                      gensparse_defconfig
mips                        nlm_xlp_defconfig
arm                          imote2_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
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
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210831
x86_64               randconfig-a001-20210831
x86_64               randconfig-a003-20210831
x86_64               randconfig-a002-20210831
x86_64               randconfig-a004-20210831
x86_64               randconfig-a006-20210831
i386                 randconfig-a005-20210831
i386                 randconfig-a002-20210831
i386                 randconfig-a003-20210831
i386                 randconfig-a006-20210831
i386                 randconfig-a004-20210831
i386                 randconfig-a001-20210831
x86_64               randconfig-a016-20210901
x86_64               randconfig-a011-20210901
x86_64               randconfig-a012-20210901
x86_64               randconfig-a015-20210901
x86_64               randconfig-a014-20210901
x86_64               randconfig-a013-20210901
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20210901
mips                 randconfig-c004-20210901
x86_64               randconfig-c007-20210901
powerpc              randconfig-c003-20210901
i386                 randconfig-c001-20210901
arm                  randconfig-c002-20210901
riscv                randconfig-c006-20210901
x86_64               randconfig-a014-20210831
x86_64               randconfig-a015-20210831
x86_64               randconfig-a013-20210831
x86_64               randconfig-a016-20210831
x86_64               randconfig-a012-20210831
x86_64               randconfig-a011-20210831
i386                 randconfig-a016-20210831
i386                 randconfig-a011-20210831
i386                 randconfig-a015-20210831
i386                 randconfig-a014-20210831
i386                 randconfig-a012-20210831
i386                 randconfig-a013-20210831
hexagon              randconfig-r045-20210901
hexagon              randconfig-r041-20210901
s390                 randconfig-r044-20210831
hexagon              randconfig-r041-20210831
hexagon              randconfig-r045-20210831
riscv                randconfig-r042-20210831

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
