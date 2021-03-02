Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B0532B515
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 07:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238826AbhCCGFf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 01:05:35 -0500
Received: from mga09.intel.com ([134.134.136.24]:45946 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1839878AbhCBTzU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Mar 2021 14:55:20 -0500
IronPort-SDR: +rnCgpsjqcheZi8fpSVJllsmi/mihD926lCptpSUq3ZOE1BQWVc4F6/kIFsnjjXQb3XP9AHCyi
 1HnVi4pDPmAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="187077424"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; 
   d="scan'208";a="187077424"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 11:48:15 -0800
IronPort-SDR: VHRXOSIOD6S3jUBezYHzo2UAvJxy095oKVohRpkLH10sJcg0OQOMvdS2xwtNw8aUglRrT9czSE
 zcQtluxnJOFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; 
   d="scan'208";a="427781154"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2021 11:48:13 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lHB09-0000d5-36; Tue, 02 Mar 2021 19:48:13 +0000
Date:   Wed, 03 Mar 2021 03:47:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 5bb9cdb320a5ca631b584a9aa1ba472eb14705af
Message-ID: <603e966f.+ZJ29i0H4uwYZr03%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 5bb9cdb320a5ca631b584a9aa1ba472eb14705af  USB: remove usb_bus_type from usb.h

elapsed time: 720m

configs tested: 99
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
mips                           ip27_defconfig
m68k                        m5307c3_defconfig
m68k                             allmodconfig
ia64                         bigsur_defconfig
arm                  colibri_pxa270_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
