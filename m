Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C575A8731
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 22:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiHaUF3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 16:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiHaUF2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 16:05:28 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8DF2656A
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661976327; x=1693512327;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NZNbz0Ytm/lRcYoTCeEySJh/JQRUphr1dgNmQSnbFIg=;
  b=SgeBTx1IkE1tIk4cGN29wh/oax9jEnDrQDzSeEDgGYEsrV3Upx4X2kOS
   GiWLh8EUw1jGzV7oq5a1nDY5+PpUnV5gSAjnsh+jwoa6A3lIDXWo17EHD
   3Tjlc5lsn6vtwLp0mzSSn2JqFF0PpvsUrR5bfdncOSQn4d7YWstTeEGBc
   IO7z1HS3evW7JuQjRlfj2sRlNiVwG7N0tKZcTfr1pAy90KasBN2ZSQQa+
   AHSe7D+CHAjgCA5s1/Xvh74oekZifc1Nl3coABK+JlDsSIHWJerdAQ/qp
   UpBDgK4zoHqrZzqpC0twaR2KlSJCep0yW0J1I+0zmqyLIopL87vNrz3sl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="359492027"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="359492027"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 13:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="787974757"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2022 13:05:26 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTTxl-0000fS-1F;
        Wed, 31 Aug 2022 20:05:25 +0000
Date:   Thu, 01 Sep 2022 04:04:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 10174220f55ac2c9ea7bdf2dcebe422d24024aec
Message-ID: <630fbee9.70pehVD9nlvqaphF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 10174220f55ac2c9ea7bdf2dcebe422d24024aec  usb: reduce kernel log spam on driver registration

Warning reports:

https://lore.kernel.org/linux-usb/202208310007.6yJMsSYz-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-allyesconfig
    |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
    `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used

elapsed time: 772m

configs tested: 57
configs skipped: 3

gcc tested configs:
loongarch                           defconfig
loongarch                         allnoconfig
i386                             allyesconfig
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
arm                                 defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
arc                        nsim_700_defconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                          lboxre2_defconfig
sh                               allmodconfig
mips                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
arm64                            allyesconfig
arm                              allyesconfig
arc                           tb10x_defconfig
arm                       multi_v4t_defconfig
parisc64                            defconfig
powerpc                      cm5200_defconfig
s390                 randconfig-r044-20220831
arc                  randconfig-r043-20220831
riscv                randconfig-r042-20220831
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arm                            hisi_defconfig
powerpc                      pcm030_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     rainier_defconfig
arm                      jornada720_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                        vexpress_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                         socfpga_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
