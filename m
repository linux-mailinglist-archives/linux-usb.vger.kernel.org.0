Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146D4217F77
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 08:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgGHGQd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 02:16:33 -0400
Received: from mga04.intel.com ([192.55.52.120]:59689 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgGHGQd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 02:16:33 -0400
IronPort-SDR: Gu+CLvknaUPCJT5LsNvYU2OwyEztLhZKIyP9HfpmurHki0LeQ+YRo0XyCql+ZpkpoQj2HMMXux
 7ZoWXGldfI1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="145247688"
X-IronPort-AV: E=Sophos;i="5.75,326,1589266800"; 
   d="scan'208";a="145247688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 23:16:31 -0700
IronPort-SDR: 7AODaR20z/zgdTDLF9AA3KQbeaZ3de6CG0mx2UDBNFa6YDoBftMqDb5bxKViQXgqPskmKxY3W2
 GGIi9dA+f7/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,326,1589266800"; 
   d="scan'208";a="358008837"
Received: from lkp-server01.sh.intel.com (HELO f2047cb89c8e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Jul 2020 23:16:30 -0700
Received: from kbuild by f2047cb89c8e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jt3Nd-0000Zp-Pn; Wed, 08 Jul 2020 06:16:29 +0000
Date:   Wed, 08 Jul 2020 14:15:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 876d4e1e8298ad1f94d9e9392fc90486755437b4
Message-ID: <5f056487.TFJxsvBvfl2R7Q4L%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 876d4e1e8298ad1f94d9e9392fc90486755437b4  usb: chipidea: core: add wakeup support for extcon

elapsed time: 725m

configs tested: 102
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
s390                       zfcpdump_defconfig
nios2                            alldefconfig
sh                          r7785rp_defconfig
arm                        trizeps4_defconfig
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
i386                 randconfig-a001-20200707
i386                 randconfig-a002-20200707
i386                 randconfig-a006-20200707
i386                 randconfig-a004-20200707
i386                 randconfig-a005-20200707
i386                 randconfig-a003-20200707
x86_64               randconfig-a012-20200707
x86_64               randconfig-a016-20200707
x86_64               randconfig-a014-20200707
x86_64               randconfig-a011-20200707
x86_64               randconfig-a015-20200707
x86_64               randconfig-a013-20200707
i386                 randconfig-a011-20200707
i386                 randconfig-a014-20200707
i386                 randconfig-a015-20200707
i386                 randconfig-a016-20200707
i386                 randconfig-a012-20200707
i386                 randconfig-a013-20200707
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
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
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
