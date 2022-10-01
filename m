Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1895F1D22
	for <lists+linux-usb@lfdr.de>; Sat,  1 Oct 2022 17:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiJAPEm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Oct 2022 11:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiJAPEk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Oct 2022 11:04:40 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3698E015
        for <linux-usb@vger.kernel.org>; Sat,  1 Oct 2022 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664636677; x=1696172677;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3vrEfHRC2LKhy1HfoM/k0FBs15PqoOVdCu/egfesaIg=;
  b=PItw4an7kmIqMZQWTzTd8r/0vGIB8LaRMt1Ghp4daT+BlqjB35+Y/uR9
   hEhthPImncFOjVyWg+OkQw5Cq59zRW+vTwkj+rfeOXWchOvtH2MzEWkLT
   IC4Vn+QolweQr0OYPSOZLONHK49SCVGIudNwUkJ+mjGXzq6KIeNUKyAFR
   q5oRkvx1yCFX1vVUJsOtxj/o5tl//5MUZQq7yNfzYKqDMDIa30JB1Qyvu
   pW3bPszKGBSL9uQbCWRWGTjgqCMdJ/wgQxY8LilnSA/y14ZILtDRwpPyL
   srwx5R5vxwFJdCpB4Xbyp3MA4uQ3rJiVAGXVBWOSPNM2UwZ9xPYPpoJvx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10487"; a="282760851"
X-IronPort-AV: E=Sophos;i="5.93,361,1654585200"; 
   d="scan'208";a="282760851"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2022 08:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10487"; a="951881134"
X-IronPort-AV: E=Sophos;i="5.93,361,1654585200"; 
   d="scan'208";a="951881134"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Oct 2022 08:04:36 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oee2d-0002N5-2V;
        Sat, 01 Oct 2022 15:04:35 +0000
Date:   Sat, 01 Oct 2022 23:03:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3180d827c807d8d6e5d6ba4f2e08eed9efa083af
Message-ID: <633856d2.GNSf1PCBK5bIDH4L%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 3180d827c807d8d6e5d6ba4f2e08eed9efa083af  usb: gadget: uvc: don't put item still in use

elapsed time: 1540m

configs tested: 152
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
i386                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a001-20220926
x86_64                               rhel-8.3
i386                 randconfig-a002-20220926
powerpc                           allnoconfig
mips                             allyesconfig
i386                 randconfig-a003-20220926
powerpc                          allmodconfig
s390                                defconfig
arm                                 defconfig
s390                             allmodconfig
m68k                             allyesconfig
i386                 randconfig-a004-20220926
x86_64                           allyesconfig
m68k                             allmodconfig
x86_64               randconfig-a002-20220926
sh                               allmodconfig
arc                              allyesconfig
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
alpha                            allyesconfig
i386                 randconfig-a005-20220926
x86_64               randconfig-a005-20220926
i386                 randconfig-a006-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
arc                  randconfig-r043-20220925
arm64                            allyesconfig
s390                             allyesconfig
arm                              allyesconfig
riscv                randconfig-r042-20220925
i386                          randconfig-a014
i386                          randconfig-a012
arc                  randconfig-r043-20220926
i386                          randconfig-a016
s390                 randconfig-r044-20220925
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                       m5249evb_defconfig
riscv                               defconfig
sh                   sh7770_generic_defconfig
mips                           ip32_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
arm                        shmobile_defconfig
ia64                                defconfig
xtensa                          iss_defconfig
arm                            mps2_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                        warp_defconfig
parisc                           allyesconfig
arc                      axs103_smp_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                           h5000_defconfig
m68k                          atari_defconfig
powerpc                      chrp32_defconfig
sh                        edosk7705_defconfig
arm                         lpc18xx_defconfig
arm                       aspeed_g5_defconfig
mips                  maltasmvp_eva_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
riscv                randconfig-r042-20220927
arc                  randconfig-r043-20220927
s390                 randconfig-r044-20220927
powerpc                       ppc64_defconfig
arm                           sunxi_defconfig
powerpc                     rainier_defconfig
sh                 kfr2r09-romimage_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
riscv                randconfig-r042-20221001
arc                  randconfig-r043-20221001
s390                 randconfig-r044-20221001
arm                          simpad_defconfig
m68k                           sun3_defconfig
sh                      rts7751r2d1_defconfig
alpha                            alldefconfig
m68k                        m5307c3_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a011
arc                  randconfig-r043-20220928
mips                           gcw0_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
hexagon              randconfig-r045-20220925
x86_64               randconfig-a011-20220926
i386                          randconfig-a013
hexagon              randconfig-r041-20220926
x86_64               randconfig-a015-20220926
x86_64               randconfig-a016-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
i386                          randconfig-a011
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
i386                          randconfig-a015
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
arm                          moxart_defconfig
arm                         mv78xx0_defconfig
x86_64                        randconfig-k001
riscv                    nommu_virt_defconfig
powerpc                        icon_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                          pxa168_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                          allyesconfig
mips                     loongson1c_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220928
hexagon              randconfig-r041-20220928
riscv                randconfig-r042-20220928
s390                 randconfig-r044-20220928

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
