Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585CB71F1FD
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 20:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbjFASau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 14:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbjFASam (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 14:30:42 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4043E48
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685644224; x=1717180224;
  h=date:from:to:cc:subject:message-id;
  bh=3D+01ZRHq4saWUvD7zawvGL26GZB7tb9r5Bu6lIYmjk=;
  b=mEg9BJYyW0HvFV1Qo3/EMPbfDj1qrftLsJROmDT16LD7w4tb9Zn7lM7B
   VY+uEupzL+nd7shKFjwnZkW1f4HeSEMeCxBkZRTaM1C5Z5wid097E9f4o
   k4h+T4SckuiL2zU4cb3EyRyY7fIP9FuvzHi+X0GFffzvrb+IDjmiukeQr
   WgFXM6b4oKIji521E7NAoqSSyW7SCF/wII3GLBihFqTDFKRFK5/5DhOmv
   te9YXmWguqvPWSaTkO9PP8gLJnKsAiZbNCsMbmOvIaU9TSBC7O38tK2jg
   3aqy4wZ0lmtmrk7GujD11Exgma0cN4wx3DUTW/26bZzUk+mU4PioaWLZB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="336005557"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="336005557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 11:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740455643"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="740455643"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2023 11:29:37 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q4n3I-0002ay-15;
        Thu, 01 Jun 2023 18:29:36 +0000
Date:   Fri, 02 Jun 2023 02:28:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 243ff7e6a03533fd5f34036b4a2c297d844ffdc0
Message-ID: <20230601182837.9ptcq%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 243ff7e6a03533fd5f34036b4a2c297d844ffdc0  usb: typec: mux: fix static inline syntax error

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305300608.8CuLyqAL-lkp@intel.com

Warning: (recently discovered and may have been fixed)

Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- arc-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- arm-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- arm-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- arm64-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- m68k-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- mips-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- mips-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- powerpc-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- s390-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- sparc-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
`-- x86_64-allnoconfig
    `-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-usb-starfive-jh7110-usb.yaml

elapsed time: 722m

configs tested: 127
configs skipped: 11

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230601   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230531   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230601   gcc  
arc                  randconfig-r043-20230531   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230531   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230531   gcc  
arm64                randconfig-r023-20230531   clang
csky         buildonly-randconfig-r001-20230531   gcc  
csky         buildonly-randconfig-r005-20230531   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230531   gcc  
csky                 randconfig-r036-20230531   gcc  
hexagon              randconfig-r031-20230531   clang
hexagon              randconfig-r035-20230531   clang
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
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230531   gcc  
loongarch            randconfig-r025-20230531   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230531   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r011-20230531   gcc  
microblaze           randconfig-r024-20230531   gcc  
microblaze           randconfig-r035-20230531   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230531   clang
mips                 randconfig-r013-20230531   gcc  
mips                 randconfig-r031-20230531   clang
nios2        buildonly-randconfig-r006-20230531   gcc  
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r004-20230531   gcc  
openrisc             randconfig-r033-20230531   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230531   gcc  
parisc               randconfig-r015-20230531   gcc  
parisc               randconfig-r024-20230531   gcc  
parisc               randconfig-r032-20230531   gcc  
parisc               randconfig-r034-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230531   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230531   clang
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230531   gcc  
riscv                randconfig-r021-20230531   clang
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230531   gcc  
s390                 randconfig-r033-20230531   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230531   gcc  
sh                   randconfig-r022-20230531   gcc  
sparc        buildonly-randconfig-r003-20230531   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230531   gcc  
sparc64              randconfig-r001-20230601   gcc  
sparc64              randconfig-r014-20230531   gcc  
sparc64              randconfig-r023-20230531   gcc  
sparc64              randconfig-r032-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230531   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-a013-20230531   clang
x86_64               randconfig-a016-20230531   clang
x86_64               randconfig-r026-20230531   clang
x86_64               randconfig-r036-20230531   gcc  
x86_64               randconfig-x061-20230601   gcc  
x86_64               randconfig-x062-20230601   gcc  
x86_64               randconfig-x063-20230601   gcc  
x86_64               randconfig-x064-20230601   gcc  
x86_64               randconfig-x065-20230601   gcc  
x86_64               randconfig-x066-20230601   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230531   gcc  
xtensa               randconfig-r004-20230531   gcc  
xtensa               randconfig-r026-20230531   gcc  
xtensa               randconfig-r034-20230531   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
