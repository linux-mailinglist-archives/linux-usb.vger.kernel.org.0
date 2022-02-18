Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557D34BB0F1
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 05:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiBRExd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 23:53:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiBRExa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 23:53:30 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE5B2DC8
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 20:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645159994; x=1676695994;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Qp38UXysFhnbWQIYhohKy0/9dtu+61Pw3SYleEa4DSA=;
  b=M/QLz7sEjECRpOU3wV5ZfLJdaaWzXuSKzZixYW4aGy8/fTtasIbZ9Fsp
   UTyOIWUf6JgFLe/mT/WTtn+qzv7IERlHLmjpf+aQUmih+he399Clb5LV6
   eujVxrRdBBUE1uV4DMQ2GpuRC7O9rkY7Gwyts2eFjlomtAdMGUzr13wYD
   T44svUJUFR9SdaQO28oHzz+uuDXpIC09xJMEYNy8MiuUblQgnHxJcDFZl
   cNZTdhZ65xMebX9dN8TP6OqycPkG/lKUSw9GxVqg6wQtT3YGF/sZI/Njo
   tOqrG9T4G8WZecUExhKZYTpwsgslqsS/YUm0Wc/4WiG23MVZcMG5EtKjX
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="234582023"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="234582023"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 20:53:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="705217523"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Feb 2022 20:53:12 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKvGa-0000wz-35; Fri, 18 Feb 2022 04:53:12 +0000
Date:   Fri, 18 Feb 2022 12:53:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a5d847b0afd317df1ed0e3b72fbef72ce4824532
Message-ID: <620f262e.58XXcVAfwwlNQb92%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: a5d847b0afd317df1ed0e3b72fbef72ce4824532  usb: dwc3: pci: Also apply Bay Trail GPIO mappings to ulpi-device

elapsed time: 726m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
riscv                            allyesconfig
xtensa                  nommu_kc705_defconfig
powerpc                       maple_defconfig
ia64                            zx1_defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
arc                      axs103_smp_defconfig
arm                            lart_defconfig
h8300                            alldefconfig
arm                        spear6xx_defconfig
sh                            titan_defconfig
m68k                       m5475evb_defconfig
powerpc                      pasemi_defconfig
arc                    vdk_hs38_smp_defconfig
x86_64                           alldefconfig
mips                           xway_defconfig
xtensa                  audio_kc705_defconfig
arm                  randconfig-c002-20220217
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
arc                  randconfig-r043-20220217
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                           allyesconfig
arm                     davinci_all_defconfig
powerpc                      ppc64e_defconfig
mips                      maltaaprp_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220217
hexagon              randconfig-r041-20220217
riscv                randconfig-r042-20220217
s390                 randconfig-r044-20220217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
