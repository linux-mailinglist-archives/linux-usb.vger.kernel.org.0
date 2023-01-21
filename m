Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1AA5676318
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 03:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjAUCat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 21:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjAUCas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 21:30:48 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEF559549
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 18:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674268247; x=1705804247;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zoaxGkrAYTlEbbN6Q1kT6MPC56jkfx6tDrExGWhHc8s=;
  b=f5CtRuc3GaLm2wZe79L6znzr1R5FKiL0eS8NOEoo2Q2u7Sk9TceQBA3R
   GbQ1NZq3QVMNjraVJwMKueW+N5+flaL5BsWXIIIc+yD9fUlL7udbAiRdL
   rEODxSGsp3rKg8hNn1264WZ1+Q+WBp2TH3a3Q2YqCF2S7Ow9dm6hwGSNE
   tUAcprO462PXVpyK+13gZdOvEEQQFJr/0ULOPrTWFU3PX8fu+A/PBJ0Qw
   7q+nA81U7dxUvdr4mSGQQ2bqB3P0OhtAvaST5O7f1myVxBck/J3S56oWx
   XTVo4f1R86+MQU+GAh3M4Lu2VeS7jmE9TEMuiHPS6Fi1I50DE9+0jPZPQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325787859"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="325787859"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 18:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="729318172"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="729318172"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2023 18:30:46 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJ3eS-0003Gq-0b;
        Sat, 21 Jan 2023 02:30:40 +0000
Date:   Sat, 21 Jan 2023 10:30:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 dd2f003e4e85b154754d5a83e0c3b1b517d1f802
Message-ID: <63cb4e42.2l874RtWYahXGHsH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: dd2f003e4e85b154754d5a83e0c3b1b517d1f802  Revert "arm64: tegra: Enable XUSB host function on Jetson AGX Orin"

elapsed time: 723m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                  randconfig-r046-20230119
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20230119
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
x86_64                        randconfig-a002
arc                                 defconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a006
m68k                             allmodconfig
alpha                               defconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           allyesconfig
arm                                 defconfig
x86_64                        randconfig-a013
i386                          randconfig-a014
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a011
x86_64                        randconfig-a015
s390                                defconfig
s390                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                                defconfig
s390                             allyesconfig
i386                             allyesconfig
i386                          randconfig-c001
arm                            hisi_defconfig
arm                      footbridge_defconfig
mips                           ci20_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20230119
riscv                randconfig-r042-20230119
hexagon              randconfig-r041-20230119
s390                 randconfig-r044-20230119
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a015
powerpc                     tqm8540_defconfig
powerpc                    ge_imp3a_defconfig
arm                       spear13xx_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                     ksi8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
