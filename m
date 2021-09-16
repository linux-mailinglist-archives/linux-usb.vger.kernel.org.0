Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A50240D829
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 13:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbhIPLNq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Sep 2021 07:13:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:28092 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235657AbhIPLNn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Sep 2021 07:13:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="209768753"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="scan'208";a="209768753"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 04:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="scan'208";a="509265942"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2021 04:12:20 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mQpJT-0000yv-Mq; Thu, 16 Sep 2021 11:12:19 +0000
Date:   Thu, 16 Sep 2021 19:11:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ae8709b296d80c7f45aa1f35c0e7659ad69edce1
Message-ID: <6143266d.iol7vMAJ+ChKFn+y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ae8709b296d80c7f45aa1f35c0e7659ad69edce1  USB: core: Make do_proc_control() and do_proc_bulk() killable

elapsed time: 2924m

configs tested: 192
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210916
mips                         rt305x_defconfig
sh                                  defconfig
powerpc                      mgcoge_defconfig
arm                       spear13xx_defconfig
riscv                            alldefconfig
mips                malta_qemu_32r6_defconfig
arm                        mvebu_v5_defconfig
arm                         vf610m4_defconfig
powerpc                      ppc40x_defconfig
sh                          rsk7201_defconfig
arm                     davinci_all_defconfig
powerpc                    amigaone_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 canyonlands_defconfig
powerpc                     kmeter1_defconfig
sh                     sh7710voipgw_defconfig
arm                         cm_x300_defconfig
sh                          polaris_defconfig
mips                        omega2p_defconfig
arm                        multi_v5_defconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
powerpc                     redwood_defconfig
powerpc                      obs600_defconfig
powerpc                      bamboo_defconfig
m68k                       bvme6000_defconfig
arm                           sunxi_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                  cavium_octeon_defconfig
arm                         s5pv210_defconfig
arm                         assabet_defconfig
ia64                                defconfig
nios2                            allyesconfig
powerpc                    mvme5100_defconfig
arm                       cns3420vb_defconfig
mips                        nlm_xlr_defconfig
powerpc                      tqm8xx_defconfig
mips                      bmips_stb_defconfig
arm                      pxa255-idp_defconfig
sh                            hp6xx_defconfig
powerpc                     akebono_defconfig
arc                     haps_hs_smp_defconfig
mips                     decstation_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      arches_defconfig
powerpc                 mpc834x_mds_defconfig
arc                         haps_hs_defconfig
sh                           se7712_defconfig
powerpc                     tqm8548_defconfig
arm                        neponset_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                        icon_defconfig
riscv                    nommu_virt_defconfig
i386                                defconfig
m68k                             alldefconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc8560_ads_defconfig
sh                            shmin_defconfig
sh                        dreamcast_defconfig
x86_64               randconfig-c001-20210916
arm                  randconfig-c002-20210916
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20210915
i386                 randconfig-a005-20210915
i386                 randconfig-a006-20210915
i386                 randconfig-a002-20210915
i386                 randconfig-a001-20210915
i386                 randconfig-a003-20210915
x86_64               randconfig-a016-20210916
x86_64               randconfig-a013-20210916
x86_64               randconfig-a012-20210916
x86_64               randconfig-a011-20210916
x86_64               randconfig-a014-20210916
x86_64               randconfig-a015-20210916
x86_64               randconfig-a013-20210914
x86_64               randconfig-a016-20210914
x86_64               randconfig-a012-20210914
x86_64               randconfig-a002-20210915
x86_64               randconfig-a003-20210915
x86_64               randconfig-a004-20210915
x86_64               randconfig-a006-20210915
x86_64               randconfig-a005-20210915
x86_64               randconfig-a001-20210915
i386                 randconfig-a016-20210916
i386                 randconfig-a015-20210916
i386                 randconfig-a011-20210916
i386                 randconfig-a012-20210916
i386                 randconfig-a013-20210916
i386                 randconfig-a014-20210916
i386                 randconfig-a016-20210914
i386                 randconfig-a015-20210914
i386                 randconfig-a011-20210914
i386                 randconfig-a012-20210914
i386                 randconfig-a013-20210914
i386                 randconfig-a014-20210914
riscv                randconfig-r042-20210914
s390                 randconfig-r044-20210914
arc                  randconfig-r043-20210914
riscv                randconfig-r042-20210916
s390                 randconfig-r044-20210916
arc                  randconfig-r043-20210916
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
riscv                randconfig-c006-20210916
x86_64               randconfig-c007-20210916
mips                 randconfig-c004-20210916
powerpc              randconfig-c003-20210916
arm                  randconfig-c002-20210916
i386                 randconfig-c001-20210916
s390                 randconfig-c005-20210916
x86_64               randconfig-a002-20210916
x86_64               randconfig-a003-20210916
x86_64               randconfig-a006-20210916
x86_64               randconfig-a004-20210916
x86_64               randconfig-a005-20210916
x86_64               randconfig-a001-20210916
i386                 randconfig-a004-20210916
i386                 randconfig-a005-20210916
i386                 randconfig-a006-20210916
i386                 randconfig-a002-20210916
i386                 randconfig-a003-20210916
i386                 randconfig-a001-20210916
x86_64               randconfig-a013-20210915
x86_64               randconfig-a016-20210915
x86_64               randconfig-a012-20210915
x86_64               randconfig-a011-20210915
x86_64               randconfig-a014-20210915
x86_64               randconfig-a015-20210915
i386                 randconfig-a016-20210915
i386                 randconfig-a015-20210915
i386                 randconfig-a011-20210915
i386                 randconfig-a012-20210915
i386                 randconfig-a013-20210915
i386                 randconfig-a014-20210915
x86_64               randconfig-a002-20210914
x86_64               randconfig-a003-20210914
x86_64               randconfig-a004-20210914
x86_64               randconfig-a006-20210914
x86_64               randconfig-a005-20210914
x86_64               randconfig-a001-20210914
hexagon              randconfig-r045-20210914
hexagon              randconfig-r041-20210914
riscv                randconfig-r042-20210915
hexagon              randconfig-r045-20210915
s390                 randconfig-r044-20210915
hexagon              randconfig-r041-20210915
hexagon              randconfig-r045-20210916
hexagon              randconfig-r041-20210916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
