Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94AF6BDD0E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 00:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjCPXlI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 19:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjCPXkr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 19:40:47 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3EE92BE4
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 16:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679010009; x=1710546009;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jCUoq7I4mF+DMhXZEs3tcgIjAQXj7sa7FCAbDH8Y3do=;
  b=NBNOAYXFm8dnpWoQFL5f3TWhzsvgQhaJrepPBQNgUMK37V5KqgLGChdY
   PHdHtrF4dGCSiTjW2/ZlW41hEX277s3qqWHI4CtzA5FIqppN2PHo975lb
   l4ckcdI0SmBpborRJNkGsmuhWLkBK6BPVeuJQEmS/0gYe/3OyNcK2sAGr
   cETF2wOZQF6jNRWavKzkK6/wwUCDnUo/ovniCeaj2oy5pestBfegsj6mG
   L0q51l1e+ykA4+hPmNUVaCNqyWcdDrLH+QvQ67dKflt1dOEDD6xzBHe/4
   9iJmjOD27fVkKfIZnBYkCEWXQdWEOpG1a57/7NfFtOUYToyQ1TlWkqesL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339680247"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="339680247"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 16:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="657365077"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="657365077"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Mar 2023 16:39:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pcxCE-0008tG-1e;
        Thu, 16 Mar 2023 23:39:46 +0000
Date:   Fri, 17 Mar 2023 07:39:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 55b7fa634d9f5d88f008f8b785448db40a2d5229
Message-ID: <6413a8a8.EcaejhxK3cxWdHwc%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 55b7fa634d9f5d88f008f8b785448db40a2d5229  dt-bindings: usb: dwc3: Add QCM2290 compatible

elapsed time: 728m

configs tested: 139
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230312   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230313   gcc  
arc                  randconfig-r013-20230313   gcc  
arc                  randconfig-r014-20230312   gcc  
arc                  randconfig-r021-20230312   gcc  
arc                  randconfig-r026-20230315   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230313   clang
arm                  randconfig-r013-20230313   gcc  
arm                  randconfig-r016-20230313   gcc  
arm                  randconfig-r021-20230315   gcc  
arm                  randconfig-r046-20230312   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230313   gcc  
arm64        buildonly-randconfig-r006-20230313   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230312   clang
arm64                randconfig-r011-20230312   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230312   gcc  
csky                 randconfig-r011-20230313   gcc  
csky                 randconfig-r012-20230313   gcc  
csky                 randconfig-r036-20230313   gcc  
hexagon              randconfig-r001-20230313   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                          randconfig-c001   gcc  
i386                 randconfig-r004-20230313   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230312   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230313   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230313   gcc  
loongarch            randconfig-r026-20230312   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230313   gcc  
m68k                 randconfig-r015-20230313   gcc  
m68k                 randconfig-r016-20230312   gcc  
m68k                 randconfig-r016-20230313   gcc  
m68k                 randconfig-r023-20230315   gcc  
m68k                 randconfig-r032-20230312   gcc  
microblaze   buildonly-randconfig-r002-20230312   gcc  
microblaze   buildonly-randconfig-r006-20230312   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r033-20230312   gcc  
mips                 randconfig-r035-20230312   gcc  
nios2        buildonly-randconfig-r001-20230313   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230312   gcc  
nios2                randconfig-r012-20230312   gcc  
nios2                randconfig-r012-20230313   gcc  
nios2                randconfig-r013-20230312   gcc  
nios2                randconfig-r023-20230313   gcc  
openrisc     buildonly-randconfig-r003-20230312   gcc  
openrisc     buildonly-randconfig-r005-20230313   gcc  
openrisc             randconfig-r022-20230315   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230312   gcc  
powerpc              randconfig-r023-20230312   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230312   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230312   clang
riscv                randconfig-r014-20230312   gcc  
riscv                randconfig-r032-20230313   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230313   gcc  
sparc                randconfig-r025-20230315   gcc  
sparc                randconfig-r034-20230312   gcc  
sparc64              randconfig-r004-20230312   gcc  
sparc64              randconfig-r025-20230312   gcc  
sparc64              randconfig-r033-20230313   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r035-20230313   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230312   gcc  
xtensa               randconfig-r001-20230312   gcc  
xtensa               randconfig-r001-20230313   gcc  
xtensa               randconfig-r003-20230312   gcc  
xtensa               randconfig-r015-20230312   gcc  
xtensa               randconfig-r036-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
