Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF8C3A1F1D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 23:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhFIVln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 17:41:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:46835 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhFIVln (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 17:41:43 -0400
IronPort-SDR: whgjsM9fZbL8EXj8IoFQ2O3Pn2SIJWBvVhQCvWlSr73muA2co+Ubcq1ftTV5clJt1DOpNRhszn
 d+hMoevCo/9g==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="204987391"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; 
   d="scan'208";a="204987391"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 14:39:45 -0700
IronPort-SDR: f00xVnk0rMZbytoQTyZRDNhLxIiFG+wQ2Hm1bgdMiTQVHhz+woHfnvl1XCBekVSq7pb22qPGNi
 5z11BM6vGL1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; 
   d="scan'208";a="419425677"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 09 Jun 2021 14:39:42 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lr5vK-0009iQ-Ao; Wed, 09 Jun 2021 21:39:42 +0000
Date:   Thu, 10 Jun 2021 05:39:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e89bb4288378b85c82212b60dc98ecda6b3d3a70
Message-ID: <60c1351b.VWchToIjJmJ7l2Cf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e89bb4288378b85c82212b60dc98ecda6b3d3a70  usb: gadget: u_audio: add real feedback implementation

elapsed time: 721m

configs tested: 208
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         rt305x_defconfig
mips                      malta_kvm_defconfig
powerpc                     asp8347_defconfig
arm                           spitz_defconfig
sparc                       sparc32_defconfig
nios2                            allyesconfig
sh                          rsk7203_defconfig
mips                    maltaup_xpa_defconfig
openrisc                 simple_smp_defconfig
mips                      maltasmvp_defconfig
arm                         orion5x_defconfig
sh                   sh7724_generic_defconfig
sh                          kfr2r09_defconfig
sparc                            alldefconfig
arm                             rpc_defconfig
arm                             ezx_defconfig
sh                           se7724_defconfig
sh                          sdk7786_defconfig
arc                          axs103_defconfig
xtensa                           allyesconfig
sh                           se7722_defconfig
arm                    vt8500_v6_v7_defconfig
mips                     loongson2k_defconfig
powerpc                     taishan_defconfig
xtensa                          iss_defconfig
powerpc                     pseries_defconfig
parisc                generic-32bit_defconfig
h8300                    h8300h-sim_defconfig
mips                      loongson3_defconfig
ia64                      gensparse_defconfig
m68k                            q40_defconfig
openrisc                            defconfig
mips                     cu1000-neo_defconfig
arc                        nsim_700_defconfig
arm                       versatile_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      pasemi_defconfig
sh                          r7785rp_defconfig
s390                                defconfig
arm                              alldefconfig
h8300                            allyesconfig
sh                         microdev_defconfig
sh                             espt_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      fuloong2e_defconfig
xtensa                  audio_kc705_defconfig
arm                         lpc32xx_defconfig
sh                           se7343_defconfig
mips                         tb0226_defconfig
arm                      integrator_defconfig
arm                         cm_x300_defconfig
arm                         bcm2835_defconfig
mips                            ar7_defconfig
arm64                            alldefconfig
arm                           tegra_defconfig
s390                       zfcpdump_defconfig
powerpc                    socrates_defconfig
ia64                        generic_defconfig
arm                          badge4_defconfig
arm                  colibri_pxa270_defconfig
xtensa                       common_defconfig
sh                             sh03_defconfig
sh                        sh7763rdp_defconfig
sh                        dreamcast_defconfig
m68k                             allyesconfig
mips                  cavium_octeon_defconfig
sh                          sdk7780_defconfig
arm                             mxs_defconfig
mips                             allmodconfig
mips                       rbtx49xx_defconfig
arm                       aspeed_g4_defconfig
sh                           se7206_defconfig
mips                           ip27_defconfig
powerpc                      ppc6xx_defconfig
arm                         s5pv210_defconfig
xtensa                  nommu_kc705_defconfig
arm                         shannon_defconfig
m68k                          amiga_defconfig
s390                             allyesconfig
powerpc                     tqm8555_defconfig
mips                         tb0287_defconfig
powerpc                    mvme5100_defconfig
powerpc                 mpc8560_ads_defconfig
arm                       cns3420vb_defconfig
sh                           se7721_defconfig
um                           x86_64_defconfig
arc                         haps_hs_defconfig
ia64                         bigsur_defconfig
sh                     sh7710voipgw_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc8540_ads_defconfig
arm                         s3c6400_defconfig
mips                      bmips_stb_defconfig
mips                      pistachio_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                         mv78xx0_defconfig
sh                           se7619_defconfig
m68k                          sun3x_defconfig
mips                   sb1250_swarm_defconfig
xtensa                         virt_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                       imx_v6_v7_defconfig
arm                       netwinder_defconfig
um                             i386_defconfig
powerpc                     mpc5200_defconfig
parisc                           alldefconfig
arm                         assabet_defconfig
mips                           ip32_defconfig
sh                   rts7751r2dplus_defconfig
mips                           ci20_defconfig
mips                     loongson1c_defconfig
microblaze                          defconfig
m68k                          multi_defconfig
powerpc                  mpc866_ads_defconfig
mips                        workpad_defconfig
nds32                             allnoconfig
powerpc                     mpc83xx_defconfig
arm                      jornada720_defconfig
sh                 kfr2r09-romimage_defconfig
sparc64                             defconfig
arc                                 defconfig
powerpc                          allyesconfig
riscv                               defconfig
arc                           tb10x_defconfig
powerpc                     kilauea_defconfig
m68k                        m5307c3_defconfig
nios2                         10m50_defconfig
powerpc                     sbc8548_defconfig
arm                          pxa168_defconfig
um                               alldefconfig
m68k                             alldefconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210608
x86_64               randconfig-a002-20210608
x86_64               randconfig-a003-20210608
x86_64               randconfig-a006-20210608
x86_64               randconfig-a005-20210608
x86_64               randconfig-a001-20210608
i386                 randconfig-a003-20210608
i386                 randconfig-a006-20210608
i386                 randconfig-a004-20210608
i386                 randconfig-a001-20210608
i386                 randconfig-a005-20210608
i386                 randconfig-a002-20210608
i386                 randconfig-a003-20210609
i386                 randconfig-a006-20210609
i386                 randconfig-a004-20210609
i386                 randconfig-a001-20210609
i386                 randconfig-a002-20210609
i386                 randconfig-a005-20210609
i386                 randconfig-a015-20210608
i386                 randconfig-a013-20210608
i386                 randconfig-a016-20210608
i386                 randconfig-a011-20210608
i386                 randconfig-a012-20210608
i386                 randconfig-a014-20210608
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a005-20210607
x86_64               randconfig-a001-20210607
x86_64               randconfig-a015-20210608
x86_64               randconfig-a012-20210608
x86_64               randconfig-a014-20210608
x86_64               randconfig-a011-20210608
x86_64               randconfig-a016-20210608
x86_64               randconfig-a013-20210608

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
