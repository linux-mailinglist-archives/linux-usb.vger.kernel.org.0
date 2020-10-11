Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B38128A4DE
	for <lists+linux-usb@lfdr.de>; Sun, 11 Oct 2020 02:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbgJKAl7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Oct 2020 20:41:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:61280 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbgJKAl6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 10 Oct 2020 20:41:58 -0400
IronPort-SDR: BCF28nkS91RW7D3/Q27txFJftUPcIZRe06gMMk4kfantC2faBcsVyturRnyPtP2ghGPEkIwQs5
 w79OtsflbCFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9770"; a="145478706"
X-IronPort-AV: E=Sophos;i="5.77,360,1596524400"; 
   d="scan'208";a="145478706"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2020 17:41:58 -0700
IronPort-SDR: CdEw1g2pN3GPfKXFvKqM0pF2uTrTeyV3QzUveeUIu3rC1exgl0HKfU0E/8kFsLdL+Sxk/Tj4KB
 66mISgY0LToQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,360,1596524400"; 
   d="scan'208";a="519144936"
Received: from lkp-server02.sh.intel.com (HELO 92b3fbfaed90) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2020 17:41:57 -0700
Received: from kbuild by 92b3fbfaed90 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kRPQy-0000LS-Gf; Sun, 11 Oct 2020 00:41:56 +0000
Date:   Sun, 11 Oct 2020 08:41:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 93578a25d4e21603518daf27a5f9caa4bf79de68
Message-ID: <5f8254a1.TXenp7HVJdAf5eCY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 93578a25d4e21603518daf27a5f9caa4bf79de68  usb: musb: gadget: Use fallthrough pseudo-keyword

elapsed time: 720m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
powerpc                     pseries_defconfig
arm                         lpc32xx_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          moxart_defconfig
c6x                        evmc6678_defconfig
mips                            ar7_defconfig
powerpc                      ppc6xx_defconfig
sh                             shx3_defconfig
openrisc                 simple_smp_defconfig
arc                      axs103_smp_defconfig
arm                           sama5_defconfig
powerpc                    gamecube_defconfig
powerpc                     mpc83xx_defconfig
powerpc                     stx_gp3_defconfig
mips                           ci20_defconfig
mips                malta_kvm_guest_defconfig
c6x                        evmc6457_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                         wii_defconfig
powerpc                     tqm8548_defconfig
powerpc                  iss476-smp_defconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                 randconfig-a005-20201010
i386                 randconfig-a006-20201010
i386                 randconfig-a001-20201010
i386                 randconfig-a003-20201010
i386                 randconfig-a004-20201010
i386                 randconfig-a002-20201010
x86_64               randconfig-a016-20201010
x86_64               randconfig-a015-20201010
x86_64               randconfig-a012-20201010
x86_64               randconfig-a013-20201010
x86_64               randconfig-a014-20201010
x86_64               randconfig-a011-20201010
i386                 randconfig-a016-20201010
i386                 randconfig-a015-20201010
i386                 randconfig-a013-20201010
i386                 randconfig-a012-20201010
i386                 randconfig-a011-20201010
i386                 randconfig-a014-20201010
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
x86_64               randconfig-a004-20201010
x86_64               randconfig-a002-20201010
x86_64               randconfig-a006-20201010
x86_64               randconfig-a001-20201010
x86_64               randconfig-a003-20201010
x86_64               randconfig-a005-20201010

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
