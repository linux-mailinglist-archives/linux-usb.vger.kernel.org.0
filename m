Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46C13801D9
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 04:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhENCUs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 22:20:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:60779 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229471AbhENCUs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 May 2021 22:20:48 -0400
IronPort-SDR: IPebWbsnJlK+BQjGUOn+t06UOKak9nJtYfraztdh9v03Hdz+SfSQQr2npiKlqfFyNFG4PngWOi
 C1N0FONUuHkQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="200153431"
X-IronPort-AV: E=Sophos;i="5.82,298,1613462400"; 
   d="scan'208";a="200153431"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2021 19:19:36 -0700
IronPort-SDR: BEEIHMnaY5sHaBaWibunRYwvZFpPnq6YKbfSNiDppSK42SxnWcI3ErLwO8vcT1gcgBXPqWdQrc
 UiWMd8ZDO57Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,298,1613462400"; 
   d="scan'208";a="463586747"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 May 2021 19:19:35 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lhNQN-0000Wh-4N; Fri, 14 May 2021 02:19:35 +0000
Date:   Fri, 14 May 2021 10:19:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 975f94c7d6c306b833628baa9aec3f79db1eb3a1
Message-ID: <609dde2d.axNpPJo06HgqgC1O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 975f94c7d6c306b833628baa9aec3f79db1eb3a1  usb: core: hub: fix race condition about TRSMRCY of resume

elapsed time: 721m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                             allyesconfig
x86_64                           allyesconfig
um                               allmodconfig
riscv                            allyesconfig
mips                             allyesconfig
um                               allyesconfig
mips                             allmodconfig
riscv                            allmodconfig
m68k                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
arc                              allyesconfig
mips                  maltasmvp_eva_defconfig
powerpc                     taishan_defconfig
riscv             nommu_k210_sdcard_defconfig
arc                              alldefconfig
mips                        workpad_defconfig
mips                     decstation_defconfig
riscv                            alldefconfig
sh                          r7785rp_defconfig
arm                           u8500_defconfig
powerpc                       maple_defconfig
powerpc                 linkstation_defconfig
powerpc                  storcenter_defconfig
ia64                             alldefconfig
arm                     davinci_all_defconfig
mips                         tb0219_defconfig
sh                           sh2007_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      ep88xc_defconfig
sh                           se7712_defconfig
powerpc                     sequoia_defconfig
mips                       rbtx49xx_defconfig
mips                           ip27_defconfig
sh                           se7751_defconfig
arm                       spear13xx_defconfig
arc                          axs103_defconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
mips                           ip22_defconfig
powerpc                          allyesconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     asp8347_defconfig
powerpc                     tqm8540_defconfig
xtensa                       common_defconfig
arm                           viper_defconfig
sh                     sh7710voipgw_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc85xx_cds_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210513
i386                 randconfig-a001-20210513
i386                 randconfig-a006-20210513
i386                 randconfig-a005-20210513
i386                 randconfig-a004-20210513
i386                 randconfig-a002-20210513
x86_64               randconfig-a012-20210513
x86_64               randconfig-a015-20210513
x86_64               randconfig-a011-20210513
x86_64               randconfig-a013-20210513
x86_64               randconfig-a016-20210513
x86_64               randconfig-a014-20210513
i386                 randconfig-a016-20210513
i386                 randconfig-a014-20210513
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210513
x86_64               randconfig-a004-20210513
x86_64               randconfig-a001-20210513
x86_64               randconfig-a005-20210513
x86_64               randconfig-a002-20210513
x86_64               randconfig-a006-20210513

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
