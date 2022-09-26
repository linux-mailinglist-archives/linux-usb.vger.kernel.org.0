Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665745EB5F4
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 01:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiIZXrT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 19:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiIZXrS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 19:47:18 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51B990182
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 16:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664236036; x=1695772036;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=co4ZMHvp4AuLeThsEiOm4kQ0Bq9SbFQM9KS6P/w1i2U=;
  b=iZAIh+Xyq9695bnaPWsVQoTjHU1SYi31npGJ1Rhf1aKAVSuNmpgU9zga
   i8vTcgtjcW7eQwRAnlflqZSbZqA3vcqOgLJB57YTdYmlxDAeVFnov3BGf
   aK7Hpi/+6uaFNXa/YaMheeHE/G2SFFOGLwRQ8q4mkmYreZr5pzMr3Q+7G
   XACfDoV6lpHy6jC1KNYPFjRMBGKHqOyiFXXilG6PeZDGRIlhs7bmXj+q7
   HLxKPdom3rF+D/V0NUKcmbl6Ng5RvXlrbeXDJxQAakhp+jVKyKxjipvU4
   nzN57DzYYTVCQKFSYJXSKJcXOxMkl2L6YbGFr5F6Vi1UKrHHeQULZN9nt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="302076490"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="302076490"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 16:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="950064278"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="950064278"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2022 16:47:14 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocxog-0000NE-13;
        Mon, 26 Sep 2022 23:47:14 +0000
Date:   Tue, 27 Sep 2022 07:46:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a8be6b6ee9595d425f304770811f3513a503e61c
Message-ID: <633239c7.Z5XILvQvAGzVVVkm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: a8be6b6ee9595d425f304770811f3513a503e61c  media: flexcop-usb: use usb_endpoint_maxp()

elapsed time: 876m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
mips                             allyesconfig
sh                               allmodconfig
i386                                defconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a006-20220926
arc                  randconfig-r043-20220925
arm                                 defconfig
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
riscv                randconfig-r042-20220925
x86_64                           rhel-8.3-syz
i386                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
ia64                             allmodconfig
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
powerpc                          allmodconfig

clang tested configs:
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a015-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a016-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
