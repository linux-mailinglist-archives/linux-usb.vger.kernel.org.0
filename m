Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3972E7DF9
	for <lists+linux-usb@lfdr.de>; Thu, 31 Dec 2020 05:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgLaEeh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Dec 2020 23:34:37 -0500
Received: from mga04.intel.com ([192.55.52.120]:33496 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgLaEeg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Dec 2020 23:34:36 -0500
IronPort-SDR: icyvQ3ZvKOV3cNRIrmcdnOYC8SCElKJUcSrUhONTIFZR5O2Z7CQrhbtwf2iOm7v7if3XDdAgAD
 hIrBABpEjxhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="174090212"
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="174090212"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 20:33:56 -0800
IronPort-SDR: i2jlEiim+mPz0+ZtYAmNvc/pzvpSxt4BCwat/5Hv9wu3B6E80x+A8jKu9HcM8RYYPacOC3Ul3E
 wTzUXZdeMaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="348097429"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Dec 2020 20:33:55 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kupes-0004gr-Cr; Thu, 31 Dec 2020 04:33:54 +0000
Date:   Thu, 31 Dec 2020 12:33:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c318840fb2a42ce25febc95c4c19357acf1ae5ca
Message-ID: <5fed54a4.hxgarp6V2Cf/F2Ig%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: c318840fb2a42ce25febc95c4c19357acf1ae5ca  USB: Gadget: dummy-hcd: Fix shift-out-of-bounds bug

elapsed time: 722m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                            alldefconfig
powerpc                      pcm030_defconfig
x86_64                              defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        bcm63xx_defconfig
mips                        qi_lb60_defconfig
arm                         vf610m4_defconfig
microblaze                          defconfig
sh                     sh7710voipgw_defconfig
arm                         s3c6400_defconfig
mips                           rs90_defconfig
h8300                    h8300h-sim_defconfig
sh                             shx3_defconfig
mips                   sb1250_swarm_defconfig
m68k                         apollo_defconfig
sh                          sdk7780_defconfig
mips                    maltaup_xpa_defconfig
arm                        cerfcube_defconfig
mips                      maltaaprp_defconfig
s390                       zfcpdump_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
parisc                           allyesconfig
powerpc                  iss476-smp_defconfig
mips                     loongson1b_defconfig
mips                     loongson1c_defconfig
x86_64                           alldefconfig
m68k                           sun3_defconfig
mips                           ip22_defconfig
powerpc                      ppc44x_defconfig
powerpc                    sam440ep_defconfig
arc                     haps_hs_smp_defconfig
ia64                             alldefconfig
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
x86_64               randconfig-a005-20201230
x86_64               randconfig-a001-20201230
x86_64               randconfig-a006-20201230
x86_64               randconfig-a002-20201230
x86_64               randconfig-a004-20201230
x86_64               randconfig-a003-20201230
i386                 randconfig-a005-20201230
i386                 randconfig-a006-20201230
i386                 randconfig-a004-20201230
i386                 randconfig-a003-20201230
i386                 randconfig-a002-20201230
i386                 randconfig-a001-20201230
i386                 randconfig-a016-20201230
i386                 randconfig-a014-20201230
i386                 randconfig-a012-20201230
i386                 randconfig-a015-20201230
i386                 randconfig-a011-20201230
i386                 randconfig-a013-20201230
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
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201230
x86_64               randconfig-a014-20201230
x86_64               randconfig-a016-20201230
x86_64               randconfig-a011-20201230
x86_64               randconfig-a013-20201230
x86_64               randconfig-a012-20201230

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
