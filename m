Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 300524B337C
	for <lists+linux-usb@lfdr.de>; Sat, 12 Feb 2022 07:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbiBLGid (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Feb 2022 01:38:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbiBLGic (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Feb 2022 01:38:32 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADCE275CB
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 22:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644647910; x=1676183910;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eT8stuQqC6WiMW5IW8cqOXLU703kbhhUkw+hJM2FR/0=;
  b=RlOyQckBFckkx43avbBR0b5SvhTVFC0fMnMkggesFgc45mTPTQeY/QeC
   aQr8dBjtS4cjqwlxmLsJjXLycne2hy5UnYSVDrlh34xcTwogOb+IfbhNC
   Sy6hclx3rXOzulZ/GLwAjIYz9CMxNDExNHeG3svnqdR1ivHkeXu3yBOmf
   ycPC8upniyaSWrYncZN2A3J01Wk+JkYD8VLaqO3+sw3jaMyBp81acwOjR
   LkN6+of47d4GL/iW+p6dCOsaVPCsVEvWU6GnCL33I0snNI4J6E0OgS0Za
   MJnrSsVpgxsW3MFDKrPTd/JwqaJec54l43a4M541WchAp0L/0pbVjTAWM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="274421283"
X-IronPort-AV: E=Sophos;i="5.88,363,1635231600"; 
   d="scan'208";a="274421283"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 22:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,363,1635231600"; 
   d="scan'208";a="542382635"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Feb 2022 22:38:28 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nIm39-0005kh-L3; Sat, 12 Feb 2022 06:38:27 +0000
Date:   Sat, 12 Feb 2022 14:37:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD REGRESSION
 c1dd10c681cd661aae7926630b3f3b0f26fc1cd5
Message-ID: <620755b8.FI3oVDKBVw6lLHyj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c1dd10c681cd661aae7926630b3f3b0f26fc1cd5  Merge tag 'usb-serial-5.17-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

possible Error/Warning in current branch (please contact us if interested):

drivers/usb/dwc2/drd.c:133:14: error: 'struct dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?
drivers/usb/dwc2/drd.c:133:28: error: 'struct dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-a001
|   `-- drivers-usb-dwc2-drd.c:error:struct-dwc2_hsotg-has-no-member-named-enabled
|-- i386-randconfig-a012
|   `-- drivers-usb-dwc2-drd.c:error:struct-dwc2_hsotg-has-no-member-named-enabled
|-- microblaze-randconfig-r015-20220211
|   `-- drivers-usb-dwc2-drd.c:error:struct-dwc2_hsotg-has-no-member-named-enabled
|-- openrisc-randconfig-r011-20220211
|   `-- drivers-usb-dwc2-drd.c:error:struct-dwc2_hsotg-has-no-member-named-enabled
|-- parisc-randconfig-c003-20220211
|   `-- drivers-usb-dwc2-drd.c:error:struct-dwc2_hsotg-has-no-member-named-enabled
`-- x86_64-randconfig-a002
    `-- drivers-usb-dwc2-drd.c:error:struct-dwc2_hsotg-has-no-member-named-enabled

elapsed time: 723m

configs tested: 110
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                      chrp32_defconfig
xtensa                    xip_kc705_defconfig
openrisc                            defconfig
mips                          rb532_defconfig
powerpc                    adder875_defconfig
arm                        shmobile_defconfig
sh                          sdk7780_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                               alldefconfig
sh                        sh7757lcr_defconfig
powerpc                           allnoconfig
arm                           u8500_defconfig
mips                        bcm47xx_defconfig
ia64                      gensparse_defconfig
arm                          simpad_defconfig
powerpc                   motionpro_defconfig
sh                        edosk7760_defconfig
arm                       aspeed_g5_defconfig
arm                           viper_defconfig
sh                          rsk7203_defconfig
arc                      axs103_smp_defconfig
mips                           ci20_defconfig
arm                  randconfig-c002-20220211
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
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
arm                       imx_v4_v5_defconfig
mips                          ath79_defconfig
mips                      malta_kvm_defconfig
arm                         bcm2835_defconfig
arm                      tct_hammer_defconfig
arm                         s3c2410_defconfig
powerpc                      katmai_defconfig
powerpc                      ppc44x_defconfig
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220211
hexagon              randconfig-r041-20220211
riscv                randconfig-r042-20220211

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
