Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C661FFD7F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 23:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgFRVmh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 17:42:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:10230 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgFRVmg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 17:42:36 -0400
IronPort-SDR: YqxLjclnXGQZBOFbdMwIEusItKNZCSYt+lrKupXnllFPQheFp5NohdvGdEaPH49KVGAVMZD8a8
 YARVnWb+gyaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="130109495"
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; 
   d="scan'208";a="130109495"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 14:42:35 -0700
IronPort-SDR: hktt9gbymBrAhJQ1cF9USc4yA6oZStxEe1faMNwKoAgpy8dRr/Tu31e1jaxoTSXCvfaRL/GKT9
 NFCI9OD01abQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; 
   d="scan'208";a="277767850"
Received: from lkp-server02.sh.intel.com (HELO 5ce11009e457) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Jun 2020 14:42:34 -0700
Received: from kbuild by 5ce11009e457 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jm2Ir-0000Qy-FF; Thu, 18 Jun 2020 21:42:33 +0000
Date:   Fri, 19 Jun 2020 05:42:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:gregkh] BUILD SUCCESS
 3e4288897d543e7753d5b806d071ed2f39d88379
Message-ID: <5eebdfaf.FhkmdwQ4yAll1fQr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  gregkh
branch HEAD: 3e4288897d543e7753d5b806d071ed2f39d88379  USB: OTG: rename product list of devices

elapsed time: 723m

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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200618
i386                 randconfig-a006-20200618
i386                 randconfig-a001-20200618
i386                 randconfig-a004-20200618
i386                 randconfig-a005-20200618
i386                 randconfig-a003-20200618
x86_64               randconfig-a001-20200618
x86_64               randconfig-a003-20200618
x86_64               randconfig-a006-20200618
x86_64               randconfig-a002-20200618
x86_64               randconfig-a005-20200618
x86_64               randconfig-a004-20200618
i386                 randconfig-a011-20200618
i386                 randconfig-a015-20200618
i386                 randconfig-a014-20200618
i386                 randconfig-a016-20200618
i386                 randconfig-a012-20200618
i386                 randconfig-a013-20200618
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
