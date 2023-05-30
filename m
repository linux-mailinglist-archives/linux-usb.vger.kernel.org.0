Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFA1715E42
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 14:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbjE3MAX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 08:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjE3MAT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 08:00:19 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1C810A
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685448005; x=1716984005;
  h=date:from:to:cc:subject:message-id;
  bh=NrolhJi9JQABJd9YuDR7K5p3hnHu8QhBm6f/dMC5LmM=;
  b=J5MrAZbRoiyRmMC95lHN8YCxh38HvbdITapU/7MmkJ0rwFhxIWzcz7Im
   JD7HCxudD/2N+zTY4oQoS45jKqwdVYZoYwQ+4fvF/cQl8U4RPvUoCSBN3
   3rCglEfFJhCLCaxg93FURNxRa6UYagTs/LxVRek5WwwgZeCN4iNwXCxgi
   xfQny0lrAxNXilmV+q/Qg8Yv2XDx/YIQDZuEBN9hylk3K8r7FMp+fqX0F
   njGa8nRfyIXS30kNIu6au/K/eIPY+06GmVIG3vyTZ2QEwxUk+oDX2CuWi
   WlcwVvr4fj0SC7zf1po4juy9tt0h63G99WVk/2sW4LYp880yFel/puHYU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420653112"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="420653112"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830730215"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="830730215"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 May 2023 04:59:15 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q3y0Q-0000Pw-1K;
        Tue, 30 May 2023 11:59:14 +0000
Date:   Tue, 30 May 2023 19:58:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 44d0fb387b53e56c8a050bac5c7d460e21eb226f
Message-ID: <20230530115821.A1UCb%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 44d0fb387b53e56c8a050bac5c7d460e21eb226f  mm: page_table_check: Ensure user pages are not slab pages

elapsed time: 1211m

configs tested: 256
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230529   gcc  
alpha                randconfig-r026-20230530   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230530   gcc  
arc                  randconfig-r043-20230529   gcc  
arc                  randconfig-r043-20230530   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230529   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r032-20230530   gcc  
hexagon      buildonly-randconfig-r003-20230529   clang
hexagon      buildonly-randconfig-r006-20230530   clang
hexagon              randconfig-r001-20230529   clang
hexagon              randconfig-r041-20230529   clang
hexagon              randconfig-r045-20230529   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230529   clang
i386                 randconfig-i001-20230530   clang
i386                 randconfig-i002-20230529   clang
i386                 randconfig-i002-20230530   clang
i386                 randconfig-i003-20230529   clang
i386                 randconfig-i003-20230530   clang
i386                 randconfig-i004-20230529   clang
i386                 randconfig-i004-20230530   clang
i386                 randconfig-i005-20230529   clang
i386                 randconfig-i005-20230530   clang
i386                 randconfig-i006-20230529   clang
i386                 randconfig-i006-20230530   clang
i386                 randconfig-i011-20230529   gcc  
i386                 randconfig-i011-20230530   gcc  
i386                 randconfig-i012-20230529   gcc  
i386                 randconfig-i012-20230530   gcc  
i386                 randconfig-i013-20230529   gcc  
i386                 randconfig-i013-20230530   gcc  
i386                 randconfig-i014-20230529   gcc  
i386                 randconfig-i014-20230530   gcc  
i386                 randconfig-i015-20230529   gcc  
i386                 randconfig-i015-20230530   gcc  
i386                 randconfig-i016-20230529   gcc  
i386                 randconfig-i016-20230530   gcc  
i386                 randconfig-i051-20230529   clang
i386                 randconfig-i051-20230530   clang
i386                 randconfig-i052-20230529   clang
i386                 randconfig-i052-20230530   clang
i386                 randconfig-i053-20230529   clang
i386                 randconfig-i053-20230530   clang
i386                 randconfig-i054-20230529   clang
i386                 randconfig-i054-20230530   clang
i386                 randconfig-i055-20230529   clang
i386                 randconfig-i055-20230530   clang
i386                 randconfig-i056-20230529   clang
i386                 randconfig-i056-20230530   clang
i386                 randconfig-i061-20230529   clang
i386                 randconfig-i061-20230530   clang
i386                 randconfig-i062-20230529   clang
i386                 randconfig-i062-20230530   clang
i386                 randconfig-i063-20230529   clang
i386                 randconfig-i063-20230530   clang
i386                 randconfig-i064-20230529   clang
i386                 randconfig-i064-20230530   clang
i386                 randconfig-i065-20230529   clang
i386                 randconfig-i065-20230530   clang
i386                 randconfig-i066-20230529   clang
i386                 randconfig-i066-20230530   clang
i386                 randconfig-i071-20230529   gcc  
i386                 randconfig-i072-20230529   gcc  
i386                 randconfig-i072-20230530   gcc  
i386                 randconfig-i073-20230529   gcc  
i386                 randconfig-i074-20230529   gcc  
i386                 randconfig-i074-20230530   gcc  
i386                 randconfig-i075-20230529   gcc  
i386                 randconfig-i075-20230530   gcc  
i386                 randconfig-i076-20230529   gcc  
i386                 randconfig-i076-20230530   gcc  
i386                 randconfig-i081-20230529   gcc  
i386                 randconfig-i082-20230529   gcc  
i386                 randconfig-i082-20230530   gcc  
i386                 randconfig-i083-20230529   gcc  
i386                 randconfig-i083-20230530   gcc  
i386                 randconfig-i084-20230529   gcc  
i386                 randconfig-i084-20230530   gcc  
i386                 randconfig-i085-20230529   gcc  
i386                 randconfig-i085-20230530   gcc  
i386                 randconfig-i086-20230529   gcc  
i386                 randconfig-i091-20230529   clang
i386                 randconfig-i091-20230530   clang
i386                 randconfig-i092-20230529   clang
i386                 randconfig-i092-20230530   clang
i386                 randconfig-i093-20230529   clang
i386                 randconfig-i093-20230530   clang
i386                 randconfig-i094-20230529   clang
i386                 randconfig-i094-20230530   clang
i386                 randconfig-i095-20230529   clang
i386                 randconfig-i095-20230530   clang
i386                 randconfig-i096-20230529   clang
i386                 randconfig-i096-20230530   clang
i386                 randconfig-r024-20230530   gcc  
i386                 randconfig-r026-20230529   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230529   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r036-20230529   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230530   gcc  
microblaze           randconfig-r003-20230529   gcc  
microblaze           randconfig-r012-20230530   gcc  
microblaze           randconfig-r023-20230530   gcc  
microblaze           randconfig-r033-20230530   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r001-20230529   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230530   gcc  
openrisc     buildonly-randconfig-r002-20230529   gcc  
openrisc             randconfig-r021-20230529   gcc  
openrisc             randconfig-r036-20230530   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230529   gcc  
parisc               randconfig-r014-20230529   gcc  
parisc               randconfig-r032-20230529   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r005-20230529   clang
powerpc              randconfig-r015-20230529   gcc  
powerpc              randconfig-r016-20230529   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230529   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230529   gcc  
riscv                randconfig-r031-20230529   clang
riscv                randconfig-r042-20230529   gcc  
riscv                randconfig-r042-20230530   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230530   gcc  
s390                 randconfig-r014-20230530   gcc  
s390                 randconfig-r022-20230529   gcc  
s390                 randconfig-r044-20230529   gcc  
s390                 randconfig-r044-20230530   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230530   gcc  
sh                   randconfig-r025-20230529   gcc  
sh                   randconfig-r035-20230530   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230529   gcc  
sparc                randconfig-r016-20230530   gcc  
sparc                randconfig-r033-20230529   gcc  
sparc64              randconfig-r032-20230530   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230530   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230529   clang
x86_64               randconfig-a001-20230530   clang
x86_64               randconfig-a002-20230529   clang
x86_64               randconfig-a002-20230530   clang
x86_64               randconfig-a003-20230529   clang
x86_64               randconfig-a003-20230530   clang
x86_64               randconfig-a004-20230529   clang
x86_64               randconfig-a004-20230530   clang
x86_64               randconfig-a005-20230529   clang
x86_64               randconfig-a005-20230530   clang
x86_64               randconfig-a006-20230529   clang
x86_64               randconfig-a006-20230530   clang
x86_64               randconfig-a011-20230529   gcc  
x86_64               randconfig-a011-20230530   gcc  
x86_64               randconfig-a012-20230529   gcc  
x86_64               randconfig-a012-20230530   gcc  
x86_64               randconfig-a013-20230529   gcc  
x86_64               randconfig-a013-20230530   gcc  
x86_64               randconfig-a014-20230529   gcc  
x86_64               randconfig-a014-20230530   gcc  
x86_64               randconfig-a015-20230529   gcc  
x86_64               randconfig-a015-20230530   gcc  
x86_64               randconfig-a016-20230529   gcc  
x86_64               randconfig-a016-20230530   gcc  
x86_64               randconfig-x051-20230529   gcc  
x86_64               randconfig-x051-20230530   gcc  
x86_64               randconfig-x052-20230529   gcc  
x86_64               randconfig-x052-20230530   gcc  
x86_64               randconfig-x053-20230529   gcc  
x86_64               randconfig-x053-20230530   gcc  
x86_64               randconfig-x054-20230529   gcc  
x86_64               randconfig-x054-20230530   gcc  
x86_64               randconfig-x055-20230529   gcc  
x86_64               randconfig-x055-20230530   gcc  
x86_64               randconfig-x056-20230529   gcc  
x86_64               randconfig-x056-20230530   gcc  
x86_64               randconfig-x061-20230529   gcc  
x86_64               randconfig-x061-20230530   gcc  
x86_64               randconfig-x062-20230529   gcc  
x86_64               randconfig-x062-20230530   gcc  
x86_64               randconfig-x063-20230529   gcc  
x86_64               randconfig-x063-20230530   gcc  
x86_64               randconfig-x064-20230529   gcc  
x86_64               randconfig-x064-20230530   gcc  
x86_64               randconfig-x065-20230529   gcc  
x86_64               randconfig-x065-20230530   gcc  
x86_64               randconfig-x066-20230529   gcc  
x86_64               randconfig-x066-20230530   gcc  
x86_64               randconfig-x071-20230529   clang
x86_64               randconfig-x071-20230530   clang
x86_64               randconfig-x072-20230529   clang
x86_64               randconfig-x072-20230530   clang
x86_64               randconfig-x073-20230529   clang
x86_64               randconfig-x073-20230530   clang
x86_64               randconfig-x074-20230529   clang
x86_64               randconfig-x074-20230530   clang
x86_64               randconfig-x075-20230529   clang
x86_64               randconfig-x075-20230530   clang
x86_64               randconfig-x076-20230529   clang
x86_64               randconfig-x076-20230530   clang
x86_64               randconfig-x081-20230529   clang
x86_64               randconfig-x081-20230530   clang
x86_64               randconfig-x082-20230529   clang
x86_64               randconfig-x082-20230530   clang
x86_64               randconfig-x083-20230529   clang
x86_64               randconfig-x083-20230530   clang
x86_64               randconfig-x084-20230529   clang
x86_64               randconfig-x084-20230530   clang
x86_64               randconfig-x085-20230529   clang
x86_64               randconfig-x085-20230530   clang
x86_64               randconfig-x086-20230529   clang
x86_64               randconfig-x086-20230530   clang
x86_64               randconfig-x091-20230529   gcc  
x86_64               randconfig-x091-20230530   gcc  
x86_64               randconfig-x092-20230529   gcc  
x86_64               randconfig-x092-20230530   gcc  
x86_64               randconfig-x093-20230529   gcc  
x86_64               randconfig-x093-20230530   gcc  
x86_64               randconfig-x094-20230529   gcc  
x86_64               randconfig-x094-20230530   gcc  
x86_64               randconfig-x095-20230529   gcc  
x86_64               randconfig-x095-20230530   gcc  
x86_64               randconfig-x096-20230529   gcc  
x86_64               randconfig-x096-20230530   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230529   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
