Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A843A21C7B9
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jul 2020 08:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgGLG2S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jul 2020 02:28:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:37901 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgGLG2S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 12 Jul 2020 02:28:18 -0400
IronPort-SDR: xreuH0TFY3S7wrs5ziqF/8w1Xf/MYWS7fGPBx9TAk84kY6OFNTxD4gL7c/Xmgv5IqA0+RPr3VM
 IMsIfOUtaEpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9679"; a="128529957"
X-IronPort-AV: E=Sophos;i="5.75,342,1589266800"; 
   d="scan'208";a="128529957"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2020 23:28:18 -0700
IronPort-SDR: fZhx2UQ981QlHvARlxMXs9GNuwwVyPK9WimZcdchqQ+AzPYxKF2wpjzevhmv6FRmCNP4n0yT6H
 02Pz0A0EWd9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,342,1589266800"; 
   d="scan'208";a="315749098"
Received: from lkp-server02.sh.intel.com (HELO 7956a0bf35ab) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2020 23:28:16 -0700
Received: from kbuild by 7956a0bf35ab with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1juVTE-0000Ik-1M; Sun, 12 Jul 2020 06:28:16 +0000
Date:   Sun, 12 Jul 2020 14:27:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:gregkh] BUILD SUCCESS
 25051b55a2f6f05a15ba60f81e1f529b751aab5b
Message-ID: <5f0aad6a.hKlp/dzjhVy+RadO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  gregkh
branch HEAD: 25051b55a2f6f05a15ba60f81e1f529b751aab5b  udc: lpc32xx: make symbol 'lpc32xx_usbddata' static

elapsed time: 2846m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
xtensa                           allyesconfig
sh                           se7712_defconfig
arm                     am200epdkit_defconfig
sh                      rts7751r2d1_defconfig
arm                          gemini_defconfig
sh                        edosk7760_defconfig
arm                      footbridge_defconfig
ia64                            zx1_defconfig
arm                        spear3xx_defconfig
powerpc                       holly_defconfig
sh                             shx3_defconfig
sh                        dreamcast_defconfig
arm                          pxa168_defconfig
mips                      pic32mzda_defconfig
arm                          iop32x_defconfig
sh                         ap325rxa_defconfig
sh                          urquell_defconfig
powerpc                     skiroot_defconfig
arc                     nsimosci_hs_defconfig
powerpc                         ps3_defconfig
arm                      tct_hammer_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200710
i386                 randconfig-a005-20200710
i386                 randconfig-a006-20200710
i386                 randconfig-a002-20200710
i386                 randconfig-a003-20200710
i386                 randconfig-a004-20200710
x86_64               randconfig-a012-20200710
x86_64               randconfig-a011-20200710
x86_64               randconfig-a016-20200710
x86_64               randconfig-a014-20200710
x86_64               randconfig-a015-20200710
x86_64               randconfig-a013-20200710
i386                 randconfig-a016-20200712
i386                 randconfig-a015-20200712
i386                 randconfig-a011-20200712
i386                 randconfig-a012-20200712
i386                 randconfig-a013-20200712
i386                 randconfig-a014-20200712
x86_64               randconfig-a005-20200711
x86_64               randconfig-a002-20200711
x86_64               randconfig-a006-20200711
x86_64               randconfig-a001-20200711
x86_64               randconfig-a003-20200711
x86_64               randconfig-a004-20200711
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
