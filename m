Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDCD2526AF
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 08:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgHZGEX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 02:04:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:43712 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgHZGEV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 02:04:21 -0400
IronPort-SDR: GuDul72IoSiooj3vQWbrJOvVvxoyWJdt6AR2qk6/8ueJ2jKfSiUHv65Aqx3WNzHWfEQxMoAtBA
 ns1oeIDtTGiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="143903919"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="143903919"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 23:04:17 -0700
IronPort-SDR: tmKcSDuYFxcVZRSIJFmuIwU0ap6oV0fz2LxlrO1PXW4XcXf7xeLNbysbCrDevd24DwLO8lzv1x
 WMlAJfb/rYpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="499600404"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2020 23:04:16 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kAoXg-0001KB-2M; Wed, 26 Aug 2020 06:04:16 +0000
Date:   Wed, 26 Aug 2020 14:03:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb_control_msg] BUILD SUCCESS
 60b03dd8985f75b374325fe16c7f9d4ce058a347
Message-ID: <5f45fb2c.49PEO7lLm5dVATNl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb_control_msg
branch HEAD: 60b03dd8985f75b374325fe16c7f9d4ce058a347  USB: add usb_control_msg_send() and usb_control_msg_recv()

elapsed time: 720m

configs tested: 159
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        mini2440_defconfig
arm                           tegra_defconfig
arm                        oxnas_v6_defconfig
xtensa                           allyesconfig
powerpc                      pasemi_defconfig
parisc                generic-32bit_defconfig
sh                        apsh4ad0a_defconfig
microblaze                    nommu_defconfig
powerpc                     mpc5200_defconfig
sh                            titan_defconfig
mips                        nlm_xlr_defconfig
microblaze                          defconfig
powerpc                          alldefconfig
mips                    maltaup_xpa_defconfig
sh                            shmin_defconfig
h8300                    h8300h-sim_defconfig
x86_64                           allyesconfig
arm                       imx_v6_v7_defconfig
sh                               j2_defconfig
arm                            hisi_defconfig
alpha                               defconfig
xtensa                generic_kc705_defconfig
mips                      bmips_stb_defconfig
mips                      maltasmvp_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc64                           defconfig
arm                        mvebu_v5_defconfig
arm                          imote2_defconfig
arc                        vdk_hs38_defconfig
arm                      tct_hammer_defconfig
mips                  maltasmvp_eva_defconfig
arm                            dove_defconfig
c6x                              allyesconfig
mips                          ath79_defconfig
arm                           sunxi_defconfig
arc                                 defconfig
powerpc                    mvme5100_defconfig
mips                             allyesconfig
arc                            hsdk_defconfig
mips                          rb532_defconfig
arm                        realview_defconfig
mips                       capcella_defconfig
arm                          ep93xx_defconfig
arm                         assabet_defconfig
openrisc                    or1ksim_defconfig
mips                      pic32mzda_defconfig
sh                ecovec24-romimage_defconfig
arm                        multi_v5_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                         cobalt_defconfig
arm                           h3600_defconfig
sh                   secureedge5410_defconfig
xtensa                           alldefconfig
arc                        nsimosci_defconfig
arm                    vt8500_v6_v7_defconfig
mips                         bigsur_defconfig
arm                           omap1_defconfig
arm                           h5000_defconfig
arm                          moxart_defconfig
arm                            mmp2_defconfig
m68k                       bvme6000_defconfig
arm                           corgi_defconfig
riscv                    nommu_virt_defconfig
mips                         mpc30x_defconfig
arm                             ezx_defconfig
mips                           ip28_defconfig
c6x                        evmc6472_defconfig
sh                     magicpanelr2_defconfig
powerpc                      ppc64e_defconfig
arc                           tb10x_defconfig
arm                        vexpress_defconfig
mips                        bcm63xx_defconfig
arm                         at91_dt_defconfig
m68k                         amcore_defconfig
mips                  decstation_64_defconfig
sh                              ul2_defconfig
nios2                         3c120_defconfig
sh                          kfr2r09_defconfig
arc                        nsim_700_defconfig
sh                   rts7751r2dplus_defconfig
arm                       aspeed_g4_defconfig
sparc                               defconfig
sh                        dreamcast_defconfig
mips                      maltaaprp_defconfig
m68k                             allyesconfig
arc                              alldefconfig
xtensa                          iss_defconfig
powerpc                     mpc83xx_defconfig
arm                            zeus_defconfig
riscv                    nommu_k210_defconfig
m68k                            q40_defconfig
arc                          axs103_defconfig
arm                       imx_v4_v5_defconfig
mips                         tb0226_defconfig
sh                          sdk7786_defconfig
arm                        multi_v7_defconfig
arc                    vdk_hs38_smp_defconfig
mips                      pistachio_defconfig
xtensa                       common_defconfig
arc                     nsimosci_hs_defconfig
sh                        edosk7705_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200826
i386                 randconfig-a004-20200826
i386                 randconfig-a003-20200826
i386                 randconfig-a005-20200826
i386                 randconfig-a006-20200826
i386                 randconfig-a001-20200826
x86_64               randconfig-a015-20200826
x86_64               randconfig-a016-20200826
x86_64               randconfig-a012-20200826
x86_64               randconfig-a014-20200826
x86_64               randconfig-a011-20200826
x86_64               randconfig-a013-20200826
i386                 randconfig-a013-20200826
i386                 randconfig-a012-20200826
i386                 randconfig-a011-20200826
i386                 randconfig-a016-20200826
i386                 randconfig-a015-20200826
i386                 randconfig-a014-20200826
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
