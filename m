Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DD24840A0
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 12:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbiADLQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 06:16:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:38744 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230512AbiADLQs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Jan 2022 06:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641295008; x=1672831008;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=97XgLTAw7bBKk5Ccbg0X3/0bpww2OLtIwFuYIHGQJIk=;
  b=Ln9Le3GDssMfjt5SD92iidGAvCDIZ1hM2lybGCGmPoMnJwEfVFZZloKX
   8pkY0vjD1OaOiUKxihHyxuRksdjdV8rVAbUG+n3WJu4CVRQJfl7mZUY5o
   ZboLx0GFGDikqziLIZbJEyWzm6332nByewGqIIgQfcm+mDaNQwgPyDFXb
   NkuA0yAih1MHuHYdJq2oeohXmC1cLh80nyfKctmYWh+W9LvggMcjYPBg3
   ccsEx5ybZGgtrfKanBkklqLiTTbJBrgmTb9hHZEmO0F0WjSaVT4uLO5ZU
   ATv6wz223zW3CP6LC+LUymwU8rXHM1Ax8mGW/wiSEY98tUPuRkohiz5v5
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="302958614"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="302958614"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 03:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="620615379"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jan 2022 03:16:46 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n4ho5-000FFo-US; Tue, 04 Jan 2022 11:16:45 +0000
Date:   Tue, 04 Jan 2022 19:15:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 0f663729bb4afc92a9986b66131ebd5b8a9254d1
Message-ID: <61d42c60.rlDpe0A86BTznLCJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 0f663729bb4afc92a9986b66131ebd5b8a9254d1  USB: core: Fix bug in resuming hub's handling of wakeup requests

Warning reports:

https://lore.kernel.org/linux-usb/202112211923.EfvDjyKL-lkp@intel.com

Warning in current branch:

drivers/usb/renesas_usbhs/mod.c:195:13: warning: variable 'intenb0' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm-defconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- arm64-defconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used
`-- sparc-allyesconfig
    `-- drivers-usb-renesas_usbhs-mod.c:warning:variable-intenb0-set-but-not-used

elapsed time: 1261m

configs tested: 54
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
