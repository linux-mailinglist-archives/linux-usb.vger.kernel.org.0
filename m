Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C2155C122
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243068AbiF1BcR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 21:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241582AbiF1BcQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 21:32:16 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7F3766D
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 18:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656379935; x=1687915935;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hlukxxE3HrYSbUuEnC3T36k1kpPGAwOWrNIRupgtGtk=;
  b=A+JIbKEZvMEv+5Nn0YqZ1aNOLUTA6wilkx3nDLDMgCOhMbJkTCQf8QsX
   4UZaSeygh8FUQwiwKON9KskAQ4XdA01YaV9h+kfw8cZG0T89WskZIzg7/
   ojNTXKo7ILGeraTNq9UcGrfHz4Dc0Lbbl35woYsESf6xsApUce9vhIyNy
   1OjM8tTY/H9IpbePRRkCMVvR11P7+NcuVhYZNJIMS35gTr80H48vcVpEW
   CX1X1w6KivExn9hdDkto4DnaacpkCsgcyU4qMS7sugu063Ekn2gD5iUR3
   k/oKVMVlem/aH6PSR6OxDiiATjYwexvJLGg0d7d+Yo3ymOJVRv7E+yd73
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="367917583"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="367917583"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 18:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="657924340"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2022 18:32:14 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o605O-0009LS-1e;
        Tue, 28 Jun 2022 01:32:14 +0000
Date:   Tue, 28 Jun 2022 09:31:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ebc4969ae125e65fdb563f66f4bfa7aec95f7eb4
Message-ID: <62ba59e6.CLZj7ZZASg4x4TmN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ebc4969ae125e65fdb563f66f4bfa7aec95f7eb4  dt-bindings: usb: mtk-xhci: Make all clocks required

elapsed time: 725m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a012-20220627
x86_64               randconfig-a016-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a013-20220627
x86_64               randconfig-a014-20220627
x86_64               randconfig-a015-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a013-20220627
i386                 randconfig-a016-20220627
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a004-20220627
x86_64               randconfig-a006-20220627
i386                 randconfig-a002-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a005-20220627
i386                 randconfig-a006-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
