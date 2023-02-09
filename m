Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB64E69146A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 00:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjBIXaR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 18:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjBIXaP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 18:30:15 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FE47D89
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 15:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675985414; x=1707521414;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wOlilqdhM/7Qxsbrkgt9sF3km89+8F8Eo4zJUJ7LasM=;
  b=QObDe9ERjKYu7nyzx6f3Cw8v/m2QFu1JgxS/X7WIOKPyTtTZf9d0e1mo
   fsJND7lYFaZ6fNqo5rVPiHVw51g6B31Jdoz7bOH5MbFujmpvSaTm8Ok/X
   lIe8DNVwhjJQZp2rxgjJY+knjJMa+liUk3cqlKeJgaILd4yhyYZEPytc8
   gnJ7haJg1GDlnmisEa69gPiqykFEBoK36B5wB+jn3T1UsG6iPemnl8aHP
   o/s/29OuaYkodrJNnRn/H62H7jnrsoC3AGFVH+iR/xnQ0o0kU7uXRqV9c
   l1ue+8HXvzJ1iCTVmfHnJRBQ3cIxfZNTyz210jZd8XiBDBh8lBoSf9kHH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="328910724"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="328910724"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 15:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="661198443"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="661198443"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Feb 2023 15:30:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pQGMl-0005NE-0Q;
        Thu, 09 Feb 2023 23:30:11 +0000
Date:   Fri, 10 Feb 2023 07:29:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f87b564686ee47c480ccacc3922b38a8c54a6945
Message-ID: <63e581c7.F5DLb7GldgtjiZjT%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f87b564686ee47c480ccacc3922b38a8c54a6945  dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: make G12A usb3-phy0 optional

elapsed time: 725m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
x86_64                            allnoconfig
i386                                defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20230209
arm                  randconfig-r046-20230209
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            allyesconfig
arm                              allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
i386                          randconfig-a005
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig

clang tested configs:
hexagon              randconfig-r045-20230209
s390                 randconfig-r044-20230209
riscv                randconfig-r042-20230209
hexagon              randconfig-r041-20230209
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
