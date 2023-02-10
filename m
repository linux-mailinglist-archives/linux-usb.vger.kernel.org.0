Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED2C69167E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 03:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjBJCHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 21:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjBJCHS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 21:07:18 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A536ADC7
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 18:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675994837; x=1707530837;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oxV/3dpmwlAPh55Ywe4XQ/PItJh/cD0meZCOB9L/N4o=;
  b=d1wjZf+/iW7YPqsUugcPJZ748RNFC3F9mSERFEKv///7oPygBdsSfLgg
   GrYuzOPJIU2zsGHevmXBGhn3UhNhKWVYIyHy3jNfhA8BkPz7Hp/S1zXHp
   d9IOiKQ2cJRq8kXvQABnvToUMHiaeqlr5pfFwKZgSALw5wNp5Nmbcn7v9
   tl7zX7rj2zuyWRT7YiP7ulZuIBO0App+OnlQfRwRAB1Tz8JWVvk1Jni9c
   7IsRPWdqRAfW5BqYtOSiQb6MCoW2rlzMIR5l89rqfRSnlZkLuYb3H8M4n
   QOjA6i8QthDIaONKy1Z8NYn+eivLG8K1mpX13J8k9GkeHwuvMkU5Bcatk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318328591"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="318328591"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 18:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="669829223"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="669829223"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Feb 2023 18:07:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pQIok-0005Ro-0P;
        Fri, 10 Feb 2023 02:07:14 +0000
Date:   Fri, 10 Feb 2023 10:06:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 303e724d7b1e1a0a93daf0b1ab5f7c4f53543b34
Message-ID: <63e5a69d.YV91hgFN3YUBUqaH%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 303e724d7b1e1a0a93daf0b1ab5f7c4f53543b34  usb: core: add quirk for Alcor Link AK9563 smartcard reader

elapsed time: 720m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
i386                                defconfig
s390                             allyesconfig
arc                  randconfig-r043-20230209
x86_64                              defconfig
arm                  randconfig-r046-20230209
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
i386                          randconfig-a001
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                           rhel-8.3-bpf
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a006
arm                                 defconfig
i386                             allyesconfig
x86_64                           allyesconfig
x86_64                            allnoconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm64                            allyesconfig
arm                              allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig

clang tested configs:
hexagon              randconfig-r041-20230209
hexagon              randconfig-r045-20230209
s390                 randconfig-r044-20230209
riscv                randconfig-r042-20230209
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
