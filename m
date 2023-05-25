Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13620710376
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 05:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236153AbjEYDvI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 23:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237435AbjEYDus (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 23:50:48 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6F2187
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 20:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684986633; x=1716522633;
  h=date:from:to:cc:subject:message-id;
  bh=PsjZ4kWlo/LSA1S/Z8Liq2eRWh+99IjtqYabE8maMBA=;
  b=GG8Y1e23AU1MYYlAuIr3mjGdni9CdyQLxjWYkQmZRJAoUt1ZYP6zqQhB
   4Fvq6Fn8Rm6AclqBPST1B5CUGSOPNz8U/K6s2n8+qqPXf/vMf9IrHAu/I
   BGsROcJUq+0Ie3fUi4ohjlfoxwiY+QjhWFzKr7yFhLGN/PU4SWWCYHC+3
   pVoMwPVtbHu7ScS1qQCfFPDI0ppNVq7zYc9tgd962Bc8ZP7ZJ6dtx5ZR9
   QVXlqZ42v6wa78r/wjlpD3e6m/YN1Xkt/5vZY+8XgvTJ/ZeW3CreYmiEy
   4NwZdli6TJrsHMyNiWHgQvW6NbOaBYQql+5FnRzSdo9w01DZ6Lb4W/ztA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="382018205"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="382018205"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 20:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="707821331"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="707821331"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 May 2023 20:50:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q21zj-000FQT-1i;
        Thu, 25 May 2023 03:50:31 +0000
Date:   Thu, 25 May 2023 11:50:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 f1138fda1b0db43ff63d19923f8e84951c0c4d1c
Message-ID: <20230525035002.A4LFR%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: f1138fda1b0db43ff63d19923f8e84951c0c4d1c  thunderbolt: Drop retimer vendor check

elapsed time: 1231m

configs tested: 231
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230524   gcc  
alpha                randconfig-r032-20230524   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230524   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230524   gcc  
arm                  randconfig-r015-20230524   gcc  
arm                  randconfig-r046-20230524   gcc  
arm                         s3c6400_defconfig   gcc  
arm                         s5pv210_defconfig   clang
arm                        spear6xx_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230524   gcc  
arm64                randconfig-r032-20230524   gcc  
csky                             alldefconfig   gcc  
csky         buildonly-randconfig-r002-20230524   gcc  
csky         buildonly-randconfig-r006-20230524   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230524   gcc  
csky                 randconfig-r022-20230524   gcc  
csky                 randconfig-r026-20230524   gcc  
csky                 randconfig-r034-20230524   gcc  
hexagon              randconfig-r041-20230524   clang
hexagon              randconfig-r045-20230524   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230524   gcc  
i386                 randconfig-i002-20230524   gcc  
i386                 randconfig-i003-20230524   gcc  
i386                 randconfig-i004-20230524   gcc  
i386                 randconfig-i005-20230524   gcc  
i386                 randconfig-i006-20230524   gcc  
i386                 randconfig-i011-20230524   clang
i386                 randconfig-i012-20230524   clang
i386                 randconfig-i013-20230524   clang
i386                 randconfig-i014-20230524   clang
i386                 randconfig-i015-20230524   clang
i386                 randconfig-i016-20230524   clang
i386                 randconfig-i051-20230524   gcc  
i386                 randconfig-i052-20230524   gcc  
i386                 randconfig-i053-20230524   gcc  
i386                 randconfig-i054-20230524   gcc  
i386                 randconfig-i055-20230524   gcc  
i386                 randconfig-i056-20230524   gcc  
i386                 randconfig-i061-20230524   gcc  
i386                 randconfig-i062-20230524   gcc  
i386                 randconfig-i063-20230524   gcc  
i386                 randconfig-i064-20230524   gcc  
i386                 randconfig-i065-20230524   gcc  
i386                 randconfig-i066-20230524   gcc  
i386                 randconfig-i071-20230524   clang
i386                 randconfig-i072-20230524   clang
i386                 randconfig-i073-20230524   clang
i386                 randconfig-i074-20230524   clang
i386                 randconfig-i075-20230524   clang
i386                 randconfig-i076-20230524   clang
i386                 randconfig-i081-20230524   clang
i386                 randconfig-i082-20230524   clang
i386                 randconfig-i083-20230524   clang
i386                 randconfig-i084-20230524   clang
i386                 randconfig-i085-20230524   clang
i386                 randconfig-i086-20230524   clang
i386                 randconfig-i091-20230524   gcc  
i386                 randconfig-i092-20230524   gcc  
i386                 randconfig-i093-20230524   gcc  
i386                 randconfig-i094-20230524   gcc  
i386                 randconfig-i095-20230524   gcc  
i386                 randconfig-i096-20230524   gcc  
i386                 randconfig-r003-20230524   gcc  
i386                 randconfig-r033-20230524   gcc  
i386                 randconfig-r036-20230524   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230524   gcc  
ia64         buildonly-randconfig-r006-20230524   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230524   gcc  
ia64                 randconfig-r021-20230524   gcc  
ia64                 randconfig-r023-20230524   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r014-20230524   gcc  
loongarch            randconfig-r024-20230524   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r026-20230524   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230524   clang
mips                     loongson1b_defconfig   gcc  
mips                      malta_kvm_defconfig   clang
mips                      pic32mzda_defconfig   clang
mips                 randconfig-r016-20230524   gcc  
mips                          rb532_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230524   gcc  
nios2                randconfig-r006-20230524   gcc  
nios2                randconfig-r024-20230524   gcc  
openrisc             randconfig-r002-20230524   gcc  
openrisc             randconfig-r006-20230524   gcc  
openrisc             randconfig-r022-20230524   gcc  
parisc       buildonly-randconfig-r004-20230524   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230524   gcc  
parisc               randconfig-r005-20230524   gcc  
parisc               randconfig-r024-20230524   gcc  
parisc               randconfig-r031-20230524   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230524   clang
powerpc                     kmeter1_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc8540_ads_defconfig   gcc  
powerpc                    socrates_defconfig   clang
powerpc                      tqm8xx_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230524   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230524   clang
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r033-20230524   gcc  
s390                 randconfig-r044-20230524   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230524   gcc  
sh                   randconfig-r013-20230524   gcc  
sh                   randconfig-r015-20230524   gcc  
sh                   randconfig-r016-20230524   gcc  
sh                   randconfig-r035-20230524   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc        buildonly-randconfig-r005-20230524   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230524   gcc  
sparc                randconfig-r005-20230524   gcc  
sparc                randconfig-r012-20230524   gcc  
sparc                randconfig-r033-20230524   gcc  
sparc                randconfig-r035-20230524   gcc  
sparc64              randconfig-r005-20230524   gcc  
sparc64              randconfig-r012-20230524   gcc  
sparc64              randconfig-r036-20230524   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r004-20230524   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230524   gcc  
x86_64               randconfig-a002-20230524   gcc  
x86_64               randconfig-a003-20230524   gcc  
x86_64               randconfig-a004-20230524   gcc  
x86_64               randconfig-a005-20230524   gcc  
x86_64               randconfig-a006-20230524   gcc  
x86_64               randconfig-a011-20230524   clang
x86_64               randconfig-a012-20230524   clang
x86_64               randconfig-a013-20230524   clang
x86_64               randconfig-a014-20230524   clang
x86_64               randconfig-a015-20230524   clang
x86_64               randconfig-a016-20230524   clang
x86_64               randconfig-k001-20230524   clang
x86_64               randconfig-r021-20230524   clang
x86_64               randconfig-r034-20230524   gcc  
x86_64               randconfig-x051-20230524   clang
x86_64               randconfig-x051-20230525   gcc  
x86_64               randconfig-x052-20230524   clang
x86_64               randconfig-x052-20230525   gcc  
x86_64               randconfig-x053-20230524   clang
x86_64               randconfig-x053-20230525   gcc  
x86_64               randconfig-x054-20230524   clang
x86_64               randconfig-x054-20230525   gcc  
x86_64               randconfig-x055-20230524   clang
x86_64               randconfig-x055-20230525   gcc  
x86_64               randconfig-x056-20230524   clang
x86_64               randconfig-x056-20230525   gcc  
x86_64               randconfig-x061-20230524   clang
x86_64               randconfig-x062-20230524   clang
x86_64               randconfig-x063-20230524   clang
x86_64               randconfig-x064-20230524   clang
x86_64               randconfig-x065-20230524   clang
x86_64               randconfig-x066-20230524   clang
x86_64               randconfig-x071-20230524   gcc  
x86_64               randconfig-x072-20230524   gcc  
x86_64               randconfig-x073-20230524   gcc  
x86_64               randconfig-x074-20230524   gcc  
x86_64               randconfig-x075-20230524   gcc  
x86_64               randconfig-x076-20230524   gcc  
x86_64               randconfig-x081-20230524   gcc  
x86_64               randconfig-x082-20230524   gcc  
x86_64               randconfig-x083-20230524   gcc  
x86_64               randconfig-x084-20230524   gcc  
x86_64               randconfig-x085-20230524   gcc  
x86_64               randconfig-x086-20230524   gcc  
x86_64               randconfig-x091-20230524   clang
x86_64               randconfig-x092-20230524   clang
x86_64               randconfig-x093-20230524   clang
x86_64               randconfig-x094-20230524   clang
x86_64               randconfig-x095-20230524   clang
x86_64               randconfig-x096-20230524   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230524   gcc  
xtensa               randconfig-r003-20230524   gcc  
xtensa               randconfig-r013-20230524   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
