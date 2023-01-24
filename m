Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABF467927D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 09:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbjAXIDu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 03:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjAXIDt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 03:03:49 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D20E303FB
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 00:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674547428; x=1706083428;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FM6ofuU5Wlv0HFigWuMQ/a8N9zdMJ39XMIj3+Je8K3M=;
  b=AT/JVNsSY7XW3E4oFKtkBETQD07AFWMIyn+jBU6dcan7Ma5TChgIeQCT
   h9L6mbtLWEUBRqXMKUk5eOBL9n44CU5+R4PAkT7c6AJ9fi58cQd9ekvzL
   LbZldjjTx/iV8AHs0GjA1+XwnoioRzsn6n7Y/i/RAaFuMyW5E1//MBCvU
   AFZ9CfY1DKa+pM3Dn4LYmZ1ydjtxbjRsxZH8FGa4IrE0nRpAAEyRRw/xg
   lSwsIwpN77r7vq8LwChjPIAicTnnl37CC+7ZQz6Iqfd54wT03Asbolt4o
   x4+2L5y1UxhP7B+Do354/AOWBY8kYFTE6rfNxImfP/a5kNw7r0beYRsCE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324921364"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="324921364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 00:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692511105"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="692511105"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 00:03:46 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKEHR-0006G4-24;
        Tue, 24 Jan 2023 08:03:45 +0000
Date:   Tue, 24 Jan 2023 16:03:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 c10e0b79ae3f57a2f8cee494bae8880bde1118ad
Message-ID: <63cf90b9.7ovfybcHAoNwy2TC%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: c10e0b79ae3f57a2f8cee494bae8880bde1118ad  USB: disable all RNDIS protocol drivers

elapsed time: 1018m

configs tested: 83
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64                            allnoconfig
um                             i386_defconfig
sh                               allmodconfig
um                           x86_64_defconfig
alpha                            allyesconfig
arc                                 defconfig
s390                             allmodconfig
arc                              allyesconfig
alpha                               defconfig
m68k                             allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
s390                                defconfig
powerpc                          allmodconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                             allyesconfig
i386                                defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64               randconfig-a002-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a006-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a004-20230123
ia64                             allmodconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                     ep8248e_defconfig
arm                           imxrt_defconfig
m68k                          atari_defconfig
m68k                             alldefconfig
arm                            mps2_defconfig
mips                        vocore2_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-k001-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
riscv                randconfig-r042-20230123
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
mips                      loongson3_defconfig
powerpc                    klondike_defconfig
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a014-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a015-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
