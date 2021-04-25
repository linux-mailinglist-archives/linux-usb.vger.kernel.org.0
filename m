Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6468136A42F
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 04:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhDYCeg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 22:34:36 -0400
Received: from mga14.intel.com ([192.55.52.115]:59954 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229514AbhDYCef (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Apr 2021 22:34:35 -0400
IronPort-SDR: SUHYQ2n2W3UhL0Q6f1nWkLEJGiQAe+qIJdxB65nSxNrUVc+9+80Ah4eVmEvqsp3Qmy3hKB+VkR
 I18T4arsYBxA==
X-IronPort-AV: E=McAfee;i="6200,9189,9964"; a="195761823"
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="195761823"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2021 19:33:56 -0700
IronPort-SDR: SBiHQRa/q0+UxOniNVb3kuVlSDvJJyh7bwtQVXXaTmlSZ91m+qo7NyjqnZ2QGGCXrhJX0FeG3i
 Ptk3pVpZSnHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,249,1613462400"; 
   d="scan'208";a="446919964"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2021 19:33:55 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1laUap-0005Kf-2t; Sun, 25 Apr 2021 02:33:55 +0000
Date:   Sun, 25 Apr 2021 10:33:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 caa93d9bd2d7ca7ffe5a23df9f003b81721c8e1b
Message-ID: <6084d4ff.DPDEisq5t9QtQdFb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: caa93d9bd2d7ca7ffe5a23df9f003b81721c8e1b  usb: Fix up movement of USB core kerneldoc location

elapsed time: 726m

configs tested: 119
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
mips                         tb0219_defconfig
powerpc                      obs600_defconfig
arm                       imx_v6_v7_defconfig
x86_64                           alldefconfig
arm                     am200epdkit_defconfig
sh                           se7705_defconfig
arm                       imx_v4_v5_defconfig
um                           x86_64_defconfig
riscv                             allnoconfig
mips                       lemote2f_defconfig
nios2                            alldefconfig
arm                           h3600_defconfig
mips                          rm200_defconfig
mips                       capcella_defconfig
powerpc                     skiroot_defconfig
sh                           se7780_defconfig
s390                          debug_defconfig
sh                        edosk7760_defconfig
mips                      bmips_stb_defconfig
powerpc                      ppc64e_defconfig
arm                        mvebu_v7_defconfig
mips                            e55_defconfig
arc                        vdk_hs38_defconfig
sh                          kfr2r09_defconfig
sh                               j2_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                         wii_defconfig
mips                           ip28_defconfig
arm                         hackkit_defconfig
sh                             sh03_defconfig
powerpc                   lite5200b_defconfig
um                             i386_defconfig
sh                            migor_defconfig
arm                     eseries_pxa_defconfig
arc                      axs103_smp_defconfig
powerpc                     tqm8555_defconfig
sh                           se7619_defconfig
mips                 decstation_r4k_defconfig
mips                  cavium_octeon_defconfig
sh                                  defconfig
powerpc                    adder875_defconfig
h8300                            alldefconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
i386                 randconfig-a005-20210424
i386                 randconfig-a002-20210424
i386                 randconfig-a001-20210424
i386                 randconfig-a006-20210424
i386                 randconfig-a004-20210424
i386                 randconfig-a003-20210424
x86_64               randconfig-a015-20210424
x86_64               randconfig-a016-20210424
x86_64               randconfig-a011-20210424
x86_64               randconfig-a014-20210424
x86_64               randconfig-a013-20210424
x86_64               randconfig-a012-20210424
i386                 randconfig-a012-20210424
i386                 randconfig-a014-20210424
i386                 randconfig-a011-20210424
i386                 randconfig-a013-20210424
i386                 randconfig-a015-20210424
i386                 randconfig-a016-20210424
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210424
x86_64               randconfig-a002-20210424
x86_64               randconfig-a001-20210424
x86_64               randconfig-a006-20210424
x86_64               randconfig-a005-20210424
x86_64               randconfig-a003-20210424

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
