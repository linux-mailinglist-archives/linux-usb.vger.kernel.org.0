Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF25358F9E
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 00:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhDHWIW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 18:08:22 -0400
Received: from mga03.intel.com ([134.134.136.65]:27203 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232265AbhDHWIV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Apr 2021 18:08:21 -0400
IronPort-SDR: OIN1biqmk7E/T0KMShva8tKw+mx+bOLORg+WHhTJZLaFRDKPZRDFevX6MF2oXJXpxWYeSKIIfp
 36VM/PtrHqtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193681244"
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="scan'208";a="193681244"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 15:08:09 -0700
IronPort-SDR: FBqVohRg1TmHMDlD4t6LvjFuySLMM1Dws+Aj0O6cb74kvuYkv45VirxSGGVZMQ6qXJlrLnM6S8
 zXDYbyLptDdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="scan'208";a="610253316"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2021 15:08:08 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lUcop-000FjW-I3; Thu, 08 Apr 2021 22:08:07 +0000
Date:   Fri, 09 Apr 2021 06:07:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 bc2f3e4c662841dc19f7e7efae87782b9f3c0831
Message-ID: <606f7ebb.5K3pHN+lN2oTOK/+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: bc2f3e4c662841dc19f7e7efae87782b9f3c0831  Merge tag 'thunderbolt-for-v5.12-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 727m

configs tested: 149
configs skipped: 3

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
arm                          gemini_defconfig
mips                           mtx1_defconfig
arm                      pxa255-idp_defconfig
alpha                               defconfig
m68k                        stmark2_defconfig
mips                      maltaaprp_defconfig
powerpc                    ge_imp3a_defconfig
sh                           se7724_defconfig
mips                      loongson3_defconfig
mips                        bcm63xx_defconfig
arm                        clps711x_defconfig
openrisc                  or1klitex_defconfig
powerpc                    amigaone_defconfig
sh                ecovec24-romimage_defconfig
mips                         cobalt_defconfig
mips                  cavium_octeon_defconfig
ia64                        generic_defconfig
mips                        maltaup_defconfig
arm                           tegra_defconfig
powerpc                     stx_gp3_defconfig
powerpc                    socrates_defconfig
sh                            shmin_defconfig
h8300                            alldefconfig
powerpc                      pmac32_defconfig
m68k                             alldefconfig
arm                         lubbock_defconfig
arc                           tb10x_defconfig
mips                            gpr_defconfig
powerpc                       maple_defconfig
powerpc64                           defconfig
mips                     cu1000-neo_defconfig
sh                   secureedge5410_defconfig
arm                         nhk8815_defconfig
sh                          landisk_defconfig
powerpc                      arches_defconfig
mips                          rb532_defconfig
riscv                               defconfig
openrisc                         alldefconfig
mips                           ip27_defconfig
arm                         s3c6400_defconfig
mips                          malta_defconfig
arm                         orion5x_defconfig
mips                           ip28_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7269_defconfig
powerpc                mpc7448_hpc2_defconfig
s390                             allmodconfig
mips                        bcm47xx_defconfig
arm                            zeus_defconfig
arm                      footbridge_defconfig
powerpc                        warp_defconfig
mips                           ip22_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
arm                     eseries_pxa_defconfig
arm                            lart_defconfig
arm64                            alldefconfig
um                               allmodconfig
powerpc                      pasemi_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          ep93xx_defconfig
xtensa                         virt_defconfig
xtensa                    xip_kc705_defconfig
m68k                        mvme16x_defconfig
csky                                defconfig
powerpc                     kilauea_defconfig
arm                          pxa3xx_defconfig
arc                    vdk_hs38_smp_defconfig
mips                           ip32_defconfig
arc                     nsimosci_hs_defconfig
arm                        realview_defconfig
x86_64                           alldefconfig
arm                        mvebu_v7_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          collie_defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a004-20210408
x86_64               randconfig-a005-20210408
x86_64               randconfig-a003-20210408
x86_64               randconfig-a001-20210408
x86_64               randconfig-a002-20210408
x86_64               randconfig-a006-20210408
i386                 randconfig-a006-20210408
i386                 randconfig-a003-20210408
i386                 randconfig-a001-20210408
i386                 randconfig-a004-20210408
i386                 randconfig-a005-20210408
i386                 randconfig-a002-20210408
i386                 randconfig-a014-20210408
i386                 randconfig-a016-20210408
i386                 randconfig-a011-20210408
i386                 randconfig-a012-20210408
i386                 randconfig-a013-20210408
i386                 randconfig-a015-20210408
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210408
x86_64               randconfig-a015-20210408
x86_64               randconfig-a012-20210408
x86_64               randconfig-a011-20210408
x86_64               randconfig-a013-20210408
x86_64               randconfig-a016-20210408

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
