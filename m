Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5047C660C51
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jan 2023 04:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236714AbjAGDwd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 22:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjAGDwb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 22:52:31 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723514D732
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 19:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673063550; x=1704599550;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TWLqbEE1xQSDfg3kEJGuMCDrQfC3nHd0jyf/8k5F7eA=;
  b=DFw3L9tMHHuyfw83SoxlbeUTa0JUaNU8Vxi+1keC5z16YspdGKq4LLGk
   EBp+SXFKJMVREkTGJA+KXEHHu2gQOA8xwbblMEWC49s+S+pKB5S4dpOHf
   ISS1gfbjc7ZEv3bfUDnwONxdu88/+aEYabu9cqGoTDrPZux9NspAgeTob
   u51PVVK1Vi5jRFisBW6D/ZOegK9F3IsP2a36GdMESMCwgva4jfoO+q1Al
   jCuiDmsKPSQ9DiQMqmOk0d/jsUoOdXLtkYcBH6YJXdL/q8ehYZXG60g2L
   ckBqnbk5Lqt89GDrKwSPuEzP9ybYa1MM/abMKQz5k+AOHPduzlQiYf0zv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="387065685"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="387065685"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 19:52:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="658075851"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="658075851"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2023 19:52:27 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pE0Fu-0004Ei-1B;
        Sat, 07 Jan 2023 03:52:26 +0000
Date:   Sat, 07 Jan 2023 11:52:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 5220cb493bf418cc4ce5f3ba961dbd0207441731
Message-ID: <63b8ec6b.G44UFB0SnXeoQKBp%lkp@intel.com>
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
branch HEAD: 5220cb493bf418cc4ce5f3ba961dbd0207441731  xhci: Convert to use list_count_nodes()

elapsed time: 723m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a014
x86_64                              defconfig
i386                                defconfig
i386                          randconfig-a012
mips                             allyesconfig
x86_64                        randconfig-a006
powerpc                          allmodconfig
i386                          randconfig-a016
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                               rhel-8.3
s390                                defconfig
x86_64                        randconfig-a013
arc                  randconfig-r043-20230106
arm                                 defconfig
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                          rhel-8.3-func
arm                  randconfig-r046-20230106
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
i386                          randconfig-a005
x86_64                           allyesconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
s390                             allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
arm                              allyesconfig
sparc64                             defconfig
powerpc                       ppc64_defconfig
sh                            titan_defconfig
ia64                             alldefconfig
powerpc                     mpc83xx_defconfig
powerpc                      ppc6xx_defconfig
powerpc                      ppc40x_defconfig
arc                              alldefconfig
m68k                        mvme147_defconfig
i386                          randconfig-c001
ia64                        generic_defconfig
nios2                            allyesconfig
sh                           sh2007_defconfig
powerpc                   currituck_defconfig
powerpc                      pasemi_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                 linkstation_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a015
hexagon              randconfig-r041-20230106
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a012
i386                          randconfig-a002
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a004
hexagon              randconfig-r045-20230106
i386                          randconfig-a006
s390                 randconfig-r044-20230106
riscv                randconfig-r042-20230106
powerpc                 xes_mpc85xx_defconfig
powerpc                          g5_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-k001
arm                          moxart_defconfig
arm                        neponset_defconfig
hexagon              randconfig-r041-20230107
hexagon              randconfig-r045-20230107
arm                  randconfig-r046-20230107
arm                       aspeed_g4_defconfig
powerpc                     mpc5200_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
