Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78C2613BEC
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 18:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbiJaRKc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 13:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbiJaRKa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 13:10:30 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8331712D28
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667236229; x=1698772229;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Du1qCjzdKi9LHDnepJFexhhO2jGRJxddbA2+zyr39P8=;
  b=aGtr5zLrY70X/rlx0xjWy5Vhisl7d3inssfJOH7ZVsLkK8WoNgfaUbvm
   S2Noap7Z8WdmstRHbB63r/bSbumTHt9bVj2ZGo561vQwJIgwojddRAey7
   wD21NnjyLoCwu3xb56MAhBolR8EHd0D/KWjPnK3Ol2z2jS4+mzyqI3nFJ
   bPTYyIcxomj1tQOGFISj5Ro7s8LqQo/qwF1e+Uu+dFkt1EkfRtexT9F+X
   seW8fi+J8/POzowyQoY2eCYmviLEm/7Ws5N9iDe6PrNP0f66csMBVEU3d
   oql0uvz8hjSektJMBmwBP+eCkm3/2mi6+J6g+6P3jEOQRsRdBkhbwTZUO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="306569956"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="306569956"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 10:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="962847827"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="962847827"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2022 10:10:27 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1opYIs-000D3I-0h;
        Mon, 31 Oct 2022 17:10:26 +0000
Date:   Tue, 01 Nov 2022 01:09:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8527e94216902cab5b483e2450db93c11109ff97
Message-ID: <63600165.AYLykd3XLOyIb0Ql%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 8527e94216902cab5b483e2450db93c11109ff97  Merge 6.1-rc3 into usb-next

elapsed time: 728m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
i386                                defconfig
x86_64                              defconfig
i386                 randconfig-a016-20221031
x86_64                           rhel-8.3-kvm
i386                 randconfig-a015-20221031
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221031
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20221031
s390                 randconfig-r044-20221031
i386                 randconfig-a011-20221031
i386                 randconfig-a012-20221031
i386                 randconfig-a013-20221031
x86_64               randconfig-a013-20221031
x86_64                               rhel-8.3
arm                                 defconfig
x86_64               randconfig-a012-20221031
x86_64               randconfig-a011-20221031
x86_64               randconfig-a014-20221031
i386                 randconfig-a014-20221031
arc                  randconfig-r043-20221030
x86_64               randconfig-a016-20221031
s390                             allmodconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64               randconfig-a015-20221031
powerpc                           allnoconfig
s390                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig

clang tested configs:
i386                 randconfig-a006-20221031
i386                 randconfig-a005-20221031
hexagon              randconfig-r045-20221031
x86_64               randconfig-a006-20221031
hexagon              randconfig-r041-20221031
x86_64               randconfig-a005-20221031
i386                 randconfig-a002-20221031
hexagon              randconfig-r041-20221030
x86_64               randconfig-a002-20221031
x86_64               randconfig-a001-20221031
hexagon              randconfig-r045-20221030
x86_64               randconfig-a004-20221031
riscv                randconfig-r042-20221030
i386                 randconfig-a003-20221031
s390                 randconfig-r044-20221030
x86_64               randconfig-a003-20221031
i386                 randconfig-a004-20221031
i386                 randconfig-a001-20221031

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
