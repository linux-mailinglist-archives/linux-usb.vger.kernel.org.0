Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 589E26CAFFF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 22:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbjC0U3d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 16:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjC0U3c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 16:29:32 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E1D26A2
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679948971; x=1711484971;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ASjNgRtXMEyGtDayTbG+TaKB3IASPe7K2nDwQcyHK3s=;
  b=FC7H6/cwYQsSCl97WLC/mzioaNSN5RY/OdYKmy8JiYJvUys72u0phgx+
   YvAYwM1/VuGyTVVA2ekmtX46q9bTAQFZ5g8bHfXArz5w30/nDFWC+SZ5n
   epi3sgCW3dg6lHDCApRviordm3EU48046CLNFUyYq0tK2+e8xSVSUJTif
   6WGlGTl6Mw6Hex9uD4oOCFR0cmgGqQtWyBTrxIx8u+OCXOYLlmJ6e19KF
   5xGKkoLGCGxzHk/FVhDuzGOYT7bdwevun7HandkSstIEa0nEfqigv/ak7
   9aOHXDkoHcqnsv39yve7N7Ys+SbWFm9P1jtDg9ZvAshhLwbjqXa2fXs4o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328826598"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="328826598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="748140280"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="748140280"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Mar 2023 13:29:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pgtT4-000HzK-1n;
        Mon, 27 Mar 2023 20:29:26 +0000
Date:   Tue, 28 Mar 2023 04:28:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 97318d6427f62b723c89f4150f8f48126ef74961
Message-ID: <6421fc8b.71DV8lUQ7bwTe5+7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 97318d6427f62b723c89f4150f8f48126ef74961  Merge 6.3-rc4 into usb-next

elapsed time: 768m

configs tested: 226
configs skipped: 24

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230327   gcc  
alpha        buildonly-randconfig-r005-20230327   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230326   gcc  
alpha                randconfig-r001-20230327   gcc  
alpha                randconfig-r012-20230326   gcc  
alpha                randconfig-r021-20230326   gcc  
alpha                randconfig-r021-20230327   gcc  
alpha                randconfig-r025-20230326   gcc  
alpha                randconfig-r032-20230327   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230326   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230327   gcc  
arc                  randconfig-r004-20230327   gcc  
arc                  randconfig-r011-20230327   gcc  
arc                  randconfig-r012-20230326   gcc  
arc                  randconfig-r014-20230327   gcc  
arc                  randconfig-r021-20230327   gcc  
arc                  randconfig-r022-20230326   gcc  
arc                  randconfig-r043-20230326   gcc  
arc                  randconfig-r043-20230327   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230326   gcc  
arm                  randconfig-r016-20230327   gcc  
arm                  randconfig-r024-20230326   clang
arm                  randconfig-r031-20230326   gcc  
arm                  randconfig-r033-20230326   gcc  
arm                  randconfig-r046-20230326   clang
arm                  randconfig-r046-20230327   gcc  
arm                        spear6xx_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230326   gcc  
arm64                randconfig-r021-20230326   gcc  
arm64                randconfig-r026-20230327   clang
arm64                randconfig-r031-20230327   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230326   gcc  
csky                 randconfig-r013-20230326   gcc  
csky                 randconfig-r013-20230327   gcc  
csky                 randconfig-r022-20230326   gcc  
csky                 randconfig-r025-20230327   gcc  
csky                 randconfig-r026-20230326   gcc  
csky                 randconfig-r033-20230327   gcc  
hexagon      buildonly-randconfig-r003-20230326   clang
hexagon      buildonly-randconfig-r005-20230326   clang
hexagon      buildonly-randconfig-r006-20230327   clang
hexagon              randconfig-r041-20230326   clang
hexagon              randconfig-r041-20230327   clang
hexagon              randconfig-r045-20230326   clang
hexagon              randconfig-r045-20230327   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230327   gcc  
i386         buildonly-randconfig-r004-20230327   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230327   gcc  
i386                 randconfig-a002-20230327   gcc  
i386                 randconfig-a003-20230327   gcc  
i386                 randconfig-a004-20230327   gcc  
i386                 randconfig-a005-20230327   gcc  
i386                 randconfig-a006-20230327   gcc  
i386                 randconfig-a011-20230327   clang
i386                 randconfig-a012-20230327   clang
i386                 randconfig-a013-20230327   clang
i386                 randconfig-a014-20230327   clang
i386                 randconfig-a015-20230327   clang
i386                 randconfig-a016-20230327   clang
i386                          randconfig-c001   gcc  
i386                 randconfig-r014-20230327   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230327   gcc  
ia64                 randconfig-r031-20230326   gcc  
ia64                 randconfig-r032-20230327   gcc  
ia64                 randconfig-r035-20230326   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230326   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230326   gcc  
loongarch            randconfig-r012-20230327   gcc  
loongarch            randconfig-r023-20230327   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                 randconfig-r005-20230326   gcc  
m68k                 randconfig-r006-20230326   gcc  
m68k                 randconfig-r022-20230327   gcc  
m68k                 randconfig-r034-20230327   gcc  
m68k                 randconfig-r035-20230327   gcc  
microblaze   buildonly-randconfig-r002-20230326   gcc  
microblaze           randconfig-r006-20230326   gcc  
microblaze           randconfig-r006-20230327   gcc  
microblaze           randconfig-r014-20230326   gcc  
microblaze           randconfig-r016-20230327   gcc  
microblaze           randconfig-r036-20230327   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230327   clang
mips                 randconfig-r003-20230326   gcc  
mips                 randconfig-r003-20230327   clang
mips                 randconfig-r022-20230327   gcc  
mips                 randconfig-r023-20230327   gcc  
mips                 randconfig-r024-20230327   gcc  
mips                 randconfig-r025-20230327   gcc  
mips                 randconfig-r033-20230326   gcc  
mips                 randconfig-r034-20230326   gcc  
mips                         rt305x_defconfig   gcc  
nios2        buildonly-randconfig-r005-20230326   gcc  
nios2        buildonly-randconfig-r006-20230326   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230327   gcc  
nios2                randconfig-r015-20230327   gcc  
nios2                randconfig-r022-20230326   gcc  
nios2                randconfig-r023-20230326   gcc  
nios2                randconfig-r024-20230327   gcc  
openrisc     buildonly-randconfig-r006-20230327   gcc  
openrisc             randconfig-r004-20230327   gcc  
openrisc             randconfig-r035-20230327   gcc  
parisc       buildonly-randconfig-r004-20230326   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230327   gcc  
parisc               randconfig-r012-20230327   gcc  
parisc               randconfig-r016-20230326   gcc  
parisc               randconfig-r024-20230326   gcc  
parisc               randconfig-r024-20230327   gcc  
parisc               randconfig-r035-20230326   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230326   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc              randconfig-r002-20230326   clang
powerpc              randconfig-r002-20230327   gcc  
powerpc              randconfig-r004-20230327   gcc  
powerpc              randconfig-r015-20230326   gcc  
powerpc              randconfig-r021-20230327   clang
powerpc              randconfig-r023-20230326   gcc  
powerpc              randconfig-r032-20230327   gcc  
powerpc              randconfig-r034-20230326   clang
powerpc              randconfig-r034-20230327   gcc  
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230327   clang
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230326   clang
riscv                randconfig-r011-20230326   gcc  
riscv                randconfig-r015-20230326   gcc  
riscv                randconfig-r016-20230327   clang
riscv                randconfig-r021-20230327   clang
riscv                randconfig-r042-20230326   gcc  
riscv                randconfig-r042-20230327   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230326   clang
s390                 randconfig-r006-20230327   gcc  
s390                 randconfig-r015-20230326   gcc  
s390                 randconfig-r015-20230327   clang
s390                 randconfig-r023-20230326   gcc  
s390                 randconfig-r044-20230326   gcc  
s390                 randconfig-r044-20230327   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                   randconfig-r011-20230327   gcc  
sh                   randconfig-r016-20230326   gcc  
sh                   randconfig-r026-20230326   gcc  
sh                   randconfig-r032-20230326   gcc  
sh                           se7724_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230327   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230326   gcc  
sparc                randconfig-r011-20230327   gcc  
sparc                randconfig-r012-20230327   gcc  
sparc                randconfig-r014-20230326   gcc  
sparc                randconfig-r016-20230326   gcc  
sparc                randconfig-r022-20230327   gcc  
sparc                randconfig-r032-20230326   gcc  
sparc                randconfig-r035-20230326   gcc  
sparc                randconfig-r036-20230327   gcc  
sparc64                          alldefconfig   gcc  
sparc64      buildonly-randconfig-r001-20230326   gcc  
sparc64              randconfig-r002-20230327   gcc  
sparc64              randconfig-r003-20230327   gcc  
sparc64              randconfig-r005-20230327   gcc  
sparc64              randconfig-r024-20230327   gcc  
sparc64              randconfig-r025-20230326   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230327   gcc  
x86_64               randconfig-a002-20230327   gcc  
x86_64               randconfig-a003-20230327   gcc  
x86_64               randconfig-a004-20230327   gcc  
x86_64               randconfig-a005-20230327   gcc  
x86_64               randconfig-a006-20230327   gcc  
x86_64               randconfig-a011-20230327   clang
x86_64               randconfig-a012-20230327   clang
x86_64               randconfig-a013-20230327   clang
x86_64               randconfig-a014-20230327   clang
x86_64               randconfig-a015-20230327   clang
x86_64               randconfig-a016-20230327   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r031-20230327   gcc  
x86_64               randconfig-r033-20230327   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230327   gcc  
xtensa               randconfig-r001-20230327   gcc  
xtensa               randconfig-r015-20230327   gcc  
xtensa               randconfig-r022-20230327   gcc  
xtensa               randconfig-r036-20230327   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
