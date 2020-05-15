Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C7D1D5BF6
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 23:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgEOVwN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 17:52:13 -0400
Received: from mga01.intel.com ([192.55.52.88]:7886 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbgEOVwL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 May 2020 17:52:11 -0400
IronPort-SDR: K9ZzzwcuUvMN+O7Z+Lp04Nv1Fh5pnglQ/I/ORed0srgGi5LN8Ua5vFhtiybSfIiFAJY8Zb5G3j
 CHVvEK2wfDtA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 14:52:11 -0700
IronPort-SDR: f4XboHA/2K0FsbTrx6m4xFOJIg4VQx3FSGRjP+u4+y0sUabw5M0naDhUdcg5aZnV0oDLCRYWkQ
 kCmyjSEZTLOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; 
   d="scan'208";a="342103833"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 May 2020 14:52:09 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jZiFV-0005MI-29; Sat, 16 May 2020 05:52:09 +0800
Date:   Sat, 16 May 2020 05:51:32 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 15753588bcd4bbffae1cca33c8ced5722477fe1f
Message-ID: <5ebf0ee4.dVUeQoFjs3ZMp1df%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 15753588bcd4bbffae1cca33c8ced5722477fe1f  USB: gadget: fix illegal array access in binding with UDC

elapsed time: 484m

configs tested: 106
configs skipped: 2

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
sparc                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
sh                          sdk7780_defconfig
arm                        mini2440_defconfig
powerpc                         wii_defconfig
m68k                            mac_defconfig
sh                           se7780_defconfig
arc                                 defconfig
arm                        shmobile_defconfig
m68k                       m5208evb_defconfig
parisc                              defconfig
sparc64                          allmodconfig
mips                          lasat_defconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200515
i386                 randconfig-a005-20200515
i386                 randconfig-a003-20200515
i386                 randconfig-a001-20200515
i386                 randconfig-a004-20200515
i386                 randconfig-a002-20200515
i386                 randconfig-a012-20200515
i386                 randconfig-a016-20200515
i386                 randconfig-a014-20200515
i386                 randconfig-a011-20200515
i386                 randconfig-a013-20200515
i386                 randconfig-a015-20200515
x86_64               randconfig-a005-20200515
x86_64               randconfig-a003-20200515
x86_64               randconfig-a006-20200515
x86_64               randconfig-a004-20200515
x86_64               randconfig-a001-20200515
x86_64               randconfig-a002-20200515
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
