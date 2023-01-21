Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2939B676319
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 03:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjAUCau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 21:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjAUCas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 21:30:48 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C19792A8
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 18:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674268247; x=1705804247;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jKq9ZM5EPOfamYNxJQhtlBpHwM3o8N9y+PkuKd3/UVM=;
  b=MvHPZ9o7iT0vH3Tu2MVWMFxnPbCrymxQMzgzEEj3pPKAktf9DSuLy6yE
   rbA4T1idWyPlU3aGr4tRJNKDXvCswq9ktTHWYsth7U7rtc09bdL7Z1uDJ
   JyxjpdW2GCstvGdXY6Zq/ryL/HXFN70B4zOTbKTA3VDIBhqj0qWWsmytf
   n2kTyLUcxnRD3IlZUHv0Ra3nKcCcPnC1C0Gcp8x9iTtnTdFjKfUFyjoC+
   jpYNiLWtnOXhpe+SqIxjZyR02xJ3bZa0ivaJj7WUOeU6Po791Jfw4OIn9
   3SKKBwRfOzE0wKTYRDGNOWrDYyPVUKK0xAGaJQC8BTzDBSGRFUgywNKhp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305419593"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="305419593"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 18:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610675649"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="610675649"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 18:30:46 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJ3eS-0003Gs-0n;
        Sat, 21 Jan 2023 02:30:40 +0000
Date:   Sat, 21 Jan 2023 10:30:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 5d3d01ae15d2f37ed0325c99ab47ef0ae5d05f3c
Message-ID: <63cb4e46.O51xlTmzSLKtdq/1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 5d3d01ae15d2f37ed0325c99ab47ef0ae5d05f3c  usb: host: ehci-fsl: Fix module alias

elapsed time: 754m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
arm                  randconfig-r046-20230119
arc                  randconfig-r043-20230119
i386                          randconfig-a001
i386                          randconfig-a003
powerpc                           allnoconfig
s390                                defconfig
x86_64                              defconfig
i386                          randconfig-a005
x86_64                               rhel-8.3
x86_64                        randconfig-a002
ia64                             allmodconfig
x86_64                           allyesconfig
s390                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
x86_64                           rhel-8.3-bpf
x86_64                        randconfig-a004
arm                                 defconfig
x86_64                        randconfig-a013
m68k                             allmodconfig
mips                             allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a011
m68k                             allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
powerpc                          allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
hexagon              randconfig-r041-20230119
hexagon              randconfig-r045-20230119
riscv                randconfig-r042-20230119
i386                          randconfig-a002
i386                          randconfig-a004
s390                 randconfig-r044-20230119
x86_64                          rhel-8.3-rust
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
