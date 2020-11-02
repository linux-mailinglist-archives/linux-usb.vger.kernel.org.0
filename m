Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6082A35CE
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 22:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgKBVLh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 16:11:37 -0500
Received: from mga03.intel.com ([134.134.136.65]:13815 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbgKBVLh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Nov 2020 16:11:37 -0500
IronPort-SDR: KrnSj9cvUdCB1XwAstMk+j1VeEX2AjD53JUYVMDZZZoEphyHuc1WtBG+C6P7SGx3n86Hre6rSx
 7hKL4Qi0OCLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="169055839"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="169055839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 13:11:36 -0800
IronPort-SDR: Wb8qPu2migjvua/nKPN56cb0k3PTMrOmfIsuzpx9qGT9aQo5Ih2JMKGtx9mEu7QdTubpzG3lqV
 r0JTrTp1AN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="363374680"
Received: from lkp-server02.sh.intel.com (HELO 9353403cd79d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Nov 2020 13:11:35 -0800
Received: from kbuild by 9353403cd79d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZh6z-00009M-C7; Mon, 02 Nov 2020 21:11:33 +0000
Date:   Tue, 03 Nov 2020 05:11:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8fba56b4cd53d6c588641db46d74a13d3c0d8602
Message-ID: <5fa075ea.CRIcafDhIsYf4ul2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 8fba56b4cd53d6c588641db46d74a13d3c0d8602  Merge 5.10-rc2 into usb-next

elapsed time: 725m

configs tested: 159
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
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
powerpc                     mpc5200_defconfig
sh                          urquell_defconfig
powerpc                      ep88xc_defconfig
powerpc                 canyonlands_defconfig
arm                          simpad_defconfig
arm                      footbridge_defconfig
arm                         lpc32xx_defconfig
sh                           se7343_defconfig
riscv                            allmodconfig
mips                      maltaaprp_defconfig
m68k                        mvme16x_defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
powerpc                 mpc837x_mds_defconfig
i386                             allyesconfig
powerpc                      pasemi_defconfig
parisc                              defconfig
m68k                        m5407c3_defconfig
powerpc                     taishan_defconfig
nds32                            alldefconfig
powerpc                     redwood_defconfig
arm                        shmobile_defconfig
arm                       cns3420vb_defconfig
mips                          ath79_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                     tqm8548_defconfig
um                            kunit_defconfig
arc                     haps_hs_smp_defconfig
m68k                       bvme6000_defconfig
arm                         vf610m4_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc40x_defconfig
arm                         socfpga_defconfig
riscv                            allyesconfig
arm                          badge4_defconfig
arm                           sunxi_defconfig
mips                        workpad_defconfig
x86_64                           allyesconfig
powerpc                       holly_defconfig
arm                            qcom_defconfig
sh                           se7619_defconfig
mips                malta_kvm_guest_defconfig
mips                        jmr3927_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc836x_rdk_defconfig
nios2                         10m50_defconfig
mips                malta_qemu_32r6_defconfig
i386                                defconfig
powerpc                        cell_defconfig
sh                         microdev_defconfig
powerpc                     rainier_defconfig
powerpc                      katmai_defconfig
powerpc                       maple_defconfig
powerpc                     tqm8541_defconfig
sh                ecovec24-romimage_defconfig
sh                   sh7770_generic_defconfig
arm                        multi_v5_defconfig
h8300                     edosk2674_defconfig
sh                           sh2007_defconfig
ia64                             alldefconfig
mips                         cobalt_defconfig
microblaze                    nommu_defconfig
powerpc                      tqm8xx_defconfig
riscv                    nommu_k210_defconfig
powerpc                      chrp32_defconfig
sh                        edosk7760_defconfig
riscv                            alldefconfig
m68k                        mvme147_defconfig
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
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201102
i386                 randconfig-a006-20201102
i386                 randconfig-a005-20201102
i386                 randconfig-a001-20201102
i386                 randconfig-a002-20201102
i386                 randconfig-a003-20201102
i386                 randconfig-a004-20201101
i386                 randconfig-a006-20201101
i386                 randconfig-a005-20201101
i386                 randconfig-a001-20201101
i386                 randconfig-a002-20201101
i386                 randconfig-a003-20201101
x86_64               randconfig-a012-20201102
x86_64               randconfig-a015-20201102
x86_64               randconfig-a011-20201102
x86_64               randconfig-a013-20201102
x86_64               randconfig-a014-20201102
x86_64               randconfig-a016-20201102
i386                 randconfig-a013-20201102
i386                 randconfig-a015-20201102
i386                 randconfig-a014-20201102
i386                 randconfig-a016-20201102
i386                 randconfig-a011-20201102
i386                 randconfig-a012-20201102
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
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
