Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C500768A3B2
	for <lists+linux-usb@lfdr.de>; Fri,  3 Feb 2023 21:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbjBCUnU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Feb 2023 15:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjBCUnT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Feb 2023 15:43:19 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AA635272
        for <linux-usb@vger.kernel.org>; Fri,  3 Feb 2023 12:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675456996; x=1706992996;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OGadrCd23O1YF1EWTwZmRRmT11QSeWIW13urCGWOrjU=;
  b=O2mfpVxVkag8iJz9Zj4FlvFlqI7cgUZUijpiQMOpewKLl1bFrPAerdkk
   pgtxPaMszIDXT7oQQuWOW5dPYJvntKDr8Ce3T3Ft/dedNBI++l4Yu/AN7
   PSMIhB4CNowRt2YlfEqzUnAkUxTh+Dhu70ZAQ+IWiVzR4QiA9HgWC0SqZ
   W5yMlZUl8d57CZbZXGbZBTluK3Ook3qiKdJjqgltLnYMNIvCc9Vs5EtvL
   Qlv4gLr3R0gLCLC/motE9R0RBBwJmQdO0G6GCqT0i8EP/+XtzScv0eHhc
   fBAP38FhT3pXUCirM3geuxlgL4E7GZwfkCPnpZ5hBZyp+g0jMwwTeWmgU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415063290"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="415063290"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 12:43:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="696252845"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="696252845"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Feb 2023 12:43:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pO2tu-0000kP-1F;
        Fri, 03 Feb 2023 20:43:14 +0000
Date:   Sat, 04 Feb 2023 04:42:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 4f6dfc2136fb2e8dc3f571a5caff6b6e88281fc0
Message-ID: <63dd71bf.1rCrZ8VbHZH4srEN%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 4f6dfc2136fb2e8dc3f571a5caff6b6e88281fc0  usb: remove the dead USB_OHCI_SH option

elapsed time: 794m

configs tested: 73
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                        randconfig-a002
sh                               allmodconfig
x86_64                            allnoconfig
mips                             allyesconfig
x86_64                        randconfig-a004
powerpc                          allmodconfig
s390                                defconfig
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20230202
i386                          randconfig-a001
i386                          randconfig-a003
s390                 randconfig-r044-20230202
arc                  randconfig-r043-20230202
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
sh                          rsk7203_defconfig
sh                           sh2007_defconfig
loongarch                           defconfig
arm                           sama5_defconfig
powerpc                      makalu_defconfig
arm                         axm55xx_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
sh                           se7705_defconfig
arc                     nsimosci_hs_defconfig
riscv                randconfig-r042-20230204
s390                 randconfig-r044-20230204
arc                  randconfig-r043-20230204
i386                          randconfig-c001
i386                             allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                          rhel-8.3-rust
arm                  randconfig-r046-20230202
hexagon              randconfig-r045-20230202
hexagon              randconfig-r041-20230202
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                       imx_v4_v5_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc8272_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
