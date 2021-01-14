Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280B72F6DAA
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 23:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730043AbhANWEc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 17:04:32 -0500
Received: from mga07.intel.com ([134.134.136.100]:10520 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727105AbhANWEb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 17:04:31 -0500
IronPort-SDR: Ej4qpEnPjtNzBcPJIaMf3N7jc0sd3MglCAubxh8ppGyCM3zB9fDdAEWrXLM/raEvrN3DOulCfr
 fLhpa7jjv4KQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="242520879"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="242520879"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 14:03:49 -0800
IronPort-SDR: NpeGfDXZQIj+BdXNP+e4fyIreiITMmO4H+ngGZNnSaUaeRU9RTZvF3dob+EUC3onwGgjyQpv7F
 IfjY8CkTQ9vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="398180625"
Received: from lkp-server01.sh.intel.com (HELO 49c0485bf89a) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jan 2021 14:03:48 -0800
Received: from kbuild by 49c0485bf89a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l0AiZ-00000M-Ld; Thu, 14 Jan 2021 22:03:47 +0000
Date:   Fri, 15 Jan 2021 06:03:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 6e6aa61d81194c01283880950df563b1b9abec46
Message-ID: <6000bfc2.eG3N6GjP2JyGBPpN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 6e6aa61d81194c01283880950df563b1b9abec46  USB: gadget: dummy-hcd: Fix errors in port-reset handling

elapsed time: 729m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        mvebu_v7_defconfig
mips                        bcm47xx_defconfig
sh                          rsk7201_defconfig
mips                  maltasmvp_eva_defconfig
arm                         s3c6400_defconfig
arm                          pcm027_defconfig
powerpc                      katmai_defconfig
mips                           ip28_defconfig
m68k                       m5475evb_defconfig
powerpc                 linkstation_defconfig
mips                     loongson1c_defconfig
arm                             ezx_defconfig
sh                            shmin_defconfig
arm                           corgi_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
arm                         assabet_defconfig
arm                        multi_v7_defconfig
powerpc                      pcm030_defconfig
sh                           se7751_defconfig
sparc                            allyesconfig
powerpc                      cm5200_defconfig
arm64                            alldefconfig
powerpc                     pseries_defconfig
mips                        nlm_xlp_defconfig
powerpc                           allnoconfig
sh                                  defconfig
arm                      pxa255-idp_defconfig
sparc64                          alldefconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
sh                           se7721_defconfig
sh                           se7722_defconfig
mips                        maltaup_defconfig
csky                             alldefconfig
arm                          iop32x_defconfig
powerpc                     tqm8541_defconfig
sh                         ap325rxa_defconfig
arm                         palmz72_defconfig
s390                             alldefconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8540_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                               tinyconfig
i386                                defconfig
sparc                               defconfig
nios2                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a002-20210114
i386                 randconfig-a005-20210114
i386                 randconfig-a006-20210114
i386                 randconfig-a001-20210114
i386                 randconfig-a003-20210114
i386                 randconfig-a004-20210114
x86_64               randconfig-a015-20210114
x86_64               randconfig-a012-20210114
x86_64               randconfig-a013-20210114
x86_64               randconfig-a016-20210114
x86_64               randconfig-a014-20210114
x86_64               randconfig-a011-20210114
i386                 randconfig-a012-20210114
i386                 randconfig-a011-20210114
i386                 randconfig-a016-20210114
i386                 randconfig-a015-20210114
i386                 randconfig-a013-20210114
i386                 randconfig-a014-20210114
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
x86_64               randconfig-a004-20210114
x86_64               randconfig-a006-20210114
x86_64               randconfig-a001-20210114
x86_64               randconfig-a003-20210114
x86_64               randconfig-a005-20210114
x86_64               randconfig-a002-20210114

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
