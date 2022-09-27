Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456535ECEFE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 22:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbiI0U4E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 16:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbiI0Uz7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 16:55:59 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA72161CD2
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 13:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664312156; x=1695848156;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a+aZrftixGbqbtVmv70fs9VnhgCFUO1Lmgw0LFHNJpw=;
  b=DRiAcFc7AhNzyZgocNa2zPgejHedJNDLtxMtZxXtI+iZF/hkUWH3ghwC
   l2Xd0OizVA8zXBKkaUqFttRVZGJdclGz3Xxu8lxRM9uOvemFbyU5+sfaU
   Ah+8lCNGKNbrPJPnWtS2HNWxTrSj1R8PPsdmS8WWoa7XeT3Hwp+DKMQKw
   hXJMATy2WnXJoq5+2dUi9H3Sf8nN6O/J69t8ci6HyPYyRzdCir24R8rkY
   rPYktkQ/An+OSK6ZXoIrGmkTBYS9YOvkKfGWO98Ffddtn5E1v0C7JAuLW
   0FBcamGOruD4MAtcUB2eAWa3stdTC3MEpk7+qDO1y8xpVOFthjN0Sr5so
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="365472698"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="365472698"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 13:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="950433587"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="950433587"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2022 13:55:53 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odHcO-0001ZA-1o;
        Tue, 27 Sep 2022 20:55:52 +0000
Date:   Wed, 28 Sep 2022 04:54:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 bce2b0539933e485d22d6f6f076c0fcd6f185c4c
Message-ID: <6333631f.JT9fHNuZngytQ0P+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: bce2b0539933e485d22d6f6f076c0fcd6f185c4c  usb: idmouse: fix an uninit-value in idmouse_open

elapsed time: 720m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
s390                             allyesconfig
mips                             allyesconfig
arc                                 defconfig
powerpc                           allnoconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220926
i386                 randconfig-a001-20220926
m68k                             allyesconfig
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
x86_64                        randconfig-a004
i386                 randconfig-a002-20220926
x86_64                        randconfig-a002
i386                 randconfig-a003-20220926
x86_64                        randconfig-a006
i386                                defconfig
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220926
riscv                randconfig-r042-20220926
hexagon              randconfig-r041-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                 randconfig-a011-20220926
x86_64                        randconfig-a005
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
