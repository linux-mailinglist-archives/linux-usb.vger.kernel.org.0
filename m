Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79DF067F89F
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jan 2023 15:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234389AbjA1OXh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Jan 2023 09:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232105AbjA1OXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Jan 2023 09:23:36 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2126D1BE8
        for <linux-usb@vger.kernel.org>; Sat, 28 Jan 2023 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674915816; x=1706451816;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PU/tfv+FdmR0S52ETx9uXq/jRdrhA0TRLzy47b0DA3Y=;
  b=NhPEhSEL062jyCbp8gNTQ7WGr/SRuTuszPsE6B6XYptEqbS3+9it0r6q
   778ko//l7aO7cf4R/0PKOCj5fH1SZQhwYuLbj0vk8zNVDJ1om5NwhNJhV
   mMM/krbXYzDD/+ekHCrPwgMSTruqJk3LERvfgLveAsOIFV6AV9IhVf15A
   ZLnsTawUAzv5Yf9ToCOgiDmE2WgJqjsGIdQXDeSHMOBrx1V1xCQ/DRkN4
   CNsYilCJ+no96TDfGczWlOX0h0mch/NHpfNH8CMTRSEWZBY2QrAN/yQT/
   l/Zhxse8M/hPtKSb16IjJR8hNOhKAtw9e5eMP3TCynlNTiSKe2Dncyfcx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="328580039"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="328580039"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 06:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="663604480"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="663604480"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2023 06:23:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLm7B-0000l7-01;
        Sat, 28 Jan 2023 14:23:33 +0000
Date:   Sat, 28 Jan 2023 22:23:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 06cbcbfaa6510eed406e3b6d5d071386b9830689
Message-ID: <63d52fd8.PIHC+m+3Jei6mxRE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 06cbcbfaa6510eed406e3b6d5d071386b9830689  thunderbolt: Add missing kernel-doc comment to tb_tunnel_maximum_bandwidth()

elapsed time: 738m

configs tested: 78
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64               randconfig-a002-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a006-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a004-20230123
i386                 randconfig-a004-20230123
i386                 randconfig-a006-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a001-20230123
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-c001-20230123
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a014-20230123
riscv                randconfig-r042-20230123
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a015-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
powerpc                 mpc832x_mds_defconfig
powerpc                      walnut_defconfig
arm                        mvebu_v5_defconfig
arm                           sama7_defconfig
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230124
hexagon              randconfig-r045-20230124
arm                  randconfig-r046-20230124

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
