Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6E5340130
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 09:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhCRItb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 04:49:31 -0400
Received: from mga12.intel.com ([192.55.52.136]:1957 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhCRItA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 04:49:00 -0400
IronPort-SDR: DfJYVPJfVKXykVa+DC3PgBPFAU6Rt3yK8S3Y4BLpCn9PGKcOp1yyRRR/A5WmMFi/ByFHpK5nmr
 KOnlmkMwTG4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="168916405"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; 
   d="scan'208";a="168916405"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 01:49:00 -0700
IronPort-SDR: aumfhnlhGrldnCTz1l85p1ldOiDUTMdkOh8Zpi0jFF0ERHMrbMi1U+aF/BVcNjBmGI0Z5Q7PIv
 AnDcPatqoisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; 
   d="scan'208";a="440819138"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2021 01:48:59 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lMoKw-00018j-MZ; Thu, 18 Mar 2021 08:48:58 +0000
Date:   Thu, 18 Mar 2021 16:48:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 fa90b937607981c9a54b3f98eef030658f837f7a
Message-ID: <605313e2.GJWrIBn2JXLaMBhJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: fa90b937607981c9a54b3f98eef030658f837f7a  usb: mtu3: Fix spelling mistake "disabed" -> "disabled"

Error/Warning reports:

https://lore.kernel.org/linux-usb/202103180724.Bj3RuCYw-lkp@intel.com

Error/Warning in current branch:

ERROR: modpost: "power_supply_get_by_name" [drivers/usb/dwc3/dwc3.ko] undefined!
ERROR: modpost: "power_supply_put" [drivers/usb/dwc3/dwc3.ko] undefined!

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- h8300-randconfig-p002-20210317
    |-- ERROR:power_supply_get_by_name-drivers-usb-dwc3-dwc3.ko-undefined
    `-- ERROR:power_supply_put-drivers-usb-dwc3-dwc3.ko-undefined

elapsed time: 723m

configs tested: 94
configs skipped: 2

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
h8300                     edosk2674_defconfig
powerpc                     redwood_defconfig
mips                        qi_lb60_defconfig
powerpc                     taishan_defconfig
mips                            gpr_defconfig
powerpc                          allmodconfig
mips                           gcw0_defconfig
sh                         apsh4a3a_defconfig
powerpc                         wii_defconfig
powerpc                       eiger_defconfig
mips                       bmips_be_defconfig
m68k                        stmark2_defconfig
arm                       imx_v4_v5_defconfig
powerpc                      chrp32_defconfig
mips                     loongson1b_defconfig
h8300                    h8300h-sim_defconfig
sh                           se7619_defconfig
sh                        sh7757lcr_defconfig
arm                            mmp2_defconfig
xtensa                       common_defconfig
m68k                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210317
i386                 randconfig-a005-20210317
i386                 randconfig-a002-20210317
i386                 randconfig-a003-20210317
i386                 randconfig-a004-20210317
i386                 randconfig-a006-20210317
x86_64               randconfig-a006-20210317
x86_64               randconfig-a001-20210317
x86_64               randconfig-a005-20210317
x86_64               randconfig-a004-20210317
x86_64               randconfig-a003-20210317
x86_64               randconfig-a002-20210317
i386                 randconfig-a013-20210317
i386                 randconfig-a016-20210317
i386                 randconfig-a011-20210317
i386                 randconfig-a012-20210317
i386                 randconfig-a015-20210317
i386                 randconfig-a014-20210317
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210317
x86_64               randconfig-a016-20210317
x86_64               randconfig-a013-20210317
x86_64               randconfig-a014-20210317
x86_64               randconfig-a015-20210317
x86_64               randconfig-a012-20210317

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
