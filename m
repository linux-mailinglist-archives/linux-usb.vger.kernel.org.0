Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC936862A1
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 10:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbjBAJPR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 04:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjBAJPM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 04:15:12 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6014B5D907
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 01:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675242909; x=1706778909;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uAZm8c8NljmrDDrB7IB9j0ANTsAuxSK0iox08nHoExk=;
  b=f7b+VSIcCbi96jGhp5lAcRmpmcMwvz+yrugAUHDT3qki7yk29JWD/KKt
   I5pbpgykSthcAAQim1uy71PA62iINTJG1Q2VPMgkW3aCsjTaVUJGtQXJ1
   erA5Dt6HN4pvihvbUeuu/cVApDtPddRmDgHpIkSluWU71dlkHxZAYntY4
   3Wx4xcJWkTm/kXTwKlJrViNsOrODDuiilGAyX8eyuQfNQdOlOp3Yjv8bh
   AaO9lGRlaFjCT/pF3+M676u5IKRynR2K3B+cT4x5KnW1COnt3eLdj2TGu
   +dbDURkfxFlO4RBjjE/Q32pYUPlBHqTbtO/dCZlGnGi+oiSG63xCZoCWn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355424766"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="355424766"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 01:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="807494171"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="807494171"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2023 01:14:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pN9C6-0005Is-1z;
        Wed, 01 Feb 2023 09:14:18 +0000
Date:   Wed, 01 Feb 2023 17:13:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 45bf39f8df7f05efb83b302c65ae3b9bc92b7065
Message-ID: <63da2d40.ZpKTyZdPMeD/exRy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 45bf39f8df7f05efb83b302c65ae3b9bc92b7065  USB: core: Don't hold device lock while reading the "descriptors" sysfs file

elapsed time: 723m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
s390                                defconfig
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
um                             i386_defconfig
x86_64               randconfig-a006-20230130
x86_64               randconfig-a005-20230130
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
s390                             allyesconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
i386                 randconfig-a002-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
i386                 randconfig-a005-20230130
powerpc                          allmodconfig
i386                 randconfig-a006-20230130
sh                               allmodconfig
mips                             allyesconfig
arc                  randconfig-r043-20230129
arm                  randconfig-r046-20230129
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
i386                                defconfig
i386                             allyesconfig
arm                                 defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230129
hexagon              randconfig-r045-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
s390                 randconfig-r044-20230129
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a011-20230130
s390                 randconfig-r044-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
x86_64               randconfig-a014-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a015-20230130
x86_64                        randconfig-k001
arm                       spear13xx_defconfig
powerpc                     kilauea_defconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
