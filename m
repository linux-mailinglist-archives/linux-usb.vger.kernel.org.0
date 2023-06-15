Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B328373228D
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jun 2023 00:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbjFOWNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jun 2023 18:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239056AbjFOWM6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 18:12:58 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73CE272D
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 15:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686867173; x=1718403173;
  h=date:from:to:cc:subject:message-id;
  bh=5dfjO16H7iex5oWN6Ht6C5wPegApj/THCZcJxf759As=;
  b=EV8X4XNNmskeZGfsc1Mzyl/rY94UdCOO10pjH44F62fuSqIpAkRUrmX+
   fIIFx552r/zqN9xxZIdGVHkghUmjP8PVL6l4tLvGnt2IE7+nWTVXml0x3
   leO8DlUm77HfwcSQdBTAfBzlptOL/YqibdquuBYn1mfZEVsc2TdiTaE0E
   w9ENqnBwqcpI62kGQdMyPmcsfo7KxexWWZgNfSpYJqNRFz9NNMKQfjKlv
   n7B+OZSsEPZj4lwEhZRWznM6EUTAWJ4KzyxKDycSzid1NhU0U8L+QhYCO
   1Z58/fC+8FUQz+4i14Grvvx+tSk8goaobklFmywFYR0QaEFfYRmpFqd+W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="338671720"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="338671720"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 15:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857146989"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="857146989"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2023 15:12:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q9vD2-0000Rn-0H;
        Thu, 15 Jun 2023 22:12:52 +0000
Date:   Fri, 16 Jun 2023 06:12:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS WITH WARNING
 df49f2a0ac4a34c0cb4b5c233fcfa0add644c43c
Message-ID: <202306160658.E79gCwiR-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: df49f2a0ac4a34c0cb4b5c233fcfa0add644c43c  Revert "usb: common: usb-conn-gpio: Set last role to unknown before initial detection"

Warning: (recently discovered and may have been fixed)

drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
`-- riscv-allyesconfig
    `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead

elapsed time: 728m

configs tested: 142
configs skipped: 7

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r004-20230615   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230615   gcc  
alpha                randconfig-r026-20230615   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230614   gcc  
arc                  randconfig-r043-20230615   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r046-20230614   clang
arm                  randconfig-r046-20230615   gcc  
arm                        realview_defconfig   gcc  
arm                         s5pv210_defconfig   clang
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r003-20230614   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r004-20230615   clang
hexagon              randconfig-r024-20230615   clang
hexagon              randconfig-r025-20230615   clang
hexagon              randconfig-r041-20230614   clang
hexagon              randconfig-r045-20230614   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230614   clang
i386                 randconfig-i001-20230615   gcc  
i386                 randconfig-i002-20230614   clang
i386                 randconfig-i002-20230615   gcc  
i386                 randconfig-i003-20230614   clang
i386                 randconfig-i003-20230615   gcc  
i386                 randconfig-i004-20230614   clang
i386                 randconfig-i004-20230615   gcc  
i386                 randconfig-i005-20230614   clang
i386                 randconfig-i005-20230615   gcc  
i386                 randconfig-i006-20230614   clang
i386                 randconfig-i006-20230615   gcc  
i386                 randconfig-i011-20230614   gcc  
i386                 randconfig-i012-20230614   gcc  
i386                 randconfig-i013-20230614   gcc  
i386                 randconfig-i014-20230614   gcc  
i386                 randconfig-i015-20230614   gcc  
i386                 randconfig-i016-20230614   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230614   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230615   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230614   gcc  
m68k                 randconfig-r033-20230615   gcc  
microblaze   buildonly-randconfig-r002-20230614   gcc  
microblaze           randconfig-r033-20230615   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                 randconfig-r022-20230615   gcc  
mips                 randconfig-r023-20230615   gcc  
mips                 randconfig-r024-20230615   gcc  
mips                 randconfig-r031-20230615   clang
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r001-20230614   gcc  
openrisc     buildonly-randconfig-r006-20230614   gcc  
openrisc             randconfig-r012-20230614   gcc  
openrisc             randconfig-r032-20230615   gcc  
openrisc             randconfig-r036-20230615   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230615   gcc  
parisc               randconfig-r036-20230615   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    mvme5100_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r011-20230614   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r035-20230615   gcc  
riscv                randconfig-r042-20230614   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230614   gcc  
s390                 randconfig-r026-20230615   clang
s390                 randconfig-r044-20230614   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230615   gcc  
sh                   randconfig-r016-20230614   gcc  
sh                   randconfig-r031-20230615   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc        buildonly-randconfig-r003-20230615   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r034-20230615   gcc  
sparc64      buildonly-randconfig-r005-20230615   gcc  
sparc64              randconfig-r001-20230615   gcc  
sparc64              randconfig-r021-20230615   gcc  
sparc64              randconfig-r022-20230615   gcc  
sparc64              randconfig-r032-20230615   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230614   clang
x86_64               randconfig-a001-20230615   gcc  
x86_64               randconfig-a002-20230614   clang
x86_64               randconfig-a002-20230615   gcc  
x86_64               randconfig-a003-20230614   clang
x86_64               randconfig-a003-20230615   gcc  
x86_64               randconfig-a004-20230614   clang
x86_64               randconfig-a004-20230615   gcc  
x86_64               randconfig-a005-20230614   clang
x86_64               randconfig-a005-20230615   gcc  
x86_64               randconfig-a006-20230614   clang
x86_64               randconfig-a006-20230615   gcc  
x86_64               randconfig-a011-20230615   clang
x86_64               randconfig-a012-20230615   clang
x86_64               randconfig-a013-20230615   clang
x86_64               randconfig-a014-20230615   clang
x86_64               randconfig-a015-20230615   clang
x86_64               randconfig-a016-20230615   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230614   gcc  
xtensa               randconfig-r015-20230614   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
