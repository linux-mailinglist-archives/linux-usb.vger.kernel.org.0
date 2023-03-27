Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3618C6CAFFE
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 22:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjC0U3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 16:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjC0U33 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 16:29:29 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A069A2685
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679948968; x=1711484968;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=S1X5cEAnBfNA3ni59EWsiXZZwx20dpX6Xxd0TA1YkuE=;
  b=KcaJY9PYXsuXYwXcKOUu8EdF4RKTHMmH/62wPKPO9h9+IvS4OfQ/jVZ/
   T0gVFxJbVhgm5hA6Zs29wjhNTRxde91bvpyR9Q8ZkhcnOoJwBwakCxoq6
   3B/+akw4O5eWQdB1tCqgfqsOTVojntHisu+g5r+y1shLIRdntW6Mqd+gK
   2N6vUfD/5Z8YRcgdRJHpc26c4puApJqYuu29v0uApPEX2PcXvIYAnns3i
   jqesmwnH1fZxJaj5Q2GstvbzNZ8v0V1EXie8A04Lqb/XF41vH+vesf4rR
   QpuapuQTLBdSHN/F5kuJ8cHQvOp4Xqod3GruhjbBDkn1hutQQenW+CxlS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="337885247"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="337885247"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="686098007"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="686098007"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 13:29:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pgtT4-000HzN-1s;
        Mon, 27 Mar 2023 20:29:26 +0000
Date:   Tue, 28 Mar 2023 04:28:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 a1f15a819288625cd97437e58aaf0cb6280fde63
Message-ID: <6421fc82.UwwLdQoPhaiRf8Gz%lkp@intel.com>
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
branch HEAD: a1f15a819288625cd97437e58aaf0cb6280fde63  USB: disable all RNDIS protocol drivers

elapsed time: 769m

configs tested: 141
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r033-20230326   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230327   gcc  
arc                  randconfig-r043-20230326   gcc  
arc                  randconfig-r043-20230327   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230327   gcc  
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                  randconfig-r046-20230326   clang
arm                  randconfig-r046-20230327   gcc  
arm                        spear6xx_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230326   clang
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230326   gcc  
arm64                randconfig-r026-20230326   gcc  
arm64                randconfig-r036-20230327   gcc  
csky         buildonly-randconfig-r003-20230327   gcc  
csky         buildonly-randconfig-r005-20230327   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230326   gcc  
hexagon              randconfig-r011-20230326   clang
hexagon              randconfig-r041-20230326   clang
hexagon              randconfig-r041-20230327   clang
hexagon              randconfig-r045-20230326   clang
hexagon              randconfig-r045-20230327   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230327   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230327   gcc  
i386                 randconfig-a002-20230327   gcc  
i386                 randconfig-a003-20230327   gcc  
i386                 randconfig-a004-20230327   gcc  
i386                 randconfig-a005-20230327   gcc  
i386                 randconfig-a006-20230327   gcc  
i386                 randconfig-a011-20230327   clang
i386                 randconfig-a012-20230327   clang
i386                 randconfig-a013-20230327   clang
i386                 randconfig-a014-20230327   clang
i386                 randconfig-a015-20230327   clang
i386                 randconfig-a016-20230327   clang
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r035-20230326   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230326   gcc  
loongarch    buildonly-randconfig-r005-20230327   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230326   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230326   gcc  
m68k         buildonly-randconfig-r003-20230327   gcc  
m68k         buildonly-randconfig-r004-20230326   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                 randconfig-r012-20230327   gcc  
m68k                 randconfig-r013-20230327   gcc  
m68k                 randconfig-r014-20230326   gcc  
m68k                 randconfig-r021-20230326   gcc  
m68k                 randconfig-r034-20230326   gcc  
microblaze   buildonly-randconfig-r004-20230327   gcc  
microblaze   buildonly-randconfig-r005-20230326   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r036-20230326   gcc  
mips                        vocore2_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230327   gcc  
nios2                randconfig-r016-20230327   gcc  
nios2                randconfig-r031-20230326   gcc  
nios2                randconfig-r035-20230327   gcc  
openrisc     buildonly-randconfig-r001-20230326   gcc  
openrisc     buildonly-randconfig-r004-20230327   gcc  
openrisc             randconfig-r011-20230326   gcc  
openrisc             randconfig-r014-20230327   gcc  
openrisc             randconfig-r015-20230326   gcc  
openrisc             randconfig-r016-20230326   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230327   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc              randconfig-r032-20230327   gcc  
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230326   gcc  
riscv        buildonly-randconfig-r002-20230326   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230326   clang
riscv                randconfig-r042-20230326   gcc  
riscv                randconfig-r042-20230327   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230326   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230326   gcc  
s390                 randconfig-r044-20230327   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r015-20230327   gcc  
sh                   randconfig-r022-20230326   gcc  
sparc        buildonly-randconfig-r006-20230326   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230327   gcc  
sparc                randconfig-r015-20230326   gcc  
sparc64                          alldefconfig   gcc  
sparc64              randconfig-r012-20230326   gcc  
sparc64              randconfig-r014-20230327   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230327   gcc  
x86_64       buildonly-randconfig-r002-20230327   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230327   gcc  
x86_64               randconfig-a002-20230327   gcc  
x86_64               randconfig-a003-20230327   gcc  
x86_64               randconfig-a004-20230327   gcc  
x86_64               randconfig-a005-20230327   gcc  
x86_64               randconfig-a006-20230327   gcc  
x86_64                        randconfig-k001   clang
x86_64               randconfig-r023-20230327   clang
x86_64               randconfig-r025-20230327   clang
x86_64               randconfig-r031-20230327   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230326   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
