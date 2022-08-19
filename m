Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E9A59A7B3
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 23:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352351AbiHSVWQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 17:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352340AbiHSVWP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 17:22:15 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1547D10522F
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 14:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660944134; x=1692480134;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6Meb3pAobajXo/Nz1UWEoDRlWRvyU3iZxeMToM+EiG4=;
  b=W/OQrJzKGG7RwoGMJH6Sxp5st1CtkC3I43U377dPtHplPEahdUMHg5ki
   Ssrbdl9O9AO91W0Znu4tdJdhwhYHlTE2Z7mS+VuIwya2eS3NaZ5952jkz
   hg/kUpw2RdcBTXOeMdUF2Goo1N3bsrcOZT9NIM0b/H+pbbg7wATZWPG7c
   3rLIG5FXgLfO/11FSkOeWz1GCctKX+S/wA10M6NQShCzTjQLyw3cMUGFY
   H0weCRHojZcpxrcqa4KMyu8tw3miszPgKD8usHEhga4gCNYI7rwPkFFzP
   o20UNt0a5QjLlCwFgHCjRRiE8o385AS6qEUTa53tzvPKcN+QGU0xSozL8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="294374574"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="294374574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 14:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="559076452"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Aug 2022 14:22:12 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oP9RT-0001p7-2P;
        Fri, 19 Aug 2022 21:22:11 +0000
Date:   Sat, 20 Aug 2022 05:22:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 4dce3b375179fdd4aba2191be11ace90ef0ec6d6
Message-ID: <62fffeff.RofS4XPIuCrfaIOm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 4dce3b375179fdd4aba2191be11ace90ef0ec6d6  usb/hcd: Fix dma_map_sg error check

elapsed time: 726m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
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
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
i386                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                             rpc_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm                      footbridge_defconfig
powerpc                   motionpro_defconfig
sh                           se7712_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      ep88xc_defconfig
powerpc                  iss476-smp_defconfig
parisc                generic-32bit_defconfig
arc                        vdk_hs38_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                           corgi_defconfig
arm                          badge4_defconfig
mips                    maltaup_xpa_defconfig
openrisc                  or1klitex_defconfig
arm                         at91_dt_defconfig
powerpc                      tqm8xx_defconfig
openrisc                            defconfig
sh                          lboxre2_defconfig
i386                          randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
riscv                randconfig-r042-20220820
s390                 randconfig-r044-20220820
arc                  randconfig-r043-20220820
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                    amigaone_defconfig
arm                         lpc18xx_defconfig
arm                          iop32x_defconfig
arm                        mini2440_defconfig
microblaze                          defconfig
powerpc                 linkstation_defconfig
arm                             ezx_defconfig
ia64                                defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                           u8500_defconfig
ia64                        generic_defconfig
powerpc                  storcenter_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc834x_itx_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
riscv                randconfig-r042-20220819
s390                 randconfig-r044-20220819
hexagon              randconfig-r045-20220819
hexagon              randconfig-r041-20220819
arm                                 defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
arm                         hackkit_defconfig
arm                      tct_hammer_defconfig
powerpc                      ppc44x_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                      ppc64e_defconfig
mips                malta_qemu_32r6_defconfig
mips                        omega2p_defconfig
mips                          malta_defconfig
powerpc                    gamecube_defconfig
arm                         orion5x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
