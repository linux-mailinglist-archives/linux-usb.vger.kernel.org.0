Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F6766326B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 22:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237640AbjAIVMK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 16:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237838AbjAIVLk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 16:11:40 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382C3221
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 13:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673298375; x=1704834375;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UpT4wCFg2hde1mvdbQmB2QH3kVUCq6FW38VgQFFz7Eo=;
  b=KxGmpxjchJiC7hoA1Iw2zV6u1G0gF3gTW5nTqKb1pR9NTRCUO12xnmi8
   UYWyJk9rsvxkt+zVKgYrulWD3+msemTQMKvlgwwHNih9YuEAY052kXMcf
   Cc5c4U7itwBwmP4ZIZpOXwsqL6yXxytmJjzWRwp7SeK6ub6iQFMxFunxc
   It9V+8OcatkAKywpifJmN8gOwD5GS0Yh4C6GpuyJ79NGcrH+bcMwUkfjZ
   VnXMli04NTOoicDLVndaRts0UykV7e9v3l5cRqGAbMx6LzJF/e5q1thLz
   goEuGP9gWeXrL3/nAHu3DXExsgVGzbHHduHTRbcfgKJvpxrndmX01aO0U
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="324223185"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="324223185"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 13:06:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="725299839"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="725299839"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jan 2023 13:06:13 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pEzLQ-0007Ec-1f;
        Mon, 09 Jan 2023 21:06:12 +0000
Date:   Tue, 10 Jan 2023 05:05:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 84ee211c83212f4d35b56e0603acdcc41f860f1b
Message-ID: <63bc818e.DTqv/kvn5AYufIx/%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 84ee211c83212f4d35b56e0603acdcc41f860f1b  thunderbolt: Disable XDomain lane 1 only in software connection manager

elapsed time: 720m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
arm                                 defconfig
sh                               allmodconfig
x86_64                              defconfig
arm64                            allyesconfig
mips                             allyesconfig
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
arm                              allyesconfig
s390                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
alpha                               defconfig
x86_64               randconfig-a011-20230109
x86_64               randconfig-a012-20230109
x86_64               randconfig-a014-20230109
s390                                defconfig
s390                             allyesconfig
x86_64               randconfig-a013-20230109
i386                          randconfig-a003
x86_64               randconfig-a016-20230109
x86_64                          rhel-8.3-func
i386                                defconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-bpf
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                 randconfig-a014-20230109
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
i386                 randconfig-a011-20230109
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
i386                 randconfig-a016-20230109
x86_64               randconfig-a015-20230109
i386                          randconfig-a005
arc                              allyesconfig
i386                 randconfig-a015-20230109
alpha                            allyesconfig
i386                 randconfig-a013-20230109
i386                 randconfig-a012-20230109
riscv                randconfig-r042-20230109
s390                 randconfig-r044-20230109
arm                  randconfig-r046-20230108
arc                  randconfig-r043-20230108
arc                  randconfig-r043-20230109
i386                             allyesconfig
arm                        mini2440_defconfig
powerpc                        warp_defconfig
sh                            titan_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                       maple_defconfig
xtensa                       common_defconfig
sh                          r7780mp_defconfig
arm                        mvebu_v7_defconfig
sh                   sh7770_generic_defconfig
alpha                             allnoconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     tqm8548_defconfig
sh                         apsh4a3a_defconfig
powerpc                   motionpro_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     taishan_defconfig
parisc                           allyesconfig
powerpc                      makalu_defconfig
powerpc                      mgcoge_defconfig
arm64                            alldefconfig
mips                         cobalt_defconfig
mips                  maltasmvp_eva_defconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                   rts7751r2dplus_defconfig
xtensa                              defconfig
ia64                                defconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a004
arm                  randconfig-r046-20230109
i386                          randconfig-a006
riscv                randconfig-r042-20230108
hexagon              randconfig-r041-20230108
hexagon              randconfig-r041-20230109
hexagon              randconfig-r045-20230108
s390                 randconfig-r044-20230108
x86_64               randconfig-a003-20230109
x86_64               randconfig-a002-20230109
x86_64               randconfig-a004-20230109
x86_64               randconfig-a001-20230109
hexagon              randconfig-r045-20230109
x86_64               randconfig-a005-20230109
x86_64               randconfig-a006-20230109
x86_64                        randconfig-k001
i386                 randconfig-a005-20230109
i386                 randconfig-a006-20230109
i386                 randconfig-a001-20230109
i386                 randconfig-a002-20230109
i386                 randconfig-a003-20230109
i386                 randconfig-a004-20230109
arm                         hackkit_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
