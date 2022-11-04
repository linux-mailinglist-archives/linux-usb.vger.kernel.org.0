Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F413C618E77
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 03:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiKDCvm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 22:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiKDCvk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 22:51:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455BC24BEA
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 19:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667530300; x=1699066300;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BaMCZIGYPB86REtfnPkmJliSWkZ/xLtm5SIXk/Bg6Xw=;
  b=XJIYyHPzk4zIQm+UYhSkMXFXjomkQ8P9EqyRH7h2gFTa3woUisI4fisD
   sxuOHOm34j/0AmPp3pCLkUHSELKn4RU8cyFd5Sx0N+128jU8eDX/Gy92S
   V3e/XOr0Yvani2bMwcYqL6kUw7cGqEWJvIzqB5AjO3JkXJHiTB3y4fLQf
   fHXTJo2xFMxeQDGnz1Cfs5BPAWXCS2vTzkjhJXFGwVWDekWKPukUxrbfE
   u5UeW3EI7uGitHpj6XugYJbFsoIvO5g+DSWuTM20Yk9hqyLvkVAYmJy9l
   IR1fjQPzPpH2SSr3dPuCA9z7g5TxQkkLbbwqch1D/gcIiLbl3Fsew1kec
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="309856074"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="309856074"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 19:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="586035815"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="586035815"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Nov 2022 19:51:38 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oqmnx-000GYN-39;
        Fri, 04 Nov 2022 02:51:37 +0000
Date:   Fri, 04 Nov 2022 10:50:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a8bc8cc193c69e41df5e757d1a592346526e136d
Message-ID: <63647e0d.EHaEKm6rduHhdarl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: a8bc8cc193c69e41df5e757d1a592346526e136d  usb: gadget: Use kstrtobool() instead of strtobool()

elapsed time: 724m

configs tested: 78
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                               defconfig
x86_64                           rhel-8.3-syz
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
ia64                             allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                              defconfig
i386                          randconfig-a001
x86_64                           allyesconfig
i386                          randconfig-a003
x86_64                               rhel-8.3
i386                          randconfig-a005
s390                             allyesconfig
sh                               allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20221102
i386                                defconfig
riscv                randconfig-r042-20221102
s390                 randconfig-r044-20221102
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20221103
i386                          randconfig-c001
arm                       imx_v6_v7_defconfig
arm                        multi_v7_defconfig
sh                          r7785rp_defconfig
sh                        sh7763rdp_defconfig
arm                            lart_defconfig
nios2                               defconfig
powerpc                     asp8347_defconfig
mips                      fuloong2e_defconfig
mips                            gpr_defconfig
arm                           u8500_defconfig
nios2                         10m50_defconfig
powerpc                   currituck_defconfig
mips                         cobalt_defconfig
parisc                           allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20221102
hexagon              randconfig-r045-20221102
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
arm                   milbeaut_m10v_defconfig
riscv                          rv32_defconfig
arm                         bcm2835_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
