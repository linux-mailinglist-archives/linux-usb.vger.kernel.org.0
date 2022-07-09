Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D6456C5E4
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jul 2022 04:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiGICAT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 22:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiGICAT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 22:00:19 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12234E87B
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 19:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657332018; x=1688868018;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3xzCzEUtMggqhVr8tsInvCcs+iNGczoyk8ytAjO3+94=;
  b=PzEDSh5vcZVujESw5h8ewlfXxbVHD9cJdmpAazB2NDRw1tVNHxMp0+4Z
   9ZHNfosmSEDoyIW/KfX+CBRnsjl1ZScc+KYh2G0hdaqz78aB/GFnAFazA
   7i6SHtHwVCRrrV+O/V1gI2vPDT32b426elhtbua/nuDSuLR8Ms3N3mxS+
   pVmNmNaFZpnd6y8mI2vuO5gKJCLxeuVgW5U4XqdYZcL6Pad4p2c+Qqsqa
   0yjUkIiWte4dn4ZXDnGz2sNbEuTv2HndaScZZClrqIrKPR2szAbC4oAvz
   1+u67yTXPilP5mU1Hcm5Z7TW6rLb3c/ohypEKPFDWx3Ah3LLxlyErb0aB
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="285524870"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="285524870"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 19:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="661960600"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2022 19:00:17 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9zlY-000OAq-Aj;
        Sat, 09 Jul 2022 02:00:16 +0000
Date:   Sat, 09 Jul 2022 10:00:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 bb160ee61c04fe96f3cc0088ef1907214861dccc
Message-ID: <62c8e126.stxa49/3u8NZgr6D%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: bb160ee61c04fe96f3cc0088ef1907214861dccc  drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.

elapsed time: 725m

configs tested: 77
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
ia64                          tiger_defconfig
sh                          rsk7264_defconfig
sh                        edosk7705_defconfig
arm                           corgi_defconfig
powerpc                     ep8248e_defconfig
powerpc                 linkstation_defconfig
arm                         vf610m4_defconfig
sh                           se7619_defconfig
sh                           se7712_defconfig
sh                           se7721_defconfig
sh                           se7750_defconfig
mips                         rt305x_defconfig
alpha                            alldefconfig
arm                        clps711x_defconfig
arm                        oxnas_v6_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220707
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
hexagon                          alldefconfig
arm                   milbeaut_m10v_defconfig
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
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220707
hexagon              randconfig-r041-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
