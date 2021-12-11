Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0991847110A
	for <lists+linux-usb@lfdr.de>; Sat, 11 Dec 2021 04:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhLKDEG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 22:04:06 -0500
Received: from mga11.intel.com ([192.55.52.93]:4401 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229886AbhLKDEE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Dec 2021 22:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639191629; x=1670727629;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yxZ+JhYCzfBS7JQ7ZQBWAecQudaCS0S7/3s6CFcHbJg=;
  b=Ib9EPascODyXKOwlgJt5NXSJfa8qE2tErxQe6cGJ26vuaeb/zOVW8tLA
   xD/o2InCLN3Sm6g/3S6UU1ekB6vsc7ggmPadbYAjTxMA+grDqmigBCdwk
   vcEXPALQaGtUPz30WMM9HR6V2hQt+woNKNIVRi5VFUCPRdw7JB1r1GhSu
   AayJe2NjMyb/REkg7CPTx+/y7gqK7erJ7UG+8CAyTAKhiDXoS9S37RETf
   kjH9Da7Ti1lo9dDn9eM923xDTCXB6hrWyJ4QqXXGoxfdAJPbZLbrqFkXU
   n67lxHrAaxqPz7riZr4jphCketwvh7a8MgHGgqZ0Eiym7qlitU6+JVx6t
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="236016147"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="236016147"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 19:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="517025173"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2021 19:00:27 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mvscc-00040i-5j; Sat, 11 Dec 2021 03:00:26 +0000
Date:   Sat, 11 Dec 2021 11:00:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 7faac1953ed1f658f719cdf7bb7303fa5eef822c
Message-ID: <61b4143a.qlHSAqK0IpZ40jBt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 7faac1953ed1f658f719cdf7bb7303fa5eef822c  xhci: avoid race between disable slot command and host runtime suspend

elapsed time: 723m

configs tested: 174
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211210
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
sh                          r7780mp_defconfig
powerpc                          g5_defconfig
arm                  colibri_pxa270_defconfig
m68k                                defconfig
sh                          rsk7269_defconfig
m68k                             allmodconfig
arm                         lubbock_defconfig
powerpc                         wii_defconfig
mips                      loongson3_defconfig
sh                          lboxre2_defconfig
openrisc                         alldefconfig
powerpc                       ebony_defconfig
arm                           h5000_defconfig
sh                      rts7751r2d1_defconfig
arm                       aspeed_g5_defconfig
sparc64                             defconfig
arm                          ixp4xx_defconfig
sh                           se7780_defconfig
mips                     cu1830-neo_defconfig
powerpc                 xes_mpc85xx_defconfig
ia64                        generic_defconfig
arm                           sama7_defconfig
powerpc                       holly_defconfig
powerpc                   motionpro_defconfig
powerpc                    mvme5100_defconfig
sh                   sh7770_generic_defconfig
powerpc                        icon_defconfig
h8300                       h8s-sim_defconfig
i386                             alldefconfig
arc                    vdk_hs38_smp_defconfig
mips                    maltaup_xpa_defconfig
mips                         cobalt_defconfig
mips                        bcm63xx_defconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
arc                     nsimosci_hs_defconfig
xtensa                generic_kc705_defconfig
x86_64                           alldefconfig
powerpc                      ppc6xx_defconfig
xtensa                  audio_kc705_defconfig
ia64                         bigsur_defconfig
nios2                         3c120_defconfig
arm                       multi_v4t_defconfig
sh                           se7619_defconfig
arm                      integrator_defconfig
mips                     loongson2k_defconfig
um                             i386_defconfig
powerpc                     sequoia_defconfig
arm                         lpc32xx_defconfig
microblaze                      mmu_defconfig
sh                        edosk7705_defconfig
m68k                         amcore_defconfig
parisc                generic-32bit_defconfig
powerpc                     kmeter1_defconfig
arm                        trizeps4_defconfig
sh                             sh03_defconfig
ia64                                defconfig
arm64                            alldefconfig
sh                          rsk7203_defconfig
sh                          polaris_defconfig
arm                             mxs_defconfig
arm                            hisi_defconfig
arm                       imx_v4_v5_defconfig
powerpc                  mpc866_ads_defconfig
m68k                          amiga_defconfig
m68k                          sun3x_defconfig
parisc                           allyesconfig
powerpc                 mpc8540_ads_defconfig
m68k                       bvme6000_defconfig
powerpc                      ppc40x_defconfig
alpha                            alldefconfig
sparc                               defconfig
sh                               j2_defconfig
powerpc                 mpc8560_ads_defconfig
arm                  colibri_pxa300_defconfig
arm                         socfpga_defconfig
x86_64                           allyesconfig
sparc                       sparc64_defconfig
mips                  cavium_octeon_defconfig
powerpc                      chrp32_defconfig
m68k                        m5407c3_defconfig
arc                            hsdk_defconfig
csky                             alldefconfig
riscv                    nommu_virt_defconfig
arm                        neponset_defconfig
openrisc                  or1klitex_defconfig
powerpc                     pq2fads_defconfig
arm                       netwinder_defconfig
x86_64                              defconfig
powerpc                     tqm8541_defconfig
arm                          pxa3xx_defconfig
riscv                            alldefconfig
m68k                       m5275evb_defconfig
xtensa                          iss_defconfig
arm                  randconfig-c002-20211210
ia64                             allmodconfig
ia64                             allyesconfig
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
x86_64               randconfig-a006-20211210
x86_64               randconfig-a005-20211210
x86_64               randconfig-a001-20211210
x86_64               randconfig-a002-20211210
x86_64               randconfig-a003-20211210
x86_64               randconfig-a004-20211210
i386                 randconfig-a001-20211210
i386                 randconfig-a002-20211210
i386                 randconfig-a005-20211210
i386                 randconfig-a003-20211210
i386                 randconfig-a006-20211210
i386                 randconfig-a004-20211210
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211210
x86_64               randconfig-c007-20211210
riscv                randconfig-c006-20211210
mips                 randconfig-c004-20211210
i386                 randconfig-c001-20211210
s390                 randconfig-c005-20211210
powerpc              randconfig-c003-20211210
x86_64               randconfig-a012-20211210
x86_64               randconfig-a014-20211210
x86_64               randconfig-a013-20211210
x86_64               randconfig-a016-20211210
x86_64               randconfig-a015-20211210
x86_64               randconfig-a011-20211210
i386                 randconfig-a013-20211210
i386                 randconfig-a011-20211210
i386                 randconfig-a016-20211210
i386                 randconfig-a014-20211210
i386                 randconfig-a015-20211210
i386                 randconfig-a012-20211210
hexagon              randconfig-r045-20211210
riscv                randconfig-r042-20211210
s390                 randconfig-r044-20211210
hexagon              randconfig-r041-20211210

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
