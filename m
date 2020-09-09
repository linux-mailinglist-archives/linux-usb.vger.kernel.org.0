Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014DB262A3C
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 10:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgIII1l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 04:27:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:4190 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726726AbgIII1l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 04:27:41 -0400
IronPort-SDR: K/DgtWA5KydfPXATKyjbn2ILFz8EaVpGaALiVDurHAIHMjgjlUD3jWSoiPADfW4RIyCiuxZut/
 tlV3tQ2ljing==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="159253869"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="159253869"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:27:39 -0700
IronPort-SDR: MYBR2LtD5tqbdWZj+iZv57LDmogyl6/chh4l4iIlmyfeAaLKEPjjY6NP6eezKVAKiaYmk1OT9Y
 H4+QjeunlfjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="304416916"
Received: from lkp-server01.sh.intel.com (HELO 12ff3cf3f2e9) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Sep 2020 01:27:38 -0700
Received: from kbuild by 12ff3cf3f2e9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kFvS6-00007N-1z; Wed, 09 Sep 2020 08:27:38 +0000
Date:   Wed, 09 Sep 2020 16:26:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 a29c0adbb688ddee61b731804fb360898412fe7e
Message-ID: <5f5891c7.AtgXnHon0B/iLL8h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: a29c0adbb688ddee61b731804fb360898412fe7e  Merge tag 'usb-serial-5.9-rc5' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 724m

configs tested: 128
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
mips                malta_kvm_guest_defconfig
m68k                        m5407c3_defconfig
c6x                              allyesconfig
mips                            gpr_defconfig
sh                           se7780_defconfig
powerpc                           allnoconfig
m68k                       m5475evb_defconfig
mips                     decstation_defconfig
h8300                    h8300h-sim_defconfig
arm                            zeus_defconfig
sh                           se7705_defconfig
riscv                    nommu_k210_defconfig
arm                       spear13xx_defconfig
mips                         tb0287_defconfig
riscv                            alldefconfig
m68k                         amcore_defconfig
arm                           h5000_defconfig
sh                          lboxre2_defconfig
sh                   secureedge5410_defconfig
um                            kunit_defconfig
sh                           se7721_defconfig
sh                          rsk7264_defconfig
c6x                         dsk6455_defconfig
arm                        mini2440_defconfig
h8300                            alldefconfig
sh                        sh7785lcr_defconfig
arc                          axs103_defconfig
mips                         rt305x_defconfig
arm                         s3c2410_defconfig
riscv                            allmodconfig
m68k                        stmark2_defconfig
arm                         shannon_defconfig
c6x                        evmc6457_defconfig
arm                            pleb_defconfig
powerpc                  mpc885_ads_defconfig
mips                           ip28_defconfig
sh                         apsh4a3a_defconfig
powerpc                          allyesconfig
arm                        magician_defconfig
arm                         assabet_defconfig
m68k                            mac_defconfig
xtensa                       common_defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                             defconfig
i386                 randconfig-a004-20200908
i386                 randconfig-a005-20200908
i386                 randconfig-a006-20200908
i386                 randconfig-a002-20200908
i386                 randconfig-a001-20200908
i386                 randconfig-a003-20200908
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
i386                 randconfig-a016-20200908
i386                 randconfig-a015-20200908
i386                 randconfig-a011-20200908
i386                 randconfig-a013-20200908
i386                 randconfig-a014-20200908
i386                 randconfig-a012-20200908
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a013-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a003-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200908
x86_64               randconfig-a006-20200908
x86_64               randconfig-a003-20200908
x86_64               randconfig-a001-20200908
x86_64               randconfig-a005-20200908
x86_64               randconfig-a002-20200908
x86_64               randconfig-a013-20200909
x86_64               randconfig-a016-20200909
x86_64               randconfig-a011-20200909
x86_64               randconfig-a012-20200909
x86_64               randconfig-a015-20200909
x86_64               randconfig-a014-20200909

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
