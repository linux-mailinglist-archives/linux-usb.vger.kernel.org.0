Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3755C305294
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 06:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhA0Fy3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 00:54:29 -0500
Received: from mga09.intel.com ([134.134.136.24]:8093 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236840AbhA0DnQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 22:43:16 -0500
IronPort-SDR: KSRzD3HGfg0b2T8gkYFziDogYFpGDa8lEol62/8X5L1ebSOuunQ3lvB5vku/4v/edM6noC4a6w
 5u1kwhwGyXpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="180156560"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="180156560"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 19:42:31 -0800
IronPort-SDR: BRQCUEgBoMbKi2UPDB/OB9etq24J5ZaDRmP5zEUdSlN3cskFZX4lf9qeuisXnKGL/STqZEl6sI
 e4dmu93kZbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="406961429"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2021 19:42:30 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4biv-0001IX-Ov; Wed, 27 Jan 2021 03:42:29 +0000
Date:   Wed, 27 Jan 2021 11:41:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 1d69f9d901ef14d81c3b004e3282b8cc7b456280
Message-ID: <6010e0f1.IQbdLfBMk7RQ4/Og%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 1d69f9d901ef14d81c3b004e3282b8cc7b456280  usb: xhci-mtk: fix unreleased bandwidth data

elapsed time: 724m

configs tested: 163
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
powerpc                     redwood_defconfig
m68k                          atari_defconfig
m68k                             allmodconfig
powerpc                     tqm8540_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                        warp_defconfig
powerpc                     tqm8560_defconfig
powerpc                      ppc44x_defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
powerpc                    klondike_defconfig
powerpc                    mvme5100_defconfig
mips                           ip22_defconfig
openrisc                    or1ksim_defconfig
arm                        clps711x_defconfig
mips                     decstation_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
powerpc                         wii_defconfig
sh                           se7780_defconfig
powerpc                     tqm8541_defconfig
arm                            lart_defconfig
openrisc                            defconfig
c6x                         dsk6455_defconfig
powerpc                        cell_defconfig
xtensa                    xip_kc705_defconfig
arm                       imx_v6_v7_defconfig
arm                        realview_defconfig
arm                         vf610m4_defconfig
alpha                               defconfig
mips                           ci20_defconfig
arm                  colibri_pxa300_defconfig
c6x                                 defconfig
powerpc                     taishan_defconfig
arm                            hisi_defconfig
arc                              allyesconfig
nds32                             allnoconfig
um                           x86_64_defconfig
arm                         lubbock_defconfig
powerpc                      acadia_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      integrator_defconfig
powerpc                    adder875_defconfig
arm                       cns3420vb_defconfig
um                            kunit_defconfig
sh                        edosk7705_defconfig
sh                         ap325rxa_defconfig
sh                           se7751_defconfig
arm                           h5000_defconfig
mips                           ip32_defconfig
microblaze                          defconfig
arc                     nsimosci_hs_defconfig
arm                       aspeed_g4_defconfig
powerpc                     pq2fads_defconfig
powerpc                     powernv_defconfig
arm                          pcm027_defconfig
mips                       capcella_defconfig
mips                         tb0287_defconfig
arm                             pxa_defconfig
parisc                           alldefconfig
powerpc                 mpc832x_rdb_defconfig
arm                        spear6xx_defconfig
powerpc                           allnoconfig
arm                        spear3xx_defconfig
sh                           se7750_defconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
powerpc                     asp8347_defconfig
powerpc                       ppc64_defconfig
nds32                               defconfig
arc                         haps_hs_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
arm                        multi_v7_defconfig
powerpc                       maple_defconfig
m68k                        m5307c3_defconfig
arm                        shmobile_defconfig
powerpc                   lite5200b_defconfig
arm                         s3c2410_defconfig
arm                        oxnas_v6_defconfig
arm                            qcom_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     pseries_defconfig
arm                          lpd270_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210127
i386                 randconfig-a011-20210127
i386                 randconfig-a012-20210127
i386                 randconfig-a015-20210127
i386                 randconfig-a014-20210127
i386                 randconfig-a016-20210127
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
