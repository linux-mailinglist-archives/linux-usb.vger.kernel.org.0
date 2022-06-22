Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726745541D9
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 06:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356969AbiFVEpi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 00:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356968AbiFVEpg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 00:45:36 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E480F33E17
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 21:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655873133; x=1687409133;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wRZQMn2eiojGPJir/qgBv+wFAZsr6Pj5NKXPVKdTlyk=;
  b=lM8sytAhLmFRZL8KgEq7YQTggICfW5uUGWKIjlMV13q18GTWWa+P0UZm
   EvBxgzPDHrmjScAL+uXqtOTO2EMTDMKbaW1lmeRClJi5PAsniyhPXFRFk
   5s10I7PZwmAFRmV+fheymYskU7+0sXV9X9DZUBN0rN3uM6+guo1g4Gy0z
   RJ7tKTafy0LNbypxe1HIGtpkrrpPA9yuz2/HPrY2IvbmNOVHjZ8aMvQw1
   LjXFXTZVUKdRYXuhFyHVr2Tioplk0GLT17aPParcJv3ohg6UWohCoZgjP
   /uyT3294zDxhaGVFF+AJtCS0ubKqy0WOUubLpV3zD7WE6d3o06woANQxP
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="279080464"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="279080464"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 21:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="677333949"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2022 21:45:32 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3sF9-0000qj-Vn;
        Wed, 22 Jun 2022 04:45:31 +0000
Date:   Wed, 22 Jun 2022 12:44:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 52a83facde141544daf35d16e57d9b158e6aa0cb
Message-ID: <62b29e4b.PC+KFHOzwoMXwRXF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 52a83facde141544daf35d16e57d9b158e6aa0cb  usb: dwc2: host: add TPL support

elapsed time: 724m

configs tested: 71
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
riscv                               defconfig
alpha                               defconfig
arc                                 defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
arm64                               defconfig
ia64                                defconfig
parisc                              defconfig
nios2                               defconfig
parisc64                            defconfig
nios2                            allyesconfig
parisc                           allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                              debian-10.3
i386                                defconfig
i386                   debian-10.3-kselftests
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220622
riscv                             allnoconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
