Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87CFB5540A1
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 04:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356085AbiFVClb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 22:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbiFVCl3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 22:41:29 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96552AC42
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 19:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655865688; x=1687401688;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=suzyjArqCQvtiE0y+DjR4Mnj6D1KnKBnoeT6ZjTgRsk=;
  b=lM2yNZyv0YMsI0yp8TB3ZWMJ6gCVshsq3OyuyBwfcD5jyX8B0rAHLbDF
   QT30oKNMBksox1/jQkNJHFFSLiC1tx+qdxgbK527EN9TS3orT/caRTkSZ
   9abWnH9FPE9GID1TJeaDS3JHTaotnPRrTo0aF4oVJyKsgEpvKw7dBCqpH
   QIUfNIz2LBNZaaZ7bLKMTZlq31yn1GxKhKO8TMnk1F8oOtArMhJ8L+Xj2
   qCCG+wxxktULgVDfqOc9GRkGgr519zdyOBa1EyOA+TZ2j4pwcJ3p2012e
   4uPk/H0GIpaBF4kq1JBsmxTq0umIU67yNKsq6mBSELSrlYN8/V4U+hZj0
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="341978464"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="341978464"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 19:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="620720486"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Jun 2022 19:41:27 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3qJ4-0000k7-IO;
        Wed, 22 Jun 2022 02:41:26 +0000
Date:   Wed, 22 Jun 2022 10:41:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 9ef165406308515dcf2e3f6e97b39a1c56d86db5
Message-ID: <62b2813d.BIrgx1Vv9+uWkmIi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 9ef165406308515dcf2e3f6e97b39a1c56d86db5  usb: typec: wcove: Drop wrong dependency to INTEL_SOC_PMIC

elapsed time: 721m

configs tested: 92
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220622
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     mpc83xx_defconfig
sh                          urquell_defconfig
sparc                       sparc64_defconfig
m68k                          multi_defconfig
alpha                            alldefconfig
mips                       bmips_be_defconfig
ia64                             alldefconfig
sh                                  defconfig
ia64                      gensparse_defconfig
mips                           ci20_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7724_defconfig
arm                        realview_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                         wii_defconfig
sh                          sdk7786_defconfig
arm                         axm55xx_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                   sh7770_generic_defconfig
m68k                            q40_defconfig
arm                           stm32_defconfig
sh                          kfr2r09_defconfig
arm                      integrator_defconfig
riscv                               defconfig
arm                         lubbock_defconfig
m68k                        mvme147_defconfig
sh                          rsk7201_defconfig
arm                     eseries_pxa_defconfig
powerpc                     tqm8541_defconfig
arm                             rpc_defconfig
openrisc                            defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220622
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
s390                             alldefconfig
mips                        qi_lb60_defconfig
x86_64                        randconfig-k001
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
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
