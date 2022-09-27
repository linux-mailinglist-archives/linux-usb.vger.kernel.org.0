Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FB05EBB76
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 09:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbiI0H2d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 03:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiI0H2b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 03:28:31 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20CA5AA1B
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 00:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664263710; x=1695799710;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ihes9PrgRrpfiyVMAj8HaxeZECOxzOQci1rwFRiWzcg=;
  b=nR2gKWIbrSnaUeN8RsRyGS0w1wzWcge/CaWblhCLfiyq4OK+Y1IBv28I
   NPonyjKOR0jCTxuIrTx6GukEX/aP63lf492SmgYriiT23/8V+9QLXaJ7Q
   52Syi3G6DhwwuGmS2Zpx3Iuk6GsB1jaQc2ROFzcgshiHZCYRnUvJnQQ4M
   gpnRI6t+412L4O2G0dMuRL+t5PwrvKiw5ifcoQ/j74IEC4ZIylPPVtpMd
   oC2NNWA5n+sdEZInK1u/NzqFaGt7qZ/9hJh+7N6z4yABjcDFUWtonnDIB
   vgNTdvUzE7y9bIguYiFp64CRuT0xfiWLXOIp0n3RuTsRNyOIN7zUnRi08
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="363084576"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="363084576"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 00:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="652183560"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="652183560"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2022 00:28:29 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1od512-0000lp-1U;
        Tue, 27 Sep 2022 07:28:28 +0000
Date:   Tue, 27 Sep 2022 15:27:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 5d2569cb4a65c373896ec0217febdf88739ed295
Message-ID: <6332a5fa.6kC6BjViNNQz/QrY%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 5d2569cb4a65c373896ec0217febdf88739ed295  thunderbolt: Explicitly enable lane adapter hotplug events at startup

elapsed time: 724m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
i386                 randconfig-a001-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
x86_64                           allyesconfig
i386                 randconfig-a004-20220926
arm                                 defconfig
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
m68k                             allmodconfig
m68k                             allyesconfig
i386                             allyesconfig
arc                              allyesconfig
powerpc                           allnoconfig
alpha                            allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220925
arm                              allyesconfig
mips                             allyesconfig
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a006
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a015-20220926
hexagon              randconfig-r045-20220925
i386                 randconfig-a016-20220926
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
