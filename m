Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5832FF98D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 01:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbhAVAni (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 19:43:38 -0500
Received: from mga06.intel.com ([134.134.136.31]:34104 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbhAVAni (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 19:43:38 -0500
IronPort-SDR: HvYgo3RBAjLhF6kg9QURr8P1zy6rTX1fFt6JVQlubEfmIG6riXS0v2Zf9IXCOKWaqbOsOGBGu+
 Yo834WbIcxQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="240907498"
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; 
   d="scan'208";a="240907498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 16:42:53 -0800
IronPort-SDR: y78uhqqMtaobpzacrGgwehKL/OomKFqrTQPNO1maEAHqcyea3W+z5Ttiqx5U2NeH4cb0em61cp
 kUK9E3iRp0Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; 
   d="scan'208";a="385543900"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Jan 2021 16:42:51 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l2kXL-0006nr-6X; Fri, 22 Jan 2021 00:42:51 +0000
Date:   Fri, 22 Jan 2021 08:42:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 386ce1d748edfdf57f21310647e2d42dd5f737f2
Message-ID: <600a1f7c.fbhXr/MDFHtMIOoi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 386ce1d748edfdf57f21310647e2d42dd5f737f2  usb: typec: tcpci_maxim: Drop GPIO includes

elapsed time: 724m

configs tested: 102
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
openrisc                         alldefconfig
arm                            lart_defconfig
arm                            pleb_defconfig
arm                         assabet_defconfig
sh                           se7619_defconfig
arm                        trizeps4_defconfig
powerpc                   motionpro_defconfig
c6x                        evmc6457_defconfig
mips                         tb0226_defconfig
mips                           ip22_defconfig
powerpc                        icon_defconfig
mips                        nlm_xlp_defconfig
arc                          axs101_defconfig
arc                        vdk_hs38_defconfig
x86_64                           alldefconfig
mips                          ath79_defconfig
sh                          lboxre2_defconfig
arm                         cm_x300_defconfig
mips                           ip27_defconfig
m68k                         amcore_defconfig
powerpc                     sequoia_defconfig
mips                          ath25_defconfig
arm                         orion5x_defconfig
arm                         s3c6400_defconfig
arm                           u8500_defconfig
powerpc                  storcenter_defconfig
powerpc                         wii_defconfig
xtensa                              defconfig
sh                   rts7751r2dplus_defconfig
m68k                       m5208evb_defconfig
arm                         lpc32xx_defconfig
sh                           se7780_defconfig
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
x86_64               randconfig-a002-20210121
x86_64               randconfig-a003-20210121
x86_64               randconfig-a001-20210121
x86_64               randconfig-a005-20210121
x86_64               randconfig-a006-20210121
x86_64               randconfig-a004-20210121
i386                 randconfig-a001-20210121
i386                 randconfig-a002-20210121
i386                 randconfig-a004-20210121
i386                 randconfig-a006-20210121
i386                 randconfig-a005-20210121
i386                 randconfig-a003-20210121
i386                 randconfig-a013-20210121
i386                 randconfig-a011-20210121
i386                 randconfig-a012-20210121
i386                 randconfig-a014-20210121
i386                 randconfig-a015-20210121
i386                 randconfig-a016-20210121
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
