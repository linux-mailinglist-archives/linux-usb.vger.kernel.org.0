Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F05716D85
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 21:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbjE3T2m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 15:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjE3T2l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 15:28:41 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C03BE
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685474920; x=1717010920;
  h=date:from:to:cc:subject:message-id;
  bh=kNTClOINZbuDp4bW11DbHGLrQ+nKnNCOE8E6R/m2oQo=;
  b=CqfF6+LLzufi+5JUOEORhi6jUmKbUikd671AsZDn/qnZX5rw4lomrL2p
   kKvYXyLNl78+SBLPoVwENc6EqcQlNGDjoi0kMYn0AsGBKIgroc4dZKi8R
   b1EiOV++WPH+XHefI0Cf++K9kVZgJ+yn1qB92JVaTBmOxRAZqIvyiOyx1
   oe334FVchMJEDkSswalMO0esr9lnAEaSzhEC0hJg8MF5L6gHtMgu7pNDd
   98ce4cb5C1YXWHqykdI9VXDJFv7D9IOJoDZoTNQsNaJMYry9TlKXdd0hx
   g+2e5AtNodIeHLWfjl8FY9Quv9/VM4DVChVdYbYYyVvas441Nat4UP1M4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344528355"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="344528355"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 12:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684101550"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="684101550"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2023 12:28:38 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q451J-0000l7-0u;
        Tue, 30 May 2023 19:28:37 +0000
Date:   Wed, 31 May 2023 03:28:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 033c2d8ab2835a7f13e1a9c6813b412935e77140
Message-ID: <20230530192804.ZERnB%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 033c2d8ab2835a7f13e1a9c6813b412935e77140  thunderbolt: Log DisplayPort adapter rate and lanes on discovery

elapsed time: 725m

configs tested: 73
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230530   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230530   gcc  
arc                  randconfig-r043-20230530   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r015-20230530   clang
arm                  randconfig-r046-20230530   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r032-20230530   gcc  
hexagon              randconfig-r041-20230530   clang
hexagon              randconfig-r045-20230530   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i071-20230530   gcc  
i386                 randconfig-i072-20230530   gcc  
i386                 randconfig-i073-20230530   gcc  
i386                 randconfig-i074-20230530   gcc  
i386                 randconfig-i075-20230530   gcc  
i386                 randconfig-i076-20230530   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230530   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230530   gcc  
microblaze   buildonly-randconfig-r005-20230530   gcc  
microblaze           randconfig-r012-20230530   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230530   gcc  
openrisc             randconfig-r036-20230530   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230530   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230530   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230530   gcc  
s390                 randconfig-r014-20230530   gcc  
s390                 randconfig-r044-20230530   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230530   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230530   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x071-20230530   clang
x86_64               randconfig-x072-20230530   clang
x86_64               randconfig-x073-20230530   clang
x86_64               randconfig-x074-20230530   clang
x86_64               randconfig-x075-20230530   clang
x86_64               randconfig-x076-20230530   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
