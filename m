Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745A0674E1F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 08:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjATH2J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 02:28:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjATH2I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 02:28:08 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B9B7DFAA
        for <linux-usb@vger.kernel.org>; Thu, 19 Jan 2023 23:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674199684; x=1705735684;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6fP6be2CneNL72Sm8dGOCy4FVt1fXr1qKIdoZMw/tkw=;
  b=KwH68e42c96/evwzE1Lk4yJciqgrthkRyhyJj4PKG724sSRCOmwiru4d
   qS4uTt/CRKX2ABawEkKWupeA4QHVJlM65/gTt/NZCQEMWpojMvDvvaeE7
   r7N47aNi1XR5MdxOOCEJcnomcLVBaiqeRiRJBh6OPpyzL4WxuWjzp6Jwf
   KjOoseeJFJ4gLTsR+29tXtSM44llw0RUYNrD3+5wSjDrAXpPXfVSmSqMO
   QdwHiPeLuDakTgp+BCWcAFvuQNji3iZjHy3eq8d7CS9R64s+95N0Z7U3+
   YGOyypph5isk4A/fM48A7dYoSWwR69VC9K871Z8RTOCmFVJ9MtboxNqMJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327614813"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="327614813"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 23:27:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662445540"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="662445540"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 23:27:47 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIloQ-0002KG-2a;
        Fri, 20 Jan 2023 07:27:46 +0000
Date:   Fri, 20 Jan 2023 15:27:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 dcbf1742ed10ede31b2e68c1412503db9fc6cfaf
Message-ID: <63ca4261.T0gXRbhq0doNo/Yc%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: dcbf1742ed10ede31b2e68c1412503db9fc6cfaf  Merge tag 'usb-serial-6.2-rc5' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 723m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
sh                               allmodconfig
alpha                               defconfig
x86_64                            allnoconfig
mips                             allyesconfig
s390                                defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
i386                          randconfig-a003
powerpc                          allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arm                                 defconfig
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                                defconfig
arm                  randconfig-r046-20230119
arc                  randconfig-r043-20230119
i386                          randconfig-a014
arm                              allyesconfig
i386                          randconfig-a012
x86_64                        randconfig-a004
arm64                            allyesconfig
x86_64                        randconfig-a002
i386                          randconfig-a016
x86_64                        randconfig-a006
i386                             allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                          rhel-8.3-rust
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
hexagon              randconfig-r045-20230119
hexagon              randconfig-r041-20230119
riscv                randconfig-r042-20230119
s390                 randconfig-r044-20230119
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
