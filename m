Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F418201AE7
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 21:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732182AbgFSTKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 15:10:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:26980 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732009AbgFSTKm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Jun 2020 15:10:42 -0400
IronPort-SDR: Xj3q55toI/9HXRjUWOH4lAOX9IVuFjwnwZsrl7EeDCicyF0EhhKZwy2EaJu7cX+O0ONIsPZdat
 fRKyo3OUDkHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="208297458"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
   d="scan'208";a="208297458"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2020 12:10:42 -0700
IronPort-SDR: pcmy1tv1lYEyQ0VymyEul2qp2NB4T9MsOdN0b9fgM8IcgT7tsLGrTaz03Zv2TdP4SIEIKMHlaP
 ZZZOid05C8tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
   d="scan'208";a="265147816"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Jun 2020 12:10:40 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jmMPQ-00008n-4g; Fri, 19 Jun 2020 19:10:40 +0000
Date:   Sat, 20 Jun 2020 03:10:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:gregkh] BUILD SUCCESS
 6c502ca4df099bd92188c72974091ed35814f938
Message-ID: <5eed0d8f.fp0gxNTvWL8TKAe0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  gregkh
branch HEAD: 6c502ca4df099bd92188c72974091ed35814f938  USB: ch9: add "USB_" prefix in front of TEST defines

elapsed time: 724m

configs tested: 98
configs skipped: 1

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
xtensa                           allyesconfig
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
i386                 randconfig-a002-20200619
i386                 randconfig-a006-20200619
i386                 randconfig-a001-20200619
i386                 randconfig-a004-20200619
i386                 randconfig-a005-20200619
i386                 randconfig-a003-20200619
x86_64               randconfig-a015-20200619
x86_64               randconfig-a016-20200619
x86_64               randconfig-a011-20200619
x86_64               randconfig-a012-20200619
x86_64               randconfig-a014-20200619
x86_64               randconfig-a013-20200619
i386                 randconfig-a011-20200619
i386                 randconfig-a015-20200619
i386                 randconfig-a014-20200619
i386                 randconfig-a013-20200619
i386                 randconfig-a016-20200619
i386                 randconfig-a012-20200619
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
