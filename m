Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043E95AB4A3
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 17:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236864AbiIBPER (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 11:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237367AbiIBPD7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 11:03:59 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D093C5FF44
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662129242; x=1693665242;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=optJifeKryLRNZKlyFdfyt1rKh1CpwsBzaiYkJGllcY=;
  b=JBfMsRrQUK31IqC14WRNTapUhzpHYqB2E5NhQ1P1YDgZDGoucXnFMyyA
   6ZNwdulubWe6q4O0ArqN3i4/dbyUEvZlwYiZp9K8coqZTALrIJee5T3Bb
   kZLjxhfAg2D8qYZnaOy0/TIuLwF/gr3QiasS8KwWSpC4wzVQwNRjLrvsa
   MVdNnryHHEiGQ/CPMX953LFTBTPuGEhNSgIpnEHUGG8k7ZvNxFOBQ96mO
   qdKIrkhzJeAv+qd6jkbZtPYqsEgLBgJQfsCo8pHb4zToXyb/m0lnByXzV
   dXoCko6xGCIq8pBGo/GsISB5PtE0AYaZGwIptPmDmFoCplzjZ38nF0zpD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="295999640"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="295999640"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 07:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="563979333"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Sep 2022 07:33:53 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oU7k0-0000Bv-1c;
        Fri, 02 Sep 2022 14:33:52 +0000
Date:   Fri, 02 Sep 2022 22:33:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 4e55e22d3d9aa50ef1ba059bf3a53aa61109c179
Message-ID: <63121443.NP1lO5I6M3DaTquC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 4e55e22d3d9aa50ef1ba059bf3a53aa61109c179  USB: hcd-pci: Drop the unused id parameter from usb_hcd_pci_probe()

Warning reports:

https://lore.kernel.org/linux-usb/202208310007.6yJMsSYz-lkp@intel.com
https://lore.kernel.org/llvm/202208310216.5IOl43es-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/host/ehci-npcm7xx.c:27:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ehci-orion.c:68:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
drivers/usb/host/ehci-platform.c:56:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
drivers/usb/host/ohci-s3c2410.c:42:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ohci-spear.c:26:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]

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
|-- x86_64-allmodconfig
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
`-- x86_64-randconfig-a002
    |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
    `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
clang_recent_errors
|-- i386-randconfig-a002
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- i386-randconfig-a011
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- i386-randconfig-a015
|   `-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|-- riscv-randconfig-r026-20220901
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- s390-randconfig-r022-20220901
|   |-- drivers-usb-host-ehci-npcm7xx.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-orion.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-s3c2410.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-spear.c:warning:unused-variable-hcd_name
|-- s390-randconfig-r044-20220901
|   |-- drivers-usb-host-ehci-exynos.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-npcm7xx.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-orion.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|-- x86_64-randconfig-a003
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- x86_64-randconfig-a012
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- x86_64-randconfig-a014
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
`-- x86_64-randconfig-a016
    |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
    `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name

elapsed time: 1454m

configs tested: 53
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
m68k                             allyesconfig
m68k                             allmodconfig
i386                          randconfig-a016
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                               rhel-8.3
x86_64                        randconfig-a013
arc                  randconfig-r043-20220901
x86_64                        randconfig-a011
x86_64                        randconfig-a004
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                        randconfig-a006
i386                             allyesconfig
x86_64                           allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220901
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
riscv                randconfig-r042-20220901
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220901
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
s390                 randconfig-r044-20220901

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
