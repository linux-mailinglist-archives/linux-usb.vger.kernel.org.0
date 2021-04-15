Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D0C36008A
	for <lists+linux-usb@lfdr.de>; Thu, 15 Apr 2021 05:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhDODgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 23:36:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:11511 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229450AbhDODgG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Apr 2021 23:36:06 -0400
IronPort-SDR: 8HRB3Z2cePLoG9+h1xf/6QaWJlAiYuNK4C0bFit3mf0F02LDvaEEW3TtSYiHVUaCoFsrxp5Ct9
 Cd/9d3zbIzYA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="215283133"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="215283133"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 20:35:44 -0700
IronPort-SDR: JxX8Y44y6zMH+cIfliWfcJKxAUkuoHMDYiP4AIp0qv2hG+eobmSxzcdala2vGGuYmMot2nB+iV
 wKnnvXHNtxFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="452743448"
Received: from lkp-server02.sh.intel.com (HELO fa9c8fcc3464) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2021 20:35:43 -0700
Received: from kbuild by fa9c8fcc3464 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lWsn8-0000cp-UV; Thu, 15 Apr 2021 03:35:42 +0000
Date:   Thu, 15 Apr 2021 11:35:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 4b853c236c7b5161a2e444bd8b3c76fe5aa5ddcb
Message-ID: <6077b47e.RYmckq4Og/ER3973%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 4b853c236c7b5161a2e444bd8b3c76fe5aa5ddcb  usb: xhci-mtk: remove unused members

elapsed time: 724m

configs tested: 160
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                 mpc8272_ads_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                      cm5200_defconfig
mips                        maltaup_defconfig
xtensa                    smp_lx200_defconfig
mips                           rs90_defconfig
powerpc                       maple_defconfig
arm                          ep93xx_defconfig
mips                            e55_defconfig
ia64                      gensparse_defconfig
sh                          urquell_defconfig
arm                            mmp2_defconfig
arm                       cns3420vb_defconfig
powerpc                          g5_defconfig
arm                         palmz72_defconfig
mips                         tb0287_defconfig
arm                          pxa3xx_defconfig
sh                           se7722_defconfig
powerpc                     ep8248e_defconfig
x86_64                              defconfig
sh                         ap325rxa_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
arm                         s3c2410_defconfig
sh                          rsk7264_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                        spear6xx_defconfig
mips                      bmips_stb_defconfig
mips                          malta_defconfig
arm                            zeus_defconfig
mips                     cu1830-neo_defconfig
arm                          gemini_defconfig
microblaze                          defconfig
riscv                          rv32_defconfig
m68k                             allmodconfig
alpha                            alldefconfig
powerpc                   currituck_defconfig
mips                          ath25_defconfig
mips                            gpr_defconfig
mips                           ci20_defconfig
xtensa                         virt_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
mips                  decstation_64_defconfig
h8300                            alldefconfig
powerpc                      arches_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     tqm5200_defconfig
powerpc                   lite5200b_defconfig
sh                           sh2007_defconfig
arm                          pxa168_defconfig
arm                        trizeps4_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                         axm55xx_defconfig
m68k                       m5475evb_defconfig
mips                     decstation_defconfig
powerpc                     tqm8548_defconfig
arm                         at91_dt_defconfig
sparc                            alldefconfig
arm                        realview_defconfig
arc                        nsim_700_defconfig
m68k                       m5275evb_defconfig
arc                           tb10x_defconfig
powerpc                   motionpro_defconfig
m68k                          hp300_defconfig
sh                          landisk_defconfig
mips                     loongson1b_defconfig
sparc                            allyesconfig
powerpc                      acadia_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                            q40_defconfig
m68k                       m5249evb_defconfig
powerpc                     tqm8555_defconfig
powerpc                     tqm8540_defconfig
powerpc                    socrates_defconfig
mips                           jazz_defconfig
sh                        apsh4ad0a_defconfig
um                            kunit_defconfig
mips                         cobalt_defconfig
um                                allnoconfig
arc                     nsimosci_hs_defconfig
sh                        edosk7705_defconfig
powerpc                    sam440ep_defconfig
arm                             pxa_defconfig
arm                         hackkit_defconfig
mips                     loongson1c_defconfig
arc                        nsimosci_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210414
i386                 randconfig-a006-20210414
i386                 randconfig-a001-20210414
i386                 randconfig-a005-20210414
i386                 randconfig-a004-20210414
i386                 randconfig-a002-20210414
x86_64               randconfig-a014-20210414
x86_64               randconfig-a015-20210414
x86_64               randconfig-a011-20210414
x86_64               randconfig-a013-20210414
x86_64               randconfig-a012-20210414
x86_64               randconfig-a016-20210414
i386                 randconfig-a015-20210414
i386                 randconfig-a014-20210414
i386                 randconfig-a013-20210414
i386                 randconfig-a012-20210414
i386                 randconfig-a016-20210414
i386                 randconfig-a011-20210414
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210414
x86_64               randconfig-a002-20210414
x86_64               randconfig-a005-20210414
x86_64               randconfig-a001-20210414
x86_64               randconfig-a006-20210414
x86_64               randconfig-a004-20210414

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
