Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0997429F6B8
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 22:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgJ2VRm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 17:17:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:27812 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbgJ2VRl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 17:17:41 -0400
IronPort-SDR: +q7Cbe2K3QH8r7cJ3QIk6jgfOhIvQbLXMAhXatuvPJNg0hO71IUxOQkhS9B60PsvkAtU3mWLN9
 O3R1WdlSF9EQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168611154"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="168611154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 14:17:40 -0700
IronPort-SDR: klZSqWcY6E4xPQE4ejG/yVbpROXxq/J7PLgmYZwA74Odyto9Ioz8GUU0mzXMFj63oA81xu/C7e
 p2FmF2Fo5bRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="351614834"
Received: from lkp-server01.sh.intel.com (HELO c01187be935a) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Oct 2020 14:17:39 -0700
Received: from kbuild by c01187be935a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kYFIg-0000GN-T8; Thu, 29 Oct 2020 21:17:38 +0000
Date:   Fri, 30 Oct 2020 05:16:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 712da5fc4a66fbb1f144742e1b808498e932009b
Message-ID: <5f9b3149.xEBh6UxbBwQS7lEX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 712da5fc4a66fbb1f144742e1b808498e932009b  xhci: Don't create stream debugfs files with spinlock held.

elapsed time: 720m

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
sh                          urquell_defconfig
powerpc                    adder875_defconfig
arm                           sama5_defconfig
s390                       zfcpdump_defconfig
powerpc                       ebony_defconfig
m68k                          sun3x_defconfig
powerpc                         wii_defconfig
arm                          lpd270_defconfig
arm                  colibri_pxa300_defconfig
powerpc                 linkstation_defconfig
mips                     cu1000-neo_defconfig
arc                           tb10x_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                         hackkit_defconfig
arm                          gemini_defconfig
powerpc                 mpc8313_rdb_defconfig
sparc                       sparc64_defconfig
sh                        dreamcast_defconfig
sh                        edosk7705_defconfig
m68k                       m5475evb_defconfig
c6x                        evmc6678_defconfig
sh                            shmin_defconfig
c6x                        evmc6472_defconfig
sh                         ecovec24_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201029
i386                 randconfig-a005-20201029
i386                 randconfig-a003-20201029
i386                 randconfig-a001-20201029
i386                 randconfig-a004-20201029
i386                 randconfig-a006-20201029
i386                 randconfig-a016-20201029
i386                 randconfig-a014-20201029
i386                 randconfig-a015-20201029
x86_64               randconfig-a001-20201029
x86_64               randconfig-a002-20201029
x86_64               randconfig-a003-20201029
x86_64               randconfig-a006-20201029
x86_64               randconfig-a005-20201029
x86_64               randconfig-a004-20201029
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20201029
x86_64               randconfig-a013-20201029
x86_64               randconfig-a016-20201029
x86_64               randconfig-a015-20201029
x86_64               randconfig-a012-20201029
x86_64               randconfig-a014-20201029

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
