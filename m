Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BC22BBDF1
	for <lists+linux-usb@lfdr.de>; Sat, 21 Nov 2020 09:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgKUIHD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Nov 2020 03:07:03 -0500
Received: from mga17.intel.com ([192.55.52.151]:9215 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgKUIHD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Nov 2020 03:07:03 -0500
IronPort-SDR: y/4T/AfZUOmUqPQ5QPln/cf15suIuZ1GZGjvAdn3maOAWtTjJ7mGX7lbIR0RrrAGGUKq7UzPUw
 oXtyxC+03UoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="151426114"
X-IronPort-AV: E=Sophos;i="5.78,358,1599548400"; 
   d="scan'208";a="151426114"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2020 00:07:03 -0800
IronPort-SDR: dJbzkzplRQN/XWFnNBdVe2NAUgZQ+8brVCkkugdcOPO/OoALK/HmzIDsHTThNvQZLadJ0Ih7wv
 OgLw0SfcSAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,358,1599548400"; 
   d="scan'208";a="477505921"
Received: from lkp-server01.sh.intel.com (HELO 00bc34107a07) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Nov 2020 00:07:01 -0800
Received: from kbuild by 00bc34107a07 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kgNvA-0000FM-VE; Sat, 21 Nov 2020 08:07:00 +0000
Date:   Sat, 21 Nov 2020 16:06:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f3bc432aa8a7a2bfe9ebb432502be5c5d979d7fe
Message-ID: <5fb8ca86.prt9QAmMuQP/gYLj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: f3bc432aa8a7a2bfe9ebb432502be5c5d979d7fe  USB: core: Change %pK for __user pointers to %px

elapsed time: 724m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      chrp32_defconfig
mips                           ip27_defconfig
arm                         s3c6400_defconfig
powerpc                    klondike_defconfig
sh                           se7780_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                            qcom_defconfig
arm                     eseries_pxa_defconfig
powerpc                      walnut_defconfig
mips                          rm200_defconfig
arm                       netwinder_defconfig
arm                             mxs_defconfig
powerpc                     mpc83xx_defconfig
mips                           ip32_defconfig
arm                          badge4_defconfig
powerpc                     tqm8540_defconfig
sh                           se7721_defconfig
i386                             alldefconfig
sh                          rsk7203_defconfig
arm                         bcm2835_defconfig
sh                          sdk7786_defconfig
m68k                        stmark2_defconfig
sh                          rsk7269_defconfig
arm                       imx_v6_v7_defconfig
arm                            pleb_defconfig
mips                        maltaup_defconfig
ia64                          tiger_defconfig
xtensa                  audio_kc705_defconfig
mips                  maltasmvp_eva_defconfig
mips                         db1xxx_defconfig
m68k                          sun3x_defconfig
arm                         mv78xx0_defconfig
arm                         hackkit_defconfig
mips                      fuloong2e_defconfig
arm                          simpad_defconfig
arm                        trizeps4_defconfig
arc                        nsimosci_defconfig
arm                       cns3420vb_defconfig
arm                     am200epdkit_defconfig
alpha                               defconfig
powerpc                     ppa8548_defconfig
c6x                                 defconfig
arm                  colibri_pxa300_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 canyonlands_defconfig
arm                           omap1_defconfig
ia64                      gensparse_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 mpc836x_mds_defconfig
ia64                             allmodconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20201120
x86_64               randconfig-a003-20201120
x86_64               randconfig-a004-20201120
x86_64               randconfig-a005-20201120
x86_64               randconfig-a001-20201120
x86_64               randconfig-a002-20201120
i386                 randconfig-a004-20201120
i386                 randconfig-a003-20201120
i386                 randconfig-a002-20201120
i386                 randconfig-a005-20201120
i386                 randconfig-a001-20201120
i386                 randconfig-a006-20201120
i386                 randconfig-a012-20201120
i386                 randconfig-a013-20201120
i386                 randconfig-a011-20201120
i386                 randconfig-a016-20201120
i386                 randconfig-a014-20201120
i386                 randconfig-a015-20201120
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201120
x86_64               randconfig-a011-20201120
x86_64               randconfig-a014-20201120
x86_64               randconfig-a016-20201120
x86_64               randconfig-a012-20201120
x86_64               randconfig-a013-20201120

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
