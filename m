Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1AC67AA04
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 06:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbjAYFkr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 00:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjAYFkq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 00:40:46 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9376540F8
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 21:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674625245; x=1706161245;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uGj2XlkpQo1ly0UHxSS4I0xXOae0a6r3TUM2MsEB7/c=;
  b=EXk/4UkwpZ7ug4ws08fUXt5pUTk9czFo7+cOW4Iz1NziF2W5e32eIOVk
   0Ng6wN1GSWVLVQak1H6kasOOros9k24/ilrg9AbdzwWL38fkbO65qNcem
   VlI2CNkWqtVnPz+HtBwkmyqOY0Pl6Uk7HjujoJ6eM5e7adX6X0WHOtHwA
   f//4tl+Oj7R+pXf8QH2nhPFhT3O7+whMNfuxOkYIxIKRq4XWbnmX4aS7W
   SSrA71gltMV0cz9sgDchojhRG7y6oW4dXKAbFnfjujB66jWrGQEY1vWJA
   Rwa+EAPGCirY5tIAUPPNKPqcnXOAgX1uK1kmbWDAxCUnT3LhxDm6H3tlX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324187428"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="324187428"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 21:40:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="639816885"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="639816885"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2023 21:40:43 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKYWY-00074Y-2a;
        Wed, 25 Jan 2023 05:40:42 +0000
Date:   Wed, 25 Jan 2023 13:39:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 921deb9da15851425ccbb6ee409dc2fd8fbdfe6b
Message-ID: <63d0c0a5.MmA9eAsLD1+mWI6D%lkp@intel.com>
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
branch HEAD: 921deb9da15851425ccbb6ee409dc2fd8fbdfe6b  usb: gadget: f_fs: Fix unbalanced spinlock in __ffs_ep0_queue_wait

elapsed time: 727m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
s390                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20230124
mips                             allyesconfig
s390                 randconfig-r044-20230124
powerpc                          allmodconfig
riscv                randconfig-r042-20230124
ia64                             allmodconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                 randconfig-a004-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
x86_64               randconfig-a002-20230123
i386                 randconfig-a005-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123
i386                 randconfig-a006-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func

clang tested configs:
arm                  randconfig-r046-20230124
hexagon              randconfig-r041-20230124
hexagon              randconfig-r045-20230124
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a016-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
