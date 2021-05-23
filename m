Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF31C38D7E6
	for <lists+linux-usb@lfdr.de>; Sun, 23 May 2021 02:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhEWAKu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 May 2021 20:10:50 -0400
Received: from mga05.intel.com ([192.55.52.43]:1521 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231440AbhEWAKt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 22 May 2021 20:10:49 -0400
IronPort-SDR: 4FYJNvrA4onfPur/BNs/ePm2xig0WehJE3gzCpB4phkZS/Lisqqq5UmMuflDQFFkzPxmRWL1Xc
 1yvoqEFaX5kA==
X-IronPort-AV: E=McAfee;i="6200,9189,9992"; a="287261659"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="287261659"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2021 17:09:23 -0700
IronPort-SDR: rxJUeHpCaUmi07wKuW+6y4yYh2U5eUDrZu1dG/a4Ou47gLPaK7Ge1fPqxe4q602TgDN6SsbQ1/
 XztRF9jZsETA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="632226680"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 May 2021 17:09:22 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lkbgH-0000ZB-Tb; Sun, 23 May 2021 00:09:21 +0000
Date:   Sun, 23 May 2021 08:08:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 7257fbc7c598617ca71605089264c61636d52157
Message-ID: <60a99d13.aaMh+OS+OQfMw3v6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 7257fbc7c598617ca71605089264c61636d52157  usb: typec: tcpci: Implement callback for apply_rc

elapsed time: 756m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
powerpc                    adder875_defconfig
m68k                        m5307c3_defconfig
powerpc                 mpc832x_mds_defconfig
mips                        nlm_xlr_defconfig
sh                          rsk7264_defconfig
x86_64                           alldefconfig
powerpc                     pseries_defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
powerpc                     mpc512x_defconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                          g5_defconfig
sh                ecovec24-romimage_defconfig
xtensa                       common_defconfig
xtensa                generic_kc705_defconfig
ia64                          tiger_defconfig
arm                             ezx_defconfig
arm                         lpc32xx_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                          axs101_defconfig
sh                          urquell_defconfig
sparc64                             defconfig
mips                           ip27_defconfig
sh                          kfr2r09_defconfig
mips                malta_qemu_32r6_defconfig
arm64                            alldefconfig
mips                        qi_lb60_defconfig
arm                          pxa910_defconfig
sh                        sh7757lcr_defconfig
powerpc                      obs600_defconfig
arm                      pxa255-idp_defconfig
m68k                            mac_defconfig
powerpc                          allmodconfig
m68k                        m5272c3_defconfig
powerpc                     tqm8541_defconfig
mips                      bmips_stb_defconfig
riscv                               defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
sh                          rsk7203_defconfig
sh                         apsh4a3a_defconfig
arm                             rpc_defconfig
arm                           sunxi_defconfig
ia64                             allmodconfig
arm                           u8500_defconfig
riscv                    nommu_virt_defconfig
arm                         s5pv210_defconfig
xtensa                              defconfig
m68k                          sun3x_defconfig
m68k                           sun3_defconfig
arm                        neponset_defconfig
powerpc                     akebono_defconfig
arm                         palmz72_defconfig
m68k                        mvme147_defconfig
arm                           tegra_defconfig
mips                  decstation_64_defconfig
arc                     haps_hs_smp_defconfig
arm                         vf610m4_defconfig
h8300                               defconfig
x86_64                            allnoconfig
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
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210522
x86_64               randconfig-a006-20210522
x86_64               randconfig-a005-20210522
x86_64               randconfig-a003-20210522
x86_64               randconfig-a004-20210522
x86_64               randconfig-a002-20210522
i386                 randconfig-a001-20210523
i386                 randconfig-a005-20210523
i386                 randconfig-a002-20210523
i386                 randconfig-a003-20210523
i386                 randconfig-a004-20210523
i386                 randconfig-a006-20210523
i386                 randconfig-a001-20210522
i386                 randconfig-a005-20210522
i386                 randconfig-a002-20210522
i386                 randconfig-a004-20210522
i386                 randconfig-a003-20210522
i386                 randconfig-a006-20210522
x86_64               randconfig-a013-20210523
x86_64               randconfig-a014-20210523
x86_64               randconfig-a012-20210523
x86_64               randconfig-a016-20210523
x86_64               randconfig-a015-20210523
x86_64               randconfig-a011-20210523
i386                 randconfig-a016-20210522
i386                 randconfig-a011-20210522
i386                 randconfig-a015-20210522
i386                 randconfig-a012-20210522
i386                 randconfig-a014-20210522
i386                 randconfig-a013-20210522
i386                 randconfig-a016-20210523
i386                 randconfig-a011-20210523
i386                 randconfig-a015-20210523
i386                 randconfig-a012-20210523
i386                 randconfig-a014-20210523
i386                 randconfig-a013-20210523
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210522
x86_64               randconfig-a013-20210522
x86_64               randconfig-a014-20210522
x86_64               randconfig-a012-20210522
x86_64               randconfig-a016-20210522
x86_64               randconfig-a015-20210522
x86_64               randconfig-a011-20210522

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
