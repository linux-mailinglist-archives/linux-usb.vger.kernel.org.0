Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7554B317D
	for <lists+linux-usb@lfdr.de>; Sat, 12 Feb 2022 00:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239899AbiBKXtS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Feb 2022 18:49:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbiBKXtR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Feb 2022 18:49:17 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4FACF8
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 15:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644623355; x=1676159355;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qoujgoE4QcDN7py7+usWflLt/7F+pW0xYwsbmBiTaws=;
  b=i/4So8cfaFDdfWZaXc02hvUujFiZKbWdgZRNDTX1DiLb2w0P3xNw5eXI
   Sy+MUKUct8z0tfo7EmhFybN4SLT+WL08C7PyA6Rk7yk7sK8iqnTa5wI4a
   UM97s49HJeZ9A8Q1Z9Lneo96u6arjOcNgS+wBlnPkrbQ1WSk2LW5uUGzG
   jzdSK+GAuwNRXFqtzYWvJw3e0v0zIm71N/q2DqDmmMFzpZssvcJp+yGdL
   eSYxM60fBN1tfKhMVzaafkupim2vd03+BufYsouctK9Nh5aPFcICIMke6
   z/ethQCBTZwlxuAf+Uz/BN4LvaP9mZ+pCOrDhbdsQyDIbV3Oxy6YesBX1
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="229795611"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="229795611"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 15:49:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="774385714"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Feb 2022 15:49:14 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nIff7-0005N8-Te; Fri, 11 Feb 2022 23:49:13 +0000
Date:   Sat, 12 Feb 2022 07:48:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c18553956f34819e224a79c9890eba2ba0604e15
Message-ID: <6206f5d2.xjzFADynxIBOo4fQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c18553956f34819e224a79c9890eba2ba0604e15  arm64: dts: qcom: sc7280: Set the default dr_mode for usb2

elapsed time: 729m

configs tested: 162
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220211
arc                           tb10x_defconfig
mips                       bmips_be_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                             allyesconfig
powerpc                      chrp32_defconfig
xtensa                    xip_kc705_defconfig
openrisc                            defconfig
mips                          rb532_defconfig
sh                               allmodconfig
m68k                          hp300_defconfig
mips                        bcm47xx_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7722_defconfig
m68k                        m5407c3_defconfig
sh                        dreamcast_defconfig
nios2                            alldefconfig
powerpc                      pasemi_defconfig
sh                        sh7785lcr_defconfig
sh                          lboxre2_defconfig
sh                          kfr2r09_defconfig
arm                           h3600_defconfig
sh                        edosk7760_defconfig
powerpc                     stx_gp3_defconfig
mips                        vocore2_defconfig
ia64                        generic_defconfig
xtensa                       common_defconfig
ia64                             alldefconfig
xtensa                         virt_defconfig
arm                         axm55xx_defconfig
m68k                       m5475evb_defconfig
arm                     eseries_pxa_defconfig
m68k                        m5307c3_defconfig
powerpc64                           defconfig
powerpc                      cm5200_defconfig
mips                            gpr_defconfig
nds32                             allnoconfig
arm                          simpad_defconfig
m68k                          multi_defconfig
alpha                            allyesconfig
mips                           ip32_defconfig
m68k                        stmark2_defconfig
xtensa                          iss_defconfig
openrisc                 simple_smp_defconfig
powerpc                         ps3_defconfig
powerpc                      ep88xc_defconfig
h8300                    h8300h-sim_defconfig
arm                          pxa3xx_defconfig
xtensa                generic_kc705_defconfig
arm                           sama5_defconfig
powerpc                      bamboo_defconfig
arc                     nsimosci_hs_defconfig
sh                                  defconfig
arm                           corgi_defconfig
mips                     loongson1b_defconfig
sh                           se7721_defconfig
alpha                            alldefconfig
sh                          landisk_defconfig
sh                              ul2_defconfig
m68k                        mvme16x_defconfig
xtensa                    smp_lx200_defconfig
arm                        realview_defconfig
m68k                        mvme147_defconfig
riscv                               defconfig
nds32                               defconfig
sh                          rsk7264_defconfig
mips                      loongson3_defconfig
sh                          rsk7203_defconfig
arc                      axs103_smp_defconfig
mips                           ci20_defconfig
arm                  randconfig-c002-20220211
arm                  randconfig-c002-20220212
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
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
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220211
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220211
arm                  randconfig-c002-20220211
i386                          randconfig-c001
mips                 randconfig-c004-20220211
powerpc                   lite5200b_defconfig
arm                     am200epdkit_defconfig
arm                         orion5x_defconfig
mips                      malta_kvm_defconfig
arm                         bcm2835_defconfig
arm                      tct_hammer_defconfig
arm                         s3c2410_defconfig
powerpc                     mpc5200_defconfig
powerpc                     akebono_defconfig
powerpc                      katmai_defconfig
powerpc                      ppc44x_defconfig
mips                        maltaup_defconfig
arm                          collie_defconfig
powerpc                 mpc8272_ads_defconfig
arm                             mxs_defconfig
mips                            e55_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220211
hexagon              randconfig-r041-20220211
riscv                randconfig-r042-20220211

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
