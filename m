Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A37C672CFCF
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 21:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbjFLTqG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 15:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbjFLTqF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 15:46:05 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49558E71
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 12:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686599164; x=1718135164;
  h=date:from:to:cc:subject:message-id;
  bh=B1K4wT+FeNwx3wJjuSWvs6vc3JXHpXTxZ1k3Y6ZhCAk=;
  b=ZhmgqYp1IkYZSfXtLhyuA8LNfQkbkErXNWUvruw93WNDUp1pz2uETSqm
   JL0CmkXFlvsq2hvEoJMxzvtmazK6nXeTF9kQrH49I6YG9hnu9Cww60Bcg
   bLN0J4IT8KUjaA2yZ4wVNd/Yph57WL+qJD5ibP1Wj1w5lm/dghyBh31Q9
   HBi9OsDCO6tYVyGSmOCgTYfVrbaHZXTzVTPEzJ/Rp/O9JIHDk7PLM/Mdl
   E2Qp8Gvvl8ZuHRpJx06NU8WCUGjTOsE28xDNTiSm50TCkRTYZr409971S
   0ZSW9roT6noH3IreIzu03pqk4xQkURsb0RKW3IS0MpIt7eIeA2fgGt7gq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347798516"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347798516"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 12:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705519841"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="705519841"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2023 12:46:02 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q8nUI-0000dE-0n;
        Mon, 12 Jun 2023 19:46:02 +0000
Date:   Tue, 13 Jun 2023 03:45:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 87200371817ec6e48e42ef2f03756268661a8815
Message-ID: <202306130338.seIvB2y9-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 87200371817ec6e48e42ef2f03756268661a8815  thunderbolt: Enable/disable sideband depending on USB4 port offline mode

elapsed time: 836m

configs tested: 95
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r024-20230612   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230612   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230612   gcc  
arm                  randconfig-r011-20230612   clang
arm                  randconfig-r026-20230612   clang
arm                  randconfig-r036-20230612   gcc  
arm                  randconfig-r046-20230612   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r002-20230612   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230612   gcc  
hexagon              randconfig-r041-20230612   clang
hexagon              randconfig-r045-20230612   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230612   clang
i386                 randconfig-i002-20230612   clang
i386                 randconfig-i003-20230612   clang
i386                 randconfig-i004-20230612   clang
i386                 randconfig-i005-20230612   clang
i386                 randconfig-i006-20230612   clang
i386                 randconfig-r035-20230612   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230612   gcc  
loongarch            randconfig-r016-20230612   gcc  
loongarch            randconfig-r023-20230612   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230612   gcc  
m68k                 randconfig-r012-20230612   gcc  
m68k                 randconfig-r021-20230612   gcc  
m68k                 randconfig-r033-20230612   gcc  
microblaze           randconfig-r022-20230612   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230612   gcc  
mips                 randconfig-r001-20230612   gcc  
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r004-20230612   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r005-20230612   gcc  
powerpc              randconfig-r032-20230612   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230612   clang
riscv                randconfig-r042-20230612   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230612   gcc  
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230612   gcc  
sparc64      buildonly-randconfig-r001-20230612   gcc  
sparc64              randconfig-r013-20230612   gcc  
sparc64              randconfig-r014-20230612   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230612   clang
x86_64               randconfig-a002-20230612   clang
x86_64               randconfig-a003-20230612   clang
x86_64               randconfig-a004-20230612   clang
x86_64               randconfig-a005-20230612   clang
x86_64               randconfig-a006-20230612   clang
x86_64               randconfig-a011-20230612   gcc  
x86_64               randconfig-a012-20230612   gcc  
x86_64               randconfig-a013-20230612   gcc  
x86_64               randconfig-a014-20230612   gcc  
x86_64               randconfig-a015-20230612   gcc  
x86_64               randconfig-r034-20230612   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
