Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F80A479914
	for <lists+linux-usb@lfdr.de>; Sat, 18 Dec 2021 07:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhLRGBh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Dec 2021 01:01:37 -0500
Received: from mga07.intel.com ([134.134.136.100]:14347 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230518AbhLRGBh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 18 Dec 2021 01:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639807297; x=1671343297;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=clkottYU+Iqb77/oBjZphZZ3LKSQnf9gPktUR++yhcI=;
  b=Th2Gcr1k2BAOMECgXjcSo8M24Od/zYwjavNK1JyDWMxukLXnrXpmanma
   aGo31dzOHvX7rdtWwgbAmrU1YonnHQ0JRpfY4A/oxjQdzL/pqiNeRamJ7
   e7IoYY5kBKTx7Hdef9IC5M/91LnpYEHFa3uUKflJAxuce2OBkt0StXSr+
   gHpWSUxzvDotLA/EqTf3DZE+HdBQ+bpwtf4NrkjjbRHkSEmlIbR92HAXg
   f7CvuDrkOutDLyr8yc9WURdWdCT7ePLrupsw2/71QW+yhcYi5jThxlt4t
   cA8kWaIS1InfRtpQQjr6m905Wb50dZ8Ln366sk/d3tsxTSNEn5zQG7Gdo
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="303267229"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="303267229"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 22:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="756693980"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Dec 2021 22:01:35 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mySmk-0005gN-Lf; Sat, 18 Dec 2021 06:01:34 +0000
Date:   Sat, 18 Dec 2021 14:00:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f2b42379c57682d4b127283da109fa1a3317966a
Message-ID: <61bd7901.cRwyp+Ui++6aILMo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f2b42379c57682d4b127283da109fa1a3317966a  usb: misc: ehset: Rework test mode entry

elapsed time: 723m

configs tested: 132
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20211216
sh                          rsk7203_defconfig
powerpc                    amigaone_defconfig
arm                            lart_defconfig
arc                         haps_hs_defconfig
sh                            titan_defconfig
xtensa                         virt_defconfig
powerpc                       ppc64_defconfig
powerpc                      ppc6xx_defconfig
microblaze                      mmu_defconfig
arc                        nsimosci_defconfig
mips                            ar7_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                       bvme6000_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                              alldefconfig
sparc                               defconfig
arm                       imx_v6_v7_defconfig
powerpc                      cm5200_defconfig
arm                   milbeaut_m10v_defconfig
arm                        multi_v7_defconfig
powerpc                      tqm8xx_defconfig
mips                         tb0219_defconfig
mips                           rs90_defconfig
arc                           tb10x_defconfig
nds32                             allnoconfig
h8300                       h8s-sim_defconfig
powerpc                       ebony_defconfig
m68k                            mac_defconfig
arm                          pxa168_defconfig
i386                             alldefconfig
powerpc                     powernv_defconfig
m68k                         apollo_defconfig
m68k                        m5407c3_defconfig
mips                       capcella_defconfig
mips                  cavium_octeon_defconfig
powerpc                 mpc832x_mds_defconfig
mips                    maltaup_xpa_defconfig
riscv                          rv32_defconfig
m68k                        stmark2_defconfig
powerpc                      makalu_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      walnut_defconfig
mips                        omega2p_defconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
sh                           se7721_defconfig
arm                         s3c6400_defconfig
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
arm                          iop32x_defconfig
arm                         vf610m4_defconfig
arm                         assabet_defconfig
arm                  randconfig-c002-20211216
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
i386                 randconfig-a013-20211217
i386                 randconfig-a011-20211217
i386                 randconfig-a016-20211217
i386                 randconfig-a014-20211217
i386                 randconfig-a015-20211217
i386                 randconfig-a012-20211217
arc                  randconfig-r043-20211217
s390                 randconfig-r044-20211217
riscv                randconfig-r042-20211217
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
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
hexagon              randconfig-r045-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216
hexagon              randconfig-r041-20211216
hexagon              randconfig-r045-20211217
hexagon              randconfig-r041-20211217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
