Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7160E658752
	for <lists+linux-usb@lfdr.de>; Wed, 28 Dec 2022 23:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbiL1Wdh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Dec 2022 17:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiL1Wdf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Dec 2022 17:33:35 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB9D11C14
        for <linux-usb@vger.kernel.org>; Wed, 28 Dec 2022 14:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672266814; x=1703802814;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tXsSxbkQtbGrH8vIfeTHCHZtThDl4U0m6J5ud5yNvdw=;
  b=ctc6SOA6jZET0fMCRv4ohCNs1+KI7wSMb524cm10tJOf2SUqn3WbhXKq
   BlRIgZL27j+z8IRpvFYbdSaLsXNUuniv0yn3wutZ+yV2tMY7sh7gAuqac
   xm5NRCkyCdR/o17LOvPvHKHemYfAm+aBTnOouAKYwKarsrz4X1RU5BRLd
   64e2KhURydDCpZgylKH/qTnRXyo0uKXk8IogwOyIhQudDR/46sGF905AP
   UrJHGjP3UeQs6vlnKxVcTImXefv2zLSvbsH/LyAw1t3diStX+kW6rRvzF
   tqvt2gtz2HEgRgtYgyhGtC6yMLh7kmQWuP1zORr59DthbvySniKb0eW7K
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="318623678"
X-IronPort-AV: E=Sophos;i="5.96,282,1665471600"; 
   d="scan'208";a="318623678"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 14:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="898791329"
X-IronPort-AV: E=Sophos;i="5.96,282,1665471600"; 
   d="scan'208";a="898791329"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Dec 2022 14:33:32 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pAezL-000G0h-2q;
        Wed, 28 Dec 2022 22:33:31 +0000
Date:   Thu, 29 Dec 2022 06:33:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 2de5bba5890f6604a997c75e754df8082386c9f7
Message-ID: <63acc438.gSAMzWvEHzHRA2JW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 2de5bba5890f6604a997c75e754df8082386c9f7  usb: fotg210: fix OTG-only build

elapsed time: 726m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
ia64                             allmodconfig
arc                                 defconfig
i386                                defconfig
mips                             allyesconfig
x86_64                              defconfig
alpha                               defconfig
x86_64                               rhel-8.3
i386                          randconfig-a014
x86_64                    rhel-8.3-kselftests
s390                                defconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a012
arm                                 defconfig
powerpc                          allmodconfig
x86_64               randconfig-a014-20221226
s390                             allmodconfig
i386                          randconfig-a016
s390                             allyesconfig
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a013-20221226
x86_64                           rhel-8.3-syz
x86_64               randconfig-a011-20221226
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a012-20221226
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a015-20221226
x86_64               randconfig-a016-20221226
x86_64                            allnoconfig
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
i386                          randconfig-c001

clang tested configs:
i386                          randconfig-a013
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
x86_64                          rhel-8.3-rust
x86_64               randconfig-a001-20221226
i386                          randconfig-a011
x86_64               randconfig-a004-20221226
i386                 randconfig-a004-20221226
x86_64               randconfig-a005-20221226
i386                          randconfig-a015
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
x86_64               randconfig-a006-20221226
i386                 randconfig-a002-20221226
i386                 randconfig-a005-20221226
i386                 randconfig-a006-20221226
hexagon              randconfig-r045-20221225
riscv                randconfig-r042-20221227
hexagon              randconfig-r041-20221225
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227
s390                 randconfig-r044-20221227
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
