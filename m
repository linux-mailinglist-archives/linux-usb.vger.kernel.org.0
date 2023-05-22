Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF6570C50F
	for <lists+linux-usb@lfdr.de>; Mon, 22 May 2023 20:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjEVSVQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 14:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjEVSVP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 14:21:15 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF8FE0
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684779674; x=1716315674;
  h=date:from:to:cc:subject:message-id;
  bh=53ia2IS1oExH3Z7LpvyH1QAHQQVPYIfsWPkAxjjrFfg=;
  b=hZ85tk4VPsHxcfiaxK+fCIr+u2qWHIIkjbIoAYtmZg1F/m7jils2Wg0m
   2tBY71ie33kHctsb2spxShFU3s/I8ppmNTrefhP7H/lBvEdWauKkUVIls
   DxWZp1X6g8N6eDu8YwdDBYBhM1XXPr5+qLx2B3BLlOQfv6Jzao241RfW3
   giQ7QGyFI/dUoTBToYK0FwZjq+gzYgmu8E6vdSpX1M0FGiDtKnQcifgHX
   I3Er7PuE8Q2t+U2B5uSb2Ochgqx46M/urSfvVsBySs6Liwzijl0P7TNOm
   4epugseTt5LzRX1Yw6IPvksCQDoQMkBMov0KyQn54P3WKOdalDoMXBquF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="418710608"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="418710608"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 11:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="773449111"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="773449111"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 May 2023 11:21:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1A9f-000D3Y-39;
        Mon, 22 May 2023 18:21:11 +0000
Date:   Tue, 23 May 2023 02:20:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 70c2e03e9aaf17496c63f6e42333c012f5ae5307
Message-ID: <20230522182048.CG1eo%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230522162832/lkp-src/repo/*/westeri-thunderbolt
https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 70c2e03e9aaf17496c63f6e42333c012f5ae5307  thunderbolt: dma_test: Use correct value for absent rings when creating paths

elapsed time: 723m

configs tested: 181
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230522   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230522   gcc  
alpha                randconfig-r014-20230521   gcc  
alpha                randconfig-r033-20230522   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230522   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230522   gcc  
arc                  randconfig-r012-20230522   gcc  
arc                  randconfig-r015-20230522   gcc  
arc                  randconfig-r034-20230522   gcc  
arc                  randconfig-r035-20230521   gcc  
arc                  randconfig-r036-20230521   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230522   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230522   gcc  
arm64                randconfig-r012-20230521   gcc  
arm64                randconfig-r016-20230522   clang
csky         buildonly-randconfig-r002-20230522   gcc  
csky         buildonly-randconfig-r003-20230522   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230522   gcc  
csky                 randconfig-r022-20230522   gcc  
csky                 randconfig-r026-20230521   gcc  
hexagon              randconfig-r041-20230521   clang
hexagon              randconfig-r041-20230522   clang
hexagon              randconfig-r045-20230521   clang
hexagon              randconfig-r045-20230522   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-a011-20230522   clang
i386                 randconfig-a012-20230522   clang
i386                 randconfig-a013-20230522   clang
i386                 randconfig-a014-20230522   clang
i386                 randconfig-a015-20230522   clang
i386                 randconfig-a016-20230522   clang
i386                 randconfig-r001-20230522   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230521   gcc  
ia64         buildonly-randconfig-r001-20230522   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230522   gcc  
ia64                 randconfig-r004-20230521   gcc  
ia64                 randconfig-r023-20230521   gcc  
ia64                          tiger_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230521   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r022-20230521   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r005-20230521   gcc  
m68k                 randconfig-r024-20230522   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze           randconfig-r004-20230522   gcc  
microblaze           randconfig-r011-20230521   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                 randconfig-r001-20230521   gcc  
mips                 randconfig-r006-20230521   gcc  
mips                 randconfig-r032-20230521   gcc  
mips                 randconfig-r036-20230522   clang
nios2        buildonly-randconfig-r001-20230522   gcc  
nios2        buildonly-randconfig-r005-20230521   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230521   gcc  
nios2                randconfig-r005-20230521   gcc  
nios2                randconfig-r025-20230521   gcc  
openrisc     buildonly-randconfig-r004-20230521   gcc  
openrisc             randconfig-r003-20230522   gcc  
openrisc             randconfig-r031-20230522   gcc  
openrisc             randconfig-r034-20230521   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230521   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc              randconfig-r036-20230521   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230521   gcc  
riscv                randconfig-r016-20230521   gcc  
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230521   clang
s390                 randconfig-r005-20230522   gcc  
s390                 randconfig-r011-20230521   gcc  
s390                 randconfig-r015-20230521   gcc  
s390                 randconfig-r033-20230521   clang
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230521   gcc  
sh           buildonly-randconfig-r005-20230522   gcc  
sh                               j2_defconfig   gcc  
sh                   randconfig-r014-20230522   gcc  
sh                   randconfig-r016-20230521   gcc  
sh                   randconfig-r035-20230522   gcc  
sh                          urquell_defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc        buildonly-randconfig-r004-20230522   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230522   gcc  
sparc                randconfig-r012-20230521   gcc  
sparc                randconfig-r014-20230521   gcc  
sparc                randconfig-r023-20230522   gcc  
sparc64              randconfig-r002-20230521   gcc  
sparc64              randconfig-r002-20230522   gcc  
sparc64              randconfig-r006-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
x86_64               randconfig-x081-20230522   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64               randconfig-x083-20230522   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64               randconfig-x085-20230522   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r002-20230522   gcc  
xtensa               randconfig-r011-20230522   gcc  
xtensa               randconfig-r013-20230521   gcc  
xtensa               randconfig-r014-20230522   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
