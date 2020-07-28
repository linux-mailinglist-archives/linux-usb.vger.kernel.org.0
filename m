Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8A4230865
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 13:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgG1LJj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 07:09:39 -0400
Received: from mga05.intel.com ([192.55.52.43]:51458 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728752AbgG1LJj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 07:09:39 -0400
IronPort-SDR: ++Yzw9Ro1FX3XJggz5RhGWiJ/PL14RlHn/QO/JydHgkTRcv3Bd4m3BIWcfhpRjv5tKTqqV5kM1
 nQ955RHzcvkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="236050627"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="236050627"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 04:09:08 -0700
IronPort-SDR: zHhqHTItto6jpph4EOmd8TbCCdHReQPWsbekM/TODyrc9fYtZOjOJaUirqsNzXWlKkp04+VZBj
 XUcI3T/bbnDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="490320214"
Received: from lkp-server01.sh.intel.com (HELO d27eb53fc52b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2020 04:09:06 -0700
Received: from kbuild by d27eb53fc52b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k0NTl-0000VN-IC; Tue, 28 Jul 2020 11:09:05 +0000
Date:   Tue, 28 Jul 2020 19:08:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 ca6377900974c3e22c379c48057aac51139d29fc
Message-ID: <5f200717.LXSgclD9GsZVARC6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: ca6377900974c3e22c379c48057aac51139d29fc  Revert "usb: dwc2: override PHY input signals with usb role switch support"

Warning in current branch:

drivers/usb/host/xhci-dbgcap.c:423:1: warning: no previous prototype for 'xhci_dbc_ring_alloc' [-Wmissing-prototypes]
drivers/usb/host/xhci-dbgtty.c:401:5: warning: no previous prototype for 'xhci_dbc_tty_register_device' [-Wmissing-prototypes]
drivers/usb/host/xhci-dbgtty.c:452:6: warning: no previous prototype for 'xhci_dbc_tty_unregister_device' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- arc-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- arm-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- arm-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- arm-randconfig-c003-20200727
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- arm64-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- c6x-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- h8300-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- i386-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- ia64-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- ia64-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- m68k-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- m68k-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- mips-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- mips-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- nds32-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- nios2-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- parisc-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- riscv-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- riscv-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- s390-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- sh-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- sh-randconfig-r034-20200727
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- sparc-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- sparc-randconfig-r023-20200727
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- x86_64-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
`-- xtensa-allyesconfig
    |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
    |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
    `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device

elapsed time: 1172m

configs tested: 71
configs skipped: 1

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
arm                       imx_v4_v5_defconfig
mips                           gcw0_defconfig
mips                      fuloong2e_defconfig
arm                      pxa255-idp_defconfig
s390                                defconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20200728
i386                 randconfig-a004-20200728
i386                 randconfig-a005-20200728
i386                 randconfig-a002-20200728
i386                 randconfig-a006-20200728
i386                 randconfig-a001-20200728
x86_64               randconfig-a014-20200728
x86_64               randconfig-a012-20200728
x86_64               randconfig-a015-20200728
x86_64               randconfig-a016-20200728
x86_64               randconfig-a013-20200728
x86_64               randconfig-a011-20200728
i386                 randconfig-a016-20200728
i386                 randconfig-a012-20200728
i386                 randconfig-a013-20200728
i386                 randconfig-a014-20200728
i386                 randconfig-a011-20200728
i386                 randconfig-a015-20200728
riscv                               defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
