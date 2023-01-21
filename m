Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6EEC67697C
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 21:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjAUU7t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Jan 2023 15:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjAUU7s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Jan 2023 15:59:48 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6241E1E0
        for <linux-usb@vger.kernel.org>; Sat, 21 Jan 2023 12:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674334787; x=1705870787;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vIgL2FIrSRnS1p4nur0Lko5tR1BW48q5LNMTb97HdDg=;
  b=C47BniH2Fd2+EizJRP4MefVXyOFZsQbmGpIX/JgviYhngDmf4p+Yk1dC
   nVXPDJK/MegMIolV9HM28ECobvmuE+jSicVNjoM1wy1DfECrjqO6/f0eQ
   NUJb4bHV12iAi4NPQkr10J3GhhxTlspsDIIyHymCG8yt29MF8QX/B/ieY
   52fU05l/aiQn1TOC6Gt7iFrZnH3wAWXYtVwplKVGodyOrNXLpptUycutk
   KgYZ11ASOqLNUMo9KwPTDw2z4Bpyg/Kn8p9/mXdYqVgc1bnXBD+KnO7DO
   SSLYT2Zjtf6nj4yIY/gN2+t4fFl27EondEP42EbIgEk+D9lDBwezUtoAQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="388189407"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="388189407"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 12:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="729504967"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729504967"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 12:59:45 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJKxl-0004TY-0G;
        Sat, 21 Jan 2023 20:59:45 +0000
Date:   Sun, 22 Jan 2023 04:59:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 14ff7460bb58662d86aa50298943cc7d25532e28
Message-ID: <63cc523c.MUjhqBbHAGD5xlKc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 14ff7460bb58662d86aa50298943cc7d25532e28  USB: misc: iowarrior: fix up header size for USB_DEVICE_ID_CODEMERCS_IOW100

elapsed time: 720m

configs tested: 92
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
arc                                 defconfig
m68k                             allyesconfig
alpha                               defconfig
i386                                defconfig
m68k                             allmodconfig
sh                               allmodconfig
arc                              allyesconfig
i386                          randconfig-a001
alpha                            allyesconfig
i386                          randconfig-a003
mips                             allyesconfig
arm                  randconfig-r046-20230119
s390                             allmodconfig
s390                                defconfig
powerpc                          allmodconfig
arm                                 defconfig
arc                  randconfig-r043-20230119
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a002
i386                          randconfig-a005
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a014
x86_64                               rhel-8.3
x86_64                           rhel-8.3-bpf
i386                          randconfig-a012
i386                             allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a016
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
sparc                       sparc32_defconfig
arm                           stm32_defconfig
arm64                            alldefconfig
arm                          exynos_defconfig
sh                        sh7757lcr_defconfig
sh                         ap325rxa_defconfig
alpha                            alldefconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arc                        vdk_hs38_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    klondike_defconfig
sh                        sh7763rdp_defconfig
ia64                         bigsur_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      arches_defconfig
sh                        dreamcast_defconfig
mips                             allmodconfig
sh                  sh7785lcr_32bit_defconfig
sh                         ecovec24_defconfig
sh                          urquell_defconfig
m68k                       bvme6000_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20230119
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a006
riscv                randconfig-r042-20230119
x86_64                        randconfig-a003
hexagon              randconfig-r041-20230119
i386                          randconfig-a015
s390                 randconfig-r044-20230119
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                        mvebu_v5_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
