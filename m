Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619863A8BF2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 00:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhFOWm0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 18:42:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:38705 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229898AbhFOWmY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Jun 2021 18:42:24 -0400
IronPort-SDR: DMpvJMzNIAB0bQq2JnWWEO3LiLtJ0zL2tcyeXrpAFoiCmaWySZ3YGUcQdfq6uJhT10SoUCeW1I
 GiOqlAFFhWzQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="193198668"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; 
   d="scan'208";a="193198668"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 15:40:19 -0700
IronPort-SDR: Ou2DG95jxzE7FC0Gq9CqGMEpDMVgXNjcZ6/5a0bYAImKpin+5riXyj2BZCIiMv3BXYqfP2weD6
 TOZocg9FfknQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; 
   d="scan'208";a="487929808"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2021 15:40:17 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ltHit-0000gK-JD; Tue, 15 Jun 2021 22:39:55 +0000
Date:   Wed, 16 Jun 2021 06:39:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 4bf584a03eec674975ee9fe36c8583d9d470dab1
Message-ID: <60c92c2c.dJwEuVIEK6hRhERh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 4bf584a03eec674975ee9fe36c8583d9d470dab1  usb: dwc3: core: fix kernel panic when do reboot

elapsed time: 722m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    ge_imp3a_defconfig
powerpc                   bluestone_defconfig
sh                          r7785rp_defconfig
sh                        sh7785lcr_defconfig
powerpc                      chrp32_defconfig
arm                        clps711x_defconfig
arm                          pcm027_defconfig
arm                        spear3xx_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         s3c2410_defconfig
arm                         nhk8815_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        oxnas_v6_defconfig
s390                                defconfig
arm                        multi_v7_defconfig
m68k                          atari_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                  storcenter_defconfig
sh                           se7619_defconfig
x86_64                            allnoconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210615
x86_64               randconfig-a004-20210615
x86_64               randconfig-a002-20210615
x86_64               randconfig-a003-20210615
x86_64               randconfig-a006-20210615
x86_64               randconfig-a005-20210615
i386                 randconfig-a002-20210615
i386                 randconfig-a006-20210615
i386                 randconfig-a004-20210615
i386                 randconfig-a001-20210615
i386                 randconfig-a005-20210615
i386                 randconfig-a003-20210615
i386                 randconfig-a015-20210615
i386                 randconfig-a013-20210615
i386                 randconfig-a016-20210615
i386                 randconfig-a012-20210615
i386                 randconfig-a014-20210615
i386                 randconfig-a011-20210615
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
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210615
x86_64               randconfig-a015-20210615
x86_64               randconfig-a011-20210615
x86_64               randconfig-a012-20210615
x86_64               randconfig-a014-20210615
x86_64               randconfig-a016-20210615
x86_64               randconfig-a013-20210615

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
