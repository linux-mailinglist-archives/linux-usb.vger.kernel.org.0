Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D12A43CCE5
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 16:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237621AbhJ0PCT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 11:02:19 -0400
Received: from mga17.intel.com ([192.55.52.151]:5708 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237605AbhJ0PCT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Oct 2021 11:02:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="210958346"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; 
   d="scan'208";a="210958346"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 07:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; 
   d="scan'208";a="494863564"
Received: from lkp-server01.sh.intel.com (HELO 3b851179dbd8) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Oct 2021 07:59:49 -0700
Received: from kbuild by 3b851179dbd8 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mfkP6-0000e8-Mq; Wed, 27 Oct 2021 14:59:48 +0000
Date:   Wed, 27 Oct 2021 22:59:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 79a4479a17b83310deb0b1a2a274fe5be12d2318
Message-ID: <6179694b.CXLsDXVyCEzMkzML%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 79a4479a17b83310deb0b1a2a274fe5be12d2318  USB: iowarrior: fix control-message timeouts

elapsed time: 1289m

configs tested: 83
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211027
mips                         tb0287_defconfig
nios2                            alldefconfig
powerpc                     ep8248e_defconfig
powerpc                        fsp2_defconfig
sh                           se7721_defconfig
arm                    vt8500_v6_v7_defconfig
arm                     davinci_all_defconfig
arc                         haps_hs_defconfig
arc                            hsdk_defconfig
arm                          lpd270_defconfig
i386                             alldefconfig
powerpc                 mpc832x_rdb_defconfig
arm                       aspeed_g5_defconfig
mips                         tb0226_defconfig
openrisc                    or1ksim_defconfig
xtensa                    xip_kc705_defconfig
mips                     decstation_defconfig
powerpc                      bamboo_defconfig
mips                          ath25_defconfig
mips                         cobalt_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                  randconfig-c002-20211027
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20211027
x86_64               randconfig-a015-20211027
x86_64               randconfig-a011-20211027
x86_64               randconfig-a014-20211027
x86_64               randconfig-a016-20211027
x86_64               randconfig-a012-20211027
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
hexagon              randconfig-r045-20211027
hexagon              randconfig-r041-20211027

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
