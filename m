Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E386259F88
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 21:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732737AbgIAT4n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 15:56:43 -0400
Received: from mga03.intel.com ([134.134.136.65]:29049 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730149AbgIAT4j (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 15:56:39 -0400
IronPort-SDR: Q9x3kDoV7ifiKy6GTq3HszpzaL6bdwr2Dxn4PiAiw8jtIK+KbguXyVsl9mMf9Eg8MESqWtNuQa
 zOKJRuAbyhhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="157266032"
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; 
   d="scan'208";a="157266032"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 12:56:38 -0700
IronPort-SDR: RYNzqBpy5UOMrOe1q20Zwz6QmSEu0C23PTac3XRlcSLRMgalDOduErEZqPh+OQWNhioRcx6XJi
 L8480xJgDhWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; 
   d="scan'208";a="446265361"
Received: from lkp-server02.sh.intel.com (HELO f796b30506bf) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2020 12:56:36 -0700
Received: from kbuild by f796b30506bf with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kDCOS-00004o-6v; Tue, 01 Sep 2020 19:56:36 +0000
Date:   Wed, 02 Sep 2020 03:56:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 6b6c71e897e2bfa6acf8583daf80970cb0a9f87e
Message-ID: <5f4ea766.lUiqffepRIAAaCNO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 6b6c71e897e2bfa6acf8583daf80970cb0a9f87e  Merge tag 'thunderbolt-for-v5.9-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 726m

configs tested: 144
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
arm                       omap2plus_defconfig
arm                             mxs_defconfig
sh                ecovec24-romimage_defconfig
mips                        nlm_xlp_defconfig
m68k                        mvme16x_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
sh                            migor_defconfig
sh                                  defconfig
um                           x86_64_defconfig
sh                           se7750_defconfig
nios2                         3c120_defconfig
ia64                      gensparse_defconfig
mips                 decstation_r4k_defconfig
riscv                    nommu_k210_defconfig
sh                            shmin_defconfig
arm                       multi_v4t_defconfig
arm                        spear3xx_defconfig
powerpc                  mpc866_ads_defconfig
mips                        omega2p_defconfig
sh                            titan_defconfig
sparc                            alldefconfig
mips                           ip32_defconfig
riscv                               defconfig
powerpc                     pq2fads_defconfig
i386                                defconfig
mips                      loongson3_defconfig
mips                  maltasmvp_eva_defconfig
mips                      bmips_stb_defconfig
mips                        maltaup_defconfig
arm                        vexpress_defconfig
s390                       zfcpdump_defconfig
arm                         shannon_defconfig
arm                         hackkit_defconfig
arm                        mvebu_v5_defconfig
xtensa                       common_defconfig
m68k                        m5407c3_defconfig
mips                         db1xxx_defconfig
arm                          ixp4xx_defconfig
sh                              ul2_defconfig
sh                         ecovec24_defconfig
s390                          debug_defconfig
mips                         tb0219_defconfig
sh                     sh7710voipgw_defconfig
mips                         tb0287_defconfig
mips                     cu1000-neo_defconfig
mips                          malta_defconfig
powerpc                    gamecube_defconfig
m68k                             alldefconfig
mips                      malta_kvm_defconfig
m68k                       m5249evb_defconfig
powerpc                      chrp32_defconfig
arm                         socfpga_defconfig
um                             i386_defconfig
arm                         s5pv210_defconfig
arm                         mv78xx0_defconfig
powerpc                     skiroot_defconfig
arm                         lubbock_defconfig
mips                         bigsur_defconfig
arm                          gemini_defconfig
nios2                         10m50_defconfig
x86_64                           alldefconfig
mips                           rs90_defconfig
um                            kunit_defconfig
m68k                         amcore_defconfig
powerpc                     mpc83xx_defconfig
sh                         microdev_defconfig
riscv                    nommu_virt_defconfig
arm                          exynos_defconfig
arm                        neponset_defconfig
m68k                        stmark2_defconfig
mips                          rm200_defconfig
arm                          prima2_defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200901
x86_64               randconfig-a006-20200901
x86_64               randconfig-a003-20200901
x86_64               randconfig-a005-20200901
x86_64               randconfig-a001-20200901
x86_64               randconfig-a002-20200901
i386                 randconfig-a004-20200901
i386                 randconfig-a005-20200901
i386                 randconfig-a006-20200901
i386                 randconfig-a002-20200901
i386                 randconfig-a001-20200901
i386                 randconfig-a003-20200901
i386                 randconfig-a016-20200901
i386                 randconfig-a015-20200901
i386                 randconfig-a011-20200901
i386                 randconfig-a013-20200901
i386                 randconfig-a014-20200901
i386                 randconfig-a012-20200901
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20200901
x86_64               randconfig-a016-20200901
x86_64               randconfig-a011-20200901
x86_64               randconfig-a012-20200901
x86_64               randconfig-a015-20200901
x86_64               randconfig-a014-20200901

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
