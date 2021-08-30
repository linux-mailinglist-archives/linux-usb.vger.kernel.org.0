Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99AA3FB0FD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Aug 2021 08:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhH3GCd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Aug 2021 02:02:33 -0400
Received: from mga01.intel.com ([192.55.52.88]:64275 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231911AbhH3GCc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Aug 2021 02:02:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="240449993"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="240449993"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2021 23:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="689136135"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2021 23:01:17 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mKaM8-0004u2-Lo; Mon, 30 Aug 2021 06:01:16 +0000
Date:   Mon, 30 Aug 2021 14:00:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 068fdad20454f815e61e6f6eb9f051a8b3120e88
Message-ID: <612c7402.cdUoDD+ONQ1cbbqP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 068fdad20454f815e61e6f6eb9f051a8b3120e88  usb: gadget: u_audio: fix race condition on endpoint stop

elapsed time: 3827m

configs tested: 122
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                            allyesconfig
i386                 randconfig-c001-20210829
mips                 randconfig-c004-20210829
nios2                         10m50_defconfig
sparc                       sparc64_defconfig
arm                     am200epdkit_defconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc836x_mds_defconfig
mips                         tb0219_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           sunxi_defconfig
m68k                        m5307c3_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                        multi_v5_defconfig
powerpc                      ppc44x_defconfig
mips                        nlm_xlp_defconfig
sh                          kfr2r09_defconfig
arm                           sama5_defconfig
sparc                            alldefconfig
parisc                generic-32bit_defconfig
arm                        keystone_defconfig
arm                          pxa168_defconfig
mips                         rt305x_defconfig
arc                     haps_hs_smp_defconfig
arm                        shmobile_defconfig
mips                           rs90_defconfig
arm                            hisi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20210829
x86_64               randconfig-a016-20210829
x86_64               randconfig-a015-20210829
x86_64               randconfig-a012-20210829
x86_64               randconfig-a013-20210829
x86_64               randconfig-a011-20210829
x86_64               randconfig-a014-20210827
x86_64               randconfig-a015-20210827
x86_64               randconfig-a016-20210827
x86_64               randconfig-a013-20210827
x86_64               randconfig-a012-20210827
x86_64               randconfig-a011-20210827
i386                 randconfig-a011-20210829
i386                 randconfig-a016-20210829
i386                 randconfig-a012-20210829
i386                 randconfig-a014-20210829
i386                 randconfig-a013-20210829
i386                 randconfig-a015-20210829
i386                 randconfig-a016-20210830
i386                 randconfig-a011-20210830
i386                 randconfig-a015-20210830
i386                 randconfig-a014-20210830
i386                 randconfig-a012-20210830
i386                 randconfig-a013-20210830
arc                  randconfig-r043-20210829
riscv                randconfig-r042-20210829
s390                 randconfig-r044-20210829
arc                  randconfig-r043-20210827
riscv                randconfig-r042-20210827
s390                 randconfig-r044-20210827
s390                 randconfig-r044-20210830
arc                  randconfig-r043-20210830
riscv                randconfig-r042-20210830
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20210829
x86_64               randconfig-a006-20210829
x86_64               randconfig-a005-20210829
x86_64               randconfig-a003-20210829
x86_64               randconfig-a004-20210829
x86_64               randconfig-a002-20210829
i386                 randconfig-a001-20210829
i386                 randconfig-a006-20210829
i386                 randconfig-a002-20210829
i386                 randconfig-a005-20210829
i386                 randconfig-a004-20210829
i386                 randconfig-a003-20210829

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
