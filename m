Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BD0354721
	for <lists+linux-usb@lfdr.de>; Mon,  5 Apr 2021 21:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240037AbhDETZq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 15:25:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:50129 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236263AbhDETZn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Apr 2021 15:25:43 -0400
IronPort-SDR: Hr8w9ff7N89sDwbiTRWRybWqhTjUvECcjBdzESSFTW8oaEV4+99hsrHFuWmPGPUgg6L4JkDH6P
 ANuZi/xzz7UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="193022978"
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; 
   d="scan'208";a="193022978"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 12:25:36 -0700
IronPort-SDR: +inHjQjvd/ozzcAwuVgrAk+ywFRTd+5YWKslIfBi5t2JUyCN3musC5BSeMpRGHgxazoU6DXZOp
 KlU8CW73zbqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; 
   d="scan'208";a="518720555"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2021 12:25:34 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lTUqr-000Aaf-Pr; Mon, 05 Apr 2021 19:25:33 +0000
Date:   Tue, 06 Apr 2021 03:25:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 363eaa3a450abb4e63bd6e3ad79d1f7a0f717814
Message-ID: <606b640f.pW9yH9gvC4FCFpZN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 363eaa3a450abb4e63bd6e3ad79d1f7a0f717814  usbip: synchronize event handler with sysfs code paths

elapsed time: 727m

configs tested: 106
configs skipped: 2

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
powerpc                   motionpro_defconfig
arm                         hackkit_defconfig
mips                      pic32mzda_defconfig
arm                     am200epdkit_defconfig
microblaze                      mmu_defconfig
nios2                         3c120_defconfig
powerpc                     rainier_defconfig
um                               allyesconfig
powerpc                       eiger_defconfig
powerpc                     kilauea_defconfig
openrisc                  or1klitex_defconfig
arm                       aspeed_g5_defconfig
arm                           spitz_defconfig
x86_64                              defconfig
mips                       lemote2f_defconfig
sh                           se7780_defconfig
m68k                          hp300_defconfig
arm                       cns3420vb_defconfig
um                             i386_defconfig
arm                            hisi_defconfig
sh                   sh7724_generic_defconfig
m68k                          sun3x_defconfig
mips                      pistachio_defconfig
mips                          ath25_defconfig
sh                          lboxre2_defconfig
sh                          rsk7203_defconfig
sh                          landisk_defconfig
i386                                defconfig
mips                       rbtx49xx_defconfig
mips                      maltasmvp_defconfig
xtensa                  nommu_kc705_defconfig
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
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210405
i386                 randconfig-a003-20210405
i386                 randconfig-a001-20210405
i386                 randconfig-a004-20210405
i386                 randconfig-a002-20210405
i386                 randconfig-a005-20210405
x86_64               randconfig-a014-20210405
x86_64               randconfig-a015-20210405
x86_64               randconfig-a013-20210405
x86_64               randconfig-a011-20210405
x86_64               randconfig-a012-20210405
x86_64               randconfig-a016-20210405
i386                 randconfig-a014-20210405
i386                 randconfig-a011-20210405
i386                 randconfig-a016-20210405
i386                 randconfig-a012-20210405
i386                 randconfig-a015-20210405
i386                 randconfig-a013-20210405
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210405
x86_64               randconfig-a003-20210405
x86_64               randconfig-a005-20210405
x86_64               randconfig-a001-20210405
x86_64               randconfig-a002-20210405
x86_64               randconfig-a006-20210405

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
