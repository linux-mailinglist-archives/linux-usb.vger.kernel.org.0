Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE7E5F2332
	for <lists+linux-usb@lfdr.de>; Sun,  2 Oct 2022 14:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiJBMke (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Oct 2022 08:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJBMkd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Oct 2022 08:40:33 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F4727DE8
        for <linux-usb@vger.kernel.org>; Sun,  2 Oct 2022 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664714432; x=1696250432;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3oyzjKD4L7KPYEPFvxEm1POW/rEvcryOY6OTuFsZzZY=;
  b=MQF5zTI1qCuJnHA2luiAZ8k8CTGg1OrLvfXGjxEH7HlhN+6EBZICc6gS
   zqGUj/963EAK+PwxOVql10TkKBQl+8FC+WI2yKNmrMkrpgapmTnXnlcfO
   Eb3yb7AI4u9t7vOStOJDnRpOikZuBrIfn9LsI59v8zV9ww57xXX3jsgS5
   elPvqEGfn+Kjjbb7pfN3OD6nqq1896wu28+TF0PcXCVDP2NlRJH8pUNlr
   mE2UpKeFV+MXz4Gi5oKbS1EuqmFZxyX9RaVPOs2wIyk/nGNkKtLpUp+Pd
   RcSsumxLVXhsGSm0NF0nwsBvM7M/p0tUYW5cNZJOfN1ZY0UcMFNahQWXx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="366520310"
X-IronPort-AV: E=Sophos;i="5.93,363,1654585200"; 
   d="scan'208";a="366520310"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2022 05:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="691776288"
X-IronPort-AV: E=Sophos;i="5.93,363,1654585200"; 
   d="scan'208";a="691776288"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Oct 2022 05:40:30 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oeyGk-0003Zt-0t;
        Sun, 02 Oct 2022 12:40:30 +0000
Date:   Sun, 02 Oct 2022 20:40:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 00988f70a0763f14c97c4c0df76fb9aa4959e953
Message-ID: <633986b5.ukp8SzXiwgGvhxbR%lkp@intel.com>
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
branch HEAD: 00988f70a0763f14c97c4c0df76fb9aa4959e953  Merge tag 'usb-serial-6.0-rc8' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 1200m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
i386                                defconfig
x86_64                              defconfig
s390                                defconfig
arc                  randconfig-r043-20220926
x86_64                           rhel-8.3-syz
i386                          randconfig-a001
x86_64                         rhel-8.3-kunit
i386                          randconfig-a003
x86_64                           rhel-8.3-kvm
s390                             allmodconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221002
x86_64                        randconfig-a011
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
arm                                 defconfig
m68k                             allyesconfig
x86_64                        randconfig-a015
mips                             allyesconfig
x86_64               randconfig-a002-20220926
x86_64                        randconfig-a004
x86_64                               rhel-8.3
i386                          randconfig-a005
x86_64               randconfig-a004-20220926
i386                          randconfig-a014
x86_64                        randconfig-a002
powerpc                          allmodconfig
s390                             allyesconfig
x86_64               randconfig-a006-20220926
x86_64               randconfig-a001-20220926
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64               randconfig-a003-20220926
x86_64                           allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a005-20220926
arc                              allyesconfig
m68k                             allmodconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                             pxa_defconfig
xtensa                         virt_defconfig
powerpc                     asp8347_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
csky                                defconfig
m68k                       m5475evb_defconfig
mips                           ip32_defconfig
arm                            lart_defconfig
arm                         lpc18xx_defconfig
powerpc                  storcenter_defconfig
i386                          randconfig-c001
openrisc                       virt_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220926
riscv                randconfig-r042-20220926
hexagon              randconfig-r041-20221002
x86_64                        randconfig-a012
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20221002
i386                          randconfig-a002
s390                 randconfig-r044-20220926
i386                          randconfig-a004
i386                          randconfig-a013
riscv                randconfig-r042-20221002
x86_64                        randconfig-a016
s390                 randconfig-r044-20221002
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a005
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
