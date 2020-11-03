Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8952A37FE
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 01:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgKCAqG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 19:46:06 -0500
Received: from mga12.intel.com ([192.55.52.136]:20670 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgKCAqG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Nov 2020 19:46:06 -0500
IronPort-SDR: vBGc1+d9Gp2OQhR60BY6/dCipLnuTQInduWI8jcbfq5ZroZxzLDeMqj8+f7sY7MOpXDTlEPGTg
 eA6/RXCw5uog==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="148258101"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="148258101"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 16:46:05 -0800
IronPort-SDR: gvVZ8Pr0virz5XUFu1tW3xq9eL3I+Bc0iWfOXodhowlNFDI5tKGJ+Kw1lIAc7Dj5BnVAsksJKA
 /X56EuRyN0pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="538231124"
Received: from lkp-server02.sh.intel.com (HELO 9353403cd79d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Nov 2020 16:46:04 -0800
Received: from kbuild by 9353403cd79d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZkSZ-0000Fg-E3; Tue, 03 Nov 2020 00:46:03 +0000
Date:   Tue, 03 Nov 2020 08:45:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 58d51f330e76cd7536d1f7e6ef46dd241a7b38ef
Message-ID: <5fa0a80f.K0ln5ACGdCysxlQz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 58d51f330e76cd7536d1f7e6ef46dd241a7b38ef  Merge tag 'fixes-for-v5.10-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus

elapsed time: 722m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
c6x                        evmc6457_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      cm5200_defconfig
arm                        magician_defconfig
powerpc                     skiroot_defconfig
sh                        sh7757lcr_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                    amigaone_defconfig
arm                        spear6xx_defconfig
arm                            mmp2_defconfig
ia64                        generic_defconfig
mips                    maltaup_xpa_defconfig
sh                          rsk7269_defconfig
arm                      tct_hammer_defconfig
arm                            xcep_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltasmvp_defconfig
m68k                             alldefconfig
sh                           se7724_defconfig
arm                            lart_defconfig
sh                           se7750_defconfig
arm                         at91_dt_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
sh                          polaris_defconfig
m68k                       bvme6000_defconfig
arm                         lpc32xx_defconfig
ia64                            zx1_defconfig
powerpc                       maple_defconfig
mips                           ip28_defconfig
arm                         lpc18xx_defconfig
c6x                         dsk6455_defconfig
powerpc                     kilauea_defconfig
h8300                       h8s-sim_defconfig
arm                        realview_defconfig
m68k                            mac_defconfig
mips                      loongson3_defconfig
arm                        multi_v7_defconfig
powerpc                           allnoconfig
arc                          axs101_defconfig
arc                        vdk_hs38_defconfig
arm                           omap1_defconfig
mips                      fuloong2e_defconfig
arm                        mvebu_v5_defconfig
powerpc                      ppc6xx_defconfig
m68k                        mvme16x_defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
alpha                               defconfig
powerpc                 mpc837x_mds_defconfig
ia64                             allyesconfig
m68k                       m5208evb_defconfig
powerpc                      obs600_defconfig
powerpc                     asp8347_defconfig
mips                         tb0226_defconfig
mips                          ath25_defconfig
arm                     davinci_all_defconfig
mips                     decstation_defconfig
powerpc                 mpc8315_rdb_defconfig
arc                     haps_hs_smp_defconfig
arm                         vf610m4_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc40x_defconfig
sh                          sdk7780_defconfig
powerpc                       eiger_defconfig
m68k                          multi_defconfig
arm                         socfpga_defconfig
riscv                            allyesconfig
arm                          badge4_defconfig
arm                           sunxi_defconfig
mips                      maltaaprp_defconfig
xtensa                generic_kc705_defconfig
sh                   sh7770_generic_defconfig
csky                                defconfig
mips                malta_kvm_guest_defconfig
mips                        jmr3927_defconfig
powerpc                   currituck_defconfig
sh                         microdev_defconfig
powerpc                     rainier_defconfig
arm                      footbridge_defconfig
powerpc                      katmai_defconfig
sh                           se7206_defconfig
microblaze                      mmu_defconfig
powerpc                     tqm8541_defconfig
sh                ecovec24-romimage_defconfig
arm                        multi_v5_defconfig
powerpc                     tqm5200_defconfig
powerpc                   lite5200b_defconfig
m68k                        mvme147_defconfig
mips                           ip27_defconfig
xtensa                    smp_lx200_defconfig
m68k                           sun3_defconfig
powerpc                        cell_defconfig
arm                          pxa3xx_defconfig
arm                       cns3420vb_defconfig
arm                  colibri_pxa270_defconfig
m68k                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                 randconfig-a004-20201102
i386                 randconfig-a006-20201102
i386                 randconfig-a005-20201102
i386                 randconfig-a001-20201102
i386                 randconfig-a002-20201102
i386                 randconfig-a003-20201102
x86_64               randconfig-a012-20201102
x86_64               randconfig-a015-20201102
x86_64               randconfig-a011-20201102
x86_64               randconfig-a013-20201102
x86_64               randconfig-a014-20201102
x86_64               randconfig-a016-20201102
i386                 randconfig-a013-20201102
i386                 randconfig-a014-20201102
i386                 randconfig-a016-20201102
i386                 randconfig-a011-20201102
i386                 randconfig-a012-20201102
i386                 randconfig-a015-20201102
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a004-20201102
x86_64               randconfig-a005-20201102
x86_64               randconfig-a003-20201102
x86_64               randconfig-a002-20201102
x86_64               randconfig-a006-20201102
x86_64               randconfig-a001-20201102

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
