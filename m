Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF70563EF75
	for <lists+linux-usb@lfdr.de>; Thu,  1 Dec 2022 12:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiLAL2c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Dec 2022 06:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbiLAL20 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Dec 2022 06:28:26 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D3A56570
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 03:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669894105; x=1701430105;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tGbH4aBNhYJBoutC+L9DQp3CaXhhSZEZk0VPrYJEiEc=;
  b=MqKd7qn44NdGkiwh1MTlxM+gj+AjaoXskFHUowgFuMe4MTSZ7HvwGDPh
   jYYL5Xa9lcV5/KgJFrQQCa8VAniqzMFfThyc/NNjn+1WWoa/tyiUcU6xN
   bQIgNpJ1jHUUOIYS0BoyMH5Xz2N3X4b8TacZ085KnvSeCijR6sWz0z8t8
   jzc6zz3F8h3LCuAatmAsSgcUSHbzIAFG/LVIIuBK+WJ9r6uwcTVZ4vrZW
   BIBPFbqo/x7AzsE/SRU5f2IFDeBMYbmuFe0yvl2MPpGtz2ll1DkzNwelJ
   fLg7Cm3CCrKSXWoN4dB6HUKkS9ohpZAE1DwBb7puueAWjZxIzLiw03OmW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="317523116"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="317523116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2022 03:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="750766598"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="750766598"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2022 03:28:23 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0hjq-000CVW-2g;
        Thu, 01 Dec 2022 11:28:22 +0000
Date:   Thu, 01 Dec 2022 19:27:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 51daa42d6b86efa366320b99e7bbe29a490ed348
Message-ID: <63888fa8.JfdhnkNxhrXOdDYE%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 51daa42d6b86efa366320b99e7bbe29a490ed348  Revert "i915: Move list_count() to list.h for broader use"

elapsed time: 1432m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
arc                  randconfig-r043-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a004-20221128
x86_64               randconfig-a002-20221128
i386                 randconfig-a005-20221128
x86_64               randconfig-a001-20221128
x86_64               randconfig-a003-20221128
i386                 randconfig-a006-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
i386                          randconfig-a014
i386                                defconfig
i386                          randconfig-a012
i386                             allyesconfig
i386                          randconfig-a016
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arc                  randconfig-r043-20221201
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r041-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a016-20221128
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a014-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
