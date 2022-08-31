Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 539625A73D2
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 04:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiHaCRC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 22:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbiHaCQ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 22:16:59 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EE085F92
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 19:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661912218; x=1693448218;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5qp4up+QhvSqMCYCRaCwRljhKrrUwcuTcWqft48gekA=;
  b=FBmO3hkUQzrqA6dfMfY9EkYmGyP46sF15Y/NVSsKjbGIKuVxeBnC5RK1
   /xsGWjNAZ9GOuEmJBfUvtecCnygoQb8cY32KP0Kg+wxq4xeIEpg2q8PW5
   M5h/v3sk+49G8IBNXeVDiu5qKYL4RnTB23bXjAbnnBcK9GgrYhbkCiMDt
   atikX7Dc2AmwNKW57hJzhcxfWucwlIq0RHnCHXlpWqYmzOz42egrl7Aqc
   DcFp4wP0NB7i5rs/fOiVEU7MUr3nzlF4e0GGU9oLQMRyx2lPjEXE/ChBm
   VsQjNFHJ1RnEGTLd6urmKTgz4vxAG3M0a4zzElhWmj7OMc44mKzOBDvua
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="359312685"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="359312685"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 19:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="588869912"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2022 19:16:47 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTDHa-0000sJ-1h;
        Wed, 31 Aug 2022 02:16:46 +0000
Date:   Wed, 31 Aug 2022 10:15:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 594b9411b4adceb59ca8a66997eec1eaa3756785
Message-ID: <630ec452.DQQWgJk6GkcY9ypE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 594b9411b4adceb59ca8a66997eec1eaa3756785  usbip: add USBIP_URB_* URB transfer flags

Warning reports:

https://lore.kernel.org/linux-usb/202208310007.6yJMsSYz-lkp@intel.com
https://lore.kernel.org/llvm/202208310216.5IOl43es-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/host/ehci-exynos.c:35:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
drivers/usb/host/ehci-platform.c:56:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- i386-randconfig-a001
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- i386-randconfig-a003
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- i386-randconfig-a012
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- i386-randconfig-a014
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- i386-randconfig-s001
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- i386-randconfig-s003
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
`-- x86_64-randconfig-a002
    |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
    `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
clang_recent_errors
|-- arm-s5pv210_defconfig
|   |-- drivers-usb-host-ehci-exynos.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-exynos.c:warning:unused-variable-hcd_name
|-- hexagon-randconfig-r024-20220830
|   |-- drivers-usb-host-ehci-atmel.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-exynos.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-orion.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-spear.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- hexagon-randconfig-r036-20220830
|   |-- drivers-usb-host-ehci-atmel.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-npcm7xx.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-st.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-at91.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-s3c2410.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-spear.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-st.c:warning:unused-variable-hcd_name
|-- i386-randconfig-a002
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- i386-randconfig-a011
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- i386-randconfig-a015
|   `-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|-- powerpc-randconfig-r013-20220830
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- x86_64-randconfig-a003
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- x86_64-randconfig-a012
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- x86_64-randconfig-a014
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- x86_64-randconfig-a016
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
`-- x86_64-randconfig-k001
    |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
    `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name

elapsed time: 721m

configs tested: 90
configs skipped: 2

gcc tested configs:
arc                  randconfig-r043-20220830
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a002
sh                               allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a013
i386                          randconfig-a001
x86_64                           allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a003
i386                          randconfig-a005
ia64                             allmodconfig
i386                                defconfig
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                          randconfig-a014
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sparc                             allnoconfig
sh                           se7721_defconfig
sh                        edosk7760_defconfig
m68k                            mac_defconfig
arm                     eseries_pxa_defconfig
powerpc                 mpc8540_ads_defconfig
xtensa                    smp_lx200_defconfig
arm                          lpd270_defconfig
openrisc                         alldefconfig
loongarch                           defconfig
loongarch                         allnoconfig
xtensa                  cadence_csp_defconfig
x86_64                           alldefconfig
arm                         nhk8815_defconfig
arm                      integrator_defconfig
sh                          kfr2r09_defconfig
arm                         cm_x300_defconfig
nios2                            alldefconfig
openrisc                  or1klitex_defconfig
i386                          randconfig-c001
sparc                               defconfig
mips                      loongson3_defconfig
m68k                       m5475evb_defconfig
xtensa                  nommu_kc705_defconfig
mips                       bmips_be_defconfig
arc                        nsim_700_defconfig
microblaze                      mmu_defconfig
arm                        realview_defconfig
ia64                      gensparse_defconfig

clang tested configs:
riscv                randconfig-r042-20220830
hexagon              randconfig-r045-20220830
hexagon              randconfig-r041-20220830
s390                 randconfig-r044-20220830
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
i386                          randconfig-a013
x86_64                        randconfig-a014
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-k001
arm                         s5pv210_defconfig
powerpc                     tqm8560_defconfig
mips                     loongson2k_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
