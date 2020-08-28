Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280282561CB
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 22:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgH1UAa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 16:00:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:7084 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgH1UA3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Aug 2020 16:00:29 -0400
IronPort-SDR: tT/AzQWGcnIhXwrvdEmddO0vf9+54N11vZ3V2uJdy412J5HyQsthHS8oDi9vZpOV2+0ZNB8ip4
 jQXxvuiRq71Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="156747242"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="156747242"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 13:00:28 -0700
IronPort-SDR: tSwq+HrxBJDE5Ml+xBsbu4iRM+k1U6OXUwLLCrfvAZNPYlF+iv8oTXMxkmQQSL70rc1tWJvk+H
 Q51O3GCI6a0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="475827464"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Aug 2020 13:00:27 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBkXy-0000AB-UE; Fri, 28 Aug 2020 20:00:26 +0000
Date:   Sat, 29 Aug 2020 03:59:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3ed8e1c2ac9914a2fcb08ec13476b85319536cea
Message-ID: <5f496230.kRMZU7AsL6pde4DL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 3ed8e1c2ac9914a2fcb08ec13476b85319536cea  usb: typec: tcpm: Migrate workqueue to RT priority for processing events

elapsed time: 724m

configs tested: 116
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
m68k                       m5208evb_defconfig
m68k                        mvme147_defconfig
openrisc                    or1ksim_defconfig
mips                         rt305x_defconfig
parisc                              defconfig
powerpc                     ep8248e_defconfig
powerpc                     pseries_defconfig
arm                        keystone_defconfig
i386                             allyesconfig
sh                           se7722_defconfig
parisc                generic-64bit_defconfig
mips                           rs90_defconfig
m68k                       bvme6000_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                     pq2fads_defconfig
m68k                         apollo_defconfig
m68k                             allyesconfig
powerpc                          alldefconfig
arc                           tb10x_defconfig
m68k                           sun3_defconfig
sh                           se7721_defconfig
sh                           se7780_defconfig
arm                           efm32_defconfig
arm                         cm_x300_defconfig
powerpc                    adder875_defconfig
arm                        mvebu_v7_defconfig
sh                           se7724_defconfig
mips                         db1xxx_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
h8300                               defconfig
nds32                               defconfig
sh                           se7751_defconfig
mips                         mpc30x_defconfig
arc                     nsimosci_hs_defconfig
mips                malta_kvm_guest_defconfig
mips                  cavium_octeon_defconfig
arc                             nps_defconfig
arm                       spear13xx_defconfig
arm                         ebsa110_defconfig
ia64                      gensparse_defconfig
sh                     magicpanelr2_defconfig
h8300                            allyesconfig
arc                        nsim_700_defconfig
mips                          rb532_defconfig
sh                          lboxre2_defconfig
s390                       zfcpdump_defconfig
sh                             sh03_defconfig
powerpc                    gamecube_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
nds32                            alldefconfig
arm                           corgi_defconfig
m68k                       m5275evb_defconfig
arm                     davinci_all_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200828
i386                 randconfig-a005-20200828
i386                 randconfig-a003-20200828
i386                 randconfig-a004-20200828
i386                 randconfig-a001-20200828
i386                 randconfig-a006-20200828
x86_64               randconfig-a015-20200828
x86_64               randconfig-a012-20200828
x86_64               randconfig-a016-20200828
x86_64               randconfig-a014-20200828
x86_64               randconfig-a011-20200828
x86_64               randconfig-a013-20200828
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
