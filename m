Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F2B1E9D15
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 07:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgFAFRl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 01:17:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:37242 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgFAFRl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jun 2020 01:17:41 -0400
IronPort-SDR: c48jvDk3Y1gbJrGZbXCsoPLqGYK3d1S+0h5CHNjTj5MOhIs9CfOvmIudqxXBfpJEZ46FSNNcEK
 NECOxhyGvKRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 22:17:40 -0700
IronPort-SDR: O/rMxu+1UoPaN7DW4YP6RAXoBKHgHS7BW3nbFyVo1uCyhBldPdsHwBm8IcF3vKbKEjbUsFIUxm
 wrNpW+dVAuKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; 
   d="scan'208";a="257142819"
Received: from lkp-server01.sh.intel.com (HELO 49d03d9b0ee7) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 May 2020 22:17:39 -0700
Received: from kbuild by 49d03d9b0ee7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfcpO-0000DB-By; Mon, 01 Jun 2020 05:17:38 +0000
Date:   Mon, 01 Jun 2020 13:17:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 de21ab70ee32a7da288d1e89a0c107e810cc9aef
Message-ID: <5ed48f57.Zk5wIB9hzc4o0igH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-next
branch HEAD: de21ab70ee32a7da288d1e89a0c107e810cc9aef  Merge tag 'usb-serial-5.8-rc1-2' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

i386-tinyconfig vmlinux size:

+-------+------------------------------------+---------------------------------------------------------------------------+
| DELTA |               SYMBOL               |                                  COMMIT                                   |
+-------+------------------------------------+---------------------------------------------------------------------------+
|  +456 | TOTAL                              | 8f3d9f354286..de21ab70ee32 (ALL COMMITS)                                  |
|  +379 | TEXT                               | 8f3d9f354286..de21ab70ee32 (ALL COMMITS)                                  |
|   +72 | DATA                               | 8f3d9f354286..de21ab70ee32 (ALL COMMITS)                                  |
|  +240 | free_irq()                         | 8f3d9f354286..de21ab70ee32 (ALL COMMITS)                                  |
|  +136 | arch/x86/events/zhaoxin/built-in.* | 97fe809934dd CDC-ACM: heed quirk also in error handling                   |
|  -136 | arch/x86/events/zhaoxin/built-in.* | 4b9d03131de3 Merge tag 'usb-serial-5.8-rc1' of https://git.kernel.org/pub |
|   +72 | copy_clone_args_from_user()        | 8f3d9f354286..de21ab70ee32 (ALL COMMITS)                                  |
|   +64 | noop_backing_dev_info              | 8f3d9f354286..de21ab70ee32 (ALL COMMITS)                                  |
|   -86 | setup_irq()                        | 8f3d9f354286..de21ab70ee32 (ALL COMMITS)                                  |
|  -253 | __free_irq()                       | 8f3d9f354286..de21ab70ee32 (ALL COMMITS)                                  |
+-------+------------------------------------+---------------------------------------------------------------------------+

elapsed time: 4122m

configs tested: 165
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                          pxa3xx_defconfig
arm                         palmz72_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
riscv                          rv32_defconfig
powerpc                      pasemi_defconfig
sparc                       sparc64_defconfig
mips                  decstation_64_defconfig
mips                          ath79_defconfig
sh                        sh7763rdp_defconfig
s390                              allnoconfig
mips                         tb0226_defconfig
m68k                          multi_defconfig
sh                          rsk7269_defconfig
ia64                        generic_defconfig
xtensa                           allyesconfig
sh                          sdk7780_defconfig
mips                        jmr3927_defconfig
riscv                               defconfig
sh                           cayman_defconfig
arm                         ebsa110_defconfig
arm                            lart_defconfig
sh                         microdev_defconfig
x86_64                              defconfig
arm                          badge4_defconfig
arm                        oxnas_v6_defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
ia64                              allnoconfig
arm                        keystone_defconfig
arm                           viper_defconfig
arm                            pleb_defconfig
sh                             espt_defconfig
arm                           omap1_defconfig
arm                       spear13xx_defconfig
sparc64                          allyesconfig
microblaze                    nommu_defconfig
arm                            qcom_defconfig
powerpc                    amigaone_defconfig
nios2                         10m50_defconfig
arm                         s3c6400_defconfig
powerpc                             defconfig
arc                           tb10x_defconfig
arm                        mvebu_v7_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
c6x                         dsk6455_defconfig
riscv                    nommu_virt_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7343_defconfig
openrisc                            defconfig
mips                          rb532_defconfig
arm                         assabet_defconfig
arc                              alldefconfig
xtensa                       common_defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
arm                       cns3420vb_defconfig
arm                        spear3xx_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200529
i386                 randconfig-a001-20200529
i386                 randconfig-a002-20200529
i386                 randconfig-a006-20200529
i386                 randconfig-a003-20200529
i386                 randconfig-a005-20200529
i386                 randconfig-a004-20200531
i386                 randconfig-a003-20200531
i386                 randconfig-a006-20200531
i386                 randconfig-a002-20200531
i386                 randconfig-a005-20200531
i386                 randconfig-a001-20200531
x86_64               randconfig-a011-20200531
x86_64               randconfig-a016-20200531
x86_64               randconfig-a012-20200531
x86_64               randconfig-a014-20200531
x86_64               randconfig-a013-20200531
x86_64               randconfig-a015-20200531
x86_64               randconfig-a002-20200529
x86_64               randconfig-a006-20200529
x86_64               randconfig-a005-20200529
x86_64               randconfig-a001-20200529
x86_64               randconfig-a004-20200529
x86_64               randconfig-a003-20200529
i386                 randconfig-a013-20200529
i386                 randconfig-a011-20200529
i386                 randconfig-a012-20200529
i386                 randconfig-a015-20200529
i386                 randconfig-a016-20200529
i386                 randconfig-a014-20200529
i386                 randconfig-a013-20200531
i386                 randconfig-a012-20200531
i386                 randconfig-a015-20200531
i386                 randconfig-a011-20200531
i386                 randconfig-a016-20200531
i386                 randconfig-a014-20200531
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
