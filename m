Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009375E71CF
	for <lists+linux-usb@lfdr.de>; Fri, 23 Sep 2022 04:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiIWCQc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 22:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiIWCQ3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 22:16:29 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B137ECCCD
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 19:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663899388; x=1695435388;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0wgbWvoIGkYkAVkuCDOQYIx9hEf5KZ/VbI/IngUShNU=;
  b=nntJQlXg2WTrc9BU2TpE2YHKInvOnJUPKUlWwdfQW9m2dwVAgNNEHEFl
   zDOvnDl9/LpEx6T0Sw4VRrt55L9EMDJ9MR0CTbOAa49lfatAL1UmMNUEC
   dJgng6+rzjZNc4VHn6JbhuU6JjsY1mzrOTVHBrApiIkOvaq5ABOtDaoXn
   cLOQcxITrH9lSiAiPJSbU8gBG7Ug+INztWYkicLaGRFsDw9bbrXUQasrl
   yiasBkU0BTGVC7S+SLPAwfudPUfaGRF+X3zu/tHnCK81rsbPGdTeHp0Q1
   /12Kjx1yHfjH2ZVpIvZ1Um53yKW34hJXElKZsOqXjIFwA/tFMhORGxZqR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386778084"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="386778084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 19:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="571213917"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Sep 2022 19:16:23 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obYEp-0005CU-0U;
        Fri, 23 Sep 2022 02:16:23 +0000
Date:   Fri, 23 Sep 2022 10:16:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 715a654bc65c648bdc209a20513b2053d46aa5b5
Message-ID: <632d16ef.sSsuQkacdl+FyBz2%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 715a654bc65c648bdc209a20513b2053d46aa5b5  Merge tag 'usb-serial-6.1-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 722m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220922
m68k                             allmodconfig
um                             i386_defconfig
arc                              allyesconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                            allyesconfig
alpha                               defconfig
i386                                defconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
s390                             allyesconfig
powerpc                          allmodconfig
arm                                 defconfig
mips                             allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
sh                               allmodconfig
x86_64                           allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
i386                          randconfig-a001
arm                              allyesconfig
i386                          randconfig-a003
x86_64                        randconfig-a002
arm64                            allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
powerpc                      tqm8xx_defconfig
csky                             alldefconfig
sh                           se7705_defconfig
xtensa                    smp_lx200_defconfig

clang tested configs:
hexagon              randconfig-r041-20220922
riscv                randconfig-r042-20220922
hexagon              randconfig-r045-20220922
s390                 randconfig-r044-20220922
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
mips                     loongson1c_defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
