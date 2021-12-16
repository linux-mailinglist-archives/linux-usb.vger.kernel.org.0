Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963F847720F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 13:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236873AbhLPMnD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 07:43:03 -0500
Received: from mga06.intel.com ([134.134.136.31]:24524 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231686AbhLPMnD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Dec 2021 07:43:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639658583; x=1671194583;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HW898JVMxfHU736NSyIN9/1A76wdfxK68kkEocM33kY=;
  b=WMTYzUG7UCKRIPt5MfFHIaVs6ae09UCMDUqAxH41W+kypVpOQTP2vzsS
   H9QywOelfBlshX5/4lxOVTe4oKlC6iSgccv7k5WQY5p6eOf5PizEqYqv+
   TLv7Z2h16GbtGkKNghlS//sS3QxHzkmm1APZP2PLHSaJ007nSGbIaT+4t
   xG22qPVEc3oQvWSdj3K5RcM7P9luKQ5ZmDE4I1Me8V7Yoax2mynFTzrbf
   0VOCSgGbIl81gtP6ls8Qc9swelYXWMRHF50pdzq2kTvWHhilEJy3nIgNd
   vsSrJ0xTJwOQlSJ4sznx4P9/5q43mg2YDfvR7u8QHRwCUAo2WvNpGSbC5
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="300252751"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="300252751"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 04:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="519233257"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Dec 2021 04:43:01 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxq68-00038r-W1; Thu, 16 Dec 2021 12:43:00 +0000
Date:   Thu, 16 Dec 2021 20:42:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ca4d8344a72b91fb9d4c8bfbc22204b4c09c5d8f
Message-ID: <61bb3424.Tufhp6bnwU+Ya/Pt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ca4d8344a72b91fb9d4c8bfbc22204b4c09c5d8f  usb: typec: tcpm: fix tcpm unregister port but leave a pending timer

elapsed time: 738m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211216
mips                             allyesconfig
mips                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
m68k                          hp300_defconfig
arm                        clps711x_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     tqm8540_defconfig
arm                       cns3420vb_defconfig
arm                            dove_defconfig
arm                        trizeps4_defconfig
arc                          axs103_defconfig
mips                           mtx1_defconfig
arm                       netwinder_defconfig
sh                        dreamcast_defconfig
powerpc                        cell_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc8315_rdb_defconfig
m68k                        stmark2_defconfig
sh                          lboxre2_defconfig
powerpc                      chrp32_defconfig
m68k                            q40_defconfig
powerpc                     sequoia_defconfig
sh                                  defconfig
sh                          rsk7203_defconfig
sh                        edosk7760_defconfig
mips                          ath79_defconfig
powerpc                      walnut_defconfig
powerpc                     mpc83xx_defconfig
mips                         tb0226_defconfig
h8300                            alldefconfig
powerpc                     kmeter1_defconfig
arm                         shannon_defconfig
sh                          landisk_defconfig
powerpc                    adder875_defconfig
mips                      pic32mzda_defconfig
arm                            mmp2_defconfig
sparc                               defconfig
powerpc                      katmai_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          lpd270_defconfig
mips                           ci20_defconfig
arm                              alldefconfig
sh                           se7722_defconfig
sh                   secureedge5410_defconfig
mips                        qi_lb60_defconfig
arm                        keystone_defconfig
powerpc                      ppc40x_defconfig
arm                        mvebu_v5_defconfig
sparc64                             defconfig
arm                         s5pv210_defconfig
h8300                       h8s-sim_defconfig
arm                           h3600_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                               j2_defconfig
sh                        edosk7705_defconfig
mips                         tb0287_defconfig
powerpc                     powernv_defconfig
arc                      axs103_smp_defconfig
arm                         orion5x_defconfig
m68k                       m5275evb_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20211216
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
i386                 randconfig-a001-20211214
i386                 randconfig-a002-20211214
i386                 randconfig-a005-20211214
i386                 randconfig-a003-20211214
arc                  randconfig-r043-20211216
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20211216
x86_64               randconfig-a014-20211216
x86_64               randconfig-a012-20211216
x86_64               randconfig-a013-20211216
x86_64               randconfig-a016-20211216
x86_64               randconfig-a015-20211216
hexagon              randconfig-r045-20211214
s390                 randconfig-r044-20211214
riscv                randconfig-r042-20211214
hexagon              randconfig-r041-20211214
hexagon              randconfig-r045-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216
hexagon              randconfig-r041-20211216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
