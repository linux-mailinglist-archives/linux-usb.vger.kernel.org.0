Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3654A5550
	for <lists+linux-usb@lfdr.de>; Tue,  1 Feb 2022 03:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiBACkG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 21:40:06 -0500
Received: from mga17.intel.com ([192.55.52.151]:61778 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232574AbiBACkF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Jan 2022 21:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643683205; x=1675219205;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=56n50xudwjsZKNNlNlAM5agdD5HeI7mpB+bMAriIZuk=;
  b=G7O2GZMJFEAnie2ZYgzVGSOVAvTX+Y0xkG9hpbgp1qagbcgR/KFsva1o
   HBGuGB8MaUdiFaGLo4PDFM8tDDS2jyW78U4kP2TKHQk19y4QOsHsF21Xo
   P92ntwS/seGNZsj4gX5HU0gsCGftW4+AT+CDjMwtimOkgjGGDhjpS7vmt
   VWkvvyeui5FE1NxL71SE0oQ6NbPcG1/I8RsZ981G9vOsywLfZp8wRFG9/
   N4qgGCXWQeiTReY3vzIhgkY3527BsL33PhthHkH+S5ATK+R3Bwf+LwwrT
   m/iv2ztuMHbzgSk2XrXCto1BCUi4M9XmwDJx6SQbvUjNCCxLh5xmKQM3T
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="228269284"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="228269284"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 18:39:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="482032965"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Jan 2022 18:39:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEj4X-000Sdy-5r; Tue, 01 Feb 2022 02:39:09 +0000
Date:   Tue, 01 Feb 2022 10:38:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 554237f2bb62c4fcf01372e4c63d3e0062f27bac
Message-ID: <61f89d12.MmSr09V7Wz4nUwDi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 554237f2bb62c4fcf01372e4c63d3e0062f27bac  usb: gadget: f_uac2: Add speed names to bInterval dbg/warn

elapsed time: 727m

configs tested: 145
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
sh                          rsk7203_defconfig
mips                           xway_defconfig
um                               alldefconfig
powerpc                 mpc834x_mds_defconfig
sh                          urquell_defconfig
arm                       imx_v6_v7_defconfig
arc                            hsdk_defconfig
powerpc                     taishan_defconfig
mips                             allmodconfig
m68k                       m5475evb_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7763rdp_defconfig
mips                         mpc30x_defconfig
sh                 kfr2r09-romimage_defconfig
sh                               alldefconfig
arm                          pxa910_defconfig
arm                          lpd270_defconfig
m68k                       m5208evb_defconfig
mips                 decstation_r4k_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
sh                          rsk7269_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_rdb_defconfig
parisc                           alldefconfig
xtensa                           allyesconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc837x_mds_defconfig
arm                           stm32_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     asp8347_defconfig
arm                      footbridge_defconfig
mips                         cobalt_defconfig
sh                          lboxre2_defconfig
arc                                 defconfig
m68k                          sun3x_defconfig
mips                      maltasmvp_defconfig
openrisc                         alldefconfig
mips                         db1xxx_defconfig
arm                       omap2plus_defconfig
mips                       capcella_defconfig
sh                        apsh4ad0a_defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220130
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
h8300                            allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a002-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220130
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
powerpc                          allyesconfig
arm                             mxs_defconfig
arm                        spear3xx_defconfig
arm                           sama7_defconfig
powerpc                     kilauea_defconfig
mips                           ip22_defconfig
powerpc                  mpc866_ads_defconfig
arm                          pcm027_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
