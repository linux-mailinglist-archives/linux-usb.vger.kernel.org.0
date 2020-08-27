Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CE7254EAC
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 21:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgH0TeO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 15:34:14 -0400
Received: from mga18.intel.com ([134.134.136.126]:59438 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726873AbgH0TeK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 15:34:10 -0400
IronPort-SDR: RVSMnCIG/CGm6DRO7NDYGyR4vMM9wKrBE4/rAYHUJpbX0TzjJ5T1SwcJ6X9Qbs0uQnH74w2j8G
 bgmCEjQrsuKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="144229074"
X-IronPort-AV: E=Sophos;i="5.76,360,1592895600"; 
   d="scan'208";a="144229074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2020 12:34:08 -0700
IronPort-SDR: w7c5j/V5orFlY6I9hkLlqEjELpW+aZ/YRhE2wBSj81JiRTh0oS7oIhMtyAZ9Yp3y3Q8IO+cxMZ
 3gJue+8GD3vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,360,1592895600"; 
   d="scan'208";a="403508103"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2020 12:34:07 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBNew-0002F1-Cw; Thu, 27 Aug 2020 19:34:06 +0000
Date:   Fri, 28 Aug 2020 03:33:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 9aa37788e7ebb3f489fb4b71ce07adadd444264a
Message-ID: <5f480a82.Zib1vqc9oHF3txJB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 9aa37788e7ebb3f489fb4b71ce07adadd444264a  USB: Ignore UAS for JMicron JMS567 ATA/ATAPI Bridge

elapsed time: 722m

configs tested: 103
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_k210_defconfig
mips                     decstation_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                              ul2_defconfig
powerpc                         ps3_defconfig
arm                             rpc_defconfig
sh                          sdk7780_defconfig
arm                             ezx_defconfig
mips                            e55_defconfig
arm                          pxa910_defconfig
sh                        apsh4ad0a_defconfig
mips                          ath25_defconfig
powerpc                     mpc5200_defconfig
arm                      pxa255-idp_defconfig
mips                           ip22_defconfig
arm                         hackkit_defconfig
arm                          moxart_defconfig
parisc                           alldefconfig
arm                        mvebu_v7_defconfig
sh                               alldefconfig
m68k                          amiga_defconfig
sh                        edosk7705_defconfig
arm                         axm55xx_defconfig
sh                          urquell_defconfig
arm                         assabet_defconfig
h8300                    h8300h-sim_defconfig
h8300                               defconfig
m68k                         apollo_defconfig
sh                             sh03_defconfig
sh                        edosk7760_defconfig
sh                           sh2007_defconfig
nios2                            alldefconfig
arc                                 defconfig
c6x                        evmc6678_defconfig
sh                             shx3_defconfig
powerpc                    amigaone_defconfig
powerpc                     skiroot_defconfig
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
powerpc                             defconfig
x86_64               randconfig-a003-20200827
x86_64               randconfig-a002-20200827
x86_64               randconfig-a001-20200827
x86_64               randconfig-a005-20200827
x86_64               randconfig-a006-20200827
x86_64               randconfig-a004-20200827
i386                 randconfig-a002-20200827
i386                 randconfig-a004-20200827
i386                 randconfig-a003-20200827
i386                 randconfig-a005-20200827
i386                 randconfig-a006-20200827
i386                 randconfig-a001-20200827
i386                 randconfig-a013-20200827
i386                 randconfig-a012-20200827
i386                 randconfig-a011-20200827
i386                 randconfig-a014-20200827
i386                 randconfig-a016-20200827
i386                 randconfig-a015-20200827
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
