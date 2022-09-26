Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9EAC5EB2E9
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 23:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiIZVOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 17:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiIZVOk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 17:14:40 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB87F44
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 14:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664226874; x=1695762874;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aNlexiMjvWY+cE/aF8UZWwkAidrheLScnU5X4/lkqEw=;
  b=RYj8GRmi3oSyi4GKJe/jgmTNu+d10/hxBsQTNzhaW52wcmhrMnw615Vz
   D61irvveCrB71Cd9J7pwJWrjPYkzuVS7LfQr/a+fwmyGZKUpX/cemsBx6
   VxqTRET+ZuB4/M7gZcePbxqMcDhzeRCPfJedeiuxS3cfcdidhQTxRr5Lj
   JXz2KhTdToxfy3n6XZPYkGBftVrXiwB8VN6htr7XOCJrrhF/lFna12jF0
   dHPaieqZzsVcjefSw0flJnSaqRnWKEqENuGryCkRmx0BlCZEUZjVz6Nva
   0YxycPr4iUz1MBBUe8oP0yZh/KAkylfbk6Jed9n0Ot/NNj7SpQH7D4ht7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="362975218"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="362975218"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 14:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="689717628"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="689717628"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2022 14:14:11 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocvQZ-0000G3-00;
        Mon, 26 Sep 2022 21:14:11 +0000
Date:   Tue, 27 Sep 2022 05:13:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 67102bd31b4e31abb0abbc390381212a2d65db72
Message-ID: <63321616.4bOC7AbDzTzI1EVM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 67102bd31b4e31abb0abbc390381212a2d65db72  Merge 6.0-rc7 into usb-next

elapsed time: 724m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a005-20220926
x86_64                              defconfig
x86_64               randconfig-a006-20220926
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
arm                                 defconfig
i386                             allyesconfig
i386                          randconfig-a001
arm                              allyesconfig
i386                          randconfig-a003
arc                  randconfig-r043-20220926
arm64                            allyesconfig
i386                          randconfig-a005
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a012-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
hexagon              randconfig-r045-20220926
i386                 randconfig-a011-20220926
riscv                randconfig-r042-20220926
x86_64               randconfig-a016-20220926
i386                          randconfig-a002
i386                 randconfig-a014-20220926
x86_64               randconfig-a015-20220926
i386                 randconfig-a013-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a014-20220926
i386                 randconfig-a012-20220926
i386                          randconfig-a004
hexagon              randconfig-r041-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a016-20220926
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
