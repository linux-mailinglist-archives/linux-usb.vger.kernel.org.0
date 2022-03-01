Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933204C8812
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 10:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbiCAJf1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 04:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233919AbiCAJfB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 04:35:01 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52F212AE3
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 01:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646127253; x=1677663253;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1lazZsnkDEap7+DHENQEjmme8b2+XOrt8ir1SQOHsYY=;
  b=CDWk8yop4r8++MBhEiYrC3rxlcRkpfGPMIHeqp0MAjyFwGIk9WVrw59U
   Az7EsH0yZKq7ZfEYi/kPOAHV/gxhHUrThqR2AmpJXYy4jIJFPgRk6vpPA
   qL/nEQxuJPUMWOVhSeAIQZGWL4McrSCbEdO7yxufmwKVDPQhhc6vr808B
   7GDnKes6BLJUQnoMFfAbUtd3qUXnPcG6dchYkazXAFraHWj5eZQDqmFn3
   Q5msRk+/aFUFv6ZgHJFGJFklH+MXkHtqzcho2ZTew4k10YfCwGoI5O1Ip
   g+DmoBNGaz518+w7IXWaayFsrDcvUQl8GzuRqDqfTKHP8OPtv8Wa4r8pf
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="252830728"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; 
   d="scan'208";a="252830728"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 01:34:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; 
   d="scan'208";a="507741345"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Mar 2022 01:34:09 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOytU-0000En-Eo; Tue, 01 Mar 2022 09:34:08 +0000
Date:   Tue, 01 Mar 2022 17:33:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ca9400ef7f6793288db95ca658dede6e71e777d6
Message-ID: <621de879.bdBEJcZx3P3P+nBI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ca9400ef7f6793288db95ca658dede6e71e777d6  Merge 5.17-rc6 into usb-next

elapsed time: 728m

configs tested: 157
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220228
arc                        vdk_hs38_defconfig
powerpc                      pasemi_defconfig
m68k                       m5249evb_defconfig
parisc                              defconfig
arc                 nsimosci_hs_smp_defconfig
mips                             allyesconfig
h8300                       h8s-sim_defconfig
nios2                         10m50_defconfig
mips                           jazz_defconfig
parisc                generic-32bit_defconfig
powerpc                      bamboo_defconfig
arc                        nsim_700_defconfig
arm                        keystone_defconfig
mips                            gpr_defconfig
mips                         rt305x_defconfig
sh                         ecovec24_defconfig
arm                        multi_v7_defconfig
sh                        sh7785lcr_defconfig
sh                          rsk7269_defconfig
arc                     nsimosci_hs_defconfig
arm                          badge4_defconfig
sh                          landisk_defconfig
sh                          r7785rp_defconfig
arc                            hsdk_defconfig
m68k                        mvme16x_defconfig
arm                         axm55xx_defconfig
m68k                       m5275evb_defconfig
arm                        mini2440_defconfig
sparc64                          alldefconfig
powerpc                     sequoia_defconfig
sh                           se7619_defconfig
powerpc                      ppc6xx_defconfig
arc                          axs103_defconfig
arm                        oxnas_v6_defconfig
xtensa                       common_defconfig
openrisc                         alldefconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
arm                  randconfig-c002-20220301
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a011-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a012-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a016-20220228
i386                 randconfig-a016-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a011-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a014-20220228
arc                  randconfig-r043-20220228
arc                  randconfig-r043-20220227
riscv                randconfig-r042-20220228
s390                 randconfig-r044-20220228
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                          allyesconfig
mips                           mtx1_defconfig
riscv                    nommu_virt_defconfig
powerpc                     powernv_defconfig
mips                           rs90_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
arm                       cns3420vb_defconfig
arm                        neponset_defconfig
mips                           ip28_defconfig
arm                        mvebu_v5_defconfig
arm                          imote2_defconfig
powerpc                  mpc885_ads_defconfig
riscv                             allnoconfig
mips                      maltaaprp_defconfig
arm                           omap1_defconfig
mips                        omega2p_defconfig
x86_64               randconfig-a003-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a002-20220228
x86_64               randconfig-a006-20220228
x86_64               randconfig-a001-20220228
x86_64               randconfig-a004-20220228
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220227
hexagon              randconfig-r041-20220228
riscv                randconfig-r042-20220227
s390                 randconfig-r044-20220227
hexagon              randconfig-r045-20220227
hexagon              randconfig-r045-20220228
hexagon              randconfig-r045-20220301
hexagon              randconfig-r041-20220301
riscv                randconfig-r042-20220301

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
