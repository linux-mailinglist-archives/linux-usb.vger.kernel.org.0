Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358634BB0F4
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 05:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbiBREyc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 23:54:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiBREya (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 23:54:30 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A933E6580
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 20:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645160054; x=1676696054;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=98ZS671FfQTybw9CKCJr9/FVCUTUcR8sn4Ao/bYZFrY=;
  b=a07dJsZReYRClZP90xzxmaN5Z64fgZqaLJZ0aPKyJ5gOKVpLEOYRQIfl
   uLRAthepbCQ2kRTBMw4PLz5AkL6F53AwNJnJhuSjxC3miReMkUX0PpL5X
   LjWokexcCSbSBfjgx58sdZZUFRKHJ37lzLwU0BUYQYIyV/TbRwpIaGnnF
   eVTfm0CzTe5IzKFVAbUp2Np0T43t6hMx/OYynNO+PYPeQ2dvgnBxvalrI
   kR/oBOp9vtqn0Vz/bfZ+AmVo3Ck3wWqdFZ/DihAzWtI4t3A6rKagdeCw2
   lZZoaRvyenCewjFXHmFb0NNqsTGVctLLKFrZ2D2lei+JyP7G+Kx7qqLTd
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231034153"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="231034153"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 20:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="503856614"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Feb 2022 20:54:12 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKvHY-0000xJ-5i; Fri, 18 Feb 2022 04:54:12 +0000
Date:   Fri, 18 Feb 2022 12:53:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 32fde84362c40961726a5c91f35ad37355ccc0c6
Message-ID: <620f2635.40G23eUsMEJgFeZX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 32fde84362c40961726a5c91f35ad37355ccc0c6  usb: dwc2: drd: fix soft connect when gadget is unconfigured

elapsed time: 727m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                       omap2plus_defconfig
powerpc                       ppc64_defconfig
arm                           viper_defconfig
powerpc                       maple_defconfig
sh                         microdev_defconfig
mips                  decstation_64_defconfig
parisc                generic-32bit_defconfig
m68k                            mac_defconfig
ia64                         bigsur_defconfig
powerpc                        cell_defconfig
xtensa                    xip_kc705_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                       eiger_defconfig
h8300                               defconfig
microblaze                      mmu_defconfig
m68k                       m5475evb_defconfig
arm                        spear6xx_defconfig
arm                            lart_defconfig
sh                            titan_defconfig
h8300                            alldefconfig
arm                             pxa_defconfig
powerpc64                           defconfig
powerpc                    klondike_defconfig
sh                               j2_defconfig
powerpc                 mpc8540_ads_defconfig
sh                     sh7710voipgw_defconfig
powerpc                      pasemi_defconfig
arm                           h5000_defconfig
arm                          pxa3xx_defconfig
ia64                          tiger_defconfig
m68k                           sun3_defconfig
powerpc                      makalu_defconfig
m68k                       m5208evb_defconfig
arm                             ezx_defconfig
sparc                       sparc32_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20220217
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220217
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220217
arm                  randconfig-c002-20220217
i386                          randconfig-c001
mips                 randconfig-c004-20220217
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220217
hexagon              randconfig-r041-20220217
riscv                randconfig-r042-20220217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
