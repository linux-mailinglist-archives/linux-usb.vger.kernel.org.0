Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9447188AB
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 19:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjEaRms (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 13:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjEaRmj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 13:42:39 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7593B128
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685554957; x=1717090957;
  h=date:from:to:cc:subject:message-id;
  bh=oTfqfZVaDQgnFSgZ7B9wjkTceD2NP2Aw+G7Tg0WjGqE=;
  b=SGcwtjUeekE/jxWQza4aRdRQd/2m7oBXSG0ZubgOSfZXo0ykcX3Nq8Ni
   laXCxtxALdd92ZDGljV9qNg1z56j9YuvL7TnVXjCBk+P+PGXv6AWku1JC
   HLDwt7aBnecZ7DOXSrrN3jhOe2+4ee/lqRxSilJmpk6tAJJ4ADs0pBGBl
   F//hEVptXOr/k+KG5VGes8kYyMrMef1Vhvct3bsfpq4tm3fZ1tRbuo6T2
   ORNy1puOiniU5LJLF/qFTPzcuFPaV23nUnTyvqGlmyekFGnIA2ejKkdIN
   41Rbx3GlqRcTimRKVYN9HDi5joL1j7HcH16hh2TfF9p/VCQGx65m06+1/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="358579344"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="358579344"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 10:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="740057588"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="740057588"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2023 10:42:35 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q4PqE-0001WZ-1n;
        Wed, 31 May 2023 17:42:34 +0000
Date:   Thu, 01 Jun 2023 01:41:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 d4cee89031c80066ec461bb77b5e13a4f37d5fd2
Message-ID: <20230531174141.u9Px1%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: d4cee89031c80066ec461bb77b5e13a4f37d5fd2  Add linux-next specific files for 20230531

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305311652.OP9x8xkW-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

include/drm/drm_print.h:456:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
include/linux/usb/typec_mux.h:77:1: error: expected identifier or '(' before '{' token

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   `-- include-drm-drm_print.h:error:format-ld-expects-argument-of-type-long-int-but-argument-has-type-size_t-aka-unsigned-int
`-- parisc-randconfig-r025-20230531
    `-- include-linux-usb-typec_mux.h:error:expected-identifier-or-(-before-token

elapsed time: 724m

configs tested: 149
configs skipped: 5

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230531   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230531   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230531   gcc  
arc                  randconfig-r043-20230531   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                  randconfig-r004-20230531   clang
arm                  randconfig-r013-20230531   gcc  
arm                  randconfig-r046-20230531   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230531   clang
arm64                randconfig-r034-20230531   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r033-20230531   gcc  
hexagon              randconfig-r002-20230531   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i011-20230531   clang
i386                 randconfig-i012-20230531   clang
i386                 randconfig-i013-20230531   clang
i386                 randconfig-i014-20230531   clang
i386                 randconfig-i015-20230531   clang
i386                 randconfig-i016-20230531   clang
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-i071-20230531   clang
i386                 randconfig-i072-20230531   clang
i386                 randconfig-i073-20230531   clang
i386                 randconfig-i074-20230531   clang
i386                 randconfig-i075-20230531   clang
i386                 randconfig-i076-20230531   clang
i386                 randconfig-i081-20230531   clang
i386                 randconfig-i082-20230531   clang
i386                 randconfig-i083-20230531   clang
i386                 randconfig-i084-20230531   clang
i386                 randconfig-i085-20230531   clang
i386                 randconfig-i086-20230531   clang
i386                 randconfig-i091-20230531   gcc  
i386                 randconfig-i092-20230531   gcc  
i386                 randconfig-i093-20230531   gcc  
i386                 randconfig-i094-20230531   gcc  
i386                 randconfig-i095-20230531   gcc  
i386                 randconfig-i096-20230531   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230531   gcc  
parisc               randconfig-r025-20230531   gcc  
parisc               randconfig-r026-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230531   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r031-20230531   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230531   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230531   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230531   gcc  
sparc64      buildonly-randconfig-r004-20230531   gcc  
sparc64      buildonly-randconfig-r005-20230531   gcc  
sparc64              randconfig-r032-20230531   gcc  
sparc64              randconfig-r035-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230531   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-a011-20230531   clang
x86_64               randconfig-a012-20230531   clang
x86_64               randconfig-a013-20230531   clang
x86_64               randconfig-a014-20230531   clang
x86_64               randconfig-k001-20230531   clang
x86_64               randconfig-r021-20230531   clang
x86_64               randconfig-r036-20230531   gcc  
x86_64               randconfig-x056-20230531   clang
x86_64               randconfig-x061-20230531   clang
x86_64               randconfig-x062-20230531   clang
x86_64               randconfig-x063-20230531   clang
x86_64               randconfig-x064-20230531   clang
x86_64               randconfig-x065-20230531   clang
x86_64               randconfig-x066-20230531   clang
x86_64               randconfig-x081-20230531   gcc  
x86_64               randconfig-x082-20230531   gcc  
x86_64               randconfig-x083-20230531   gcc  
x86_64               randconfig-x084-20230531   gcc  
x86_64               randconfig-x085-20230531   gcc  
x86_64               randconfig-x086-20230531   gcc  
x86_64               randconfig-x091-20230531   clang
x86_64               randconfig-x092-20230531   clang
x86_64               randconfig-x093-20230531   clang
x86_64               randconfig-x094-20230531   clang
x86_64               randconfig-x095-20230531   clang
x86_64               randconfig-x096-20230531   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230531   gcc  
xtensa               randconfig-r005-20230531   gcc  
xtensa               randconfig-r024-20230531   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
