Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156DE683880
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 22:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbjAaVST (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 16:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbjAaVSP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 16:18:15 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F8411169
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 13:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675199889; x=1706735889;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uJD715ISOkgKTrQ3/oTaLZgf7i+dM2YolO97fXiwmMI=;
  b=gZ8+3smOyVGYJp5MW/qEsUvKUfqLvAtdn3WLmfQO+4X+Um9hqTb8cYvE
   KGjPOUraJ118fne5+Ir4CkD0DHMnLMUyu/cQ9x00aiyAOtZF/MR0WIzJK
   OH8L+H7HnT2pQ/0TMMxuYxhQrEfhq5vU63Tfww2gGSQqHqyCmFIFL7Rv2
   Y44kTpzDHdWctZ9W48uaAb0n5SSYZrO73PFmIOWca0wXrY/S1Ay3LfW0i
   8fx6+sG2oyaxQhSrWSRgYMyO54MvvIBEwJ8YSaY/uCglCU26PN2kHXpNh
   /FSox9Z9wk+syHGrnI5Qq120auCMqB8Y31E7Vt3huNyFPpsCdgCJbQ2BB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355290839"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="355290839"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 13:17:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="614599332"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="614599332"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2023 13:17:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMy0K-0004i4-28;
        Tue, 31 Jan 2023 21:17:24 +0000
Date:   Wed, 01 Feb 2023 05:17:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 e4157519ad46c7bd81b1c1e76d634aa0033d00e5
Message-ID: <63d9854c.60r9eXmCDHiYm5FO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: e4157519ad46c7bd81b1c1e76d634aa0033d00e5  Documentation: usb: correct spelling

elapsed time: 721m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                              defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
i386                                defconfig
sh                               allmodconfig
x86_64               randconfig-a006-20230130
x86_64               randconfig-a005-20230130
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
i386                 randconfig-a002-20230130
i386                 randconfig-a005-20230130
x86_64                           rhel-8.3-syz
i386                 randconfig-a006-20230130
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                             allyesconfig
arm                                 defconfig
arc                  randconfig-r043-20230129
arm                  randconfig-r046-20230129
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                           h5000_defconfig
arm                         lpc18xx_defconfig
m68k                          multi_defconfig
sh                     magicpanelr2_defconfig
arc                            hsdk_defconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a014-20230130
x86_64               randconfig-a012-20230130
i386                 randconfig-a013-20230130
x86_64               randconfig-a013-20230130
i386                 randconfig-a012-20230130
x86_64               randconfig-a011-20230130
i386                 randconfig-a014-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
hexagon              randconfig-r041-20230129
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130
hexagon              randconfig-r045-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
s390                 randconfig-r044-20230129
s390                 randconfig-r044-20230130
x86_64                        randconfig-k001
hexagon                          alldefconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
