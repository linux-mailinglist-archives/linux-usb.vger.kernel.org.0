Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F7F37994F
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 23:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhEJVkr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 17:40:47 -0400
Received: from mga09.intel.com ([134.134.136.24]:62283 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232257AbhEJVkq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 17:40:46 -0400
IronPort-SDR: gaQtkISANa/6Iv3yR2hdlS9QmK7wzSEvtcsL0ArrVgnwWBNzQNTXIbftRWeezd34hO/YXXHpLJ
 wa04VaF+wmpQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199362953"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="199362953"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 14:39:41 -0700
IronPort-SDR: olKun+Ku0IPBJ4XXHPFO7x2rsyv0XQgwW3c1Vu2WQE0AyTz1tad6XShc/MF7coIbhw0L2yJ31q
 Lq1Po/NwvU4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="536602113"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 May 2021 14:39:39 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgDcp-0000Na-2q; Mon, 10 May 2021 21:39:39 +0000
Date:   Tue, 11 May 2021 05:39:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 f91e5d097f120755060b6abe8249696b405666fd
Message-ID: <6099a810.SFeqdQTg8WZVSnYI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: f91e5d097f120755060b6abe8249696b405666fd  usb: gadget: fsl_qe_udc: fix implicit-fallthrough warnings

elapsed time: 721m

configs tested: 142
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
arc                     haps_hs_smp_defconfig
mips                      pic32mzda_defconfig
mips                malta_qemu_32r6_defconfig
arm                        mvebu_v5_defconfig
arm                         vf610m4_defconfig
h8300                            alldefconfig
m68k                        mvme16x_defconfig
mips                           xway_defconfig
powerpc                  storcenter_defconfig
mips                           ip32_defconfig
riscv                    nommu_k210_defconfig
ia64                        generic_defconfig
sh                   sh7770_generic_defconfig
mips                       lemote2f_defconfig
powerpc                  mpc885_ads_defconfig
arm                         bcm2835_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                        fsp2_defconfig
arm                         s3c2410_defconfig
sh                          rsk7201_defconfig
mips                     cu1830-neo_defconfig
x86_64                           alldefconfig
mips                        bcm47xx_defconfig
mips                         tb0226_defconfig
nios2                               defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     decstation_defconfig
mips                        omega2p_defconfig
arm                         mv78xx0_defconfig
ia64                             alldefconfig
arc                        vdk_hs38_defconfig
mips                          ath79_defconfig
openrisc                    or1ksim_defconfig
powerpc                    klondike_defconfig
mips                          rm200_defconfig
arm                           u8500_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                              ul2_defconfig
powerpc                      pmac32_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                          g5_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
sh                        sh7757lcr_defconfig
mips                        nlm_xlp_defconfig
arc                 nsimosci_hs_smp_defconfig
csky                                defconfig
mips                       rbtx49xx_defconfig
sh                           se7724_defconfig
sh                               allmodconfig
mips                        maltaup_defconfig
powerpc                        icon_defconfig
arm                        multi_v7_defconfig
arm                          pxa3xx_defconfig
sh                               j2_defconfig
powerpc                   currituck_defconfig
mips                            gpr_defconfig
arm                          ixp4xx_defconfig
m68k                          hp300_defconfig
powerpc                     pq2fads_defconfig
arm                             ezx_defconfig
xtensa                          iss_defconfig
arm                        oxnas_v6_defconfig
powerpc                   motionpro_defconfig
nios2                            alldefconfig
x86_64                              defconfig
h8300                    h8300h-sim_defconfig
mips                          ath25_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210510
x86_64               randconfig-a004-20210510
x86_64               randconfig-a001-20210510
x86_64               randconfig-a005-20210510
x86_64               randconfig-a002-20210510
x86_64               randconfig-a006-20210510
i386                 randconfig-a003-20210510
i386                 randconfig-a005-20210510
i386                 randconfig-a004-20210510
i386                 randconfig-a001-20210510
i386                 randconfig-a002-20210510
i386                 randconfig-a006-20210510
i386                 randconfig-a016-20210510
i386                 randconfig-a014-20210510
i386                 randconfig-a011-20210510
i386                 randconfig-a015-20210510
i386                 randconfig-a012-20210510
i386                 randconfig-a013-20210510
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210510
x86_64               randconfig-a016-20210510
x86_64               randconfig-a014-20210510
x86_64               randconfig-a012-20210510
x86_64               randconfig-a011-20210510
x86_64               randconfig-a013-20210510

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
