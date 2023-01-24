Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56AAF678EE0
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 04:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbjAXDMj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 22:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjAXDMh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 22:12:37 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B9937B72
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 19:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674529956; x=1706065956;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QfNxQNFKvGIzTNKTRqiP7xBIUernOZnGRS5lFMqUsVE=;
  b=dZJdwY6+JnJmSxNFE7LI95Q0z8o0ag5aneHh5O6YXTPxRgttRfg95iUS
   D0lYs8YC+t3abRwdXBU2ZQLabE1IODjpCDV0uV5fs1P/HcMtzOhAeYQDo
   /z+QAmSg2pIg25UxGtbq4TJTahNWefHqMFTCXWHd5ArRJG/8xXhcx80zl
   /Q/MEIHDwVYg3Fnu5Lz56i1/MLg1t5PW16rFjTK5JSlCuZe83CqVQvRzN
   X4LghyabackQ/Of3SbAXfXKjjvqxCwk5+q0q70CB13nImCb1WlBK78Cxn
   /jvHQKsqcSijJzYAbmyDJxXqXrkCE7j9YDXlJGVLrshVLpC23FSUn7rRh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353491176"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="353491176"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750682524"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="750682524"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 19:12:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK9je-00064u-0a;
        Tue, 24 Jan 2023 03:12:34 +0000
Date:   Tue, 24 Jan 2023 11:12:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e3e9fc7fa7ad221cc2e7b207d514cc84ed393251
Message-ID: <63cf4c95.NoiK54+koLIijTc3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e3e9fc7fa7ad221cc2e7b207d514cc84ed393251  Merge 6.2-rc5 into usb-next

elapsed time: 727m

configs tested: 67
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
arc                              allyesconfig
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
mips                             allyesconfig
alpha                               defconfig
powerpc                          allmodconfig
s390                                defconfig
s390                             allyesconfig
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
ia64                             allmodconfig
i386                 randconfig-a006-20230123
x86_64               randconfig-a002-20230123
x86_64               randconfig-a001-20230123
x86_64                              defconfig
arm                                 defconfig
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
x86_64                               rhel-8.3
i386                 randconfig-a001-20230123
i386                 randconfig-a004-20230123
x86_64                           rhel-8.3-bpf
arm                              allyesconfig
i386                 randconfig-a005-20230123
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                                defconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a016-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
x86_64               randconfig-a014-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a015-20230123
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                  mpc885_ads_defconfig
x86_64               randconfig-k001-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
