Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F29734C099
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 02:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhC2Ajx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Mar 2021 20:39:53 -0400
Received: from mga02.intel.com ([134.134.136.20]:19435 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231258AbhC2Ajs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Mar 2021 20:39:48 -0400
IronPort-SDR: U1EGleUhedIw7vVcHC5Zg4RBC7vljxrZgwnks6dXCNijrVPxxFBQHqijNhSmBrRWAgtnHq8Ckk
 Nl4VNuwLkv6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178585280"
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; 
   d="scan'208";a="178585280"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2021 17:39:48 -0700
IronPort-SDR: 3E89x1jBbX/QbjVJ60YDfjAcEQnWLWxTDL1lol1+JavgWGYe/JkePuJu47AVrreayOwauSAnW1
 fNslRRt6B7Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; 
   d="scan'208";a="444327098"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2021 17:39:46 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lQfwY-0004Fn-AI; Mon, 29 Mar 2021 00:39:46 +0000
Date:   Mon, 29 Mar 2021 08:39:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e5242861ec6a0bce25b4cd10af0fc8a508fd067d
Message-ID: <606121b1.okQhCWWyRfaqSTlE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e5242861ec6a0bce25b4cd10af0fc8a508fd067d  usb: gadget: s3c: Fix the error handling path in 's3c2410_udc_probe()'

elapsed time: 722m

configs tested: 107
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
arm                       aspeed_g4_defconfig
arm                             pxa_defconfig
sparc                       sparc32_defconfig
ia64                             alldefconfig
powerpc                        icon_defconfig
arc                        nsimosci_defconfig
arm                         at91_dt_defconfig
parisc                generic-64bit_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          rsk7203_defconfig
mips                     decstation_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 xes_mpc85xx_defconfig
xtensa                    xip_kc705_defconfig
mips                          ath25_defconfig
mips                       lemote2f_defconfig
arm                        spear3xx_defconfig
arm                         axm55xx_defconfig
arm                      integrator_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                 randconfig-a004-20210328
i386                 randconfig-a003-20210328
i386                 randconfig-a001-20210328
i386                 randconfig-a002-20210328
i386                 randconfig-a006-20210328
i386                 randconfig-a005-20210328
x86_64               randconfig-a015-20210328
x86_64               randconfig-a012-20210328
x86_64               randconfig-a013-20210328
x86_64               randconfig-a014-20210328
x86_64               randconfig-a016-20210328
x86_64               randconfig-a011-20210328
i386                 randconfig-a014-20210328
i386                 randconfig-a011-20210328
i386                 randconfig-a015-20210328
i386                 randconfig-a016-20210328
i386                 randconfig-a013-20210328
i386                 randconfig-a012-20210328
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210329
x86_64               randconfig-a012-20210329
x86_64               randconfig-a013-20210329
x86_64               randconfig-a014-20210329
x86_64               randconfig-a011-20210329
x86_64               randconfig-a016-20210329
x86_64               randconfig-a002-20210328
x86_64               randconfig-a003-20210328
x86_64               randconfig-a001-20210328
x86_64               randconfig-a006-20210328
x86_64               randconfig-a005-20210328
x86_64               randconfig-a004-20210328

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
