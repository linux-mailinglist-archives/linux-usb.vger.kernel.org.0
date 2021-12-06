Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F0F46A933
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 22:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350188AbhLFVOQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 16:14:16 -0500
Received: from mga12.intel.com ([192.55.52.136]:45030 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350185AbhLFVOQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Dec 2021 16:14:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="217432076"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="217432076"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 13:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="460980570"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 06 Dec 2021 13:10:19 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muLFb-000Lkg-8U; Mon, 06 Dec 2021 21:10:19 +0000
Date:   Tue, 07 Dec 2021 05:09:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d598c3c46ea69ea974f0613a651cd4ef3be0c870
Message-ID: <61ae7c1e.uegLUDJfUbThC2aG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d598c3c46ea69ea974f0613a651cd4ef3be0c870  Merge 5.16-rc4 into usb-next

possible Warning in current branch (please contact us if interested):

drivers/usb/gadget/udc/at91_udc.h:174:42: warning: format '%d' expects argument of type 'int', but argument 3 has type 'struct gpio_desc *' [-Wformat=]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   `-- drivers-usb-gadget-udc-at91_udc.h:warning:format-d-expects-argument-of-type-int-but-argument-has-type-struct-gpio_desc
`-- arm-allyesconfig
    `-- drivers-usb-gadget-udc-at91_udc.h:warning:format-d-expects-argument-of-type-int-but-argument-has-type-struct-gpio_desc

elapsed time: 721m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211206
arm                             ezx_defconfig
arc                              alldefconfig
arm                       multi_v4t_defconfig
ia64                         bigsur_defconfig
sh                          r7780mp_defconfig
powerpc                     tqm5200_defconfig
powerpc                     asp8347_defconfig
arm                            xcep_defconfig
sh                           se7750_defconfig
powerpc                      chrp32_defconfig
sh                          urquell_defconfig
sh                           se7751_defconfig
mips                            gpr_defconfig
um                             i386_defconfig
mips                     cu1830-neo_defconfig
arm                        magician_defconfig
riscv                    nommu_virt_defconfig
arm                       cns3420vb_defconfig
sparc64                             defconfig
m68k                            mac_defconfig
arm                        multi_v5_defconfig
arm                          ixp4xx_defconfig
powerpc                      pcm030_defconfig
powerpc                     pq2fads_defconfig
mips                     loongson1b_defconfig
um                                  defconfig
arm                       imx_v4_v5_defconfig
arm                           sama7_defconfig
arm                            zeus_defconfig
sh                               alldefconfig
arm                         vf610m4_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
arc                      axs103_smp_defconfig
powerpc                     ep8248e_defconfig
parisc                generic-64bit_defconfig
microblaze                          defconfig
xtensa                generic_kc705_defconfig
arm                           corgi_defconfig
sh                   sh7724_generic_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                           sama5_defconfig
h8300                    h8300h-sim_defconfig
arm                         orion5x_defconfig
sh                   secureedge5410_defconfig
i386                                defconfig
sh                           se7705_defconfig
um                           x86_64_defconfig
arm                            mps2_defconfig
openrisc                  or1klitex_defconfig
powerpc                      ep88xc_defconfig
arm                         bcm2835_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc8560_ads_defconfig
mips                        qi_lb60_defconfig
arm                     eseries_pxa_defconfig
sh                            hp6xx_defconfig
mips                          ath79_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                     sh7710voipgw_defconfig
arm                          collie_defconfig
arm                  randconfig-c002-20211206
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20211206
x86_64               randconfig-a011-20211206
x86_64               randconfig-a013-20211206
x86_64               randconfig-a014-20211206
x86_64               randconfig-a012-20211206
x86_64               randconfig-a015-20211206
i386                 randconfig-a016-20211206
i386                 randconfig-a013-20211206
i386                 randconfig-a011-20211206
i386                 randconfig-a014-20211206
i386                 randconfig-a012-20211206
i386                 randconfig-a015-20211206
arc                  randconfig-r043-20211206
riscv                randconfig-r042-20211206
s390                 randconfig-r044-20211206
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20211206
x86_64               randconfig-a005-20211206
x86_64               randconfig-a001-20211206
x86_64               randconfig-a002-20211206
x86_64               randconfig-a004-20211206
x86_64               randconfig-a003-20211206
i386                 randconfig-a001-20211206
i386                 randconfig-a005-20211206
i386                 randconfig-a002-20211206
i386                 randconfig-a003-20211206
i386                 randconfig-a006-20211206
i386                 randconfig-a004-20211206
hexagon              randconfig-r045-20211206
hexagon              randconfig-r041-20211206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
