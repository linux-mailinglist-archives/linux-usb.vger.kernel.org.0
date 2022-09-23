Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C882E5E70B2
	for <lists+linux-usb@lfdr.de>; Fri, 23 Sep 2022 02:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiIWAfw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 20:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiIWAfv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 20:35:51 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2525100AAF
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 17:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663893350; x=1695429350;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m7dhrkSd9gP9vy1tRqPuALgl1n/9eH82iWrVw5Pd4po=;
  b=j6RnKb+MdCUEpka/UilaZoPxtKNPeGoDyaahd+aZNddDETVjY3+0r0el
   WlqnIuWhmBD86jV0n9+Qmjo9DaJx30R500fHyiRqPH/Evh1PmAILNd1Pk
   JsIT48MZIAl7u/H6B3N8DlBzrg9A2Y9gj22TRMDikMseUFUYPqUxkSjN6
   Qgx2Vrbf8E8VlPi4j0sW/ssbkY33iTtaEOF2Op1QT8Dk3XVnCC2Oxr8F7
   t3Pb1vzNCPswGelrOfRmFAHLb1whSIAfYnsxSCx5HNxj/rlDSfmRpTqT8
   7ODh1mUi6EFdqADSRrXZ0KvCDw0Js76lcBLIPk4Hj4P4f8HS/ni22CQFY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="364485059"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="364485059"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 17:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="620022724"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Sep 2022 17:35:49 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obWfU-00057o-1V;
        Fri, 23 Sep 2022 00:35:48 +0000
Date:   Fri, 23 Sep 2022 08:34:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 31f87f705b3c1635345d8e8a493697099b43e508
Message-ID: <632cff2e.RMGiN734Mqjb8fHQ%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 31f87f705b3c1635345d8e8a493697099b43e508  thunderbolt: Explicitly reset plug events delay back to USB4 spec value

elapsed time: 721m

configs tested: 73
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                           allnoconfig
m68k                             allmodconfig
alpha                               defconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20220922
m68k                             allyesconfig
x86_64                              defconfig
i386                                defconfig
sh                               allmodconfig
x86_64                               rhel-8.3
mips                             allyesconfig
powerpc                          allmodconfig
s390                                defconfig
s390                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           allyesconfig
arm                                 defconfig
s390                             allyesconfig
x86_64                        randconfig-a015
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a005
i386                          randconfig-a014
x86_64                        randconfig-a006
i386                          randconfig-a012
arm                              allyesconfig
i386                          randconfig-a016
arm64                            allyesconfig
alpha                             allnoconfig
ia64                             allmodconfig
riscv                             allnoconfig
csky                              allnoconfig
arc                               allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
microblaze                          defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220922
i386                          randconfig-c001
sparc                               defconfig
loongarch                        alldefconfig
xtensa                       common_defconfig
m68k                        stmark2_defconfig

clang tested configs:
hexagon              randconfig-r041-20220922
riscv                randconfig-r042-20220922
hexagon              randconfig-r045-20220922
s390                 randconfig-r044-20220922
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015
arm                         palmz72_defconfig
powerpc                      obs600_defconfig
powerpc                      walnut_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
