Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E94169A407
	for <lists+linux-usb@lfdr.de>; Fri, 17 Feb 2023 03:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBQCwF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 21:52:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBQCwE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 21:52:04 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691423865F
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 18:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676602323; x=1708138323;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o9iUKnbilpCMuJ29DYYMLSeWD4KPSoFxj3q4HgwzXKI=;
  b=hTy6NEnwQoD0HEQe0C3teBneKhvZOQH4eOdZNloDk9y6IyBGXoZOScKy
   Gcfrsq5HF8Kp5yHRq7ZY0HSC525P1xgouMQS51ELl6u0KgN4J/3uZJRVd
   9p7zPLdnY+CqVmvcZrhYAkwAA9b7kBlqmjcwJ+9slaWKnYof3+OTSHpdU
   d+YDvWxesUH/ZSnYLj5mzuN/p7//Um5UylislTnDHWLeISU3J+0so4Au8
   rUVbAUiu1WBjwMkn/U5+ltkuYbXIt8qUMxOMVIV4MMF0VfdbiN27+zGPg
   mV+uyNIfMPecCdPUHjji32tGjMu/jdPn+yeFX1CzKJi8LDtzFkMg6y7z6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331897209"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331897209"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 18:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="620243260"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="620243260"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Feb 2023 18:51:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pSqqq-000B40-1y;
        Fri, 17 Feb 2023 02:51:56 +0000
Date:   Fri, 17 Feb 2023 10:50:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 1243741f6b02b5f2c06bca910f894c333838f994
Message-ID: <63eeeb93.Os6Duuds4mEsi4eK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LONGWORDS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1243741f6b02b5f2c06bca910f894c333838f994  Merge tag 'usb-serial-6.3-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 728m

configs tested: 97
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230212
arc                  randconfig-r043-20230213
arc                  randconfig-r043-20230214
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                  randconfig-r046-20230212
arm                  randconfig-r046-20230214
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                 randconfig-a011-20230213
i386                 randconfig-a012-20230213
i386                 randconfig-a013-20230213
i386                 randconfig-a014-20230213
i386                 randconfig-a015-20230213
i386                 randconfig-a016-20230213
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230213
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230213
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64               randconfig-a011-20230213
x86_64               randconfig-a012-20230213
x86_64               randconfig-a013-20230213
x86_64               randconfig-a014-20230213
x86_64               randconfig-a015-20230213
x86_64               randconfig-a016-20230213
x86_64                               rhel-8.3

clang tested configs:
arm                  randconfig-r046-20230213
hexagon              randconfig-r041-20230212
hexagon              randconfig-r041-20230213
hexagon              randconfig-r041-20230214
hexagon              randconfig-r045-20230212
hexagon              randconfig-r045-20230213
hexagon              randconfig-r045-20230214
i386                 randconfig-a001-20230213
i386                          randconfig-a002
i386                 randconfig-a002-20230213
i386                 randconfig-a003-20230213
i386                          randconfig-a004
i386                 randconfig-a004-20230213
i386                 randconfig-a005-20230213
i386                          randconfig-a006
i386                 randconfig-a006-20230213
riscv                randconfig-r042-20230212
riscv                randconfig-r042-20230214
s390                 randconfig-r044-20230212
s390                 randconfig-r044-20230214
x86_64                        randconfig-a001
x86_64               randconfig-a001-20230213
x86_64               randconfig-a002-20230213
x86_64                        randconfig-a003
x86_64               randconfig-a003-20230213
x86_64               randconfig-a004-20230213
x86_64                        randconfig-a005
x86_64               randconfig-a005-20230213
x86_64               randconfig-a006-20230213

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
