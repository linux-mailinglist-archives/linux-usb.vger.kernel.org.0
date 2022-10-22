Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB5660905A
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 01:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiJVXFF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Oct 2022 19:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiJVXFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Oct 2022 19:05:03 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B9F2A714
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666479898; x=1698015898;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9rX3aYuvp/rbqn8eBHLNt19naCfeav3urvA13rgt+9c=;
  b=n8Jajh6/0MMSsymr5hygXCrP8oEg3b/ijKPDgFa5VxsET0I1ZO1nk61C
   VE/nIfTzkBoM1NuJsE3N4vMvCRACVYAmw+xVocrpwekAKBpXno1PiotRh
   9TyUH2MXStpyXmSBrRi/28rKOmke5zXSMDMm3NAB0Eb4FpGPHGrzILh8i
   KVdwTfMajPIe9WsV47IdcF/svADByJ1oV+TkROcTpGr9ft5KRR9ElR5Dm
   6oJ3tiT+4OCK7oBJliA5h2OWDUNwFp96AhUCgkVTQ2LJw196JFHdbG0uu
   dhNrflmjm9lplWRwXB/f56ejJnMUkPXRc9K+Vs1x2hZ8tcIxzc4UCcNeD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="304829344"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="304829344"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2022 16:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="876063402"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="876063402"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Oct 2022 16:04:56 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1omNXz-0003xq-2G;
        Sat, 22 Oct 2022 23:04:55 +0000
Date:   Sun, 23 Oct 2022 07:04:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 fb8f60dd1b67520e0e0d7978ef17d015690acfc1
Message-ID: <635476f4.EY9g6gEX6Ros37Ae%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: fb8f60dd1b67520e0e0d7978ef17d015690acfc1  usb: bdc: change state when port disconnected

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20221020
i386                                defconfig
s390                 randconfig-r044-20221020
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
riscv                randconfig-r042-20221020
x86_64                          rhel-8.3-func
i386                          randconfig-a001
s390                             allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a003
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a005
arm                                 defconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
sh                               allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a013
arm64                            allyesconfig
x86_64                        randconfig-a011
arm                              allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221020
hexagon              randconfig-r045-20221020
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
