Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 246266DCB6D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 21:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjDJTPE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 15:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjDJTOl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 15:14:41 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57F31982
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681154080; x=1712690080;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wuAouLt+8+ybub6Vb9Hco6EII0HU0b11fcY1Y7lrbqc=;
  b=ZUKHZbi4IVw4hAoWlLrth8D8E8F5a8OiQBK8eih15tsovmRj0HnhB4+c
   71ukXxGCyEighi57PQfKgkPceQL2quEQI/nW3lVput6cJaPVeG7eQU13f
   ddLkVRqek8RvUllLz1unywefF58UTvls9nhmKHMoiNKorfE2/ch70aBRq
   keQ3WAUYoJ0aBlEjxIZ1+A/Vp6feCFmwhXWdZqQ8RdUrlKCp7oypDkE5U
   qb0QgMI3hzCONOK2FMj4ZjdLWSoRaylQ1WH5KlmM6mAn6C8vWNXBY0Cdc
   UJd7syN/tX53aLWPKAtB0v01685I9AHCC1wKH6RcWNMu9jcOOckv4hhYm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="342199337"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="342199337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 12:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="862570921"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="862570921"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Apr 2023 12:14:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1plwyK-000Vbn-1Y;
        Mon, 10 Apr 2023 19:14:36 +0000
Date:   Tue, 11 Apr 2023 03:14:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 f0052ad6fa1ab90dba8b5450c48192788a4b88be
Message-ID: <64346002.9tWMWVT2ESH7D2ap%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: f0052ad6fa1ab90dba8b5450c48192788a4b88be  USB: disable all RNDIS protocol drivers

elapsed time: 726m

configs tested: 134
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230409   gcc  
alpha                randconfig-r023-20230410   gcc  
alpha                randconfig-r026-20230410   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r032-20230410   gcc  
arc                  randconfig-r033-20230409   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230409   gcc  
arm                  randconfig-r012-20230409   clang
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230410   clang
arm64                randconfig-r016-20230409   gcc  
arm64                randconfig-r022-20230410   gcc  
csky         buildonly-randconfig-r003-20230409   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230409   gcc  
hexagon              randconfig-r033-20230410   clang
hexagon              randconfig-r034-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230410   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r006-20230410   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230410   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r022-20230409   gcc  
ia64                 randconfig-r034-20230410   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230409   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230410   gcc  
loongarch            randconfig-r014-20230410   gcc  
loongarch            randconfig-r024-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230409   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230409   gcc  
m68k                 randconfig-r036-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r013-20230410   clang
mips                 randconfig-r021-20230409   clang
nios2        buildonly-randconfig-r001-20230409   gcc  
nios2        buildonly-randconfig-r006-20230410   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r035-20230409   gcc  
openrisc     buildonly-randconfig-r001-20230410   gcc  
openrisc             randconfig-r006-20230409   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230410   gcc  
parisc               randconfig-r014-20230409   gcc  
parisc               randconfig-r023-20230409   gcc  
parisc               randconfig-r032-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r001-20230410   clang
powerpc              randconfig-r011-20230410   gcc  
powerpc              randconfig-r031-20230410   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230409   gcc  
riscv                randconfig-r015-20230410   gcc  
riscv                randconfig-r024-20230410   gcc  
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r026-20230409   gcc  
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230409   gcc  
sh                   randconfig-r012-20230410   gcc  
sh                   randconfig-r025-20230409   gcc  
sparc        buildonly-randconfig-r005-20230410   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230410   gcc  
sparc                randconfig-r031-20230409   gcc  
sparc64              randconfig-r005-20230410   gcc  
sparc64              randconfig-r025-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64               randconfig-r021-20230410   gcc  
x86_64               randconfig-r036-20230410   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r035-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
