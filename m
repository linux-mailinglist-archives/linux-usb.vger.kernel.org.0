Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526E8584937
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jul 2022 03:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbiG2BEI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 21:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiG2BEH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 21:04:07 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8905B053
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659056644; x=1690592644;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=igE+0mBIShHQLHL3sylnZI0AumQYPzOkT4S5Nai0NZU=;
  b=m1ZgWHVkss+pXdfsMr3loOu0jGU5rntkdOPFnjcuY3FBxXgeqkVCmkhy
   u2Stmp1eTiUfR5wfrqGMgtRJssLcsD4NFlq2BVwMuQ6FDY5FMOQJw957i
   GgE2yRhn3lUmpBI3aZJ09OJSl0UbBt22HHi7WyCphzDbTrnlRZdC9QFnf
   W3XIVdUkAKJqfUqn22wsT9hLsC3u4ELX5yeQnxjXPbiGR4G7VFhCVX2PQ
   +4bSTmERBs1tuaImcCXtXljlNF+vln4NvbgrHVPiMEO33RO1nVncbW6bO
   RCdZURguaY7bj7sp1qquuKk0+smvbUunJRSZCLny4l8Z7uiJ46SYaS9sa
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="289431395"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="289431395"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 18:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="777379234"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2022 18:04:02 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oHEQ5-000Aoc-20;
        Fri, 29 Jul 2022 01:04:01 +0000
Date:   Fri, 29 Jul 2022 09:03:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8288c99fc263bcafc5df5fa8c278b2eb8106364e
Message-ID: <62e331fd.sfrehKxGyAbsfPyb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 8288c99fc263bcafc5df5fa8c278b2eb8106364e  usb: misc: onboard_usb_hub: Remove duplicated power_on delay

elapsed time: 1033m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                        randconfig-a002
s390                 randconfig-r044-20220728
x86_64                        randconfig-a006
x86_64                        randconfig-a015
x86_64                        randconfig-a004
i386                             allyesconfig
riscv                randconfig-r042-20220728
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
arm                                 defconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220728
i386                          randconfig-a001
arm                              allyesconfig
i386                          randconfig-a003
ia64                             allmodconfig
arm64                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
sh                               allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                         amcore_defconfig
powerpc                 mpc837x_rdb_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
loongarch                         allnoconfig
arm                            hisi_defconfig
m68k                        m5272c3_defconfig
loongarch                           defconfig
i386                          randconfig-c001
arc                           tb10x_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                       m5475evb_defconfig
powerpc                      pasemi_defconfig
sparc                       sparc64_defconfig
arm                           sama5_defconfig
sh                         ecovec24_defconfig
arm                            qcom_defconfig
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
ia64                        generic_defconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
xtensa                  cadence_csp_defconfig
mips                           ip32_defconfig
arc                            hsdk_defconfig
sh                 kfr2r09-romimage_defconfig
sh                     sh7710voipgw_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220728
m68k                        m5407c3_defconfig
powerpc                     taishan_defconfig
sh                         ap325rxa_defconfig
powerpc                      tqm8xx_defconfig
arm                          lpd270_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
mips                 randconfig-c004-20220728
powerpc              randconfig-c003-20220728
nios2                               defconfig
m68k                            mac_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220728
hexagon              randconfig-r045-20220728
i386                          randconfig-a002
i386                          randconfig-a004
mips                malta_qemu_32r6_defconfig
powerpc                    gamecube_defconfig
arm                          collie_defconfig
x86_64                        randconfig-k001
arm                       imx_v4_v5_defconfig
arm                       versatile_defconfig
powerpc                      obs600_defconfig
powerpc                 mpc836x_mds_defconfig
riscv                             allnoconfig
arm                     davinci_all_defconfig
powerpc                     tqm5200_defconfig
powerpc                        fsp2_defconfig
powerpc                      katmai_defconfig
powerpc                   microwatt_defconfig
powerpc                      ppc64e_defconfig
mips                          rm200_defconfig
arm                  colibri_pxa270_defconfig
arm                      pxa255-idp_defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
