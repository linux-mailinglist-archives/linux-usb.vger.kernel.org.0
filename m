Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74933A79F4
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 11:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhFOJTq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 05:19:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:38241 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230502AbhFOJTq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Jun 2021 05:19:46 -0400
IronPort-SDR: t5fIPVHdWeyf2G61A/GtbS4hQkyTo8ufvUp31GsVDjY45FSgRFMj05dJ5IGAHyW1sxjiIIVuRy
 TAXLlqlMa4ew==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="193071245"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="193071245"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 02:17:41 -0700
IronPort-SDR: X+QdLOjb6Azm7muOS+lYLikk+VXDAgtNJ1f6Rov9Unkirp6YXjkQRPdiy6+G7xRawWSIASZxas
 VBLhlE+6eFIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="471589684"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2021 02:17:41 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lt5CV-0000JA-UR; Tue, 15 Jun 2021 09:17:39 +0000
Date:   Tue, 15 Jun 2021 17:16:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 1f28f6f091b49040c3e198c982704c3f21cad1e5
Message-ID: <60c87004.PDOLcw3EwDHHuhtM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1f28f6f091b49040c3e198c982704c3f21cad1e5  usb: gadget: fsl: properly remove remnant of MXC support

elapsed time: 1464m

configs tested: 127
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                              allyesconfig
sh                          kfr2r09_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear3xx_defconfig
powerpc                    klondike_defconfig
csky                             alldefconfig
powerpc                 mpc837x_mds_defconfig
arm                       spear13xx_defconfig
arm                          pxa910_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      chrp32_defconfig
nios2                         10m50_defconfig
arm                           omap1_defconfig
csky                                defconfig
sh                     magicpanelr2_defconfig
x86_64                           alldefconfig
powerpc                       ppc64_defconfig
mips                        bcm47xx_defconfig
sh                           se7619_defconfig
powerpc                     ppa8548_defconfig
mips                         bigsur_defconfig
sh                             sh03_defconfig
powerpc                     taishan_defconfig
arm                          ixp4xx_defconfig
mips                        nlm_xlp_defconfig
mips                      malta_kvm_defconfig
arm                          pcm027_defconfig
powerpc                      ppc40x_defconfig
arm                          simpad_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      walnut_defconfig
m68k                        mvme16x_defconfig
arm                         mv78xx0_defconfig
arm                            dove_defconfig
mips                      maltasmvp_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210613
i386                 randconfig-a006-20210613
i386                 randconfig-a001-20210613
i386                 randconfig-a004-20210613
i386                 randconfig-a005-20210613
i386                 randconfig-a003-20210613
i386                 randconfig-a002-20210614
i386                 randconfig-a006-20210614
i386                 randconfig-a004-20210614
i386                 randconfig-a001-20210614
i386                 randconfig-a005-20210614
i386                 randconfig-a003-20210614
i386                 randconfig-a015-20210613
i386                 randconfig-a013-20210613
i386                 randconfig-a016-20210613
i386                 randconfig-a014-20210613
i386                 randconfig-a012-20210613
i386                 randconfig-a011-20210613
i386                 randconfig-a015-20210614
i386                 randconfig-a013-20210614
i386                 randconfig-a016-20210614
i386                 randconfig-a012-20210614
i386                 randconfig-a014-20210614
i386                 randconfig-a011-20210614
x86_64               randconfig-a001-20210615
x86_64               randconfig-a004-20210615
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210614
x86_64               randconfig-a001-20210614
x86_64               randconfig-a004-20210614
x86_64               randconfig-a002-20210614
x86_64               randconfig-a003-20210614
x86_64               randconfig-a006-20210614
x86_64               randconfig-a005-20210614
x86_64               randconfig-a015-20210613
x86_64               randconfig-a011-20210613
x86_64               randconfig-a014-20210613
x86_64               randconfig-a012-20210613
x86_64               randconfig-a013-20210613
x86_64               randconfig-a016-20210613

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
