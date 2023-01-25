Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112AB67AA02
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 06:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbjAYFjr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 00:39:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjAYFjq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 00:39:46 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B93340F8
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 21:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674625185; x=1706161185;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g9nLF0bxse06OjKo/3D+O29t+DxjMCAyPGATmr21Chg=;
  b=VHpZQ9EmFnKpRQp+aM1PYn3GA4h3uG/F0D0qHkuzn7PMuoDiz+a5aLAJ
   qKPmHcU4y+vd+jPRtX1zYE6QToc1aNm/8m5X5O4JjO5HK9sgIO37pF/OF
   XCOelvyErsEkKU+XP5XnbZJTjKg+swP/AaAjM1jhP0RtANt5wS34kFlmL
   f1rekEj8mMU5JiVv8w6IQ8mKS+L21n11rb/f6tYmm1j3/QGRItAM0N86D
   m5/ZWezYs/ZUjZjrQFhzg0GlELa0lA3rpImeYujWafPhd+q77SwfxtO8l
   RZjGArnhP6LE9IqJUR8g8nSnQ6JXNB5sz08y09Wb82Eutf3yC8S5OfO/N
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306152023"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="306152023"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 21:39:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="836244837"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="836244837"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2023 21:39:43 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKYVa-000740-23;
        Wed, 25 Jan 2023 05:39:42 +0000
Date:   Wed, 25 Jan 2023 13:39:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 9e6f4c8b880bb34851c21db3869e3096d113ccbf
Message-ID: <63d0c096.aexgs/XV90XQS+FH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 9e6f4c8b880bb34851c21db3869e3096d113ccbf  usb: typec: tcpm: Remove altmode active state updates

elapsed time: 726m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
s390                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                           rhel-8.3-bpf
i386                             allyesconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64               randconfig-a002-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
arm                                 defconfig
x86_64                           allyesconfig
i386                 randconfig-a004-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a005-20230123
x86_64                          rhel-8.3-func
i386                 randconfig-a006-20230123
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a016-20230123
x86_64                          rhel-8.3-rust
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
