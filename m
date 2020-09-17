Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D334526D294
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 06:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgIQE2w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 00:28:52 -0400
Received: from mga09.intel.com ([134.134.136.24]:2889 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgIQE2v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 00:28:51 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 00:28:51 EDT
IronPort-SDR: Fo0SRXJctn0nY2ukI/7TurawSKiAz1tJp6VaCeCy5ARh4JzEsK2Dj+MnAjtw26DFdmz898fnnu
 IUWr7/C4dZZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="160551263"
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; 
   d="scan'208";a="160551263"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 21:21:44 -0700
IronPort-SDR: a2KZHtg3XCgFACfSHEChJKPjzWFR1DraS5jjZigpSJsnTNsARgyUhXqfmGBm7yb41Ef3xfMkEr
 zwJCu5lvs0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; 
   d="scan'208";a="336277407"
Received: from lkp-server02.sh.intel.com (HELO bdcb92cf8b4e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Sep 2020 21:21:42 -0700
Received: from kbuild by bdcb92cf8b4e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kIlQU-0000PB-7T; Thu, 17 Sep 2020 04:21:42 +0000
Date:   Thu, 17 Sep 2020 12:20:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 d69030c91b3765934048151792f141f0571efa86
Message-ID: <5f62e41e.02KQ+8iJoOu29vsF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: d69030c91b3765934048151792f141f0571efa86  usb: typec: intel_pmc_mux: Handle SCU IPC error conditions

elapsed time: 1029m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     decstation_defconfig
mips                      malta_kvm_defconfig
sh                        sh7763rdp_defconfig
arm                          pcm027_defconfig
powerpc                  storcenter_defconfig
mips                         cobalt_defconfig
riscv                            alldefconfig
sh                   secureedge5410_defconfig
sh                            shmin_defconfig
m68k                       m5475evb_defconfig
arm                          tango4_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                    sam440ep_defconfig
arm                         axm55xx_defconfig
arm                         at91_dt_defconfig
parisc                           allyesconfig
powerpc                     kilauea_defconfig
arm                          imote2_defconfig
powerpc                  mpc885_ads_defconfig
nios2                            allyesconfig
arm                           sama5_defconfig
sh                ecovec24-romimage_defconfig
arm                           efm32_defconfig
mips                         tb0287_defconfig
mips                         db1xxx_defconfig
arc                             nps_defconfig
arm                        trizeps4_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      katmai_defconfig
sh                        apsh4ad0a_defconfig
powerpc                         wii_defconfig
arm                          exynos_defconfig
ia64                         bigsur_defconfig
mips                         rt305x_defconfig
powerpc                  mpc866_ads_defconfig
alpha                            alldefconfig
m68k                         apollo_defconfig
alpha                               defconfig
powerpc                 mpc8313_rdb_defconfig
um                             i386_defconfig
powerpc                       holly_defconfig
arm                         assabet_defconfig
mips                      pistachio_defconfig
m68k                          multi_defconfig
arc                      axs103_smp_defconfig
powerpc                   lite5200b_defconfig
sh                           se7343_defconfig
powerpc                 mpc85xx_cds_defconfig
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
csky                                defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200916
x86_64               randconfig-a004-20200916
x86_64               randconfig-a003-20200916
x86_64               randconfig-a002-20200916
x86_64               randconfig-a001-20200916
x86_64               randconfig-a005-20200916
i386                 randconfig-a004-20200916
i386                 randconfig-a006-20200916
i386                 randconfig-a003-20200916
i386                 randconfig-a001-20200916
i386                 randconfig-a002-20200916
i386                 randconfig-a005-20200916
i386                 randconfig-a015-20200916
i386                 randconfig-a014-20200916
i386                 randconfig-a011-20200916
i386                 randconfig-a013-20200916
i386                 randconfig-a016-20200916
i386                 randconfig-a012-20200916
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20200916
x86_64               randconfig-a011-20200916
x86_64               randconfig-a016-20200916
x86_64               randconfig-a012-20200916
x86_64               randconfig-a015-20200916
x86_64               randconfig-a013-20200916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
