Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E505633DD8C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 20:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236987AbhCPTaQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 15:30:16 -0400
Received: from mga09.intel.com ([134.134.136.24]:36349 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240464AbhCPT3t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Mar 2021 15:29:49 -0400
IronPort-SDR: 0CdHkTyzWkEIBuTA0mqrwp5H3jb5ykjBde9LzXknV8/Ow3OpEU3gpwdT267dXHdhtZpqjdmKpK
 hVt2cu9USfwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="189416564"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="189416564"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 12:29:47 -0700
IronPort-SDR: 8yPI7C0hQw+BS1DE1y+XmtvSWWbRda9Vi3Xq7dP/gq63NmuLLULOQGtpOBYVl5ye4Bz632Nu0R
 0EF4p4A4Qp+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="440184329"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2021 12:29:46 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lMFNx-0000H4-DJ; Tue, 16 Mar 2021 19:29:45 +0000
Date:   Wed, 17 Mar 2021 03:29:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 eb9238e53717a46191db2d3bc5c18b13b6c8cb64
Message-ID: <60510725.hvYJlcnaOZGh2Lb9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: eb9238e53717a46191db2d3bc5c18b13b6c8cb64  Merge tag 'usb-v5.12-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-linus

elapsed time: 723m

configs tested: 104
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
mips                           ip27_defconfig
powerpc                      arches_defconfig
sh                           se7343_defconfig
arm                           sama5_defconfig
s390                             alldefconfig
powerpc                     skiroot_defconfig
arm                         hackkit_defconfig
powerpc                     tqm5200_defconfig
powerpc                         wii_defconfig
arm                        trizeps4_defconfig
arm                          gemini_defconfig
csky                             alldefconfig
powerpc                  storcenter_defconfig
powerpc                       ppc64_defconfig
sh                          rsk7264_defconfig
arm                        shmobile_defconfig
powerpc64                           defconfig
ia64                        generic_defconfig
powerpc                   bluestone_defconfig
mips                         tb0219_defconfig
powerpc                      ppc6xx_defconfig
arm                         assabet_defconfig
mips                      pistachio_defconfig
mips                  decstation_64_defconfig
arm                            lart_defconfig
arm                         nhk8815_defconfig
mips                        workpad_defconfig
powerpc                      pasemi_defconfig
mips                      malta_kvm_defconfig
powerpc                     kilauea_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      obs600_defconfig
xtensa                  audio_kc705_defconfig
arm                          collie_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210316
i386                 randconfig-a005-20210316
i386                 randconfig-a002-20210316
i386                 randconfig-a003-20210316
i386                 randconfig-a004-20210316
i386                 randconfig-a006-20210316
i386                 randconfig-a013-20210316
i386                 randconfig-a016-20210316
i386                 randconfig-a011-20210316
i386                 randconfig-a012-20210316
i386                 randconfig-a015-20210316
i386                 randconfig-a014-20210316
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210316
x86_64               randconfig-a001-20210316
x86_64               randconfig-a005-20210316
x86_64               randconfig-a004-20210316
x86_64               randconfig-a003-20210316
x86_64               randconfig-a002-20210316

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
