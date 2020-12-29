Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B554E2E7503
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 23:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgL2Wkx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 17:40:53 -0500
Received: from mga09.intel.com ([134.134.136.24]:57918 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgL2Wkx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 17:40:53 -0500
IronPort-SDR: KViR4G9KKuy7GUpmr6ad84lm7VdvCjFC0axVDH8b5e88b/GuzrIOI1UAwf6rKlZbes0gbslMe9
 vEgVf9CzlciA==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="176700965"
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="176700965"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 14:40:12 -0800
IronPort-SDR: TBowZ8bhORVUYPVj67VuAKU6ryoPkOxQWmyTWlXV0UC/fUoF0APM0IndnWqiZ79AJdDUjBRUMQ
 I5V7hXyHicXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="359039031"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Dec 2020 14:40:11 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kuNf0-0003qg-Le; Tue, 29 Dec 2020 22:40:10 +0000
Date:   Wed, 30 Dec 2020 06:39:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 cb4d9b52ec06acc6eafd82e53ca90a1368fee7e6
Message-ID: <5febb02d.PXvyRpBZU+nrCM7e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-next
branch HEAD: cb4d9b52ec06acc6eafd82e53ca90a1368fee7e6  usb: dwc3: drd: Improve dwc3_get_extcon() style

elapsed time: 1906m

configs tested: 137
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc834x_itx_defconfig
arm                          gemini_defconfig
arm                         bcm2835_defconfig
mips                         bigsur_defconfig
powerpc                      cm5200_defconfig
riscv                               defconfig
arm                       mainstone_defconfig
arm                            qcom_defconfig
mips                           ip27_defconfig
mips                           mtx1_defconfig
arm                        cerfcube_defconfig
mips                         tb0226_defconfig
nds32                             allnoconfig
sh                           se7619_defconfig
sh                        sh7785lcr_defconfig
arm                        trizeps4_defconfig
sh                           se7722_defconfig
sh                          polaris_defconfig
powerpc                        fsp2_defconfig
arm                           omap1_defconfig
powerpc                 mpc837x_mds_defconfig
openrisc                    or1ksim_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      mgcoge_defconfig
sh                           se7712_defconfig
arm                       cns3420vb_defconfig
mips                    maltaup_xpa_defconfig
arm                         lpc32xx_defconfig
powerpc                  mpc866_ads_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        mvebu_v5_defconfig
um                             i386_defconfig
arm                     am200epdkit_defconfig
mips                     cu1830-neo_defconfig
powerpc                      ep88xc_defconfig
ia64                          tiger_defconfig
arm                        multi_v5_defconfig
arm                     davinci_all_defconfig
arm                           corgi_defconfig
arm                            u300_defconfig
mips                      maltasmvp_defconfig
mips                            ar7_defconfig
powerpc                      ppc64e_defconfig
c6x                              allyesconfig
mips                        nlm_xlp_defconfig
arm                      jornada720_defconfig
arm                          pxa3xx_defconfig
arm                            pleb_defconfig
s390                             alldefconfig
powerpc                      makalu_defconfig
sh                          landisk_defconfig
arm                         assabet_defconfig
xtensa                  cadence_csp_defconfig
arc                        nsimosci_defconfig
arm                            zeus_defconfig
sh                          r7780mp_defconfig
powerpc                 mpc8560_ads_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
powerpc                    adder875_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          iop32x_defconfig
powerpc                     mpc83xx_defconfig
mips                        vocore2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201229
x86_64               randconfig-a006-20201229
x86_64               randconfig-a002-20201229
x86_64               randconfig-a004-20201229
x86_64               randconfig-a003-20201229
x86_64               randconfig-a005-20201229
i386                 randconfig-a002-20201229
i386                 randconfig-a005-20201229
i386                 randconfig-a004-20201229
i386                 randconfig-a006-20201229
i386                 randconfig-a003-20201229
i386                 randconfig-a001-20201229
i386                 randconfig-a014-20201229
i386                 randconfig-a012-20201229
i386                 randconfig-a011-20201229
i386                 randconfig-a016-20201229
i386                 randconfig-a015-20201229
i386                 randconfig-a013-20201229
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a014-20201229
x86_64               randconfig-a015-20201229
x86_64               randconfig-a016-20201229
x86_64               randconfig-a012-20201229
x86_64               randconfig-a011-20201229
x86_64               randconfig-a013-20201229

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
