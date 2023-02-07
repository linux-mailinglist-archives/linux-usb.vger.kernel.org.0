Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C216E68CBD8
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 02:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjBGBSk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 20:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjBGBSb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 20:18:31 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BAF1E1CB
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 17:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675732708; x=1707268708;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/yorm8cB4udh/ptE9I+Ntdx4ANmqGRDxLXRjOmKF7OQ=;
  b=je7lT4icfR8l3teMs5DSsgL5tYKDdXbbvwqDIkR+aBpxUziz8OunH94D
   FHmKN4UPzoUI3OWYCgnk4wmuFS7DZMk61UB1a8Qb3pmj9rWLY2cI5WLO4
   AZY1TQ/t1sNcCoqO+/7sPCxy4lsPTf1bG07QMT2k8GZ/jALykWH4b2UKM
   gRM/wWOBNAkA2Z/SvbkvUwDltEWr3coQ3yl1JLdvADtOx7rRQMVJ4FrYV
   cSs0T2DPDG34SEt69cORyT1QoFcPjPGYhRFtF/xAXWkvR+PK4G6li2i+J
   wnZ+G2mug6EMjogt0speuwBdeVjWtrPcX88R/SX0yL9LVg9vtBVKmx+li
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="391765531"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="391765531"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 17:18:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="755447881"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="755447881"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2023 17:18:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPCcs-0002vi-08;
        Tue, 07 Feb 2023 01:18:26 +0000
Date:   Tue, 07 Feb 2023 09:17:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 25746a3fa2dad79a6dfc42522b5bb38b4bdec844
Message-ID: <63e1a6c6.7Ni+Uc4IaJJFpxT8%lkp@intel.com>
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
branch HEAD: 25746a3fa2dad79a6dfc42522b5bb38b4bdec844  drm/i915: fix up merge with usb-next branch

elapsed time: 728m

configs tested: 50
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
s390                             allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
x86_64                           allyesconfig
i386                 randconfig-a013-20230206
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
mips                             allyesconfig
i386                 randconfig-a012-20230206
ia64                             allmodconfig
m68k                             allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a015-20230206
i386                 randconfig-a016-20230206
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
riscv                randconfig-r042-20230206
s390                 randconfig-r044-20230206
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                                defconfig
arm                                 defconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230205
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
