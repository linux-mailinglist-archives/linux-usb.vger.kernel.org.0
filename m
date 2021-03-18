Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCE7340F8C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 22:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhCRVIA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 17:08:00 -0400
Received: from mga02.intel.com ([134.134.136.20]:59210 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhCRVH4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 17:07:56 -0400
IronPort-SDR: dHKBdl9OPvSDtWbbmIDQHDV6Q920rLvuPeGloWZKeBDylIGDJS+0iV9OI+pN0NiiiTIohpeqjp
 9g71Sz//+iXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="176903923"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="176903923"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 14:07:55 -0700
IronPort-SDR: hjFnbktOmqIYsFh7IwznBEZnv/0HjVdiKzbLrktXzay3R+8fYj/klWkjd7XfdAH702QNJQ7Mq+
 mX0IoQJv0y4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="591621240"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2021 14:07:54 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lMzs1-0001Pj-Et; Thu, 18 Mar 2021 21:07:53 +0000
Date:   Fri, 19 Mar 2021 05:07:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 2b8c956ea6ba896ec18ae36c2684ecfa04c1f479
Message-ID: <6053c109.sHeC9iui2NzkLZB9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 2b8c956ea6ba896ec18ae36c2684ecfa04c1f479  usb: typec: tcpm: Skip sink_cap query only when VDM sm is busy

elapsed time: 722m

configs tested: 136
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
riscv                            allyesconfig
i386                             allyesconfig
arm                       omap2plus_defconfig
powerpc                 mpc8560_ads_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
arm                        clps711x_defconfig
m68k                       m5475evb_defconfig
sparc                            alldefconfig
powerpc                        icon_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    socrates_defconfig
arm                         assabet_defconfig
h8300                    h8300h-sim_defconfig
mips                  decstation_64_defconfig
arm                         nhk8815_defconfig
arm                       cns3420vb_defconfig
powerpc                     sbc8548_defconfig
arm                        magician_defconfig
mips                         tb0226_defconfig
mips                        jmr3927_defconfig
arm                     davinci_all_defconfig
sh                           se7750_defconfig
mips                  maltasmvp_eva_defconfig
mips                        qi_lb60_defconfig
xtensa                           alldefconfig
mips                     decstation_defconfig
arm                          exynos_defconfig
mips                            gpr_defconfig
arm                       multi_v4t_defconfig
arm                          moxart_defconfig
powerpc                    klondike_defconfig
sh                            migor_defconfig
riscv                          rv32_defconfig
sh                     magicpanelr2_defconfig
powerpc                      chrp32_defconfig
powerpc                   lite5200b_defconfig
csky                             alldefconfig
powerpc                      acadia_defconfig
sh                          rsk7269_defconfig
mips                          rm200_defconfig
mips                     cu1000-neo_defconfig
powerpc                     tqm8560_defconfig
arm                          pxa910_defconfig
arm                          simpad_defconfig
powerpc                  mpc866_ads_defconfig
s390                             allyesconfig
powerpc                      ppc40x_defconfig
powerpc                     stx_gp3_defconfig
arm                        multi_v7_defconfig
sh                             espt_defconfig
powerpc                      ppc44x_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v7_defconfig
sh                             shx3_defconfig
mips                        vocore2_defconfig
mips                           ci20_defconfig
sh                             sh03_defconfig
sh                               j2_defconfig
powerpc                      makalu_defconfig
arm                          pxa3xx_defconfig
sh                         ap325rxa_defconfig
powerpc                      ppc64e_defconfig
um                            kunit_defconfig
sh                        edosk7705_defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210318
i386                 randconfig-a005-20210318
i386                 randconfig-a003-20210318
i386                 randconfig-a002-20210318
i386                 randconfig-a006-20210318
i386                 randconfig-a004-20210318
x86_64               randconfig-a011-20210318
x86_64               randconfig-a016-20210318
x86_64               randconfig-a013-20210318
x86_64               randconfig-a015-20210318
x86_64               randconfig-a014-20210318
x86_64               randconfig-a012-20210318
i386                 randconfig-a013-20210318
i386                 randconfig-a016-20210318
i386                 randconfig-a011-20210318
i386                 randconfig-a014-20210318
i386                 randconfig-a015-20210318
i386                 randconfig-a012-20210318
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210318
x86_64               randconfig-a001-20210318
x86_64               randconfig-a005-20210318
x86_64               randconfig-a002-20210318
x86_64               randconfig-a003-20210318
x86_64               randconfig-a004-20210318

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
