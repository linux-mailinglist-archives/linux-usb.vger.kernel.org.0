Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAEF56C5E5
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jul 2022 04:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiGICAU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 22:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiGICAT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 22:00:19 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A134E876
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 19:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657332018; x=1688868018;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QEzG0hgZbevx4ZbYcKitU47GwWSQA0HeqqXVJ0SWhfg=;
  b=ZOXtSiZrepYDFl+v4GAjtnm3fFey3CioVOOjNBRuK+oc36lxxmGJnf1N
   loT+RnHlFON6DJvEjiiVnfWJU5GMfh28Qv/iu/B+bZ/f9fgtHjqa+6Rt/
   I/lyWCM0rIghxGVQzafA9rT35fd6arpMTU2Z5KkW/lQIJy2CK2EqNWI8T
   6B4gUYVG3h9u3c0qUGsh6kLqBjIzCmm7CxbKmwpVzTsuwSpIrAy91vawB
   HJiVFcziE8tA0znUsGwK8jCtIB68oXXvkAtjYkplxU67+tnx1C7HPQye6
   /LJIHZE0elJU/LbEBIki7BE9oglBuv30FHb3753b9HCmobMz7YSmWwoIi
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="264177147"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="264177147"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 19:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="544402115"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Jul 2022 19:00:16 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9zlY-000OAo-9G;
        Sat, 09 Jul 2022 02:00:16 +0000
Date:   Sat, 09 Jul 2022 09:59:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8affe37c525d800a2628c4ecfaed13b77dc5634a
Message-ID: <62c8e108.SWXm/uCw5I/HJICA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 8affe37c525d800a2628c4ecfaed13b77dc5634a  usb: dwc3: gadget: fix high speed multiplier setting

elapsed time: 723m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
ia64                          tiger_defconfig
sh                          rsk7264_defconfig
sh                        edosk7705_defconfig
arm                           corgi_defconfig
powerpc                     ep8248e_defconfig
powerpc                 linkstation_defconfig
arm                         vf610m4_defconfig
sh                           se7619_defconfig
sh                           se7712_defconfig
sh                           se7721_defconfig
sh                           se7750_defconfig
mips                         rt305x_defconfig
alpha                            alldefconfig
arm                        clps711x_defconfig
arm                        oxnas_v6_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
riscv                randconfig-r042-20220707
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
hexagon                          alldefconfig
arm                   milbeaut_m10v_defconfig
powerpc                      walnut_defconfig
powerpc                          g5_defconfig
mips                       rbtx49xx_defconfig
arm                         palmz72_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a013
hexagon              randconfig-r041-20220707
hexagon              randconfig-r045-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
