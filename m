Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8526FBE5E
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 06:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbjEIEpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 00:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234624AbjEIEpA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 00:45:00 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221327688
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 21:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683607499; x=1715143499;
  h=date:from:to:cc:subject:message-id;
  bh=pixqkkPKIupM4t0ljnTeRSFtPfoablu6yslSJyF8h/s=;
  b=SBDx9WLvX8C6o5VtnwkQnqYB70rwARd77ud/+nG9kg+DRzALvf/UhGPv
   PWyteFMuhr7qZgGuebUxxcKtQbvF4/RKmTXAGPlw27tKBBxhE99+1tKGh
   7YcqukDeNFjAJblAawWAU4t8dt7frvgCvWXKKLOl2+EBv54EK+XL/MbgE
   dI90PphxyUKMh+jjoe8t7Ah0FBfgWZueZQVK68TfQ0DmkNeN+WZO1XiHP
   dM4QbcyeW21NjzkftW3zo8A418hu9y+dc7wSlEUcRWeyC7lRJ7zz3Dscz
   n/cL9ZwCFm2sCMPyloD9I6FoBgNlzMaFXq0IqYnOmyUesTCdR4FOVQmZn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349845532"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="349845532"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 21:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="810508423"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="810508423"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 May 2023 21:44:58 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwFDd-0001i8-1S;
        Tue, 09 May 2023 04:44:57 +0000
Date:   Tue, 09 May 2023 12:44:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 ce3480c31462229e77b324c746b69e842a6d8a1b
Message-ID: <20230509044431.AouLf%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: ce3480c31462229e77b324c746b69e842a6d8a1b  USB: disable all RNDIS protocol drivers

elapsed time: 720m

configs tested: 112
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230508   gcc  
alpha                randconfig-r023-20230507   gcc  
alpha                randconfig-r035-20230507   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230508   gcc  
arc                  randconfig-r043-20230507   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230507   clang
arm                  randconfig-r003-20230507   clang
arm                  randconfig-r014-20230508   clang
arm                  randconfig-r046-20230507   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230508   clang
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230508   clang
arm64                randconfig-r011-20230507   clang
arm64                randconfig-r033-20230507   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r045-20230507   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r002-20230508   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230508   clang
i386                 randconfig-a002-20230508   clang
i386                 randconfig-a003-20230508   clang
i386                 randconfig-a004-20230508   clang
i386                 randconfig-a005-20230508   clang
i386                 randconfig-a006-20230508   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230508   gcc  
ia64         buildonly-randconfig-r004-20230508   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230508   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230507   gcc  
microblaze           randconfig-r011-20230508   gcc  
microblaze           randconfig-r024-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r026-20230507   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230507   gcc  
nios2                randconfig-r021-20230507   gcc  
nios2                randconfig-r032-20230507   gcc  
openrisc             randconfig-r013-20230507   gcc  
openrisc             randconfig-r015-20230507   gcc  
openrisc             randconfig-r034-20230508   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230508   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230507   gcc  
powerpc              randconfig-r033-20230508   clang
powerpc              randconfig-r036-20230507   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230507   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230508   clang
s390                 randconfig-r006-20230508   clang
s390                 randconfig-r036-20230508   clang
s390                 randconfig-r044-20230507   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230508   gcc  
sh                   randconfig-r013-20230508   gcc  
sh                   randconfig-r034-20230507   gcc  
sh                   randconfig-r035-20230508   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r001-20230507   gcc  
sparc64              randconfig-r022-20230507   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230508   clang
x86_64               randconfig-a002-20230508   clang
x86_64               randconfig-a003-20230508   clang
x86_64               randconfig-a004-20230508   clang
x86_64               randconfig-a005-20230508   clang
x86_64               randconfig-a006-20230508   clang
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r032-20230508   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
