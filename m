Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC4E6ACF90
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 21:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjCFUwi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 15:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCFUwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 15:52:37 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E777DA3
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 12:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678135956; x=1709671956;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Li/TBzFgBX00H9tLaphAit1VN/akSL+v/oQlY6HKDJI=;
  b=MpCfC6awylQDJJcsIMXq6oYbem4vIGArvMRjfCo3NFim9Mp9p+2NgYYj
   BZHXmzoYQgonhT5lEVOXuA1+2AivXEo0royyYrFkTHGuthmyqxsd97AVK
   TI3h/6xSicfl7z5ftAC/xLUfff1Ns5evVF4EANGkrkC3JaVynXIHRksoS
   SgPQ6zDMAPQqJpccYNJv/lkLyH45c9kEuluZ2LTiyIONGWcCUJi0wpP6x
   GUDFcyHnJq6SIKEEcdVKDp0N9736xtNUERBa1XzyfqmD54gX7Kyr3xYRi
   opbEMOGVX2RmBDTVpODIGhN/DMSekMls5lXG1vtlWig5n9FEKUGQXjTbC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="421946870"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="421946870"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 12:52:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676309736"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="676309736"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Mar 2023 12:52:34 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZHow-0000cm-0S;
        Mon, 06 Mar 2023 20:52:34 +0000
Date:   Tue, 07 Mar 2023 04:51:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 d36e309bc0250fdf2acebdd1a1c2e95bef745223
Message-ID: <64065263.EM3eo8up+T2Fm4OT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: d36e309bc0250fdf2acebdd1a1c2e95bef745223  USB: disable all RNDIS protocol drivers

elapsed time: 810m

configs tested: 132
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230306   gcc  
alpha                randconfig-r033-20230306   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r022-20230305   gcc  
arc                  randconfig-r022-20230306   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230306   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230305   gcc  
arm                  randconfig-r035-20230306   clang
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230306   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r001-20230305   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230305   gcc  
csky                 randconfig-r015-20230306   gcc  
csky                 randconfig-r024-20230305   gcc  
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-a011-20230306   clang
i386                 randconfig-a012-20230306   clang
i386                 randconfig-a013-20230306   clang
i386                 randconfig-a014-20230306   clang
i386                 randconfig-a015-20230306   clang
i386                 randconfig-a016-20230306   clang
i386                 randconfig-r002-20230306   gcc  
i386                 randconfig-r012-20230306   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230306   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230305   gcc  
loongarch            randconfig-r021-20230306   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230306   gcc  
microblaze   buildonly-randconfig-r001-20230306   gcc  
microblaze           randconfig-r033-20230305   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230305   clang
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230305   gcc  
nios2                randconfig-r031-20230306   gcc  
openrisc             randconfig-r011-20230305   gcc  
openrisc             randconfig-r014-20230305   gcc  
openrisc             randconfig-r024-20230306   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r036-20230305   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230305   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230306   gcc  
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230305   clang
s390                 randconfig-r023-20230305   gcc  
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r026-20230306   gcc  
sh                   randconfig-r031-20230305   gcc  
sh                   randconfig-r034-20230306   gcc  
sparc        buildonly-randconfig-r006-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230306   gcc  
sparc                randconfig-r016-20230306   gcc  
sparc                randconfig-r021-20230305   gcc  
sparc                randconfig-r026-20230305   gcc  
sparc                randconfig-r032-20230306   gcc  
sparc                randconfig-r035-20230305   gcc  
sparc64              randconfig-r003-20230305   gcc  
sparc64              randconfig-r004-20230305   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64               randconfig-r006-20230306   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230305   gcc  
xtensa       buildonly-randconfig-r005-20230305   gcc  
xtensa               randconfig-r012-20230305   gcc  
xtensa               randconfig-r014-20230306   gcc  
xtensa               randconfig-r015-20230305   gcc  
xtensa               randconfig-r023-20230306   gcc  
xtensa               randconfig-r032-20230305   gcc  
xtensa               randconfig-r036-20230306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
