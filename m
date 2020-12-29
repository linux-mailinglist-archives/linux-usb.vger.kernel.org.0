Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB6C2E6D64
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 03:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgL2C5z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 21:57:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:27042 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbgL2C5y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 21:57:54 -0500
IronPort-SDR: 8f4FZ2vJz4ROQVFaJAiZERH1KIQ+4lz6tb2VMEvHS5cjhioSMyfCq5SH6g0U52ZMbLjaS8m+IE
 wAFGO8JLhAYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="176604621"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="176604621"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 18:57:13 -0800
IronPort-SDR: 2kLgzbRabbsjvtRvr3pz2Tqbwx4YbL63zREAAnMfGmPcodWjwDDD6IsQeKXSjnjHA2NDCQhUKw
 ZXp6db3Vu/XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="564858851"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Dec 2020 18:57:12 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ku5CC-0003HX-4Q; Tue, 29 Dec 2020 02:57:12 +0000
Date:   Tue, 29 Dec 2020 10:56:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 9389044f27081d6ec77730c36d5bf9a1288bcda2
Message-ID: <5fea9af0.JK0mWK84AcJVNzo3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 9389044f27081d6ec77730c36d5bf9a1288bcda2  usb: gadget: f_uac2: reset wMaxPacketSize

elapsed time: 720m

configs tested: 140
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_k210_defconfig
powerpc                     rainier_defconfig
powerpc                        warp_defconfig
ia64                            zx1_defconfig
arm                            mps2_defconfig
m68k                          hp300_defconfig
powerpc                    ge_imp3a_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                    klondike_defconfig
powerpc                     taishan_defconfig
powerpc                     tqm8541_defconfig
sh                           se7722_defconfig
sh                 kfr2r09-romimage_defconfig
sh                         ap325rxa_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     powernv_defconfig
arm                     am200epdkit_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
mips                        workpad_defconfig
nios2                            alldefconfig
um                           x86_64_defconfig
sh                           se7724_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                         tb0226_defconfig
h8300                       h8s-sim_defconfig
sh                               j2_defconfig
csky                                defconfig
sparc                       sparc32_defconfig
powerpc                      pmac32_defconfig
arm                            qcom_defconfig
arm                         at91_dt_defconfig
sh                           se7751_defconfig
arm                      footbridge_defconfig
sh                     magicpanelr2_defconfig
powerpc                    adder875_defconfig
arm                           tegra_defconfig
mips                            gpr_defconfig
arm                           sunxi_defconfig
arm                         socfpga_defconfig
sh                          kfr2r09_defconfig
powerpc                    socrates_defconfig
sh                     sh7710voipgw_defconfig
arm                           h5000_defconfig
sh                        dreamcast_defconfig
powerpc                      makalu_defconfig
sh                      rts7751r2d1_defconfig
powerpc                       ebony_defconfig
mips                        jmr3927_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ci20_defconfig
powerpc                     kilauea_defconfig
mips                malta_kvm_guest_defconfig
arc                     haps_hs_smp_defconfig
mips                      fuloong2e_defconfig
arm                      jornada720_defconfig
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
i386                 randconfig-a005-20201228
i386                 randconfig-a002-20201228
i386                 randconfig-a004-20201228
i386                 randconfig-a006-20201228
i386                 randconfig-a003-20201228
i386                 randconfig-a001-20201228
i386                 randconfig-a002-20201227
i386                 randconfig-a005-20201227
i386                 randconfig-a006-20201227
i386                 randconfig-a004-20201227
i386                 randconfig-a003-20201227
i386                 randconfig-a001-20201227
x86_64               randconfig-a014-20201228
x86_64               randconfig-a015-20201228
x86_64               randconfig-a016-20201228
x86_64               randconfig-a012-20201228
x86_64               randconfig-a011-20201228
x86_64               randconfig-a013-20201228
i386                 randconfig-a014-20201228
i386                 randconfig-a012-20201228
i386                 randconfig-a016-20201228
i386                 randconfig-a011-20201228
i386                 randconfig-a015-20201228
i386                 randconfig-a013-20201228
i386                 randconfig-a011-20201227
i386                 randconfig-a016-20201227
i386                 randconfig-a012-20201227
i386                 randconfig-a014-20201227
i386                 randconfig-a015-20201227
i386                 randconfig-a013-20201227
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201228
x86_64               randconfig-a006-20201228
x86_64               randconfig-a002-20201228
x86_64               randconfig-a004-20201228
x86_64               randconfig-a003-20201228
x86_64               randconfig-a005-20201228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
