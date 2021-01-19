Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442552FB18E
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 07:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbhASGXd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 01:23:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:13780 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728273AbhASGDE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Jan 2021 01:03:04 -0500
IronPort-SDR: RPpLwurxbzqU87QVFfPOM2YclD9wiicrK/cmeHLpcx0bjW+R6zVWF2dDRPYTd/9nYa9LGiNfDE
 jiyOAQtULX7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="158655543"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="158655543"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:02:02 -0800
IronPort-SDR: 9HP+hkece3r9AVLSmiBuP0D1jIpFzqi0NIzB6U7XuujlyS92p80Ff2MuQ9EKYbQwfs5PcSf/I2
 DWplsR+njlWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="569413325"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2021 22:02:00 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l1k5Y-0004lW-0q; Tue, 19 Jan 2021 06:02:00 +0000
Date:   Tue, 19 Jan 2021 14:01:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d70f7598c4583c6326cbd499b66bc9b3dd821e12
Message-ID: <600675b2.IJhUANlo46HubRb2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d70f7598c4583c6326cbd499b66bc9b3dd821e12  usb: gadget: u_audio: clean up locking

elapsed time: 722m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                 kfr2r09-romimage_defconfig
sparc                            allyesconfig
sparc64                             defconfig
arm                          pxa910_defconfig
powerpc                    amigaone_defconfig
ia64                                defconfig
arm                           tegra_defconfig
arm                          collie_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                         ps3_defconfig
arm                     am200epdkit_defconfig
mips                      loongson3_defconfig
ia64                             alldefconfig
powerpc                      tqm8xx_defconfig
sh                          polaris_defconfig
m68k                        mvme147_defconfig
arm                          tango4_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      ep88xc_defconfig
arm                            xcep_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         nhk8815_defconfig
s390                       zfcpdump_defconfig
powerpc                      mgcoge_defconfig
h8300                     edosk2674_defconfig
mips                     decstation_defconfig
mips                malta_qemu_32r6_defconfig
arm                         s3c2410_defconfig
sh                              ul2_defconfig
m68k                          multi_defconfig
powerpc                      pcm030_defconfig
sh                   sh7724_generic_defconfig
xtensa                    smp_lx200_defconfig
arm                             ezx_defconfig
arm                           viper_defconfig
arm                            zeus_defconfig
mips                      bmips_stb_defconfig
arm                            hisi_defconfig
arm                         vf610m4_defconfig
mips                          rm200_defconfig
arm                        magician_defconfig
h8300                               defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                      tct_hammer_defconfig
mips                           jazz_defconfig
powerpc                     skiroot_defconfig
ia64                             allmodconfig
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
sparc                               defconfig
i386                               tinyconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210118
i386                 randconfig-a002-20210118
i386                 randconfig-a005-20210118
i386                 randconfig-a006-20210118
i386                 randconfig-a001-20210118
i386                 randconfig-a003-20210118
x86_64               randconfig-a015-20210118
x86_64               randconfig-a013-20210118
x86_64               randconfig-a012-20210118
x86_64               randconfig-a016-20210118
x86_64               randconfig-a011-20210118
x86_64               randconfig-a014-20210118
i386                 randconfig-a011-20210118
i386                 randconfig-a012-20210118
i386                 randconfig-a016-20210118
i386                 randconfig-a015-20210118
i386                 randconfig-a013-20210118
i386                 randconfig-a014-20210118
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210118
x86_64               randconfig-a006-20210118
x86_64               randconfig-a001-20210118
x86_64               randconfig-a003-20210118
x86_64               randconfig-a005-20210118
x86_64               randconfig-a002-20210118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
