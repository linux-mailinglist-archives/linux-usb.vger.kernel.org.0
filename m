Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3A52149EA
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jul 2020 06:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgGEEID (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 00:08:03 -0400
Received: from mga14.intel.com ([192.55.52.115]:15670 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgGEEIC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Jul 2020 00:08:02 -0400
IronPort-SDR: ZCLjtJrTuNkDbuzSHzlWvYOyi9qu+TYyrMA84a6k+KYo0yNsgzsZ4bxnlF+kq8ZSgtO2srKQ1f
 +56ZMRd6b1Hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9672"; a="146374781"
X-IronPort-AV: E=Sophos;i="5.75,314,1589266800"; 
   d="scan'208";a="146374781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2020 21:07:31 -0700
IronPort-SDR: qQcBnzrCbTUPE+UVL27rZzZg2VM3rK4KGQnIFMqWjdW+tYVbrfZzFk2n5RtAWDBnOwNuX2Wtlp
 WVKPV6670Ckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,314,1589266800"; 
   d="scan'208";a="278939726"
Received: from lkp-server01.sh.intel.com (HELO 6dc8ab148a5d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Jul 2020 21:07:30 -0700
Received: from kbuild by 6dc8ab148a5d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jrvw9-0001dK-B8; Sun, 05 Jul 2020 04:07:29 +0000
Date:   Sun, 05 Jul 2020 12:07:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 3660d0b8380e7c490a31d2eb669b4c02ccddaf3f
Message-ID: <5f0151f0.5eaBNEH8E9YCliel%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 3660d0b8380e7c490a31d2eb669b4c02ccddaf3f  Merge tag 'thunderbolt-fix-for-v5.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 5175m

configs tested: 193
configs skipped: 24

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                       aspeed_g4_defconfig
m68k                       m5249evb_defconfig
arm                            mmp2_defconfig
sh                            shmin_defconfig
powerpc                      pmac32_defconfig
sh                                  defconfig
arm                          moxart_defconfig
arm                            qcom_defconfig
arm                          iop32x_defconfig
mips                           ip28_defconfig
powerpc                     pq2fads_defconfig
arm                         at91_dt_defconfig
sh                           cayman_defconfig
m68k                        m5407c3_defconfig
sh                               allmodconfig
arm                         s5pv210_defconfig
arm                             ezx_defconfig
arm                  colibri_pxa270_defconfig
h8300                       h8s-sim_defconfig
arc                        nsim_700_defconfig
c6x                        evmc6472_defconfig
m68k                        m5272c3_defconfig
arc                        nsimosci_defconfig
arm                         cm_x300_defconfig
sh                 kfr2r09-romimage_defconfig
mips                         tb0219_defconfig
sh                               j2_defconfig
arm                          lpd270_defconfig
arm                          pxa3xx_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      ppc6xx_defconfig
mips                          ath25_defconfig
ia64                             allyesconfig
powerpc                       maple_defconfig
mips                      pistachio_defconfig
h8300                               defconfig
arm                          simpad_defconfig
xtensa                         virt_defconfig
sh                          landisk_defconfig
arm                          ep93xx_defconfig
m68k                        stmark2_defconfig
sh                           se7780_defconfig
arm                           efm32_defconfig
sh                               alldefconfig
powerpc                    mvme5100_defconfig
mips                          rb532_defconfig
xtensa                          iss_defconfig
powerpc                  mpc885_ads_defconfig
arm                   milbeaut_m10v_defconfig
sh                        dreamcast_defconfig
openrisc                    or1ksim_defconfig
arm                             pxa_defconfig
powerpc                      mgcoge_defconfig
powerpc                     mpc5200_defconfig
s390                          debug_defconfig
ia64                                defconfig
s390                             alldefconfig
sh                           se7705_defconfig
arc                        vdk_hs38_defconfig
parisc                           alldefconfig
arm                          imote2_defconfig
nios2                               defconfig
arm                        clps711x_defconfig
xtensa                    xip_kc705_defconfig
arm                         bcm2835_defconfig
sparc                            alldefconfig
arm                           viper_defconfig
arm                         orion5x_defconfig
m68k                          multi_defconfig
arm                         socfpga_defconfig
mips                            e55_defconfig
powerpc                      tqm8xx_defconfig
mips                     loongson1b_defconfig
powerpc                    gamecube_defconfig
arm                        trizeps4_defconfig
sh                      rts7751r2d1_defconfig
arm                         ebsa110_defconfig
powerpc                       ppc64_defconfig
m68k                       bvme6000_defconfig
sh                     sh7710voipgw_defconfig
mips                           xway_defconfig
ia64                              allnoconfig
arm                         vf610m4_defconfig
arm                          tango4_defconfig
nios2                         10m50_defconfig
powerpc                          alldefconfig
arm                           stm32_defconfig
arc                            hsdk_defconfig
mips                        jmr3927_defconfig
i386                             alldefconfig
mips                      fuloong2e_defconfig
mips                           jazz_defconfig
parisc                generic-64bit_defconfig
arm                           spitz_defconfig
mips                  maltasmvp_eva_defconfig
ia64                        generic_defconfig
s390                              allnoconfig
microblaze                    nommu_defconfig
mips                        vocore2_defconfig
mips                      pic32mzda_defconfig
arm                              zx_defconfig
sh                           se7619_defconfig
mips                        nlm_xlp_defconfig
arm                      jornada720_defconfig
powerpc                  storcenter_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
arm                          badge4_defconfig
m68k                            q40_defconfig
arc                    vdk_hs38_smp_defconfig
arc                     nsimosci_hs_defconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
c6x                        evmc6678_defconfig
sh                   sh7770_generic_defconfig
sparc                               defconfig
arm                             mxs_defconfig
riscv                            allyesconfig
m68k                          sun3x_defconfig
sparc                       sparc32_defconfig
mips                 decstation_r4k_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                              defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                                 defconfig
sh                                allnoconfig
microblaze                        allnoconfig
arc                              allyesconfig
mips                              allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc                            allyesconfig
sparc64                          allyesconfig
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
