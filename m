Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E9322C863
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 16:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgGXOuh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 10:50:37 -0400
Received: from mga01.intel.com ([192.55.52.88]:19147 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbgGXOuh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jul 2020 10:50:37 -0400
IronPort-SDR: kmnaRh5TeXyZ81dhjpDgFBfkBYng0H8FDu/Z5y5o83+KOjBngJWr1aS31xE8LzKXnLeI2yW+qG
 mrEwxKVnxBkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="168848689"
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; 
   d="scan'208";a="168848689"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2020 07:48:34 -0700
IronPort-SDR: 3qD4emY11BiWaNoUivO5G1BW9Xa9UgRlf69O+VHzyVw2hyetEVfv7cusd2zTcjKJGQVztfKHlx
 x4QswLk2YokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; 
   d="scan'208";a="321039315"
Received: from lkp-server01.sh.intel.com (HELO df0563f96c37) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2020 07:48:33 -0700
Received: from kbuild by df0563f96c37 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jyyzw-0000Nw-Vt; Fri, 24 Jul 2020 14:48:32 +0000
Date:   Fri, 24 Jul 2020 22:48:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 9a360a7cae11461ccd933a9ea366b0dcb3afadb0
Message-ID: <5f1af4be.tlUI8XPIq7ZTTGEd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 9a360a7cae11461ccd933a9ea366b0dcb3afadb0  xhci: dbc: remove tty specific port structure from struct xhci_dbc

Warning in current branch:

drivers/usb/host/xhci-dbgcap.c:410:1: warning: no previous prototype for 'xhci_dbc_ring_alloc' [-Wmissing-prototypes]
drivers/usb/host/xhci-dbgcap.c:423:1: warning: no previous prototype for 'xhci_dbc_ring_alloc' [-Wmissing-prototypes]
drivers/usb/host/xhci-dbgtty.c:396:5: warning: no previous prototype for 'xhci_dbc_tty_register_device' [-Wmissing-prototypes]
drivers/usb/host/xhci-dbgtty.c:401:5: warning: no previous prototype for 'xhci_dbc_tty_register_device' [-Wmissing-prototypes]
drivers/usb/host/xhci-dbgtty.c:444:6: warning: no previous prototype for 'xhci_dbc_tty_unregister_device' [-Wmissing-prototypes]
drivers/usb/host/xhci-dbgtty.c:452:6: warning: no previous prototype for 'xhci_dbc_tty_unregister_device' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- alpha-allyesconfig
|   `-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
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
|-- arm64-allmodconfig
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
|-- h8300-allmodconfig
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
|-- mips-randconfig-c021-20200724
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- nds32-allyesconfig
|   `-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|-- nios2-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- openrisc-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- parisc-allmodconfig
|   `-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|-- parisc-allyesconfig
|   `-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|-- powerpc-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- powerpc-allyesconfig
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
|-- s390-allmodconfig
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
|-- sparc-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- sparc64-allmodconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- sparc64-allyesconfig
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
|-- x86_64-randconfig-c002-20200724
|   |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
|   |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
|   `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device
`-- xtensa-allyesconfig
    |-- drivers-usb-host-xhci-dbgcap.c:warning:no-previous-prototype-for-xhci_dbc_ring_alloc
    |-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_register_device
    `-- drivers-usb-host-xhci-dbgtty.c:warning:no-previous-prototype-for-xhci_dbc_tty_unregister_device

elapsed time: 1337m

configs tested: 74
configs skipped: 1

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                            defconfig
openrisc                         allyesconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
