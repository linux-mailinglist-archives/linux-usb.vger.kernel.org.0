Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0034C4C39A4
	for <lists+linux-usb@lfdr.de>; Fri, 25 Feb 2022 00:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbiBXX0K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 18:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiBXX0J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 18:26:09 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17892757B7
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 15:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645745138; x=1677281138;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=une3uOtEQ/rvTc4vboHRP8j44F2MCl039f8MaWJjOsk=;
  b=f80WZRQtLbDWZGTR2G2P2vFNe6GYW3N3wKpvgHtmDeFyyzdoKXG3RiuS
   wE/HS/NeMF0R6VNgBsynOKbznWqjNhH6V//b1QwbONmlQf+EoQUnQ5PsQ
   bdqrpPYkhz2U951hWqFij/g7aIU+Yv/ggou4WW3rQ+tb76k1Zh6uhUiQk
   Z0mPb5v5BWPNTvT5efFWH9U+PZIqEzGRrBQ6fB7P/k+HKTp8CLYLX30CH
   aVkiNt3le++76q+8RSspZ23EGkzBc4DXlFgzyitnCeJrG0TSt8KvEqIb2
   uKuODwkNG/A+JyNvwEHfKHyuQYcmVzEXQVzSEGNK+pX48ly7K4XQZtdZv
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252104216"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="252104216"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 15:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="533343614"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2022 15:25:37 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nNNUO-0003ZG-7N; Thu, 24 Feb 2022 23:25:36 +0000
Date:   Fri, 25 Feb 2022 07:24:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a352fa58c0ee5c91714cd31a36b5cd308085fcbf
Message-ID: <621813c1.Hwwe5FggyOx/gSHY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: a352fa58c0ee5c91714cd31a36b5cd308085fcbf  usb: misc: USB_QCOM_EUD should depend on ARCH_QCOM

elapsed time: 724m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
i386                          randconfig-c001
arm                            zeus_defconfig
powerpc                       maple_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
powerpc                     stx_gp3_defconfig
sh                   sh7724_generic_defconfig
arc                     haps_hs_smp_defconfig
powerpc                        cell_defconfig
powerpc                      bamboo_defconfig
sh                           se7712_defconfig
arm                          iop32x_defconfig
powerpc                       eiger_defconfig
arm                  randconfig-c002-20220223
arm                  randconfig-c002-20220224
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220223
arc                  randconfig-r043-20220224
riscv                randconfig-r042-20220224
s390                 randconfig-r044-20220224
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func

clang tested configs:
arm                          pcm027_defconfig
arm                         palmz72_defconfig
powerpc                    gamecube_defconfig
arm                       spear13xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220223
hexagon              randconfig-r045-20220224
riscv                randconfig-r042-20220223
hexagon              randconfig-r041-20220224
hexagon              randconfig-r041-20220223
s390                 randconfig-r044-20220223
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
