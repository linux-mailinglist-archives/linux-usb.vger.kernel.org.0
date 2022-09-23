Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256BE5E71CE
	for <lists+linux-usb@lfdr.de>; Fri, 23 Sep 2022 04:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiIWCQa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 22:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiIWCQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 22:16:28 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0824EC570
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 19:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663899387; x=1695435387;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tTZBrqXlVRXq8FBLo1+/Hc2184wNp7voLcHWCXuEVrM=;
  b=FCsrkt7r/xF3ENN8C12mdjInP8RbNZ2RViiIKpr6C54+miK9Fj/W1q2O
   aTx2lXBRE5vZ5tYad/EQx3mwijf6sw4IHL1u7ooyVdu5y/vkC0oHzTpKo
   f09qZMsHyLmC/hpIuk6y9las76XPLwE2XYNF6m325PRl+EH82/wsqN15m
   C6zXmAlVt2YuHzfC6UE4j42Cid3xUFNgidMpL2ZVTwvGk6qR6ups0Yq3h
   KxUlk37UouvG0Bj3iDMQxRYK04LPYDhjTR0UaYtmqvXsPu6g7Ef0lyrCe
   SbsIHw7HgA6RoFlXkEF77jV1k/ucqzOPcnxl5AgmyE1yHK29E0fx4XsFM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386778082"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="386778082"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 19:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="653236923"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2022 19:16:23 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obYEp-0005CX-0Z;
        Fri, 23 Sep 2022 02:16:23 +0000
Date:   Fri, 23 Sep 2022 10:16:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ad5dbfc123e6ffbbde194e2a4603323e09f741ee
Message-ID: <632d16ed.ex1/DjDBvlH7clBA%lkp@intel.com>
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
branch HEAD: ad5dbfc123e6ffbbde194e2a4603323e09f741ee  Revert "usb: storage: Add quirk for Samsung Fit flash"

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220922
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
sh                               allmodconfig
x86_64                              defconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
x86_64                        randconfig-a013
x86_64                           allyesconfig
x86_64                        randconfig-a011
s390                             allmodconfig
i386                                defconfig
x86_64                        randconfig-a015
s390                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                             allyesconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
arm                                 defconfig
powerpc                      tqm8xx_defconfig
csky                             alldefconfig
sh                           se7705_defconfig
xtensa                    smp_lx200_defconfig
mips                             allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220922
riscv                randconfig-r042-20220922
hexagon              randconfig-r045-20220922
s390                 randconfig-r044-20220922
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
mips                     loongson1c_defconfig
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
