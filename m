Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2391149DAF7
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 07:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbiA0Gps (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 01:45:48 -0500
Received: from mga09.intel.com ([134.134.136.24]:65391 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229716AbiA0Gpr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jan 2022 01:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643265947; x=1674801947;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V8ZDt/nPacnynXibZVTQkrP/iR/INlRL5iKrsLjow80=;
  b=nYgj9uyh5IYjlgURbS22C3vxCzn1Wl4AiHoBaclaciw6qhqKzoJJ7jOY
   Y+RoeO3WZlKxHMbh6OirBbSGFWVIqHO8/ndhv4FD3jf9yDkANYzQVw/r0
   ipIFASQ3BiKa9+91JiyY3XIwCLAM6JAxg//CBHROkXg5mo39+fZOPUwh+
   SCsDXA0c1KYy1MPgmGeG0QQUTmKfpTamNIzyFzZlqHtyr1dzWIhcIN4Qs
   oJPXEQBU7we0d+yEtPNjd7EXkOp419XP0DViyEGD5uM38bsJirPU5xf17
   gggzId/K01rsAJNROFJo+6gYwnnNHy/xMFHEO7DWaVzWCP2SnyMuMt/jz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246544322"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="246544322"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 22:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="696530906"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2022 22:45:44 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCyXP-000MEs-Ue; Thu, 27 Jan 2022 06:45:43 +0000
Date:   Thu, 27 Jan 2022 14:44:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 993a44fa85c1ea5989fb5c46236ca2e3cfd71b78
Message-ID: <61f23f58.yGu4HcJXhvpvUqBh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 993a44fa85c1ea5989fb5c46236ca2e3cfd71b78  usb: gadget: f_uac2: allow changing interface name via configfs

elapsed time: 865m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
sparc64                          alldefconfig
h8300                    h8300h-sim_defconfig
arm                         nhk8815_defconfig
powerpc                       ppc64_defconfig
m68k                        stmark2_defconfig
xtensa                  nommu_kc705_defconfig
mips                         rt305x_defconfig
arm                            zeus_defconfig
nios2                         10m50_defconfig
xtensa                              defconfig
arc                        vdk_hs38_defconfig
sh                          rsk7269_defconfig
ia64                        generic_defconfig
sh                           sh2007_defconfig
um                                  defconfig
xtensa                  audio_kc705_defconfig
mips                         cobalt_defconfig
powerpc                      makalu_defconfig
sh                           se7722_defconfig
m68k                          amiga_defconfig
powerpc                      ppc6xx_defconfig
arm                             ezx_defconfig
arm                          pxa3xx_defconfig
powerpc                      pasemi_defconfig
m68k                       m5208evb_defconfig
mips                             allmodconfig
arm                        oxnas_v6_defconfig
sh                   sh7724_generic_defconfig
sparc                            allyesconfig
arc                            hsdk_defconfig
arm                            hisi_defconfig
i386                             alldefconfig
sh                             espt_defconfig
m68k                         amcore_defconfig
mips                 decstation_r4k_defconfig
s390                          debug_defconfig
m68k                        mvme16x_defconfig
xtensa                       common_defconfig
sh                            migor_defconfig
openrisc                 simple_smp_defconfig
powerpc                      tqm8xx_defconfig
m68k                       m5249evb_defconfig
h8300                            alldefconfig
arm                           corgi_defconfig
arm                          pxa910_defconfig
powerpc                  iss476-smp_defconfig
arm                  randconfig-c002-20220124
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
sh                               allmodconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220125
arc                  randconfig-r043-20220125
arc                  randconfig-r043-20220124
s390                 randconfig-r044-20220125
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
arm                  colibri_pxa300_defconfig
arm                          imote2_defconfig
powerpc                      obs600_defconfig
arm                            mmp2_defconfig
mips                   sb1250_swarm_defconfig
powerpc                   microwatt_defconfig
arm                              alldefconfig
arm                      pxa255-idp_defconfig
hexagon                             defconfig
mips                     loongson2k_defconfig
arm                        neponset_defconfig
powerpc                     kmeter1_defconfig
powerpc                    socrates_defconfig
arm                           omap1_defconfig
powerpc                     skiroot_defconfig
i386                             allyesconfig
powerpc                      walnut_defconfig
powerpc                        fsp2_defconfig
powerpc                      katmai_defconfig
riscv                          rv32_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124
s390                 randconfig-r044-20220124
riscv                randconfig-r042-20220126
hexagon              randconfig-r045-20220126
hexagon              randconfig-r041-20220126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
