Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213B0663663
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 01:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235485AbjAJArG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 19:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235128AbjAJArF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 19:47:05 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4270186E5
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 16:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673311624; x=1704847624;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KYhALTlU/X6tHLgZ+LbFBVom0Lhmss01TcXDJ3SzEus=;
  b=Swi0r8iydZkyosiSgBeIyb+ENaNkvrFn9D6DF6MN14EqBQdAC6oWfXMj
   LiJHFPjm29jE+OCbqh9V8Y+yNK/8HZa0t8ZP1tBiiiKp5+PU9YWeXc0cl
   bVRNaHBocBunGYRrrvFBrc4c7NwuZAkcxu1s1Je945C2qy570YZfHxl7c
   Q4p6jIRZw4VdGAMTE8wKVcuavwhA59pSPPciYWu36qwVOtNsUCAR2lCJ+
   OPTCnwIOByOgI6WXa+xDgOpQIUBWD75aTLPRmPz7xQfRozWcWZqU6Qab/
   DUxuBFVa/j8B+XZ890x0hCZgUP9Uq1UWzvYjoCGInGKj6B+pMLxsjUhV4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="323094137"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="323094137"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 16:47:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="830806903"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="830806903"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Jan 2023 16:47:02 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pF2n8-0007Pi-0T;
        Tue, 10 Jan 2023 00:47:02 +0000
Date:   Tue, 10 Jan 2023 08:46:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 5eb127bb9741c1480aff95ffa4e1bd4cd9b5b16d
Message-ID: <63bcb576.7oGcu373mnD+aGwe%lkp@intel.com>
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
branch HEAD: 5eb127bb9741c1480aff95ffa4e1bd4cd9b5b16d  USB: disable all RNDIS protocol drivers

elapsed time: 728m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                                 defconfig
arc                              allyesconfig
m68k                             allyesconfig
alpha                               defconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
ia64                             allmodconfig
i386                 randconfig-a014-20230109
i386                                defconfig
i386                 randconfig-a011-20230109
x86_64                               rhel-8.3
i386                 randconfig-a013-20230109
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a012-20230109
x86_64                          rhel-8.3-func
i386                 randconfig-a016-20230109
i386                 randconfig-a015-20230109
arm                                 defconfig
x86_64               randconfig-a011-20230109
x86_64                           allyesconfig
x86_64               randconfig-a013-20230109
x86_64               randconfig-a012-20230109
x86_64               randconfig-a014-20230109
x86_64               randconfig-a016-20230109
x86_64               randconfig-a015-20230109
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
riscv                randconfig-r042-20230109
arm                  randconfig-r046-20230108
arc                  randconfig-r043-20230108
arc                  randconfig-r043-20230109
s390                 randconfig-r044-20230109
sh                   rts7751r2dplus_defconfig
xtensa                              defconfig
ia64                                defconfig
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                             pxa_defconfig
arc                           tb10x_defconfig
arm                              allmodconfig
arm                       multi_v4t_defconfig
arc                    vdk_hs38_smp_defconfig

clang tested configs:
i386                 randconfig-a004-20230109
i386                 randconfig-a002-20230109
i386                 randconfig-a003-20230109
i386                 randconfig-a001-20230109
i386                 randconfig-a006-20230109
i386                 randconfig-a005-20230109
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20230109
arm                  randconfig-r046-20230109
riscv                randconfig-r042-20230108
hexagon              randconfig-r041-20230108
hexagon              randconfig-r041-20230109
hexagon              randconfig-r045-20230108
s390                 randconfig-r044-20230108
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
mips                     loongson1c_defconfig
mips                      maltaaprp_defconfig
x86_64               randconfig-a001-20230109
x86_64               randconfig-a002-20230109
x86_64               randconfig-a004-20230109
x86_64               randconfig-a003-20230109
x86_64               randconfig-a006-20230109
x86_64               randconfig-a005-20230109
powerpc               mpc834x_itxgp_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
