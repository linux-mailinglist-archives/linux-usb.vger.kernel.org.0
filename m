Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9EE728A18
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 23:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbjFHVRo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 17:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjFHVRn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 17:17:43 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07572D51
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 14:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686259061; x=1717795061;
  h=date:from:to:cc:subject:message-id;
  bh=/waIJP//qRI1b1wXbs5/GRsuG73UWG7QXc19qMIAB+k=;
  b=ihjE+rf+b5w2sDGLFiWL6NK06h1LSP56R98F+KiQVzNI8Ct7cMSVrO6k
   BXTIjq/mrTTbiLmTuekJOXcG3cQ0yODB5hGTVW83w3L1beiQZuIpAM5qo
   0/bB3QyvUpJRzdv7Zpubw/bxkkXgjWLoFRusVypu9obcRd0JlM91fBVZE
   /Ey9crDn+q09HTJ3Ej1Oxakd4GaGx1jwsoW5i755NE/A0zN9R48AMweDv
   qBRH9EBNH4vj+OkzShG93zPmhT6sZQtBvQuHu1H0qeEhJGejw3oxsy5A9
   JlPS9dUf08sC9xzfTW28p6LhOJPW52XP6CxctMbzClerHA87Q/gcZdFBu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356315944"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="356315944"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 14:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="775247986"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="775247986"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jun 2023 14:17:40 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q7N0l-0008HN-2q;
        Thu, 08 Jun 2023 21:17:39 +0000
Date:   Fri, 09 Jun 2023 05:16:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 7b672f282cf4712cb392ef798f0305cc4de32454
Message-ID: <202306090545.KFGOLuqy-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 7b672f282cf4712cb392ef798f0305cc4de32454  Merge tag 'usb-serial-6.4-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 723m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230608   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230608   clang
hexagon              randconfig-r045-20230608   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i011-20230608   clang
i386                 randconfig-i012-20230608   clang
i386                 randconfig-i013-20230608   clang
i386                 randconfig-i014-20230608   clang
i386                 randconfig-i015-20230608   clang
i386                 randconfig-i016-20230608   clang
i386                 randconfig-i051-20230608   gcc  
i386                 randconfig-i052-20230608   gcc  
i386                 randconfig-i053-20230608   gcc  
i386                 randconfig-i054-20230608   gcc  
i386                 randconfig-i055-20230608   gcc  
i386                 randconfig-i056-20230608   gcc  
i386                 randconfig-i061-20230608   gcc  
i386                 randconfig-i062-20230608   gcc  
i386                 randconfig-i063-20230608   gcc  
i386                 randconfig-i064-20230608   gcc  
i386                 randconfig-i065-20230608   gcc  
i386                 randconfig-i066-20230608   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r034-20230608   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        maltaup_defconfig   clang
mips                        qi_lb60_defconfig   clang
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc              randconfig-r033-20230608   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230608   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230608   clang
sh                               allmodconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r036-20230608   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230608   gcc  
x86_64               randconfig-a002-20230608   gcc  
x86_64               randconfig-a003-20230608   gcc  
x86_64               randconfig-a004-20230608   gcc  
x86_64               randconfig-a005-20230608   gcc  
x86_64               randconfig-a006-20230608   gcc  
x86_64               randconfig-a011-20230608   clang
x86_64               randconfig-a012-20230608   clang
x86_64               randconfig-a013-20230608   clang
x86_64               randconfig-a014-20230608   clang
x86_64               randconfig-a015-20230608   clang
x86_64               randconfig-a016-20230608   clang
x86_64               randconfig-x051-20230608   clang
x86_64               randconfig-x052-20230608   clang
x86_64               randconfig-x053-20230608   clang
x86_64               randconfig-x054-20230608   clang
x86_64               randconfig-x055-20230608   clang
x86_64               randconfig-x056-20230608   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                              defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
