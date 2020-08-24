Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A793124F17D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 05:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgHXDS0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 23:18:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:8475 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726684AbgHXDSZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Aug 2020 23:18:25 -0400
IronPort-SDR: x2pqr9kprezgYgWhV7IrKVwyYkI4U4EvoKq3ZDnFRTXkCfrGlofVLcw4Bts+q3nk2l3Q0OVYuE
 HedNAdST7dIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="153243782"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="153243782"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2020 20:18:23 -0700
IronPort-SDR: 7N7BRUexiUIHBDwTMJld/I4p4QQAjdwPAV2la9RKObzeM78GCsuSs+EoSFwgGjgexDmZQDS3TP
 tLa7eQ+pAgPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="279505111"
Received: from lkp-server01.sh.intel.com (HELO 91ed66e1ca04) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2020 20:18:21 -0700
Received: from kbuild by 91ed66e1ca04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kA301-0002NL-7b; Mon, 24 Aug 2020 03:18:21 +0000
Date:   Mon, 24 Aug 2020 11:17:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f1ec7ae6c9f8c016db320e204cb519a1da1581b8
Message-ID: <5f433167.9mNg0YnuMCNL1cxx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: f1ec7ae6c9f8c016db320e204cb519a1da1581b8  xhci: Always restore EP_SOFT_CLEAR_TOGGLE even if ep reset failed

elapsed time: 722m

configs tested: 89
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
powerpc                     powernv_defconfig
sh                        apsh4ad0a_defconfig
arm                  colibri_pxa270_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
m68k                            q40_defconfig
ia64                         bigsur_defconfig
powerpc                      pmac32_defconfig
powerpc                     skiroot_defconfig
arc                            hsdk_defconfig
csky                             alldefconfig
riscv                    nommu_virt_defconfig
arm                        neponset_defconfig
sh                          polaris_defconfig
sh                          urquell_defconfig
powerpc                             defconfig
m68k                         apollo_defconfig
powerpc                          alldefconfig
arm                            pleb_defconfig
arm                            dove_defconfig
arm64                            alldefconfig
arc                             nps_defconfig
arm                          ep93xx_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20200823
x86_64               randconfig-a003-20200823
x86_64               randconfig-a005-20200823
x86_64               randconfig-a001-20200823
x86_64               randconfig-a006-20200823
x86_64               randconfig-a004-20200823
i386                 randconfig-a002-20200823
i386                 randconfig-a004-20200823
i386                 randconfig-a003-20200823
i386                 randconfig-a005-20200823
i386                 randconfig-a006-20200823
i386                 randconfig-a001-20200823
i386                 randconfig-a013-20200823
i386                 randconfig-a012-20200823
i386                 randconfig-a011-20200823
i386                 randconfig-a016-20200823
i386                 randconfig-a014-20200823
i386                 randconfig-a015-20200823
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
