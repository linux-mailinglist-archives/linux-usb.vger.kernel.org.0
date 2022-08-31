Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 689365A87A8
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 22:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbiHaUna (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 16:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbiHaUn3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 16:43:29 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73804E9A82
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 13:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661978608; x=1693514608;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NSAUFyjWL7ZVkDqjBUEZOEyUSWGoWJkZ1EvA/QA1xpc=;
  b=kJHThFtPTYzJvIMJRRNzJar6SP1/6kZxRV2RSMG331M2++ob2MppcvLk
   p/b1Uhxv+C4ph5DLybhMmH8bxd044/rIxUp75orbFw3ejzPHvr8ey+vMs
   lQWQq7fhmrEJewBR2skmXoU9s2YO/+saOHJAgHcekYV+QJ1YeSF2733Iw
   NRIFh3t/kAiWfSWuDoaihW2aItNNPFPdKJh9Hp4GhLz4p6LYCbVZeGrs1
   474HK7fDyq8wgiV7qwVzSAiieR7ahtzdy5lEeP/cWg7rfdovJxLjEExkb
   CQf09S/54IvE6Cw5Qu9jtRUEkC7J9yWh+OLqT+S0VSODwsBzE2a482dxs
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296323751"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="296323751"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 13:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="642024009"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 13:43:26 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTUYY-0000gg-0j;
        Wed, 31 Aug 2022 20:43:26 +0000
Date:   Thu, 01 Sep 2022 04:42:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 58bfe7d8e31014d7ce246788df99c56e3cfe6c68
Message-ID: <630fc7ce.sT3l6YiLPiMBy9pb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 58bfe7d8e31014d7ce246788df99c56e3cfe6c68  Revert "usb: add quirks for Lenovo OneLink+ Dock"

elapsed time: 722m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20220830
sh                               allmodconfig
x86_64                              defconfig
arc                              allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
i386                          randconfig-a005
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
x86_64                           allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a015
ia64                             allmodconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a014
i386                          randconfig-a012
arm                                 defconfig
i386                          randconfig-a016
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220830
riscv                randconfig-r042-20220830
hexagon              randconfig-r041-20220830
s390                 randconfig-r044-20220830
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                        randconfig-a003
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
