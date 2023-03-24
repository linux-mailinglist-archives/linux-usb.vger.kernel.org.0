Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 875A26C77F0
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 07:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjCXGcl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 02:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbjCXGck (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 02:32:40 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6366D1A482
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 23:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679639557; x=1711175557;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fbgUE8HyZvia5t4vENjIcuyRahNKgZ7FSVj1RMMvHC4=;
  b=DpOaHLJd0H6I7z0yBdmY/IkMI/Zxw3ZiSRv1B1Vh7ku9gfE/StrzH6h+
   Ydw9APXebfRD1vA2hznhE5GNtqAHLa0F+wuCvPHqmc5PDLwW9ThWzEOi0
   +CWyt1Qr5Vjd48vXWYc54VzkEwdB4h/SlKozRcTsp++LhPdkmle5ST31+
   SRGQHhNxG4yyyxsl28K8YOO/8ktWaEjLMHFsMeKDZ52MU6YLNZvWv0TOS
   Ks8HmtRHmnV8Scx9oaWqXsDcILDub2aV+qEYeZxSUD4x9q/T1z6qBaFdY
   hEYzs6cJWtFYb64wX6gsew5vhSfXlXWx1x2s/rAvikJkW4ffxd4RA+6Zo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404625404"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="404625404"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 23:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826131520"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="826131520"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 23:32:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfay2-000F34-1H;
        Fri, 24 Mar 2023 06:32:02 +0000
Date:   Fri, 24 Mar 2023 14:31:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 5021383242ada277a38bd052a4c12ed4707faccb
Message-ID: <641d43d8.ZGoX2/kOzc+DFYq4%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 5021383242ada277a38bd052a4c12ed4707faccb  usb: dwc2: fix a race, don't power off/on phy for dual-role mode

elapsed time: 724m

configs tested: 132
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230322   gcc  
arc                  randconfig-r031-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230322   clang
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                  randconfig-r002-20230323   clang
arm                  randconfig-r023-20230322   clang
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230322   clang
arm64                randconfig-r006-20230322   clang
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r004-20230322   clang
hexagon              randconfig-r004-20230322   clang
hexagon              randconfig-r014-20230322   clang
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
ia64                 randconfig-r003-20230323   gcc  
ia64                 randconfig-r005-20230322   gcc  
ia64                 randconfig-r011-20230322   gcc  
ia64                 randconfig-r013-20230322   gcc  
ia64                 randconfig-r016-20230322   gcc  
ia64                 randconfig-r025-20230322   gcc  
ia64                 randconfig-r033-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230322   gcc  
loongarch            randconfig-r026-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230322   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230322   gcc  
microblaze   buildonly-randconfig-r004-20230322   gcc  
microblaze   buildonly-randconfig-r006-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230322   clang
mips                 randconfig-r034-20230322   gcc  
nios2        buildonly-randconfig-r004-20230322   gcc  
nios2        buildonly-randconfig-r005-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230322   gcc  
nios2                randconfig-r035-20230322   gcc  
openrisc     buildonly-randconfig-r002-20230322   gcc  
openrisc             randconfig-r004-20230323   gcc  
openrisc             randconfig-r006-20230323   gcc  
openrisc             randconfig-r032-20230322   gcc  
openrisc             randconfig-r036-20230322   gcc  
parisc       buildonly-randconfig-r005-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230322   gcc  
parisc               randconfig-r031-20230322   gcc  
parisc               randconfig-r036-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230322   gcc  
powerpc                 mpc836x_mds_defconfig   clang
powerpc                     powernv_defconfig   clang
powerpc              randconfig-r005-20230323   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230322   clang
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230322   clang
s390                 randconfig-r003-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r034-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230322   gcc  
sparc                randconfig-r015-20230322   gcc  
sparc64      buildonly-randconfig-r002-20230322   gcc  
sparc64              randconfig-r022-20230322   gcc  
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
xtensa               randconfig-r024-20230322   gcc  
xtensa               randconfig-r035-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
