Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE312BB7E6
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 21:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgKTUtH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 15:49:07 -0500
Received: from mga07.intel.com ([134.134.136.100]:11834 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729912AbgKTUtH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Nov 2020 15:49:07 -0500
IronPort-SDR: 1IS3uQ2d8wThG1Y+jzYj84YNxPEis9DogwmhD8LOffrKMw+DHPu36ZfRhjpCAfSOd/x+oQRY5S
 rHH86k4+Yn0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="235685423"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; 
   d="scan'208";a="235685423"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2020 12:49:06 -0800
IronPort-SDR: lwAFtr6tEoaNwVzC6RdUYfppvJdGnP53epBELtQyUt8SjLkmnGxEObt8wl9D02hJIN6ymC1p5v
 /CAuraEEBvjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; 
   d="scan'208";a="326480082"
Received: from lkp-server01.sh.intel.com (HELO 00bc34107a07) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Nov 2020 12:49:05 -0800
Received: from kbuild by 00bc34107a07 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kgDL6-00005U-8t; Fri, 20 Nov 2020 20:49:04 +0000
Date:   Sat, 21 Nov 2020 04:48:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 52a0372a38b45899368b44147db52f7360aaea31
Message-ID: <5fb82ba2.YWk1i1vZTKw/8mrV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 52a0372a38b45899368b44147db52f7360aaea31  usb: typec: Fix num_altmodes kernel-doc error

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sh-randconfig-c004-20201120
    `-- drivers-usb-misc-apple-mfi-fastcharge.c:ERROR:reference-preceded-by-free-on-line

elapsed time: 724m

configs tested: 117
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         hackkit_defconfig
sh                   sh7724_generic_defconfig
powerpc                      obs600_defconfig
powerpc                     mpc512x_defconfig
mips                      malta_kvm_defconfig
powerpc                        cell_defconfig
powerpc                     tqm8560_defconfig
arm                          pxa168_defconfig
sh                        sh7785lcr_defconfig
nds32                             allnoconfig
mips                        jmr3927_defconfig
xtensa                          iss_defconfig
arm                              alldefconfig
sh                          rsk7203_defconfig
powerpc                      mgcoge_defconfig
mips                     decstation_defconfig
arm                          imote2_defconfig
h8300                     edosk2674_defconfig
sh                         ap325rxa_defconfig
m68k                           sun3_defconfig
mips                      maltasmvp_defconfig
powerpc                     kilauea_defconfig
mips                         cobalt_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                      pcm030_defconfig
arm                        magician_defconfig
um                            kunit_defconfig
powerpc                     ppa8548_defconfig
sh                      rts7751r2d1_defconfig
arm                             pxa_defconfig
arm                      pxa255-idp_defconfig
mips                            ar7_defconfig
arm                        mvebu_v5_defconfig
sparc                       sparc64_defconfig
mips                         tb0219_defconfig
mips                          malta_defconfig
arm                            hisi_defconfig
mips                        nlm_xlr_defconfig
arm                           viper_defconfig
m68k                        m5307c3_defconfig
arm                       aspeed_g5_defconfig
sh                             espt_defconfig
arm                         lubbock_defconfig
xtensa                       common_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
