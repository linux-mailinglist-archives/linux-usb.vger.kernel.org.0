Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703F84AE968
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 06:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiBIFig (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 00:38:36 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242421AbiBIF3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 00:29:24 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA1DC03544A
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 21:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644384568; x=1675920568;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OYDmVtmiRjDuHPvcCP+8jF8Z9FcacN7C1sV7Gj+Ek4c=;
  b=DMVGc3erW0btPdmOgZ6ipBV/908dThdyRQKVSdtCJR9rh7/s6bdRHMsA
   V6wxbR3pAI/HZIaGMWamX71LOhIE3l4tGaoHc1ehH1rnom3zsba62+c6m
   F2sual6hLeZ8KHekpKKSiBYVCY3KvfIqACp0n7ekUXUO92lJsWnp+EYJl
   Y/vL0T+iKo8Zk/jNYfqOANMDrUnGEsbDRC13zPrTQ9x/rNlmyXFeXGSSn
   wYagEDAQTbrkTe59nA+9DTixyHq+Gpm647ef62osuqATj6OZN5H9N/Hr3
   ZeGj4oMmmY3Ehcf7ZFtDjSJrAmiJUWL1QuBkCx3ZW6A0AqplzKE8VWnfC
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232688958"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="232688958"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 21:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="773378243"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2022 21:29:26 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHfXh-0001GQ-UW; Wed, 09 Feb 2022 05:29:25 +0000
Date:   Wed, 09 Feb 2022 13:28:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c3c9cee592828528fd228b01d312c7526c584a42
Message-ID: <62035101.1ZjSwcdubmzIkiyk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c3c9cee592828528fd228b01d312c7526c584a42  usb: ehci: add pci device support for Aspeed platforms

elapsed time: 730m

configs tested: 123
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                    sam440ep_defconfig
arm                         cm_x300_defconfig
h8300                            alldefconfig
sh                          rsk7264_defconfig
mips                  decstation_64_defconfig
sh                           se7750_defconfig
openrisc                         alldefconfig
sparc                       sparc64_defconfig
m68k                        m5272c3_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
powerpc                     tqm8548_defconfig
sh                          urquell_defconfig
mips                     decstation_defconfig
sh                         microdev_defconfig
xtensa                  nommu_kc705_defconfig
m68k                       m5249evb_defconfig
arm                        realview_defconfig
m68k                          sun3x_defconfig
mips                        jmr3927_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          sdk7780_defconfig
powerpc                     sequoia_defconfig
sh                   rts7751r2dplus_defconfig
mips                         db1xxx_defconfig
powerpc                     tqm8541_defconfig
mips                      fuloong2e_defconfig
mips                        bcm47xx_defconfig
powerpc                       maple_defconfig
parisc                           alldefconfig
sh                           se7619_defconfig
arc                          axs103_defconfig
arm                  randconfig-c002-20220208
arm                  randconfig-c002-20220209
ia64                             allmodconfig
ia64                                defconfig
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
nios2                            allyesconfig
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
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220208
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220208
i386                          randconfig-c001
mips                 randconfig-c004-20220208
arm                  randconfig-c002-20220208
mips                        qi_lb60_defconfig
arm                          ixp4xx_defconfig
mips                      malta_kvm_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                 mpc836x_mds_defconfig
mips                        workpad_defconfig
arm                         s3c2410_defconfig
hexagon                             defconfig
powerpc                        icon_defconfig
mips                  cavium_octeon_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
arm                         hackkit_defconfig
powerpc                     mpc512x_defconfig
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208
riscv                randconfig-r042-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
