Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97111E71C6
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 02:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438165AbgE2Aps (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 20:45:48 -0400
Received: from mga17.intel.com ([192.55.52.151]:1120 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438062AbgE2Apr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 May 2020 20:45:47 -0400
IronPort-SDR: 05khAsYHBpAZ0KS4XueWONJ/jPWfr/FIkqhurkTyRnRKZPXOb2IP3qhJiaYAK+xvTNNfrGAyH5
 u7EZ+4ISx+9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 17:45:46 -0700
IronPort-SDR: 1jJNr1+TzYd0dyC0KCybd34BKy5bEu3Ka3jtZPeBOPd/UUJ9C1lbejs4ibYUMVJVfUYYYte4bD
 Gps7K9z7UWNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,446,1583222400"; 
   d="scan'208";a="257201605"
Received: from lkp-server02.sh.intel.com (HELO 5e8f22f9921b) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 May 2020 17:45:45 -0700
Received: from kbuild by 5e8f22f9921b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jeT9c-0000DB-VP; Fri, 29 May 2020 00:45:44 +0000
Date:   Fri, 29 May 2020 08:45:22 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 97fe809934dd2b0b37dfef3a2fc70417f485d7af
Message-ID: <5ed05b22.T8Is/7bRnQJHusmF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 97fe809934dd2b0b37dfef3a2fc70417f485d7af  CDC-ACM: heed quirk also in error handling

elapsed time: 2396m

configs tested: 91
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
sh                           se7724_defconfig
arm                            mmp2_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
arm                      footbridge_defconfig
arm                      jornada720_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                              allnoconfig
m68k                             allmodconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nios2                            allyesconfig
openrisc                         allyesconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                           allyesconfig
parisc                           allmodconfig
parisc                            allnoconfig
parisc                              defconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200527
i386                 randconfig-a004-20200527
i386                 randconfig-a003-20200527
i386                 randconfig-a006-20200527
i386                 randconfig-a002-20200527
i386                 randconfig-a005-20200527
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
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
um                               allyesconfig
um                               allmodconfig
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
