Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A558F30914F
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jan 2021 02:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbhA3Bl0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jan 2021 20:41:26 -0500
Received: from mga05.intel.com ([192.55.52.43]:58296 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230525AbhA3BiN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Jan 2021 20:38:13 -0500
IronPort-SDR: Xqnhs+nU6mfMpMrKfo+FCxRrjUE7yjDDnQzJfUPtJrvC0/F/Ve96KSk3KvRBZcMy9eM2zSwSgn
 vaeaQCS0I6Rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="265337271"
X-IronPort-AV: E=Sophos;i="5.79,387,1602572400"; 
   d="scan'208";a="265337271"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 17:36:41 -0800
IronPort-SDR: 9GRqoqAZcf+JAcWZlWWjIG2HivYNkdsyVGP2ptrzgQ6LE3WiFJb7FSncg9ro++l3GQwBtFFELX
 RgCs/3msYqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,387,1602572400"; 
   d="scan'208";a="365569570"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2021 17:36:39 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l5fBn-0004CO-3A; Sat, 30 Jan 2021 01:36:39 +0000
Date:   Sat, 30 Jan 2021 09:36:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3c648d3deb0f95c360c9b91f49c0f313db0cef31
Message-ID: <6014b80e.e+fH7W40OU8L+edl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 3c648d3deb0f95c360c9b91f49c0f313db0cef31  xhci: handle halting transfer event properly after endpoint stop and halt raced.

elapsed time: 724m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    adder875_defconfig
mips                           mtx1_defconfig
powerpc                      cm5200_defconfig
xtensa                    smp_lx200_defconfig
mips                       capcella_defconfig
powerpc                      ep88xc_defconfig
powerpc64                        alldefconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                  mpc885_ads_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                        magician_defconfig
powerpc                          allmodconfig
c6x                        evmc6472_defconfig
arc                     nsimosci_hs_defconfig
mips                      pic32mzda_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210129
i386                 randconfig-a002-20210129
i386                 randconfig-a004-20210129
i386                 randconfig-a005-20210129
i386                 randconfig-a003-20210129
i386                 randconfig-a006-20210129
x86_64               randconfig-a002-20210129
x86_64               randconfig-a003-20210129
x86_64               randconfig-a001-20210129
x86_64               randconfig-a005-20210129
x86_64               randconfig-a006-20210129
x86_64               randconfig-a004-20210129
i386                 randconfig-a013-20210129
i386                 randconfig-a011-20210129
i386                 randconfig-a012-20210129
i386                 randconfig-a016-20210129
i386                 randconfig-a014-20210129
i386                 randconfig-a015-20210129
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
