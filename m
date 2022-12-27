Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9AD0657013
	for <lists+linux-usb@lfdr.de>; Tue, 27 Dec 2022 22:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiL0Vpl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Dec 2022 16:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiL0Vpj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Dec 2022 16:45:39 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BC6633C
        for <linux-usb@vger.kernel.org>; Tue, 27 Dec 2022 13:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672177539; x=1703713539;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wKC6zi4mWCZf4x87CzOmRB9JpS98OIigpmJ4qZnn8yI=;
  b=T+A2V5lRx8Ne24gdV0RLLh/gB/7kZF6Yrh64PgqDFId5LXWeqzstDSln
   TW+/5zR+3PxU8gEqtcplV3RdzmXhyepoOy6x5HFJn0UJSqF7huxNHEk6R
   dWD4HSwwYY199ew4EuHRwYkQY/KND/s643c16h5GNFWq6scjsknF/B8q1
   1FM2lHEy0Q3+kpVNi2ra4BrAR1OG2PfcgKJlXvyzJpMFM1E0g5BZu46P7
   9kZDplM+/lj658G+tA2L9oBpmCsjXJ9iTHAPg6YM8Jn3zsxTvOm/Bd+no
   LA9sofw0lrXWNTAefUNp0nF4EtLDZtGHzw+BAURE5HyG00VcAgc3RmeKQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="385185731"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="385185731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 13:45:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="683725984"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="683725984"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Dec 2022 13:45:37 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pAHlQ-000FDm-1o;
        Tue, 27 Dec 2022 21:45:36 +0000
Date:   Wed, 28 Dec 2022 05:45:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 c28f3d80383571d3630df1a0e89500d23e855924
Message-ID: <63ab676e.Ciwz1Mk0YgggncAP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: c28f3d80383571d3630df1a0e89500d23e855924  thunderbolt: Do not report errors if on-board retimers are found

elapsed time: 722m

configs tested: 94
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
ia64                             allmodconfig
i386                 randconfig-a012-20221226
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
sh                               allmodconfig
x86_64                              defconfig
i386                 randconfig-a016-20221226
i386                 randconfig-a015-20221226
x86_64                               rhel-8.3
x86_64               randconfig-a014-20221226
arc                                 defconfig
x86_64                           allyesconfig
mips                             allyesconfig
x86_64               randconfig-a013-20221226
s390                             allmodconfig
powerpc                          allmodconfig
x86_64               randconfig-a011-20221226
alpha                               defconfig
x86_64               randconfig-a012-20221226
x86_64                           rhel-8.3-bpf
s390                                defconfig
x86_64                           rhel-8.3-syz
x86_64               randconfig-a015-20221226
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a016-20221226
x86_64                           rhel-8.3-kvm
arm                                 defconfig
m68k                             allyesconfig
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
arm64                            allyesconfig
s390                 randconfig-r044-20221226
arm                              allyesconfig
i386                             allyesconfig
x86_64                            allnoconfig
sh                        apsh4ad0a_defconfig
powerpc                  storcenter_defconfig
i386                          randconfig-c001
s390                       zfcpdump_defconfig
arm                           stm32_defconfig
arm                        spear6xx_defconfig
powerpc                mpc7448_hpc2_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
x86_64               randconfig-a002-20221226
i386                 randconfig-a006-20221226
i386                 randconfig-a005-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a006-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
hexagon              randconfig-r045-20221225
riscv                randconfig-r042-20221227
hexagon              randconfig-r041-20221225
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227
s390                 randconfig-r044-20221227
x86_64                        randconfig-k001
arm                         socfpga_defconfig
arm                     am200epdkit_defconfig
powerpc                     akebono_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
