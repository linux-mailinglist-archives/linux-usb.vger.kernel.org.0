Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1F01D99CE
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 16:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgESOci (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 10:32:38 -0400
Received: from mga09.intel.com ([134.134.136.24]:51825 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729132AbgESOch (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 May 2020 10:32:37 -0400
IronPort-SDR: YeykbbY1zLgU29F/SwlTFnfskR855pYgqscvKnWDAmOHNKf6GEzq15roaBcX+ELaxu5eJotPEe
 XkrB9G242S7w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 07:32:36 -0700
IronPort-SDR: KtMqhTaaOp9MPpbGelpHvoNxbTOWIZ/efOrbsSGGjTXeyiB82yN7BsIgNVk4U8MqNBoPe7EjHp
 Ev8lL+MIzDlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="282337331"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 May 2020 07:32:35 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jb3II-00033r-L4; Tue, 19 May 2020 22:32:34 +0800
Date:   Tue, 19 May 2020 22:31:43 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 df00731cffa0edb454ee0c490696ce0c1745e680
Message-ID: <5ec3edcf.6N1MbgmCmu7SOPMd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: df00731cffa0edb454ee0c490696ce0c1745e680  usb: xhci: fix USB_XHCI_PCI depends

Warning in current branch:

drivers/usb/host/xhci-pci.h:13:5: warning: no previous prototype for 'renesas_xhci_check_request_fw' [-Wmissing-prototypes]
drivers/usb/host/xhci-pci.h:19:6: warning: no previous prototype for 'renesas_xhci_pci_exit' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

recent_errors
|-- arm-defconfig
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- arm-shmobile_defconfig
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- arm64-defconfig
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- i386-debian-10.3
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- i386-defconfig
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- i386-randconfig-a004-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- i386-randconfig-a005-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- i386-randconfig-a006-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- i386-randconfig-a016-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- ia64-randconfig-r001-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- ia64-randconfig-r005-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- m68k-randconfig-r012-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- powerpc-skiroot_defconfig
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- riscv-defconfig
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- riscv-randconfig-r032-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- riscv-rv32_defconfig
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- sparc64-randconfig-r035-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-defconfig
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-fedora-25
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-kexec
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-randconfig-a001-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-randconfig-a004-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-randconfig-a005-20200519
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-rhel
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-rhel-7.2-clear
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-rhel-7.6
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
|-- x86_64-rhel-7.6-kselftests
|   |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
|   `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit
`-- xtensa-randconfig-r012-20200519
    |-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_check_request_fw
    `-- drivers-usb-host-xhci-pci.h:warning:no-previous-prototype-for-renesas_xhci_pci_exit

elapsed time: 480m

configs tested: 145
configs skipped: 5

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
sparc                            allyesconfig
m68k                             allyesconfig
mips                             allyesconfig
xtensa                generic_kc705_defconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
m68k                          hp300_defconfig
arc                      axs103_smp_defconfig
alpha                               defconfig
xtensa                           alldefconfig
arm                     davinci_all_defconfig
sh                          r7780mp_defconfig
arm                           sunxi_defconfig
powerpc                      chrp32_defconfig
sh                          polaris_defconfig
sh                         microdev_defconfig
arm                          exynos_defconfig
mips                              allnoconfig
arm                       omap2plus_defconfig
sh                                  defconfig
sh                           se7722_defconfig
powerpc64                           defconfig
riscv                          rv32_defconfig
arc                        nsimosci_defconfig
arc                        vdk_hs38_defconfig
sh                           se7751_defconfig
arm                       netwinder_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
powerpc                     powernv_defconfig
arc                             nps_defconfig
mips                    maltaup_xpa_defconfig
riscv                            allmodconfig
arm                        multi_v7_defconfig
powerpc                 linkstation_defconfig
csky                             allyesconfig
powerpc                     skiroot_defconfig
s390                                defconfig
arm                           h5000_defconfig
arc                     nsimosci_hs_defconfig
mips                         tb0287_defconfig
powerpc                      mgcoge_defconfig
um                           x86_64_defconfig
powerpc                  storcenter_defconfig
sh                            shmin_defconfig
powerpc                      tqm8xx_defconfig
arm                        shmobile_defconfig
arm                           stm32_defconfig
powerpc                       holly_defconfig
mips                         tb0226_defconfig
arm                       imx_v4_v5_defconfig
arm                       cns3420vb_defconfig
m68k                         amcore_defconfig
mips                  decstation_64_defconfig
arm                            mps2_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a006-20200519
i386                 randconfig-a005-20200519
i386                 randconfig-a001-20200519
i386                 randconfig-a003-20200519
i386                 randconfig-a004-20200519
i386                 randconfig-a002-20200519
x86_64               randconfig-a003-20200519
x86_64               randconfig-a005-20200519
x86_64               randconfig-a004-20200519
x86_64               randconfig-a006-20200519
x86_64               randconfig-a002-20200519
x86_64               randconfig-a001-20200519
i386                 randconfig-a012-20200519
i386                 randconfig-a014-20200519
i386                 randconfig-a016-20200519
i386                 randconfig-a011-20200519
i386                 randconfig-a015-20200519
i386                 randconfig-a013-20200519
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
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
