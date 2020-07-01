Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9152102AE
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 06:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgGAENy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 00:13:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:35449 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgGAENy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 00:13:54 -0400
IronPort-SDR: Ja2v96Ek9K+uwHv6gHFAL1x/16PgkYXjiRY2RH0ZGwuv7JyyCh5h+jsACJbkz4HWWvywaAD1Dr
 2W6rFFnf0gxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231330782"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="231330782"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 21:13:21 -0700
IronPort-SDR: z3BxL3FGZN906kqqKiCc7ep1rPCopzE/0UBYRQEu1G239rYEillkRCQFd+chQhsAKtlaVLVH/Z
 cty4Xph7yGzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="321121856"
Received: from lkp-server01.sh.intel.com (HELO 28879958b202) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2020 21:13:20 -0700
Received: from kbuild by 28879958b202 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jqU7b-0002Qh-N9; Wed, 01 Jul 2020 04:13:19 +0000
Date:   Wed, 01 Jul 2020 12:11:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:gregkh] BUILD SUCCESS
 9cf6ffae380061b16b2b4269d4f2e1a50aa2508a
Message-ID: <5efc0cee.7DdbUfpUgszlN8hg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  gregkh
branch HEAD: 9cf6ffae380061b16b2b4269d4f2e1a50aa2508a  Merge 5.8-rc3 into usb-next

elapsed time: 2615m

configs tested: 195
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
mips                         tb0287_defconfig
powerpc                  mpc866_ads_defconfig
mips                      pistachio_defconfig
sparc64                          allyesconfig
arm                         ebsa110_defconfig
powerpc                          g5_defconfig
mips                            e55_defconfig
s390                             alldefconfig
riscv                          rv32_defconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
mips                              allnoconfig
arm                         s3c2410_defconfig
openrisc                 simple_smp_defconfig
arm                         s3c6400_defconfig
mips                      malta_kvm_defconfig
powerpc                    mvme5100_defconfig
microblaze                          defconfig
m68k                          hp300_defconfig
sh                             espt_defconfig
arm                           stm32_defconfig
sparc                       sparc64_defconfig
sh                          rsk7201_defconfig
mips                           mtx1_defconfig
arm                         orion5x_defconfig
mips                        bcm63xx_defconfig
sh                          landisk_defconfig
sh                         apsh4a3a_defconfig
arm                          badge4_defconfig
arm                          lpd270_defconfig
mips                  maltasmvp_eva_defconfig
mips                 pnx8335_stb225_defconfig
mips                         tb0219_defconfig
powerpc                      mgcoge_defconfig
nds32                             allnoconfig
arm                          pcm027_defconfig
mips                         mpc30x_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                     davinci_all_defconfig
sh                   sh7724_generic_defconfig
sh                        edosk7760_defconfig
h8300                    h8300h-sim_defconfig
arm                      jornada720_defconfig
arm                             pxa_defconfig
mips                      pic32mzda_defconfig
mips                           xway_defconfig
um                             i386_defconfig
mips                        maltaup_defconfig
m68k                          multi_defconfig
m68k                                defconfig
sh                      rts7751r2d1_defconfig
arm                           viper_defconfig
powerpc                      ppc44x_defconfig
arm                          moxart_defconfig
sh                        sh7763rdp_defconfig
arm                        mvebu_v7_defconfig
arm                          exynos_defconfig
c6x                        evmc6474_defconfig
sh                           se7724_defconfig
arm                            pleb_defconfig
arm                             ezx_defconfig
xtensa                       common_defconfig
arm                       versatile_defconfig
xtensa                          iss_defconfig
sh                        sh7785lcr_defconfig
mips                   sb1250_swarm_defconfig
arm                         nhk8815_defconfig
powerpc                          allyesconfig
mips                           gcw0_defconfig
mips                     decstation_defconfig
sparc                            allyesconfig
arc                        nsim_700_defconfig
mips                       rbtx49xx_defconfig
sh                                  defconfig
m68k                          amiga_defconfig
m68k                          sun3x_defconfig
mips                  mips_paravirt_defconfig
sh                     sh7710voipgw_defconfig
c6x                                 defconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                             allyesconfig
m68k                           sun3_defconfig
openrisc                            defconfig
openrisc                         allyesconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                        allnoconfig
sh                               allmodconfig
sh                                allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200630
i386                 randconfig-a003-20200630
i386                 randconfig-a002-20200630
i386                 randconfig-a004-20200630
i386                 randconfig-a005-20200630
i386                 randconfig-a006-20200630
i386                 randconfig-a002-20200701
i386                 randconfig-a001-20200701
i386                 randconfig-a006-20200701
i386                 randconfig-a005-20200701
i386                 randconfig-a004-20200701
i386                 randconfig-a003-20200701
i386                 randconfig-a006-20200629
i386                 randconfig-a002-20200629
i386                 randconfig-a003-20200629
i386                 randconfig-a001-20200629
i386                 randconfig-a005-20200629
i386                 randconfig-a004-20200629
x86_64               randconfig-a011-20200629
x86_64               randconfig-a012-20200629
x86_64               randconfig-a013-20200629
x86_64               randconfig-a014-20200629
x86_64               randconfig-a015-20200629
x86_64               randconfig-a016-20200629
x86_64               randconfig-a011-20200630
x86_64               randconfig-a014-20200630
x86_64               randconfig-a013-20200630
x86_64               randconfig-a015-20200630
x86_64               randconfig-a016-20200630
x86_64               randconfig-a012-20200630
i386                 randconfig-a013-20200629
i386                 randconfig-a016-20200629
i386                 randconfig-a014-20200629
i386                 randconfig-a012-20200629
i386                 randconfig-a015-20200629
i386                 randconfig-a011-20200629
i386                 randconfig-a011-20200630
i386                 randconfig-a016-20200630
i386                 randconfig-a015-20200630
i386                 randconfig-a014-20200630
i386                 randconfig-a013-20200630
i386                 randconfig-a012-20200630
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
