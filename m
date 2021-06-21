Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F723AF8AA
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 00:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbhFUWly (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Jun 2021 18:41:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:63548 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232112AbhFUWly (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Jun 2021 18:41:54 -0400
IronPort-SDR: sIYATkhqThhHQpXLrpX4ar+gde3vsiYk+87WbqLherQ08AzyjpZQQADvNFPI2+Or8kvblaR97q
 mF4LGKJewXXA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="268082925"
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="scan'208";a="268082925"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 15:39:38 -0700
IronPort-SDR: TkiZT+uWTJFJDpxIKq9fsZnw245wX6vgP+Hzde/Ff/TCJpAh/ecQBlYp6Z+7LMxw5Rgs0i86wY
 NjERtu+qyaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="scan'208";a="423100496"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2021 15:39:37 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lvSZs-0004oz-Oq; Mon, 21 Jun 2021 22:39:36 +0000
Date:   Tue, 22 Jun 2021 06:39:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 00a738b86ec0c88ad4745f658966f951cbe4c885
Message-ID: <60d11512.lso9Yht5YKc/CWyu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 00a738b86ec0c88ad4745f658966f951cbe4c885  Merge tag 'thunderbolt-for-v5.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

elapsed time: 720m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    sam440ep_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    socrates_defconfig
m68k                            mac_defconfig
riscv                               defconfig
um                               alldefconfig
arm                            zeus_defconfig
arm                  colibri_pxa270_defconfig
sh                           se7780_defconfig
arm                         shannon_defconfig
mips                      pic32mzda_defconfig
arm                   milbeaut_m10v_defconfig
arm                         lpc32xx_defconfig
arc                              allyesconfig
nios2                         10m50_defconfig
arm                             mxs_defconfig
powerpc                     sequoia_defconfig
arm                          badge4_defconfig
mips                          ath79_defconfig
sh                 kfr2r09-romimage_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
powerpc                      ppc44x_defconfig
mips                             allyesconfig
powerpc                  mpc866_ads_defconfig
sh                          landisk_defconfig
powerpc                      ep88xc_defconfig
mips                  maltasmvp_eva_defconfig
s390                             alldefconfig
m68k                          multi_defconfig
powerpc                     tqm5200_defconfig
m68k                        mvme16x_defconfig
h8300                    h8300h-sim_defconfig
mips                       lemote2f_defconfig
powerpc                       holly_defconfig
parisc                generic-32bit_defconfig
arm                          pxa168_defconfig
mips                           ip22_defconfig
powerpc                     redwood_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                          sdk7786_defconfig
powerpc                     pseries_defconfig
mips                         mpc30x_defconfig
arm                           h5000_defconfig
h8300                     edosk2674_defconfig
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
powerpc                       eiger_defconfig
mips                        vocore2_defconfig
powerpc                      katmai_defconfig
mips                  decstation_64_defconfig
m68k                        m5272c3_defconfig
sh                         ecovec24_defconfig
arm                          collie_defconfig
s390                                defconfig
powerpc                   motionpro_defconfig
arm                       cns3420vb_defconfig
mips                       bmips_be_defconfig
m68k                           sun3_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210621
x86_64               randconfig-a001-20210621
x86_64               randconfig-a005-20210621
x86_64               randconfig-a003-20210621
x86_64               randconfig-a004-20210621
x86_64               randconfig-a006-20210621
i386                 randconfig-a002-20210621
i386                 randconfig-a001-20210621
i386                 randconfig-a003-20210621
i386                 randconfig-a006-20210621
i386                 randconfig-a005-20210621
i386                 randconfig-a004-20210621
i386                 randconfig-a011-20210621
i386                 randconfig-a014-20210621
i386                 randconfig-a013-20210621
i386                 randconfig-a015-20210621
i386                 randconfig-a012-20210621
i386                 randconfig-a016-20210621
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-b001-20210621
x86_64               randconfig-a012-20210621
x86_64               randconfig-a016-20210621
x86_64               randconfig-a015-20210621
x86_64               randconfig-a014-20210621
x86_64               randconfig-a013-20210621
x86_64               randconfig-a011-20210621

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
