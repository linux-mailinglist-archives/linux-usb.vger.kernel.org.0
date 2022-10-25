Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86DCD60D5E6
	for <lists+linux-usb@lfdr.de>; Tue, 25 Oct 2022 22:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbiJYUya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 16:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiJYUy2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 16:54:28 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A52338A8
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666731267; x=1698267267;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Mf04pKa+x7unMwVfRj8fL5f1b7MbjQsFFh6PTapubmQ=;
  b=Sq5OX8lcJqOxY9Qy7xQ7ywVpb500YfrSE5/ODBAl+wgaxUxiOuF1yg5v
   XDeqV10zEUY9W4het5Aby1RqMG44BpctLUXm/IEr/ZSYwFEqU1DL6Gr1w
   MmFsNdn0EX3Ibo7Ei7KKjIFUJGAr5K8UIfXjnQMMtGkQhgyCCjgYsanyT
   meR9xSAbmmsFUGAHgIDblZqzXMqhfWmumKnpyGvTGq1bsmZC5Dm1C3u9+
   Zu9KVPjBu2TnWDz4jmYQRwULVBII3rK5gol49FAhMm827wBZJSSTcOD+b
   tTKVD+3xk7xF4eYDgMjZrKmuypQFUfe+EYZPFQMYH42ee0cFnSdTojhmr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="306519596"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="306519596"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 13:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="631772828"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="631772828"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Oct 2022 13:54:24 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onQwJ-0006d6-19;
        Tue, 25 Oct 2022 20:54:23 +0000
Date:   Wed, 26 Oct 2022 04:54:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 2ae18cc2269fc2d05d36bf44a8daa4404fa11dde
Message-ID: <63584cf2.9Y5hspw8gZVeYw9i%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 2ae18cc2269fc2d05d36bf44a8daa4404fa11dde  thunderbolt: ACPI: Use the helper fwnode_find_reference()

elapsed time: 724m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
x86_64                           rhel-8.3-syz
alpha                               defconfig
x86_64                         rhel-8.3-kunit
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
s390                                defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
i386                                defconfig
s390                             allyesconfig
x86_64                              defconfig
mips                             allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a011-20221024
i386                 randconfig-a014-20221024
i386                 randconfig-a012-20221024
i386                 randconfig-a013-20221024
sh                               allmodconfig
i386                 randconfig-a015-20221024
i386                 randconfig-a016-20221024
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                  randconfig-r043-20221024
arc                              allyesconfig
arm                                 defconfig
alpha                            allyesconfig
x86_64                           allyesconfig
riscv                randconfig-r042-20221024
arc                  randconfig-r043-20221023
s390                 randconfig-r044-20221024
m68k                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024

clang tested configs:
hexagon              randconfig-r045-20221023
hexagon              randconfig-r041-20221024
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a001-20221024
x86_64               randconfig-a001-20221024
i386                 randconfig-a002-20221024
s390                 randconfig-r044-20221023
x86_64               randconfig-a003-20221024
i386                 randconfig-a005-20221024
x86_64               randconfig-a002-20221024
hexagon              randconfig-r041-20221023
i386                 randconfig-a003-20221024
i386                 randconfig-a006-20221024
x86_64               randconfig-a004-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a005-20221024
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
