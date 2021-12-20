Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8C347B5DA
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 23:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhLTWV2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 17:21:28 -0500
Received: from mga09.intel.com ([134.134.136.24]:24994 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230444AbhLTWV1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 17:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640038887; x=1671574887;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NThnfb5Mtf5R7n7cVolHDhzQ6Js8TeEGVUJ9MkRwXaA=;
  b=hg75Wsfva3TbqaMw5Fi9u7V6ksBYzbkhb/5rw74giYxX+kFC05hpfrvO
   DeYibG3CjJfHKTKxxVfqsb34gEHA4Vtik6cNoC4PTng65PiZB4Nmzdd7p
   tpEBBpf+qyCM8+Kwzhrvjp68gqsjU9Qi8Gkk5p3VpjtJdS9YbMdNf5Pra
   OhghYuC883mn5hgeHmnvslOej+Le9S2nHnFcXZwGaarHuMwrhx5Arp8Um
   00GW5LDPxCqthdDu+Tm7fS+yb0dJG1CHH3wbDN8fITEzclYdIolq6vt6R
   DOBOdo+EX1AwIM5MjxaXWUg8E2KE27DclNyzV6MEPF3eBZm3saHVh+vTx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240087506"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="240087506"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 14:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="755550491"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Dec 2021 14:21:25 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzR24-0008K2-TY; Mon, 20 Dec 2021 22:21:24 +0000
Date:   Tue, 21 Dec 2021 06:20:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 236c9ad1f87088bb07ebdd136b8432f83dfd1e14
Message-ID: <61c101c0.fz4QyE85lrQz3LDY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 236c9ad1f87088bb07ebdd136b8432f83dfd1e14  Merge 5.16-rc6 into usb-next

possible Warning in current branch (please contact us if interested):

drivers/usb/gadget/udc/at91_udc.h:174:42: warning: format '%d' expects argument of type 'int', but argument 3 has type 'struct gpio_desc *' [-Wformat=]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   `-- drivers-usb-gadget-udc-at91_udc.h:warning:format-d-expects-argument-of-type-int-but-argument-has-type-struct-gpio_desc
`-- arm-allyesconfig
    `-- drivers-usb-gadget-udc-at91_udc.h:warning:format-d-expects-argument-of-type-int-but-argument-has-type-struct-gpio_desc

elapsed time: 729m

configs tested: 145
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                      footbridge_defconfig
arm                       versatile_defconfig
sh                           se7724_defconfig
powerpc                       maple_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7712_defconfig
arm                        vexpress_defconfig
mips                       bmips_be_defconfig
mips                             allmodconfig
arm                        shmobile_defconfig
sh                        edosk7760_defconfig
sh                             espt_defconfig
arm                           tegra_defconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     sequoia_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
xtensa                              defconfig
arm                       spear13xx_defconfig
powerpc                      chrp32_defconfig
csky                                defconfig
parisc                           allyesconfig
powerpc                 mpc85xx_cds_defconfig
mips                      pic32mzda_defconfig
arm                            hisi_defconfig
arm                         palmz72_defconfig
powerpc                 mpc832x_mds_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 canyonlands_defconfig
powerpc                      ppc44x_defconfig
powerpc                           allnoconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
sh                          urquell_defconfig
sh                             shx3_defconfig
openrisc                  or1klitex_defconfig
powerpc                     tqm5200_defconfig
arm                           omap1_defconfig
arm                     davinci_all_defconfig
sh                          rsk7269_defconfig
arm                            mmp2_defconfig
h8300                            alldefconfig
arm                         hackkit_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                             sh03_defconfig
parisc                generic-64bit_defconfig
powerpc                       eiger_defconfig
sh                            hp6xx_defconfig
sh                           se7750_defconfig
arm                         lubbock_defconfig
alpha                               defconfig
powerpc                   currituck_defconfig
arm                          exynos_defconfig
sh                     magicpanelr2_defconfig
powerpc                      ep88xc_defconfig
arm                        neponset_defconfig
nios2                         3c120_defconfig
powerpc                 mpc834x_itx_defconfig
um                             i386_defconfig
powerpc                      pmac32_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a006-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a005-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a015-20211219
i386                 randconfig-a013-20211219
i386                 randconfig-a011-20211219
i386                 randconfig-a016-20211219
i386                 randconfig-a014-20211219
i386                 randconfig-a012-20211219
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig

clang tested configs:
x86_64               randconfig-a015-20211220
x86_64               randconfig-a014-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
x86_64               randconfig-a013-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a013-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a016-20211220
s390                 randconfig-r044-20211220
hexagon              randconfig-r041-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
