Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A70663691E
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 19:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236582AbiKWSji (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Nov 2022 13:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238244AbiKWSje (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 13:39:34 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D6A6D49D
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 10:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669228774; x=1700764774;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LXqgcrraC9BMzvqnyIfE5+jtOn/H4k1U1B7zg7FTv+w=;
  b=FNhfCUpvVu7s/Lt7G2yxjr3qfS2ZDQNuP6ZtqLsQnLM342fgOtjnJ/Kr
   Skdn0rmrvlu7IxxH248HrL2kNEtMBcWlEgq0R8SsZQMWrc27QyFirIj/g
   3Mlc+PzkyViPBzgyqyGAZg7emsh+uKlC5Gh6LrosShVVEvkl6BjPA20HH
   ArPb8X45eCexGAR1yO+5l1pMgcWeuN22+DQdmE+aRbAorjnR73G0gUi5V
   lbqtbLpytfuSNNKKh14DXeqozRO5qjLfXj9kthjUWsqRXka9+cT+udJtC
   +zBIuzWbhHKU5EpC8/u0tBQI2e74uxFHpP7jYzYr6zpxKTHGulOPHLEhG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="301696574"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="301696574"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 10:39:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="672972981"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="672972981"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Nov 2022 10:39:32 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxueh-000302-1U;
        Wed, 23 Nov 2022 18:39:31 +0000
Date:   Thu, 24 Nov 2022 02:39:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 907140462eb511f3d98aa89c0665da1b618d3545
Message-ID: <637e68e1.VSPGSZ2AY8aiAD2f%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 907140462eb511f3d98aa89c0665da1b618d3545  usb: usb251xb: Convert to i2c's .probe_new()

elapsed time: 1558m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
s390                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                              defconfig
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a012-20221121
i386                          randconfig-a001
i386                 randconfig-a014-20221121
i386                          randconfig-a003
i386                 randconfig-a015-20221121
i386                          randconfig-a005
i386                 randconfig-a016-20221121
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a012-20221121
x86_64               randconfig-a011-20221121
x86_64               randconfig-a015-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
arc                  randconfig-r043-20221120
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221121
s390                 randconfig-r044-20221121
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                                defconfig
i386                             allyesconfig
arm                                 defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
