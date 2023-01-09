Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F45662FF7
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 20:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235031AbjAITJ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 14:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237626AbjAITJX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 14:09:23 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241BF3B93A
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 11:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673291363; x=1704827363;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sxTHv6bxrQaxUbv+OvJSMgDwltW6Mbhwa+sZ4wM7apw=;
  b=kbuDPC6pJo971vsX5qJ/WV6oe2s5Kn8aQJLGDgnPkZQTip/x+srdlXev
   zdfuOXCRsW94SNuKk1DasxwQ0d0TQRaKSZbhd+awgdZvk5TY1wvXlQxli
   pEfhpQsZbbeeDkFoX4RlUcI7nzhhX8kQMFtSu5HT7+KlJHNooMnxIYpFt
   Kp6cUyUkGGVuJw6NGWhSZ69SW2ArMc/KIGdlP0e9DB/Ga66Ld3UCR/Y0h
   zKOHFmwgt8fR9ZXPunuUk9wYUHlj425Dm42q/OdP+wx1MdXZwaecsKBZA
   g/g3Lpg9CXUf+553dd59RlBAlLTAU6wF4KjtS2SSeje3qM6s9y/LTcnwR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="306474983"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="306474983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 11:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="656778028"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="656778028"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 09 Jan 2023 11:09:21 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pExWK-00079u-0u;
        Mon, 09 Jan 2023 19:09:20 +0000
Date:   Tue, 10 Jan 2023 03:08:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c2fb9a214da1efc3f8968daa795a1bbbf50cbfc8
Message-ID: <63bc663e.Veq19kiU4wI1vyKd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c2fb9a214da1efc3f8968daa795a1bbbf50cbfc8  Merge 6.2-rc3 into usb-next

elapsed time: 721m

configs tested: 127
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arm                                 defconfig
powerpc                          allmodconfig
i386                          randconfig-a001
ia64                             allmodconfig
m68k                             allmodconfig
sh                               allmodconfig
i386                          randconfig-a003
arc                              allyesconfig
x86_64               randconfig-a016-20230109
mips                             allyesconfig
x86_64               randconfig-a015-20230109
i386                          randconfig-a005
alpha                            allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
arm                  randconfig-r046-20230108
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a014-20230109
x86_64                           allyesconfig
x86_64               randconfig-a011-20230109
arc                  randconfig-r043-20230108
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
s390                 randconfig-r044-20230109
arc                  randconfig-r043-20230109
x86_64               randconfig-a013-20230109
arm64                            allyesconfig
i386                          randconfig-a012
x86_64               randconfig-a012-20230109
i386                 randconfig-a011-20230109
i386                 randconfig-a013-20230109
riscv                randconfig-r042-20230109
arm                              allyesconfig
arc                                 defconfig
i386                 randconfig-a012-20230109
i386                 randconfig-a014-20230109
s390                             allmodconfig
i386                 randconfig-a016-20230109
i386                             allyesconfig
i386                 randconfig-a015-20230109
alpha                               defconfig
s390                                defconfig
arm                        mini2440_defconfig
powerpc                        warp_defconfig
sh                            titan_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                       maple_defconfig
xtensa                       common_defconfig
s390                             allyesconfig
m68k                          hp300_defconfig
arm                         s3c6400_defconfig
powerpc                      makalu_defconfig
sh                          r7780mp_defconfig
arm                        mvebu_v7_defconfig
sh                   sh7770_generic_defconfig
alpha                             allnoconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     tqm8548_defconfig
sh                         apsh4a3a_defconfig
powerpc                   motionpro_defconfig
arc                     haps_hs_smp_defconfig
arm                          iop32x_defconfig
m68k                       bvme6000_defconfig
powerpc                     taishan_defconfig
parisc                           allyesconfig
i386                          randconfig-c001
powerpc                      mgcoge_defconfig
arm64                            alldefconfig
mips                         cobalt_defconfig
mips                  maltasmvp_eva_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                   rts7751r2dplus_defconfig
xtensa                              defconfig
ia64                                defconfig
riscv             nommu_k210_sdcard_defconfig
sh                         microdev_defconfig
m68k                        stmark2_defconfig

clang tested configs:
i386                 randconfig-a001-20230109
i386                 randconfig-a004-20230109
arm                  randconfig-r046-20230109
i386                 randconfig-a002-20230109
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230108
i386                 randconfig-a003-20230109
hexagon              randconfig-r041-20230109
i386                          randconfig-a004
i386                 randconfig-a006-20230109
hexagon              randconfig-r045-20230108
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a011
x86_64               randconfig-a003-20230109
i386                 randconfig-a005-20230109
riscv                randconfig-r042-20230108
hexagon              randconfig-r045-20230109
s390                 randconfig-r044-20230108
x86_64               randconfig-a002-20230109
i386                          randconfig-a015
x86_64               randconfig-a004-20230109
x86_64               randconfig-a005-20230109
x86_64               randconfig-a001-20230109
x86_64               randconfig-a006-20230109
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
arm                         hackkit_defconfig
powerpc                   microwatt_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          pcm027_defconfig
powerpc                       ebony_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
