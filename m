Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6B45BA324
	for <lists+linux-usb@lfdr.de>; Fri, 16 Sep 2022 01:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiIOX0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 19:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiIOX0A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 19:26:00 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9209F86061
        for <linux-usb@vger.kernel.org>; Thu, 15 Sep 2022 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663284356; x=1694820356;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1tD7z4QsamIfoWevRx3YopmEJmd7XSIpih+uXY/ohKM=;
  b=XEmt2xmAZfCS5/YdDLnXCtuiy99wssnOzYTvjt01CAPRAZRutsURTNW2
   lQ0PAxxf3fr52S2xMdjIkv8L2P8WcTIVirEtriSaakzoYzZ5Pn/ty9f11
   hxDAckRh8/H+xevh6OK3c724igg62n+aKZ5if2RhY0Fx1QeJEb6lxMlfZ
   By2aevkWHj2gVNQfyB6r66OoYHwkeOErmxvo8swajrqZIxfxh7oQ1mI+Q
   YSdkzenp6CZ8NE/nqrUG2LA7KYx5Zt0euEE4YHRCPZPFE+sxHj6t0gPGT
   gfTr/G7iidRlebwowqHYgJlPp1aghtw4PioUZFqUodSEzrAQ5mvAqKlyc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299688934"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="299688934"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 16:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="679741820"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Sep 2022 16:25:54 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYyEz-0001Al-2g;
        Thu, 15 Sep 2022 23:25:53 +0000
Date:   Fri, 16 Sep 2022 07:24:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ce001778dfc34804f2b1fa6faaad7ac888326afb
Message-ID: <6323b448.fUzWxsrZl0COQMYa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ce001778dfc34804f2b1fa6faaad7ac888326afb  Merge tag 'thunderbolt-for-v6.0-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 721m

configs tested: 114
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
s390                 randconfig-r044-20220915
arc                  randconfig-r043-20220915
riscv                randconfig-r042-20220915
x86_64                           rhel-8.3-syz
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
mips                     decstation_defconfig
m68k                        m5272c3_defconfig
m68k                       m5275evb_defconfig
powerpc                     asp8347_defconfig
i386                          randconfig-c001
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                        warp_defconfig
xtensa                           alldefconfig
powerpc                      mgcoge_defconfig
m68k                        m5307c3_defconfig
arm                           viper_defconfig
sh                         ap325rxa_defconfig
arc                          axs103_defconfig
mips                            gpr_defconfig
sh                             sh03_defconfig
powerpc                         wii_defconfig
openrisc                       virt_defconfig
powerpc                      ep88xc_defconfig
sparc                       sparc32_defconfig
powerpc                      arches_defconfig
sh                          rsk7203_defconfig
arm                         vf610m4_defconfig
powerpc                        cell_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
loongarch                           defconfig
loongarch                         allnoconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220916
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r045-20220915
hexagon              randconfig-r041-20220915
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-k001
powerpc                 xes_mpc85xx_defconfig
mips                           ip28_defconfig
powerpc                    socrates_defconfig
arm                        mvebu_v5_defconfig
mips                   sb1250_swarm_defconfig
powerpc                    gamecube_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
