Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF2568CFAC
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 07:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjBGGoI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 01:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjBGGoH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 01:44:07 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA61736FE1
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 22:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675752223; x=1707288223;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4PS7NjOE4MQvZQsDOmKByGJpjxaTJi9Mz4ruiouAjNo=;
  b=jGLD+ziRPo3CevfEtQ2MzWgPgUBmmayc7WcLgheRR3XWkUvbA1PxmgIK
   xaGCqQPZ9hXqw/NvznmiMpPtjNLnZDWPukJJqZsYZWQ6FQwCTcfdmo/Xq
   A0VzFNifVACIGIO+qy4PaqXF2gzx1XT0nCEdSlh0YeyfjyT2Wstq4HBIq
   26HAM796sWiVo0ewa+4a9PmeyR4XJqKyPDYBj8WqF5xOGeKHh2VoQKOuR
   pElQhS+qR8ZXJ5sYTbqY+r21P8PtPPL8YhG1fuo+jTjXY4AEEEpsANMu8
   Un5KJIKGLOs3MTADpaE9pwXAMVv+X8JZ+OZPMdS5c23PdsVM2TE0fVyXE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="317438994"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="317438994"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 22:43:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="666734121"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="666734121"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Feb 2023 22:43:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPHhd-0003CS-0n;
        Tue, 07 Feb 2023 06:43:41 +0000
Date:   Tue, 07 Feb 2023 14:43:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 41070a7027e9c4493791266fa38e59ded6aea7b4
Message-ID: <63e1f310.0y/KZBvQzYdG628x%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 41070a7027e9c4493791266fa38e59ded6aea7b4  usb: gadget: uvc: Correct documentation formatting

elapsed time: 722m

configs tested: 84
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64               randconfig-a013-20230206
x86_64               randconfig-a011-20230206
x86_64               randconfig-a012-20230206
sh                               allmodconfig
x86_64               randconfig-a014-20230206
x86_64                              defconfig
x86_64               randconfig-a015-20230206
x86_64               randconfig-a016-20230206
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                           allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
mips                           jazz_defconfig
sh                          r7780mp_defconfig
um                               alldefconfig
xtensa                  nommu_kc705_defconfig
m68k                         amcore_defconfig
sh                           se7705_defconfig
i386                                defconfig
m68k                          atari_defconfig
sh                         ap325rxa_defconfig
arm                                 defconfig
s390                 randconfig-r044-20230206
riscv                randconfig-r042-20230206
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
riscv                    nommu_k210_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a004-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
i386                 randconfig-a002-20230206
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                 randconfig-a005-20230206
hexagon              randconfig-r041-20230205
i386                 randconfig-a006-20230206
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
powerpc                      ppc44x_defconfig
hexagon                             defconfig
arm                  randconfig-r046-20230206
hexagon              randconfig-r045-20230205
powerpc                      obs600_defconfig
s390                 randconfig-r044-20230205
arm                         s5pv210_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                    socrates_defconfig
s390                             alldefconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
