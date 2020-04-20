Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C172D1B0C37
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 15:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgDTNEf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 09:04:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:36592 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgDTNEf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Apr 2020 09:04:35 -0400
IronPort-SDR: Hv1u5c8A6DuUbmv0Pux/1/GvYMMgq6Kgh28TAcsOoyzdy0r+qrJ1/OVeS2x7+cj7N5hi2vM+vz
 HG/szSRgT4xw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 06:04:35 -0700
IronPort-SDR: kmPTbffVwNNqI3nzhpFgrXV/5kruvvb2/adr8vQSoSKtM/uZXMYEmea4g2nyHaxDp7uPR4+ITh
 yYFgn7doXeUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="429116539"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Apr 2020 06:04:33 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jQW6C-0008Xj-St; Mon, 20 Apr 2020 21:04:32 +0800
Date:   Mon, 20 Apr 2020 21:03:34 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e9010320f2d953156fdaa65b54ac868d8ad67c16
Message-ID: <5e9d9da6.CXl/8gWssRRbjrK6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: e9010320f2d953156fdaa65b54ac868d8ad67c16  usb: cdns3: gadget: make a bunch of functions static

elapsed time: 5621m

configs tested: 93
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
sparc                            allyesconfig
arm                           efm32_defconfig
sparc64                           allnoconfig
mips                             allmodconfig
i386                                defconfig
arc                                 defconfig
xtensa                          iss_defconfig
sparc64                          allmodconfig
sparc64                             defconfig
mips                         tb0287_defconfig
powerpc                             defconfig
arm                          exynos_defconfig
riscv                          rv32_defconfig
arm                        multi_v7_defconfig
nds32                             allnoconfig
riscv                    nommu_virt_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
i386                 randconfig-a002-20200416
x86_64               randconfig-a001-20200416
x86_64               randconfig-a002-20200416
i386                 randconfig-a003-20200416
i386                 randconfig-a001-20200416
x86_64               randconfig-a003-20200416
x86_64               randconfig-a001-20200420
i386                 randconfig-a003-20200420
x86_64               randconfig-a003-20200420
i386                 randconfig-a002-20200420
i386                 randconfig-a001-20200420
x86_64               randconfig-a002-20200420
i386                 randconfig-a002-20200417
x86_64               randconfig-a001-20200417
x86_64               randconfig-a002-20200417
i386                 randconfig-a003-20200417
i386                 randconfig-a001-20200417
x86_64               randconfig-a003-20200417
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
