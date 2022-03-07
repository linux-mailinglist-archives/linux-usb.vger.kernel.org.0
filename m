Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A2F4CF1B0
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 07:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbiCGGRe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 01:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233483AbiCGGRd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 01:17:33 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7801A5468A
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 22:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646633799; x=1678169799;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bcha4y3YWRQL8J1qH363U44ax50BQe72AbPi69/5tmU=;
  b=QP1Vhbq0tNBoMUQOw58rXqEUP6ZdwOWuJgyDN3YBC7m6hmbrQoowDXpw
   qfG5rCy2OWae3rPnlHc4a36wP8PSUit0GwF9PIMROlcLYfVkgiuCKhvph
   D4Ro0Z+ZNjo0mcWAN7LAZFATwdpm6LRXfC2i0CW7pVKKskxI/pKh8y5Jo
   9QRxzY61HKa6IntViAbK9IdXz175b43ky/wNtSg6qqrOUtRavWv5DdpkG
   ncrLI1WNywaJlOIintSrANL3UthQ9CSepaPoswHWbbvooxo5UBbdjGv1F
   kfFWki7gdMoLgQ36Z15YOUdEgQMGoSVy/Rhmz5yckdzpm7OzizF1DLWE0
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="251886875"
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; 
   d="scan'208";a="251886875"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2022 22:16:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; 
   d="scan'208";a="812739911"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2022 22:16:38 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nR6fY-00002p-Fn; Mon, 07 Mar 2022 06:16:32 +0000
Date:   Mon, 07 Mar 2022 13:41:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 98d107b84614a1c6b0b8009feae49c5fb0ef4758
Message-ID: <62259b08.qom9GBGL0FEStlAt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 98d107b84614a1c6b0b8009feae49c5fb0ef4758  usb: host: xhci: Remove some unnecessary return value initializations

elapsed time: 4821m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
sh                            migor_defconfig
arm                           sunxi_defconfig
arm                         axm55xx_defconfig
arm                        mvebu_v7_defconfig
arm                        cerfcube_defconfig
h8300                            alldefconfig
powerpc                  iss476-smp_defconfig
sh                             sh03_defconfig
m68k                       m5275evb_defconfig
sh                           se7751_defconfig
riscv                            allmodconfig
sh                 kfr2r09-romimage_defconfig
sh                               alldefconfig
sh                          sdk7780_defconfig
sh                            titan_defconfig
sh                          lboxre2_defconfig
sh                          kfr2r09_defconfig
sh                          r7780mp_defconfig
arm                           sama5_defconfig
arm                         lubbock_defconfig
sparc                       sparc64_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                generic_kc705_defconfig
sh                          urquell_defconfig
powerpc                     ep8248e_defconfig
arm                         vf610m4_defconfig
m68k                          multi_defconfig
nds32                            alldefconfig
arm                            qcom_defconfig
sh                        sh7757lcr_defconfig
um                             i386_defconfig
sh                           se7722_defconfig
um                           x86_64_defconfig
sparc64                          alldefconfig
arm                          badge4_defconfig
mips                         mpc30x_defconfig
powerpc                     sequoia_defconfig
m68k                                defconfig
sh                ecovec24-romimage_defconfig
sh                   secureedge5410_defconfig
arm                           u8500_defconfig
m68k                          sun3x_defconfig
powerpc                        cell_defconfig
arm                       omap2plus_defconfig
s390                          debug_defconfig
arm                           h5000_defconfig
arm                            mps2_defconfig
arm                        clps711x_defconfig
m68k                        m5407c3_defconfig
sh                           se7712_defconfig
sh                         microdev_defconfig
parisc                generic-64bit_defconfig
parisc                           allyesconfig
powerpc                           allnoconfig
h8300                     edosk2674_defconfig
arc                        vdk_hs38_defconfig
arm                            hisi_defconfig
arm                  randconfig-c002-20220303
arm                  randconfig-c002-20220304
arm                  randconfig-c002-20220302
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
parisc64                            defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220303
riscv                randconfig-c006-20220303
i386                          randconfig-c001
arm                  randconfig-c002-20220303
mips                 randconfig-c004-20220303
powerpc              randconfig-c003-20220302
riscv                randconfig-c006-20220302
arm                  randconfig-c002-20220302
mips                 randconfig-c004-20220302
arm                  colibri_pxa270_defconfig
mips                     cu1000-neo_defconfig
i386                             allyesconfig
powerpc                      ppc64e_defconfig
arm                           spitz_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220303
hexagon              randconfig-r045-20220304
hexagon              randconfig-r041-20220304
riscv                randconfig-r042-20220303
hexagon              randconfig-r041-20220303

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
