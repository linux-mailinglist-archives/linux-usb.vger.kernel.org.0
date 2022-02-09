Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F79A4AE612
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 01:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240110AbiBIAem (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 19:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240105AbiBIAel (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 19:34:41 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8BDC06157B
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 16:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644366881; x=1675902881;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rw2pi3WS0W9MzIK7OghkM75IwW/czoMvFHWvyCxMito=;
  b=ldYvtOxNw25EyRaNKdmkuMYj+pOJZLk/TMiwGaV+KFQ7MD3LmjoP/T6c
   dwFMu0dIyckS4RZyKU4t1n97EsKhrN42St+8pRUy7bXUNWMpUm46AzVNs
   vnC+VBrH+Txb9BJ69MtVTTS488ZuifnQeC9AFMU/Y5h9vv3xfkeWQ3tzF
   8f0vn9YJvNXWgxClwjZM3Cv5rYqaRknchsYdOV4aEVa5xwto+Wnaz9r8D
   xAX+I0YEtIWQgKAzhApXxy2qpAcq7/1PE2v02YMljg2nerogYyRqKm9VK
   1jpxMFhM6RD4Zy1NA9ID3T4tv4l028SGP0GQrDifVQaubpnK8+GimJy9r
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273618717"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="273618717"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 16:34:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="633036219"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2022 16:34:19 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHaw6-00010B-9n; Wed, 09 Feb 2022 00:34:18 +0000
Date:   Wed, 09 Feb 2022 08:33:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 117b4e96c7f362eb6459543883fc07f77662472c
Message-ID: <62030bf1.jIChFn9ogzpM1SdQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
branch HEAD: 117b4e96c7f362eb6459543883fc07f77662472c  usb: dwc3: gadget: Prevent core from processing stale TRBs

elapsed time: 732m

configs tested: 113
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    sam440ep_defconfig
arm                         cm_x300_defconfig
h8300                            alldefconfig
sh                          sdk7780_defconfig
sh                         apsh4a3a_defconfig
ia64                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7750_defconfig
openrisc                         alldefconfig
sparc                       sparc64_defconfig
m68k                        m5272c3_defconfig
mips                     decstation_defconfig
sh                               j2_defconfig
sh                           se7712_defconfig
arm                        mini2440_defconfig
nios2                            allyesconfig
powerpc                     taishan_defconfig
xtensa                  audio_kc705_defconfig
arm                          iop32x_defconfig
arm                      jornada720_defconfig
powerpc                     tqm8541_defconfig
mips                      fuloong2e_defconfig
mips                        bcm47xx_defconfig
xtensa                  nommu_kc705_defconfig
parisc                           alldefconfig
m68k                        m5407c3_defconfig
powerpc                     tqm8548_defconfig
sh                           se7780_defconfig
powerpc                       maple_defconfig
riscv                    nommu_k210_defconfig
sh                           se7619_defconfig
arc                          axs103_defconfig
arm                  randconfig-c002-20220208
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig

clang tested configs:
riscv                randconfig-c006-20220208
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220208
mips                 randconfig-c004-20220208
arm                  randconfig-c002-20220208
riscv                             allnoconfig
mips                        qi_lb60_defconfig
arm                          ixp4xx_defconfig
powerpc                   bluestone_defconfig
powerpc                          allyesconfig
arm                          ep93xx_defconfig
mips                      bmips_stb_defconfig
arm                        spear3xx_defconfig
arm                         hackkit_defconfig
powerpc                     mpc512x_defconfig
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208
riscv                randconfig-r042-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
