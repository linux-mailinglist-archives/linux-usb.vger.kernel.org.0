Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA72B5795DA
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jul 2022 11:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbiGSJNp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jul 2022 05:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiGSJNo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jul 2022 05:13:44 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93FF23BC6
        for <linux-usb@vger.kernel.org>; Tue, 19 Jul 2022 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658222023; x=1689758023;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PvD9hwN3lpjl84PLzHRvSutotyrHAuUDyA+ToWvtSI4=;
  b=ZPFAZ6d3dq2Kjc+OZ+qoLtU5ROfQKWGd6vO0QuX394Bi5oV6lZvfjRpe
   4X7ESD8JgXkTiAoP51LoWq4KirJNsu8zLFpdZkYiEMzaPgSq9s/hxNwWB
   oKgPAZPUXaW5StkQ17+liXuCNkmwqNFqyolsOukQVAoj/31BUs0TM+3yw
   ZWNojb4qMfJZo1OIZIAb6FnjG4TDnk6FfdGJnqQz7Kqo8hvbHQ2uYKgmL
   7rHt7w2tl+hw0US/yRrTuRcZrlzCkt/vjhQ3N2LEgzr9mZmNQ71FExCxR
   3V5boDEnDpVHHvUSIRWXQ/gRCLsoho4I0V3sq74NT27fDL0CGWplM4xNB
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="273274151"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="273274151"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 02:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="597589180"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2022 02:13:42 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDjIT-0005TF-MF;
        Tue, 19 Jul 2022 09:13:41 +0000
Date:   Tue, 19 Jul 2022 17:13:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 88a15fbb47db483d06b12b1ae69f114b96361a96
Message-ID: <62d675ac.TJZzHzq4dI24/VDj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 88a15fbb47db483d06b12b1ae69f114b96361a96  platform/chrome: cros_typec_switch: Add ACPI Kconfig dep

elapsed time: 729m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64               randconfig-a015-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a013-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a015-20220718
arc                  randconfig-r043-20220718
riscv                randconfig-r042-20220718
s390                 randconfig-r044-20220718
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a001-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a003-20220718
i386                 randconfig-a004-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a005-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
