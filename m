Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AFB30B563
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 03:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbhBBCmw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 21:42:52 -0500
Received: from mga07.intel.com ([134.134.136.100]:63962 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231156AbhBBCmu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 21:42:50 -0500
IronPort-SDR: Ic8omYVZTFFybryO6v/gZt2vfCwt6v83LotD+1CME5f4NYAkbWChi5jrsXWSGB3go0E9bMCKBu
 A9RLmAuqkf6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="244869604"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="244869604"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 18:42:09 -0800
IronPort-SDR: pYZKtCCS7Ck1TQdC+zy9EUr8vj4XFuII4FmLql6mS7zTMC9h3RgtpID2Ux0LlYGiZopSQG2SQs
 yLJliXN7PX1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="575338434"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Feb 2021 18:42:08 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l6ldn-0008ts-Ex; Tue, 02 Feb 2021 02:42:07 +0000
Date:   Tue, 02 Feb 2021 10:41:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 29b01295a829fba7399ee84afff4e64660e49f04
Message-ID: <6018bbda.sJqSo0/a0+nbmGqI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 29b01295a829fba7399ee84afff4e64660e49f04  usb: typec: Add typec_partner_set_pd_revision

elapsed time: 726m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                            q40_defconfig
powerpc                  storcenter_defconfig
arm                           h5000_defconfig
sh                           se7619_defconfig
mips                            ar7_defconfig
sh                   secureedge5410_defconfig
powerpc                        fsp2_defconfig
mips                         mpc30x_defconfig
h8300                               defconfig
mips                      loongson3_defconfig
sh                        sh7763rdp_defconfig
arm                         s5pv210_defconfig
arm                        keystone_defconfig
ia64                         bigsur_defconfig
mips                      maltaaprp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210201
x86_64               randconfig-a001-20210201
x86_64               randconfig-a005-20210201
x86_64               randconfig-a002-20210201
x86_64               randconfig-a004-20210201
x86_64               randconfig-a003-20210201
i386                 randconfig-a001-20210201
i386                 randconfig-a005-20210201
i386                 randconfig-a003-20210201
i386                 randconfig-a006-20210201
i386                 randconfig-a002-20210201
i386                 randconfig-a004-20210201
i386                 randconfig-a013-20210201
i386                 randconfig-a016-20210201
i386                 randconfig-a014-20210201
i386                 randconfig-a012-20210201
i386                 randconfig-a015-20210201
i386                 randconfig-a011-20210201
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
x86_64               randconfig-a013-20210201
x86_64               randconfig-a014-20210201
x86_64               randconfig-a015-20210201
x86_64               randconfig-a016-20210201
x86_64               randconfig-a011-20210201
x86_64               randconfig-a012-20210201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
