Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4EB599673
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 09:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346563AbiHSHsz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 03:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347252AbiHSHsq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 03:48:46 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759ACB56E7
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660895325; x=1692431325;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TwUPkp63eRZgWJ8UmDyVKsvpY+AU7pHAELqQG6y/i2c=;
  b=VuzsnejutR/eXTKwi9dpgQT3Qbma9okHMQWMwvK6JZqGTZ0dPWOMeK1w
   oJmubA+JAjtAkko9guK2+pBFfdohkZnE+4seLKPnU/WNwlEn6tj451q+N
   wrnD5lUsXYZPT5SsXz0oXwmgrhp5eE2qrgya8Sn8/9/HN3H2WS1VQohvF
   C0feV9EfhJ5nwhJ56eayEHCAhfbYzkLGes/Dk4Qz3mYB5XDC7rTZ4Wix2
   QHbMfLBgnxo5zz5jUXSbsEjVQZe9xdB8JUrDcuWUOdLA6bDT+q0XRSrEc
   DfXQx6rF5ZWMP66p6Mjed/q5gLSNeZoKShWtWhLEmzWIaEzjQwWxYMVrG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="276004177"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="276004177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 00:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="558856081"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Aug 2022 00:48:43 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOwkF-0001Bv-00;
        Fri, 19 Aug 2022 07:48:43 +0000
Date:   Fri, 19 Aug 2022 15:48:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS WITH WARNING
 c1e5c2f0cb8a22ec2e14af92afc7006491bebabb
Message-ID: <62ff4039.8ikdJHGvu8cY4NuF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c1e5c2f0cb8a22ec2e14af92afc7006491bebabb  usb: typec: altmodes/displayport: correct pin assignment for UFP receptacles

Warning reports:

https://lore.kernel.org/linux-usb/202208190411.1lugjsYz-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/dwc3/dwc3-qcom.c:313:25: warning: variable 'hcd' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- ia64-allmodconfig
    `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used

elapsed time: 726m

configs tested: 74
configs skipped: 3

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
arc                  randconfig-r043-20220818
powerpc                          allmodconfig
arm                                 defconfig
mips                             allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
s390                 randconfig-r044-20220818
riscv                randconfig-r042-20220818
x86_64                              defconfig
sh                               allmodconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a013
arm64                            allyesconfig
arm                              allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a002
i386                          randconfig-a014
i386                          randconfig-a012
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                        randconfig-a004
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
x86_64                           rhel-8.3-syz
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
sh                   rts7751r2dplus_defconfig
sh                                  defconfig
sh                               alldefconfig
um                                  defconfig
sh                               j2_defconfig
ia64                             alldefconfig
arm                            mps2_defconfig
arm                        clps711x_defconfig
arm                      footbridge_defconfig
arm                            qcom_defconfig
m68k                           sun3_defconfig
sh                           sh2007_defconfig
arm                          gemini_defconfig
mips                            gpr_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r041-20220818
hexagon              randconfig-r045-20220818
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
arm                         s5pv210_defconfig
arm                         shannon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
