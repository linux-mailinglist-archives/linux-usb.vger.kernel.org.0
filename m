Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1B96748D1
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 02:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjATB2t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Jan 2023 20:28:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjATB2q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Jan 2023 20:28:46 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF8251C7A
        for <linux-usb@vger.kernel.org>; Thu, 19 Jan 2023 17:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674178125; x=1705714125;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mikSfAUvfAhHNXnvJ9kSq/iFQeZykX+1EH5TBgKoZxQ=;
  b=DC/MPUgKsjeOsfkriwWwh2C1QjGzuUTf2wP15/6cbfVzX5jO6qFLupGr
   s9XFeTcbWtQZEhtJC/JZMOh/UIKLdNUJjUjUPIYtsUpgvO0hiuogmvMpy
   XoO9dakaTymUgLUo8xAwgowlU8k0KcRnoZI9VhryyLQSwK7J8xzT5PAZQ
   mL/aDgul3e2zwwuyAP4z1tPOerFqE3i6yN2tDSHQ/w64kqtN46SFNkcBf
   KINW+5le1zJ4jvRSbQDTTSZ1y81D1PQ/biUQX0yagv60xg84/zBRVZO2f
   8JxQ1niBwxABZVQJu9eZUSEmSvBQACH580wMon8nRxPIPQM9AU+nW6Ng+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="390000757"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="390000757"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 17:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784347706"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="784347706"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 17:28:32 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIgCl-000237-1x;
        Fri, 20 Jan 2023 01:28:31 +0000
Date:   Fri, 20 Jan 2023 09:27:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 93c473948c588978cd55d9a3adad8b3e8057aa21
Message-ID: <63c9ee08.FsZ63SUu4/IZou0U%lkp@intel.com>
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
branch HEAD: 93c473948c588978cd55d9a3adad8b3e8057aa21  usb: gadget: add WebUSB landing page support

elapsed time: 723m

configs tested: 90
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
um                             i386_defconfig
s390                             allyesconfig
um                           x86_64_defconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                              defconfig
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a004
arm                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
m68k                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a006
alpha                            allyesconfig
arm                  randconfig-r046-20230119
x86_64                           rhel-8.3-bpf
arc                  randconfig-r043-20230119
x86_64                        randconfig-a013
x86_64                        randconfig-a011
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a015
arm64                            allyesconfig
i386                             allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
m68k                          hp300_defconfig
sparc                       sparc32_defconfig
sparc64                          alldefconfig
sh                          sdk7786_defconfig
parisc                              defconfig
xtensa                          iss_defconfig
sh                         ecovec24_defconfig
powerpc                     ep8248e_defconfig
sh                        sh7763rdp_defconfig
mips                       bmips_be_defconfig
i386                          randconfig-c001
powerpc                      bamboo_defconfig
powerpc                         ps3_defconfig
powerpc                   currituck_defconfig
sh                          rsk7264_defconfig
m68k                          multi_defconfig
nios2                               defconfig
arm                           corgi_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20230119

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                          rhel-8.3-rust
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r045-20230119
hexagon              randconfig-r041-20230119
riscv                randconfig-r042-20230119
x86_64                        randconfig-a012
s390                 randconfig-r044-20230119
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-k001
powerpc                 mpc8315_rdb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
