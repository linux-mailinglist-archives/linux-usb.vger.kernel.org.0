Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCFD4DAEA8
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 12:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355246AbiCPLLN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 07:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244894AbiCPLLN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 07:11:13 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD2A63BFA
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 04:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647428999; x=1678964999;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D6csiTo8kZ9mxSR3NDqw2OoIe06udlmqVrTRfAh00RI=;
  b=nvQDmCc4YKNX3voZfaqHYxsyiFyfUbpVh7abS4q7gqBaMNy3ovs6K2Av
   ukfRa+mfHJE1v/LgN21xlK2bzADUVIKCP2rXOJ6LLJpmcSCLPJcN70aWo
   d3eoTdNzaLDjz2RWLDeoQ23is00GE/330nPLqe/dSXZH6sGYA8wp9YTWg
   xgWuTbXNXd8W3mRmdqC3MGR5/Y4USoJ+j6FaJP2ISJHEs8mb4aYOYxuFj
   UaQL4H0jb/21P3flSA4HvktcHQdkcqyztkNey0nTVZAQx6wx87OU347F9
   LmD4a3buHdXw8du7+hTAxG+Kp7Piq7LDtBUfhcPyQCzfhdcscwO4xEUS8
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281331592"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="281331592"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 04:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="498393235"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Mar 2022 04:09:58 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nURXR-000CIk-Aa; Wed, 16 Mar 2022 11:09:57 +0000
Date:   Wed, 16 Mar 2022 19:09:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 16b1941eac2bd499f065a6739a40ce0011a3d740
Message-ID: <6231c566.1te76Yge+5MnXMMh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 16b1941eac2bd499f065a6739a40ce0011a3d740  usb: gadget: Fix use-after-free bug by not setting udc->dev.driver

elapsed time: 729m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220314
mips                 randconfig-c004-20220314
i386                          randconfig-c001
powerpc                 mpc834x_itx_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
mips                        vocore2_defconfig
powerpc64                           defconfig
mips                  decstation_64_defconfig
sh                          landisk_defconfig
powerpc                    amigaone_defconfig
h8300                            alldefconfig
sh                          rsk7201_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
arm                          pxa910_defconfig
sparc                            alldefconfig
openrisc                 simple_smp_defconfig
powerpc                     pq2fads_defconfig
sh                        sh7763rdp_defconfig
sh                     sh7710voipgw_defconfig
mips                           ci20_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a006-20220314
x86_64               randconfig-a001-20220314
arc                  randconfig-r043-20220313
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
arc                  randconfig-r043-20220314
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220313
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220313
riscv                randconfig-c006-20220313
mips                 randconfig-c004-20220313
i386                          randconfig-c001
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_mds_defconfig
mips                      maltaaprp_defconfig
powerpc                          g5_defconfig
powerpc                     skiroot_defconfig
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
