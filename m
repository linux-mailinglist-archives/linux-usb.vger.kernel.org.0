Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A15200019
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 04:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgFSCLj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 22:11:39 -0400
Received: from mga06.intel.com ([134.134.136.31]:1283 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbgFSCLh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 22:11:37 -0400
IronPort-SDR: zaZohx96aa0Yr4AFOM2Fe0E+mP2x+HMll/bHumr+ih5XCaAWXC7P0Jt7AU6v/0QsVYY2cR0+h0
 0rZR3gY09N3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="204283162"
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; 
   d="scan'208";a="204283162"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 19:11:24 -0700
IronPort-SDR: YFLDehT5kRWUJ1V1CjsgUZuuD/DEWa7Jy0han17lYH17QT6YjVNdvvDOqiIJBl/Sy3N6hcZgzy
 AJmMFIQjxKTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; 
   d="scan'208";a="299904113"
Received: from lkp-server02.sh.intel.com (HELO 5ce11009e457) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2020 19:11:23 -0700
Received: from kbuild by 5ce11009e457 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jm6V1-0000Yl-0F; Fri, 19 Jun 2020 02:11:23 +0000
Date:   Fri, 19 Jun 2020 10:11:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 81c7462883b0cc0a4eeef0687f80ad5b5baee5f6
Message-ID: <5eec1ec1.StCho05UuhM+NnTU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 81c7462883b0cc0a4eeef0687f80ad5b5baee5f6  USB: replace hardcode maximum usb string length by definition

elapsed time: 721m

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
i386                 randconfig-a013-20200618
i386                 randconfig-a016-20200618
i386                 randconfig-a012-20200618
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
um                                  defconfig
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
