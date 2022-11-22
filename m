Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43BF26334BD
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 06:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbiKVFjD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 00:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiKVFjB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 00:39:01 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F8B21274
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 21:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669095540; x=1700631540;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5hRvZhGSyfGW+L2fCVWVzsm4LkwkozSiYCd9oqOz5hY=;
  b=TVGk2lwjRQD4h0TB5SKQg0ZL2TIMVXIHh0TVgipMktBjgRMrC/ruxClG
   KpR96YWpZDBVgOytQUcwlRGkQGSIQtmgo33AS3NOt4Ez6bHveoQKYZZUX
   6e0LQe7wN6r+SQrP3tumEQiCRdevN93vyseT10fKnWLaxAuQXgPIVw9BI
   qznFhKuTRlgzTgTD7KyKwRaVQ2Cf66cteAqqqPugWjDGYvl+0w7MtoNkY
   Gh9AC1Aiy8zZa9dxiZVNjR/7h9EQk/K2YDEHiJtTCV4Ii2FajkPYsuYF0
   pMG4ESh9HdbnJquz55bErSbDmGqcVl4QaL0CqvaekFR291eOBzkLxfOr8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="377995701"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="377995701"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 21:38:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="641293304"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="641293304"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2022 21:38:58 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxLzl-00017L-1J;
        Tue, 22 Nov 2022 05:38:57 +0000
Date:   Tue, 22 Nov 2022 13:38:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d9c3b34d3b3af22d548007d5d36e83ad12140ee7
Message-ID: <637c6064.b6XqxtFN9J1r4tlF%lkp@intel.com>
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
branch HEAD: d9c3b34d3b3af22d548007d5d36e83ad12140ee7  Merge 6.1-rc6 into usb-next

elapsed time: 1171m

configs tested: 116
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                            allnoconfig
s390                 randconfig-r044-20221121
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221121
arc                                 defconfig
sh                        sh7763rdp_defconfig
m68k                            q40_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      footbridge_defconfig
powerpc                       eiger_defconfig
alpha                               defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
s390                             allmodconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64               randconfig-a011-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a012-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a015-20221121
s390                             allyesconfig
m68k                          hp300_defconfig
arm                        realview_defconfig
powerpc                    sam440ep_defconfig
sh                         ap325rxa_defconfig
i386                 randconfig-a014-20221121
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a012-20221121
i386                 randconfig-a015-20221121
i386                          randconfig-c001
arm                            hisi_defconfig
sh                          sdk7786_defconfig
sparc                       sparc64_defconfig
sh                          rsk7264_defconfig
sh                           se7712_defconfig
arc                              allyesconfig
m68k                        m5272c3_defconfig
arm                         nhk8815_defconfig
mips                           jazz_defconfig
powerpc                      ep88xc_defconfig
m68k                       m5249evb_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                           sama5_defconfig
m68k                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                           tb10x_defconfig
mips                          rb532_defconfig
powerpc                      bamboo_defconfig
sh                               alldefconfig
m68k                        m5307c3_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
csky                                defconfig
x86_64                                  kexec
arc                  randconfig-r043-20221120
powerpc                     tqm8541_defconfig
powerpc                     asp8347_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64               randconfig-a002-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a004-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a003-20221121
powerpc                    mvme5100_defconfig
arm                         bcm2835_defconfig
arm                         lpc32xx_defconfig
i386                 randconfig-a001-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a006-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a002-20221121
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                    gamecube_defconfig
powerpc                  mpc866_ads_defconfig
arm                        neponset_defconfig
powerpc                     ksi8560_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
