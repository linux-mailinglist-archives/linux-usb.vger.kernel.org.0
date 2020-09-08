Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF68260A35
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 07:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgIHFjJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 01:39:09 -0400
Received: from mga06.intel.com ([134.134.136.31]:51292 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728799AbgIHFjE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 01:39:04 -0400
IronPort-SDR: PWr3gJ1pMOn8PVjr4Ytoq7dicn2tKTNADPGkEvWtmAl00NmQPu2VvGkOThJp+WPmpicnE0qUDQ
 g+i9Lx+7XD6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="219634687"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; 
   d="scan'208";a="219634687"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 22:39:04 -0700
IronPort-SDR: brFSW5CNZW66IGgoSK7ljBa3mNFmwsFiHt3XfqOcEpVjm+jYKdN0qClpz7PAFp9eWwg4PlRdxS
 4FIR79IXPZPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; 
   d="scan'208";a="317066356"
Received: from lkp-server01.sh.intel.com (HELO c2729d4f3f0b) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Sep 2020 22:39:03 -0700
Received: from kbuild by c2729d4f3f0b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kFWLO-00002j-84; Tue, 08 Sep 2020 05:39:02 +0000
Date:   Tue, 08 Sep 2020 13:38:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb_control_msg] BUILD SUCCESS
 5bc91bcde6a1f3fd8dc8f413e84e632499a98152
Message-ID: <5f5718cd.ue2qDzB4Kg7ucrr3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb_control_msg
branch HEAD: 5bc91bcde6a1f3fd8dc8f413e84e632499a98152  ALSA: remove calls to usb_pipe_type_check for control endpoints

elapsed time: 720m

configs tested: 143
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                    xip_kc705_defconfig
arm                          iop32x_defconfig
h8300                    h8300h-sim_defconfig
mips                           ip27_defconfig
arm                   milbeaut_m10v_defconfig
alpha                               defconfig
arc                              alldefconfig
m68k                        m5272c3_defconfig
mips                 decstation_r4k_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     ep8248e_defconfig
xtensa                              defconfig
arm                          pxa910_defconfig
arm                        spear3xx_defconfig
powerpc                      tqm8xx_defconfig
mips                           rs90_defconfig
xtensa                       common_defconfig
arm                            u300_defconfig
powerpc                     powernv_defconfig
arc                         haps_hs_defconfig
arm                       netwinder_defconfig
mips                           ci20_defconfig
c6x                        evmc6457_defconfig
sh                   sh7724_generic_defconfig
mips                          ath79_defconfig
openrisc                    or1ksim_defconfig
sh                          lboxre2_defconfig
powerpc                     mpc5200_defconfig
h8300                     edosk2674_defconfig
sh                          urquell_defconfig
sh                        apsh4ad0a_defconfig
c6x                        evmc6472_defconfig
xtensa                           alldefconfig
powerpc                      ppc64e_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
riscv                          rv32_defconfig
arm                         nhk8815_defconfig
nios2                               defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc6xx_defconfig
mips                             allyesconfig
sh                          sdk7786_defconfig
arm                             ezx_defconfig
mips                       lemote2f_defconfig
arm                           spitz_defconfig
arm                          ep93xx_defconfig
arm                       versatile_defconfig
sh                          r7785rp_defconfig
openrisc                 simple_smp_defconfig
s390                       zfcpdump_defconfig
arm                       mainstone_defconfig
sh                            shmin_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
i386                 randconfig-a004-20200908
i386                 randconfig-a006-20200908
i386                 randconfig-a002-20200908
i386                 randconfig-a001-20200908
i386                 randconfig-a003-20200908
i386                 randconfig-a004-20200907
i386                 randconfig-a005-20200907
i386                 randconfig-a006-20200907
i386                 randconfig-a002-20200907
i386                 randconfig-a003-20200907
i386                 randconfig-a001-20200907
i386                 randconfig-a005-20200908
x86_64               randconfig-a013-20200908
x86_64               randconfig-a016-20200908
x86_64               randconfig-a011-20200908
x86_64               randconfig-a015-20200908
x86_64               randconfig-a014-20200908
i386                 randconfig-a016-20200908
i386                 randconfig-a015-20200908
i386                 randconfig-a011-20200908
i386                 randconfig-a013-20200908
i386                 randconfig-a014-20200908
i386                 randconfig-a012-20200908
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
i386                 randconfig-a013-20200907
x86_64               randconfig-a003-20200907
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

clang tested configs:
x86_64               randconfig-a006-20200908
x86_64               randconfig-a003-20200908
x86_64               randconfig-a001-20200908
x86_64               randconfig-a002-20200908
x86_64               randconfig-a013-20200907
x86_64               randconfig-a011-20200907
x86_64               randconfig-a016-20200907
x86_64               randconfig-a012-20200907
x86_64               randconfig-a015-20200907
x86_64               randconfig-a014-20200907

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
