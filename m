Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50778309FEC
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 02:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhBABSC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 Jan 2021 20:18:02 -0500
Received: from mga02.intel.com ([134.134.136.20]:22655 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231142AbhBABRn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 31 Jan 2021 20:17:43 -0500
IronPort-SDR: gCcKkOYLOXHLG8AFzkkhvodwMJbJU5+aMf6NQA9v4OmR2MgsIxooaFb74QjzD0p5cAkwky8EE0
 c6RUHVUmQFaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="167724297"
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="167724297"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2021 17:17:00 -0800
IronPort-SDR: LSCQk7SFT7CNoKRdasr6ikzmGfwO9szHvU7811g/cdmeSusZD9ewaiMG4oiqzDbYCu8exfuE7e
 46F8cJNL0blw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="368713615"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2021 17:16:59 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l6Npq-0006Gm-O3; Mon, 01 Feb 2021 01:16:58 +0000
Date:   Mon, 01 Feb 2021 09:16:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 3e1f4a2e1184ae6ad7f4caf682ced9554141a0f4
Message-ID: <60175674.3/6Y5ujNifjX98f4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 3e1f4a2e1184ae6ad7f4caf682ced9554141a0f4  USB: gadget: legacy: fix an error code in eth_bind()

elapsed time: 725m

configs tested: 94
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm                       imx_v4_v5_defconfig
powerpc                     tqm5200_defconfig
arm                         palmz72_defconfig
arm                        oxnas_v6_defconfig
arm                           sunxi_defconfig
powerpc                       maple_defconfig
sh                          sdk7786_defconfig
arm                       versatile_defconfig
m68k                        mvme147_defconfig
m68k                        m5272c3_defconfig
sh                           se7619_defconfig
sh                          rsk7201_defconfig
powerpc                  iss476-smp_defconfig
mips                     decstation_defconfig
arm                           sama5_defconfig
arm                       netwinder_defconfig
powerpc                    gamecube_defconfig
m68k                        stmark2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210131
i386                 randconfig-a003-20210131
i386                 randconfig-a002-20210131
i386                 randconfig-a001-20210131
i386                 randconfig-a004-20210131
i386                 randconfig-a006-20210131
x86_64               randconfig-a015-20210131
x86_64               randconfig-a011-20210131
x86_64               randconfig-a014-20210131
x86_64               randconfig-a016-20210131
x86_64               randconfig-a012-20210131
x86_64               randconfig-a013-20210131
i386                 randconfig-a013-20210131
i386                 randconfig-a011-20210131
i386                 randconfig-a015-20210131
i386                 randconfig-a012-20210131
i386                 randconfig-a014-20210131
i386                 randconfig-a016-20210131
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
x86_64               randconfig-a004-20210131
x86_64               randconfig-a002-20210131
x86_64               randconfig-a001-20210131
x86_64               randconfig-a005-20210131
x86_64               randconfig-a006-20210131
x86_64               randconfig-a003-20210131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
