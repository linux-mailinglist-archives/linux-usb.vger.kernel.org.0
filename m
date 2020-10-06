Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23CA12843A0
	for <lists+linux-usb@lfdr.de>; Tue,  6 Oct 2020 03:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgJFBJU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Oct 2020 21:09:20 -0400
Received: from mga01.intel.com ([192.55.52.88]:11866 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgJFBJT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Oct 2020 21:09:19 -0400
IronPort-SDR: iPaPlI1ISxguFoOKw+LkmZjw8luDIlzwte9+FCJ2udBI3oJSmQY65C2YNm6ml7H8n7qg3+HZJG
 pMBZQFElFL8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="181741974"
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; 
   d="scan'208";a="181741974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 18:09:16 -0700
IronPort-SDR: WrISQc5MeamlsKq6EDaXgSgqr9NlcKHl6P7NTwLLru2qkgAGAPM6+JwWe8wqFq6sPr2q0uK9QJ
 635rGiEyIysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; 
   d="scan'208";a="341738480"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2020 18:09:14 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kPbTd-00011Y-UX; Tue, 06 Oct 2020 01:09:13 +0000
Date:   Tue, 06 Oct 2020 09:09:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a4f88430af896bf34ec25a7a5f0e053fb3d928e0
Message-ID: <5f7bc3b3.MuH82sMxsQ15mvYl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: a4f88430af896bf34ec25a7a5f0e053fb3d928e0  usb: cdc-acm: add quirk to blacklist ETAS ES58X devices

elapsed time: 724m

configs tested: 213
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                  maltasmvp_eva_defconfig
m68k                        mvme16x_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
powerpc                      acadia_defconfig
mips                       bmips_be_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      katmai_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
arm                        shmobile_defconfig
powerpc                    socrates_defconfig
mips                        jmr3927_defconfig
arm                         vf610m4_defconfig
arm                        neponset_defconfig
mips                           ip22_defconfig
mips                           rs90_defconfig
arm                          exynos_defconfig
arm                          pxa168_defconfig
mips                           ci20_defconfig
arm                         cm_x300_defconfig
powerpc                      pasemi_defconfig
mips                      bmips_stb_defconfig
powerpc                      cm5200_defconfig
powerpc                     stx_gp3_defconfig
sh                           se7721_defconfig
powerpc                     tqm8541_defconfig
arm                         axm55xx_defconfig
arm                          moxart_defconfig
mips                           xway_defconfig
sh                              ul2_defconfig
riscv                          rv32_defconfig
mips                         bigsur_defconfig
arm                           stm32_defconfig
arm                          iop32x_defconfig
arm                          tango4_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                        nlm_xlp_defconfig
arm                        clps711x_defconfig
arm                            hisi_defconfig
i386                             alldefconfig
microblaze                          defconfig
powerpc                        icon_defconfig
m68k                          amiga_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     tqm8555_defconfig
ia64                         bigsur_defconfig
m68k                         apollo_defconfig
arm                        spear6xx_defconfig
sparc                               defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
arm                            qcom_defconfig
powerpc                     tqm5200_defconfig
sh                          sdk7786_defconfig
powerpc                      ppc40x_defconfig
sh                            titan_defconfig
arc                             nps_defconfig
sh                             shx3_defconfig
powerpc                      ppc44x_defconfig
sh                        apsh4ad0a_defconfig
mips                        vocore2_defconfig
c6x                        evmc6474_defconfig
openrisc                    or1ksim_defconfig
sh                          lboxre2_defconfig
arm                            zeus_defconfig
mips                         tb0219_defconfig
m68k                            q40_defconfig
sh                          r7780mp_defconfig
sparc64                             defconfig
sh                      rts7751r2d1_defconfig
arm                       mainstone_defconfig
c6x                              alldefconfig
sh                         apsh4a3a_defconfig
arc                            hsdk_defconfig
arm                        multi_v5_defconfig
xtensa                           alldefconfig
arm                           efm32_defconfig
mips                           ip27_defconfig
sh                           se7724_defconfig
powerpc                   lite5200b_defconfig
arm                           omap1_defconfig
x86_64                              defconfig
arm                           corgi_defconfig
powerpc                      ep88xc_defconfig
arm                            pleb_defconfig
powerpc                      chrp32_defconfig
arm                         palmz72_defconfig
arm                          ixp4xx_defconfig
i386                             allyesconfig
xtensa                         virt_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          landisk_defconfig
arm                         bcm2835_defconfig
powerpc                     pseries_defconfig
sh                           se7722_defconfig
sh                   secureedge5410_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      pcm030_defconfig
arm                        keystone_defconfig
mips                      pistachio_defconfig
mips                       lemote2f_defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                        sh7763rdp_defconfig
sh                   rts7751r2dplus_defconfig
sh                          urquell_defconfig
riscv                    nommu_virt_defconfig
mips                         mpc30x_defconfig
arm                        spear3xx_defconfig
mips                          ath25_defconfig
powerpc                 canyonlands_defconfig
ia64                             allmodconfig
arm                             pxa_defconfig
sh                         ap325rxa_defconfig
powerpc                     powernv_defconfig
parisc                              defconfig
sh                               allmodconfig
mips                     loongson1c_defconfig
sh                          rsk7264_defconfig
powerpc                          allmodconfig
arm                           viper_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                          g5_defconfig
c6x                         dsk6455_defconfig
powerpc                     sequoia_defconfig
arm                            dove_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201005
i386                 randconfig-a005-20201005
i386                 randconfig-a001-20201005
i386                 randconfig-a004-20201005
i386                 randconfig-a003-20201005
i386                 randconfig-a002-20201005
i386                 randconfig-a006-20201006
i386                 randconfig-a005-20201006
i386                 randconfig-a001-20201006
i386                 randconfig-a004-20201006
i386                 randconfig-a003-20201006
i386                 randconfig-a002-20201006
i386                 randconfig-a006-20201004
i386                 randconfig-a005-20201004
i386                 randconfig-a001-20201004
i386                 randconfig-a004-20201004
i386                 randconfig-a003-20201004
i386                 randconfig-a002-20201004
x86_64               randconfig-a012-20201005
x86_64               randconfig-a015-20201005
x86_64               randconfig-a014-20201005
x86_64               randconfig-a013-20201005
x86_64               randconfig-a011-20201005
x86_64               randconfig-a016-20201005
i386                 randconfig-a014-20201005
i386                 randconfig-a015-20201005
i386                 randconfig-a013-20201005
i386                 randconfig-a016-20201005
i386                 randconfig-a011-20201005
i386                 randconfig-a012-20201005
i386                 randconfig-a014-20201004
i386                 randconfig-a015-20201004
i386                 randconfig-a013-20201004
i386                 randconfig-a016-20201004
i386                 randconfig-a011-20201004
i386                 randconfig-a012-20201004
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201005
x86_64               randconfig-a002-20201005
x86_64               randconfig-a001-20201005
x86_64               randconfig-a003-20201005
x86_64               randconfig-a005-20201005
x86_64               randconfig-a006-20201005

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
