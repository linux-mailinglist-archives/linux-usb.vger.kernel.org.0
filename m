Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663796C77F1
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 07:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjCXGcm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 02:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCXGcl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 02:32:41 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C53719F1A
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 23:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679639560; x=1711175560;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lqqRd4ACYRdDx+xe5dcmtxGHg7q9oqjyX1mBRQZTq3E=;
  b=bXNp216DtknvpZ52u5xtDDXy1QgO8mLWI7QnwQUHMbOL/4w4B9UTck9x
   OiGJMW66GIKEwIJUGMHB2HTrTiHU03dWvEB0CzONbUDxWHM2sQaWSCLCZ
   NejzC5CsgzhPPCZpT+IkBnsJBwzjhKlagN1FkaLeX7MGTUDX8FQan92eM
   dJl23f2Bi8sePUXFsVsiRbBMRWFGNdWowI+8WfC3JGR+4uYrw/h5q/m/t
   PMBQhFP+MKSBgO5j7I/MNsR6FwZ0l0e8LFfDyFD6jsbExkqZz2vClBPwA
   BuXFuLTfNOgwHClVdZv+lgLWILmyzJAToE8PD+JMMrJ0OR3pqpl/U78AR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404625406"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="404625406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 23:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826131519"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="826131519"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 23:32:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfay2-000F2y-11;
        Fri, 24 Mar 2023 06:32:02 +0000
Date:   Fri, 24 Mar 2023 14:31:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 2b947f8769be8b8181dc795fd292d3e7120f5204
Message-ID: <641d43ce.fR40xKB79zreBpYt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 2b947f8769be8b8181dc795fd292d3e7120f5204  usb: gadget: udc: renesas_usb3: Fix use after free bug in renesas_usb3_remove due to race condition

elapsed time: 723m

configs tested: 136
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230322   gcc  
alpha                randconfig-r026-20230322   gcc  
alpha                randconfig-r035-20230322   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230323   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230322   clang
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                  randconfig-r014-20230322   clang
arm                  randconfig-r023-20230322   clang
arm                  randconfig-r025-20230322   clang
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230322   gcc  
arm64                randconfig-r013-20230322   gcc  
arm64                randconfig-r022-20230322   gcc  
arm64                randconfig-r025-20230323   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230322   gcc  
hexagon      buildonly-randconfig-r004-20230322   clang
hexagon              randconfig-r002-20230322   clang
hexagon              randconfig-r004-20230322   clang
hexagon              randconfig-r036-20230322   clang
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230322   gcc  
ia64                 randconfig-r012-20230322   gcc  
ia64                 randconfig-r033-20230322   gcc  
ia64                 randconfig-r034-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230322   gcc  
loongarch            randconfig-r032-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r023-20230322   gcc  
m68k                          sun3x_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230322   clang
mips                 randconfig-r034-20230322   gcc  
nios2        buildonly-randconfig-r004-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230322   gcc  
nios2                randconfig-r024-20230323   gcc  
nios2                randconfig-r026-20230322   gcc  
nios2                randconfig-r035-20230322   gcc  
openrisc     buildonly-randconfig-r002-20230322   gcc  
openrisc             randconfig-r026-20230323   gcc  
openrisc             randconfig-r032-20230322   gcc  
openrisc             randconfig-r036-20230322   gcc  
parisc                           alldefconfig   gcc  
parisc       buildonly-randconfig-r005-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230322   gcc  
parisc               randconfig-r006-20230322   gcc  
parisc               randconfig-r015-20230322   gcc  
parisc               randconfig-r021-20230323   gcc  
parisc               randconfig-r031-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc836x_mds_defconfig   clang
powerpc                     powernv_defconfig   clang
powerpc              randconfig-r025-20230322   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r024-20230322   gcc  
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230322   clang
s390                 randconfig-r003-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230323   gcc  
sh                   randconfig-r024-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230322   gcc  
sparc                randconfig-r031-20230322   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230322   gcc  
xtensa       buildonly-randconfig-r006-20230322   gcc  
xtensa               randconfig-r001-20230322   gcc  
xtensa               randconfig-r002-20230322   gcc  
xtensa               randconfig-r033-20230322   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
