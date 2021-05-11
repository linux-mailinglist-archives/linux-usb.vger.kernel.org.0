Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E2D379D38
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 04:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhEKC7k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 22:59:40 -0400
Received: from mga09.intel.com ([134.134.136.24]:25127 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhEKC7f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 22:59:35 -0400
IronPort-SDR: gySsKh+PLAlNEVJHKclgB/lMlE/HXgHKAiohYtllzUpkKOq4Fi52FFR3cXTcdxh4N0EBfPmztH
 fKuom8URa6bQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199409164"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="199409164"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 19:58:29 -0700
IronPort-SDR: qN9limTc3wAoUzDDxvBX2zC/HDk3v9lZ8vIMLrE9WQIOMYUWIVPBXLG6n94MUcnJ9P+kkgw/2Q
 VLmZVnXPu3sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="541484967"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2021 19:58:27 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgIbL-0000Wj-6W; Tue, 11 May 2021 02:58:27 +0000
Date:   Tue, 11 May 2021 10:57:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 4676be28a46e9b1aef9a1fd24ecc207ebc189c9a
Message-ID: <6099f29b.ypCo/zdIkDXSwoNI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 4676be28a46e9b1aef9a1fd24ecc207ebc189c9a  usb: xhci-mtk: use first-fit for LS/FS

elapsed time: 738m

configs tested: 106
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
i386                             allyesconfig
riscv                            allyesconfig
arm                           spitz_defconfig
h8300                            alldefconfig
sh                          lboxre2_defconfig
sh                         ap325rxa_defconfig
m68k                         apollo_defconfig
sh                        apsh4ad0a_defconfig
m68k                          multi_defconfig
sh                          rsk7201_defconfig
arm                             mxs_defconfig
parisc                generic-64bit_defconfig
ia64                             allyesconfig
arm                          simpad_defconfig
arc                          axs101_defconfig
sh                      rts7751r2d1_defconfig
sh                   secureedge5410_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                          g5_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
sh                        sh7757lcr_defconfig
mips                        nlm_xlp_defconfig
arm                         cm_x300_defconfig
nios2                            alldefconfig
arm                       imx_v6_v7_defconfig
riscv                            alldefconfig
powerpc                     rainier_defconfig
xtensa                       common_defconfig
m68k                        stmark2_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210510
x86_64               randconfig-a004-20210510
x86_64               randconfig-a001-20210510
x86_64               randconfig-a005-20210510
x86_64               randconfig-a002-20210510
x86_64               randconfig-a006-20210510
i386                 randconfig-a003-20210510
i386                 randconfig-a001-20210510
i386                 randconfig-a005-20210510
i386                 randconfig-a004-20210510
i386                 randconfig-a002-20210510
i386                 randconfig-a006-20210510
i386                 randconfig-a016-20210510
i386                 randconfig-a014-20210510
i386                 randconfig-a011-20210510
i386                 randconfig-a015-20210510
i386                 randconfig-a012-20210510
i386                 randconfig-a013-20210510
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
x86_64               randconfig-a015-20210510
x86_64               randconfig-a012-20210510
x86_64               randconfig-a011-20210510
x86_64               randconfig-a013-20210510
x86_64               randconfig-a016-20210510
x86_64               randconfig-a014-20210510

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
