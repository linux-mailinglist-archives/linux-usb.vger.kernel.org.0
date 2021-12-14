Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D45B0473B7F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 04:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbhLNDZG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 22:25:06 -0500
Received: from mga14.intel.com ([192.55.52.115]:24850 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233081AbhLNDZF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Dec 2021 22:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639452305; x=1670988305;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kR5bE5kDngr7eHYIzjT5/VahVyeMzXXkryt3+8IuHV8=;
  b=cv37Q7WvHlLXHrP1uW4kabFdB6XS0+cBd0Dw7mbmEzH3VuLT2bUxQmEG
   s9gKaqtoGjIcFIPEMaw3TmjrgYPFbTPHslYHs+1B3jBdJHztJqnZCnvz2
   n2c3l7yiR+y3wZA1K+VOg3+HQt9YZSI5gD3ZuNg8nOyGEzE53QXAstEXZ
   rgEROr6SaBpcnK12K/O3CildZbS78osext9uAS3DJiN+DHdCnQ6MUqSRW
   4b3lnEmhl+/LCHMWUKxKCXl84cYqwc8g8ZyNWXTycvDN2+GqFbH6Ln1V7
   bvOcAmzNd+jHTDvr2w0t+Wiv6ewvxXYMt8At4gLr+pgfO+q98pm/JhTLk
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239111341"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="239111341"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 19:25:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="518043325"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Dec 2021 19:25:03 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwyR4-0007N1-PF; Tue, 14 Dec 2021 03:25:02 +0000
Date:   Tue, 14 Dec 2021 11:24:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 99ea221f2e2f2743314e348b25c1e2574b467528
Message-ID: <61b80e88.plRPhRxA8kTxHfEU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 99ea221f2e2f2743314e348b25c1e2574b467528  usb: cdnsp: Fix incorrect status for control request

elapsed time: 734m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211213
mips                             allyesconfig
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
riscv                            allyesconfig
powerpc                          allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
powerpc                     tqm5200_defconfig
powerpc                      walnut_defconfig
sh                ecovec24-romimage_defconfig
mips                           xway_defconfig
arm                        keystone_defconfig
powerpc                   motionpro_defconfig
arm                       imx_v6_v7_defconfig
arm                         s5pv210_defconfig
powerpc                     taishan_defconfig
powerpc                      acadia_defconfig
arm                          pxa3xx_defconfig
sh                           se7722_defconfig
arc                     haps_hs_smp_defconfig
mips                     decstation_defconfig
mips                          rm200_defconfig
xtensa                  audio_kc705_defconfig
powerpc                   bluestone_defconfig
mips                           mtx1_defconfig
m68k                       m5249evb_defconfig
mips                           gcw0_defconfig
mips                         tb0219_defconfig
powerpc                       ebony_defconfig
arm                        trizeps4_defconfig
arm                         at91_dt_defconfig
arm                       spear13xx_defconfig
powerpc64                        alldefconfig
sh                        sh7785lcr_defconfig
m68k                        stmark2_defconfig
i386                             alldefconfig
sh                         ap325rxa_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    sam440ep_defconfig
m68k                       m5208evb_defconfig
m68k                         apollo_defconfig
powerpc                       holly_defconfig
sh                              ul2_defconfig
m68k                       bvme6000_defconfig
powerpc                 canyonlands_defconfig
arm                           sunxi_defconfig
mips                           ip22_defconfig
openrisc                         alldefconfig
mips                         bigsur_defconfig
arc                 nsimosci_hs_smp_defconfig
openrisc                            defconfig
powerpc                  iss476-smp_defconfig
m68k                          hp300_defconfig
mips                          malta_defconfig
powerpc                     ksi8560_defconfig
arc                          axs101_defconfig
powerpc                      obs600_defconfig
m68k                          atari_defconfig
mips                     loongson1c_defconfig
openrisc                 simple_smp_defconfig
h8300                       h8s-sim_defconfig
arm                       multi_v4t_defconfig
mips                      loongson3_defconfig
arm                            qcom_defconfig
sh                           se7724_defconfig
mips                      bmips_stb_defconfig
mips                      pic32mzda_defconfig
powerpc                     mpc512x_defconfig
m68k                          multi_defconfig
arm                  randconfig-c002-20211213
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                           allnoconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a015-20211213
x86_64               randconfig-a016-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a016-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
arc                  randconfig-r043-20211213
riscv                randconfig-r042-20211213
s390                 randconfig-r044-20211213
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
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
riscv                randconfig-c006-20211213
mips                 randconfig-c004-20211213
i386                 randconfig-c001-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
x86_64               randconfig-a006-20211213
x86_64               randconfig-a005-20211213
x86_64               randconfig-a001-20211213
x86_64               randconfig-a002-20211213
x86_64               randconfig-a003-20211213
x86_64               randconfig-a004-20211213
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a006-20211213
i386                 randconfig-a004-20211213
hexagon              randconfig-r045-20211213
hexagon              randconfig-r041-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
