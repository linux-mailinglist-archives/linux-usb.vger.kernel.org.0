Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D229A487307
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 07:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbiAGGVo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 01:21:44 -0500
Received: from mga02.intel.com ([134.134.136.20]:8474 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229658AbiAGGVo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jan 2022 01:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641536504; x=1673072504;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=peUh51/ch4S5Aey4CiEFoGZOCAueaJAeF/t0l0qpJX0=;
  b=ILmZFo3z3QRzlz00IxcTkh/4W7BRYfsXtGZ2kxlnHoG4qxiTSVhg48aO
   jyvehDbOhPcAKJz4wCahwDJjuyFosAvIh0kmBgDYSDW20knR9UB52hr7f
   BdPlsm7s2sgn+iFVaCLBlJrQyjQoPVf0tJt/Nod/Cnv0uX8o8VUTBHv5o
   TUHGa8MYMxG4cBrVnmdf8B/EQ8FXz+PEMBotp/WCnpEV1258B7+lkPspC
   WsKUOFneity02AmWaKKCmRHf8jluWd7nO4V4dBVUFhRtPmYUdzMvaZ0Kx
   SCbYrUUS9Ab2KbCV9t8qTpxgnBQzBCiqE5lXRrzDdZYhUxg/RJK58x+xD
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="230158274"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="230158274"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 22:21:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="557174586"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jan 2022 22:21:42 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n5idB-000IK5-NQ; Fri, 07 Jan 2022 06:21:41 +0000
Date:   Fri, 07 Jan 2022 14:20:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 601a5bc1aeef772ab1f47582fd322957799f5ab5
Message-ID: <61d7dbbb.BcnNoFzWlceVEix+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 601a5bc1aeef772ab1f47582fd322957799f5ab5  usb: gadget: u_audio: Subdevice 0 for capture ctls

Warning reports:

https://lore.kernel.org/linux-usb/202112211923.EfvDjyKL-lkp@intel.com

Warning in current branch:

drivers/usb/renesas_usbhs/mod.c:195:13: warning: variable 'intenb0' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- ia64-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
`-- xtensa-allyesconfig
    `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used

elapsed time: 869m

configs tested: 130
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20220106
parisc                           alldefconfig
arm                           stm32_defconfig
mips                        bcm47xx_defconfig
powerpc                      ppc40x_defconfig
s390                       zfcpdump_defconfig
arm                     eseries_pxa_defconfig
powerpc                    adder875_defconfig
sh                        sh7785lcr_defconfig
sh                        sh7763rdp_defconfig
sh                            shmin_defconfig
sh                           se7705_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7206_defconfig
powerpc64                        alldefconfig
arc                          axs101_defconfig
powerpc                     taishan_defconfig
sh                        edosk7705_defconfig
sh                          r7780mp_defconfig
mips                      loongson3_defconfig
ia64                      gensparse_defconfig
openrisc                    or1ksim_defconfig
xtensa                  cadence_csp_defconfig
sh                         ap325rxa_defconfig
mips                            gpr_defconfig
arm                  randconfig-c002-20220106
arm                  randconfig-c002-20220107
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a012-20220106
x86_64               randconfig-a015-20220106
x86_64               randconfig-a014-20220106
x86_64               randconfig-a013-20220106
x86_64               randconfig-a011-20220106
x86_64               randconfig-a016-20220106
i386                 randconfig-a012-20220106
i386                 randconfig-a016-20220106
i386                 randconfig-a014-20220106
i386                 randconfig-a015-20220106
i386                 randconfig-a011-20220106
i386                 randconfig-a013-20220106
s390                 randconfig-r044-20220106
arc                  randconfig-r043-20220106
riscv                randconfig-r042-20220106
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220106
arm                  randconfig-c002-20220106
i386                 randconfig-c001-20220106
riscv                randconfig-c006-20220106
powerpc              randconfig-c003-20220106
x86_64               randconfig-c007-20220106
s390                 randconfig-c005-20220106
arm                  colibri_pxa300_defconfig
mips                       lemote2f_defconfig
mips                         tb0219_defconfig
powerpc                 xes_mpc85xx_defconfig
s390                             alldefconfig
mips                           ip28_defconfig
mips                      bmips_stb_defconfig
i386                 randconfig-a003-20220106
i386                 randconfig-a005-20220106
i386                 randconfig-a004-20220106
i386                 randconfig-a006-20220106
i386                 randconfig-a002-20220106
i386                 randconfig-a001-20220106
x86_64               randconfig-a012-20220107
x86_64               randconfig-a015-20220107
x86_64               randconfig-a014-20220107
x86_64               randconfig-a013-20220107
x86_64               randconfig-a011-20220107
x86_64               randconfig-a016-20220107
x86_64               randconfig-a005-20220106
x86_64               randconfig-a001-20220106
x86_64               randconfig-a004-20220106
x86_64               randconfig-a006-20220106
x86_64               randconfig-a002-20220106
x86_64               randconfig-a003-20220106
s390                 randconfig-r044-20220107
hexagon              randconfig-r041-20220107
hexagon              randconfig-r045-20220107
riscv                randconfig-r042-20220107

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
