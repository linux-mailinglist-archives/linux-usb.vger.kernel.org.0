Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B22B660C50
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jan 2023 04:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236693AbjAGDwc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 22:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjAGDwa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 22:52:30 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B610C48283
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 19:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673063549; x=1704599549;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lCqAukZ4W/lZEsuH3pnjWkrzfoTWCy6Xp29dbI5RiEg=;
  b=DiNRjgPhZ6EhNfCz7B59KDOVXDsSn2T0B45n6mCdU7HACAr8ImabUaZr
   DN8mJMxkkjOQit4B6JVDtGmxO1rTpA53rkmmQ6bL6qxvqRni0zgs+mgGk
   e8orYl+GSjFifAvPcdLzL66bzypx9gJ4NqS5/Bu0erq54pEm+KbeoiuKR
   i63/+DFOSYNXkGiMP/NylsT8Trs8RqJjZIr7s8l3GZZiKf8UubymO9RaO
   /gAzFcyDrLLnvpkrkB7t9mcNtVUPPdX7Xph31+h8Nggl6PzpviMBPm3GQ
   RJ56S2JwP30RFGVDcKH56Jlv/1CW01iMdpVLIfq9KgiR0z4kB1v2gRu+p
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="387065683"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="387065683"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 19:52:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="658075850"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="658075850"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2023 19:52:27 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pE0Fu-0004Eg-13;
        Sat, 07 Jan 2023 03:52:26 +0000
Date:   Sat, 07 Jan 2023 11:52:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c4e3ef5685393c5051b52cf1e94b8891d49793ab
Message-ID: <63b8ec70.Q/Gb/VKMFzFzxQph%lkp@intel.com>
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
branch HEAD: c4e3ef5685393c5051b52cf1e94b8891d49793ab  usb: dwc3: gadget: Ignore End Transfer delay on teardown

elapsed time: 724m

configs tested: 100
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                            allnoconfig
powerpc                           allnoconfig
arm                                 defconfig
arm64                            allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
sh                               allmodconfig
arm                              allyesconfig
i386                                defconfig
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
mips                             allyesconfig
s390                                defconfig
x86_64                        randconfig-a013
i386                          randconfig-a003
powerpc                          allmodconfig
x86_64                        randconfig-a011
x86_64                           allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a015
ia64                             allmodconfig
x86_64                               rhel-8.3
i386                          randconfig-a005
i386                             allyesconfig
x86_64                           rhel-8.3-bpf
arc                  randconfig-r043-20230106
s390                             allyesconfig
i386                          randconfig-a012
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
arm                  randconfig-r046-20230106
x86_64                          rhel-8.3-func
sparc64                             defconfig
powerpc                       ppc64_defconfig
sh                            titan_defconfig
ia64                             alldefconfig
powerpc                     mpc83xx_defconfig
powerpc                      ppc6xx_defconfig
i386                          randconfig-c001
powerpc                      ppc40x_defconfig
arc                              alldefconfig
m68k                        mvme147_defconfig
powerpc                 linkstation_defconfig
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
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                           ci20_defconfig
arm                        cerfcube_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a016
i386                          randconfig-a013
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a006
hexagon              randconfig-r041-20230106
i386                          randconfig-a015
x86_64                          rhel-8.3-rust
s390                 randconfig-r044-20230106
riscv                randconfig-r042-20230106
hexagon              randconfig-r045-20230106
powerpc                 xes_mpc85xx_defconfig
powerpc                          g5_defconfig
arm                          ixp4xx_defconfig
arm                          moxart_defconfig
arm                        neponset_defconfig
x86_64                        randconfig-k001
hexagon              randconfig-r041-20230107
hexagon              randconfig-r045-20230107
arm                  randconfig-r046-20230107
arm                       aspeed_g4_defconfig
powerpc                     mpc5200_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
