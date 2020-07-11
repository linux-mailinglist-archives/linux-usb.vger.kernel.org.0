Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0EE21C300
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jul 2020 09:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgGKHK0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jul 2020 03:10:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:26375 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728119AbgGKHK0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Jul 2020 03:10:26 -0400
IronPort-SDR: Ae+l/JGGbUa3IB+4tM5d2xvt7GciBJTl9nPFsbmurMDM8mlK+EdPMcJFh46YBsI3yt22espQRF
 UsnzUUizaUKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="149825366"
X-IronPort-AV: E=Sophos;i="5.75,338,1589266800"; 
   d="scan'208";a="149825366"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2020 00:10:22 -0700
IronPort-SDR: 7WGCiSN/Z/3TbpnerfI6gNLn1mNI8LkPD+BxHhAiCZuVFrbRrge4xvlX1mNY6cxGB/cSSnuzEA
 A8gwG9eckz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,338,1589266800"; 
   d="scan'208";a="323755240"
Received: from lkp-server02.sh.intel.com (HELO 0fc60ea15964) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2020 00:10:08 -0700
Received: from kbuild by 0fc60ea15964 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ju9eB-0001FI-Ph; Sat, 11 Jul 2020 07:10:07 +0000
Date:   Sat, 11 Jul 2020 15:09:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 d1c0d96535d7464d1111727c79d6dac274b8bc4f
Message-ID: <5f0965a9.CvqKdCRKIxTn4htW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: d1c0d96535d7464d1111727c79d6dac274b8bc4f  Merge tag 'fixes-for-v5.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus

elapsed time: 1209m

configs tested: 123
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
arm                  colibri_pxa300_defconfig
arm                      tct_hammer_defconfig
arm                     am200epdkit_defconfig
arm                            dove_defconfig
sh                        sh7757lcr_defconfig
sh                          rsk7264_defconfig
sh                          rsk7269_defconfig
arc                     haps_hs_smp_defconfig
powerpc                 linkstation_defconfig
mips                           mtx1_defconfig
sh                        sh7763rdp_defconfig
arm                            zeus_defconfig
mips                         tb0287_defconfig
s390                          debug_defconfig
c6x                        evmc6678_defconfig
mips                  mips_paravirt_defconfig
powerpc                         ps3_defconfig
sh                      rts7751r2d1_defconfig
sh                             shx3_defconfig
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
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
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
i386                 randconfig-a016-20200710
i386                 randconfig-a015-20200710
i386                 randconfig-a011-20200710
i386                 randconfig-a012-20200710
i386                 randconfig-a013-20200710
i386                 randconfig-a014-20200710
i386                 randconfig-a016-20200711
i386                 randconfig-a015-20200711
i386                 randconfig-a011-20200711
i386                 randconfig-a012-20200711
i386                 randconfig-a013-20200711
i386                 randconfig-a014-20200711
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
