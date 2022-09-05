Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFBE05AD8FB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 20:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbiIESYM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 14:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232263AbiIESXs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 14:23:48 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CCF24BD6
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662402226; x=1693938226;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iVZXXJ1Ezg+WEIxdTu8fYATgtvOCvaUnqVvnQFh7/jw=;
  b=gugXFgi2ORKHwbRwABSbt3W8Qf8Fd4JbOBfeno+9v5nCR0cP6VmMqk91
   ZuFZOhKUKhZ3LGwBvd3FNIHtb7BfJM6LUArxxH7GH+CLdW5NStGcdymn4
   oDuPNb71n3masbpszgToT6aI/LWU0lJP+KWcsTIoHV0tAKlkxm14jekHq
   24ybvphseOxtjWnkQiHzReJq724Ll3hvsKQtsLCLDy63JXdmkG8c65VnA
   Ew2G95IMCVLzfU1HYMTY2P6O7YlfJkhvte4flbyq2Zpg0vqfUxy7JytlO
   AlDf9+jb4YTz+KcPLsp/YwsHOPyOfVb5Q4D3oa+hhxJgFzEi9KaP2q30Y
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="276832276"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="276832276"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 11:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="590997040"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2022 11:23:45 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oVGl6-0004QD-1j;
        Mon, 05 Sep 2022 18:23:44 +0000
Date:   Tue, 06 Sep 2022 02:23:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS WITH WARNING
 a956f91247da3fe71e4d5f7da1f6dd8bae7c3c21
Message-ID: <63163e9c.sSqe8BMEsxMpwDUm%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: a956f91247da3fe71e4d5f7da1f6dd8bae7c3c21  Merge 6.0-rc4 into usb-next

Warning reports:

https://lore.kernel.org/linux-usb/202208310007.6yJMsSYz-lkp@intel.com
https://lore.kernel.org/llvm/202208310216.5IOl43es-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
drivers/usb/host/ehci-platform.c:56:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ohci-at91.c:65:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
drivers/usb/host/ohci-s3c2410.c:42:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ohci-st.c:43:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- x86_64-allmodconfig
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- x86_64-randconfig-a004-20220905
|   `-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|-- x86_64-randconfig-a005-20220905
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
`-- x86_64-randconfig-a006-20220905
    `-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
clang_recent_errors
|-- i386-randconfig-a016-20220905
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- powerpc-buildonly-randconfig-r001-20220905
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- riscv-randconfig-r023-20220905
|   |-- drivers-usb-host-ohci-at91.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-exynos.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-s3c2410.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-st.c:warning:unused-variable-hcd_name
|-- x86_64-randconfig-a011-20220905
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
`-- x86_64-randconfig-a012-20220905
    |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
    `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name

elapsed time: 728m

configs tested: 77
configs skipped: 2

gcc tested configs:
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
um                             i386_defconfig
arc                  randconfig-r043-20220905
i386                                defconfig
alpha                            allyesconfig
um                           x86_64_defconfig
x86_64               randconfig-a002-20220905
x86_64                              defconfig
i386                 randconfig-a002-20220905
x86_64               randconfig-a001-20220905
i386                 randconfig-a003-20220905
m68k                             allmodconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
arc                              allyesconfig
i386                 randconfig-a001-20220905
x86_64               randconfig-a003-20220905
x86_64                         rhel-8.3-kunit
powerpc                           allnoconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
x86_64               randconfig-a004-20220905
ia64                             allmodconfig
i386                             allyesconfig
arm                              allyesconfig
x86_64               randconfig-a005-20220905
x86_64               randconfig-a006-20220905
i386                             alldefconfig
powerpc                      mgcoge_defconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
sparc                               defconfig
sh                               j2_defconfig
sh                             espt_defconfig
sh                 kfr2r09-romimage_defconfig
arm64                            allyesconfig
i386                 randconfig-a005-20220905
i386                 randconfig-a006-20220905
i386                 randconfig-a004-20220905
i386                 randconfig-c001-20220905
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig

clang tested configs:
hexagon              randconfig-r045-20220905
hexagon              randconfig-r041-20220905
x86_64               randconfig-a011-20220905
i386                 randconfig-a014-20220905
x86_64               randconfig-a012-20220905
x86_64               randconfig-a014-20220905
i386                 randconfig-a015-20220905
s390                 randconfig-r044-20220905
x86_64               randconfig-a016-20220905
riscv                randconfig-r042-20220905
i386                 randconfig-a016-20220905
x86_64               randconfig-a013-20220905
x86_64               randconfig-a015-20220905
arm                  colibri_pxa270_defconfig
powerpc                    socrates_defconfig
i386                 randconfig-a011-20220905
i386                 randconfig-a013-20220905
i386                 randconfig-a012-20220905
powerpc                     ksi8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
