Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACB132B513
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 07:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238311AbhCCGFS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 01:05:18 -0500
Received: from mga03.intel.com ([134.134.136.65]:13150 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349221AbhCBTxG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Mar 2021 14:53:06 -0500
IronPort-SDR: PgJQbUDYLaL+Pf4gNAVPctZZxCKiQ/KUCDvpYRWokleNA1qiYobyvfUmwvpJzdR+6ZfBpOJdzh
 JtA3odCOI5ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="187026977"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; 
   d="scan'208";a="187026977"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 11:48:15 -0800
IronPort-SDR: /Hwtrj9VKHn8lhm+O2PKbA1alJ/m7cHYEG0XNBrzv7TD/pHeSPd6sx5qHep84cFzzp9OLjlsJ5
 dNnn1pq4FIcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; 
   d="scan'208";a="406182399"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Mar 2021 11:48:13 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lHB09-0000d8-AP; Tue, 02 Mar 2021 19:48:13 +0000
Date:   Wed, 03 Mar 2021 03:48:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 466b4bed6798e912264325bb4d90dfcd3a8a9128
Message-ID: <603e9672.yJIXGBnOjzjeFVgV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 466b4bed6798e912264325bb4d90dfcd3a8a9128  usb: gadget: f_uac1: stop playback on function disable

elapsed time: 720m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc8540_ads_defconfig
mips                      bmips_stb_defconfig
sparc64                          alldefconfig
arm                         vf610m4_defconfig
sparc                       sparc32_defconfig
sh                        sh7757lcr_defconfig
mips                         bigsur_defconfig
arm                        oxnas_v6_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7705_defconfig
powerpc                      walnut_defconfig
powerpc                     sbc8548_defconfig
powerpc                   currituck_defconfig
m68k                        mvme147_defconfig
nios2                            alldefconfig
arm                       mainstone_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                       ppc64_defconfig
arm                          pxa168_defconfig
riscv                          rv32_defconfig
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
s390                             allmodconfig
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
x86_64               randconfig-a006-20210302
x86_64               randconfig-a001-20210302
x86_64               randconfig-a004-20210302
x86_64               randconfig-a002-20210302
x86_64               randconfig-a005-20210302
x86_64               randconfig-a003-20210302
i386                 randconfig-a005-20210302
i386                 randconfig-a003-20210302
i386                 randconfig-a002-20210302
i386                 randconfig-a004-20210302
i386                 randconfig-a006-20210302
i386                 randconfig-a001-20210302
i386                 randconfig-a016-20210302
i386                 randconfig-a012-20210302
i386                 randconfig-a014-20210302
i386                 randconfig-a013-20210302
i386                 randconfig-a011-20210302
i386                 randconfig-a015-20210302
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210302
x86_64               randconfig-a016-20210302
x86_64               randconfig-a015-20210302
x86_64               randconfig-a014-20210302
x86_64               randconfig-a012-20210302
x86_64               randconfig-a011-20210302

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
