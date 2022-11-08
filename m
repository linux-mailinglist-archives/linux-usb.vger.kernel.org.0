Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4670620596
	for <lists+linux-usb@lfdr.de>; Tue,  8 Nov 2022 02:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbiKHBHc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 20:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbiKHBHb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 20:07:31 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE4D240BF
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667869650; x=1699405650;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UZpRhPdHTVz/A1vnQi+IwAuJBAU0EbWsxZGWEZXh1rE=;
  b=SvUfvqSbLShTK1ddPQHL87xveZO6ZWtif90JLTMQ7/IiK6ijIkF+NrOg
   8sBSbUhSWZUG+klGG2tLmyxU26mYCBIsOHNsyGLYYbfAPuax5fbl0poFQ
   /1I4NlwGd09WVxRnr+lsef2+PaYhM47uZTUR6OLRU3YamlTtGwQx/Ro98
   Pk4viBsDZjqmnK6vB4Flc2q6w6und3cvgGFWeq26acfFy0WH7S7JAEJiE
   GWFKsqQCb7Rr1u3ovetvXh37B1w1eX8DEjlBIjCNYkipHV+WWMmYT+kyk
   Imf6tymXYZ8UuUfDM2IvU5V57yTxrrqHuym1LztIpPnPfTxkyh2nNLknP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="396864764"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="396864764"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 17:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705097896"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="705097896"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2022 17:07:28 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osD5L-0001Mw-3A;
        Tue, 08 Nov 2022 01:07:27 +0000
Date:   Tue, 08 Nov 2022 09:06:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 a5cfc9d65879c0d377f732531a2e80ee3a9eebbc
Message-ID: <6369ab9a.kMwR12LhDekJekfk%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: a5cfc9d65879c0d377f732531a2e80ee3a9eebbc  thunderbolt: Add wake on connect/disconnect on USB4 ports

elapsed time: 726m

configs tested: 113
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221107
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
x86_64               randconfig-a006-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a004-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a002-20221107
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20221107
mips                 randconfig-c004-20221107
powerpc                       ppc64_defconfig
loongarch                           defconfig
parisc64                         alldefconfig
sh                   sh7724_generic_defconfig
x86_64                           alldefconfig
powerpc                        warp_defconfig
microblaze                          defconfig
m68k                        stmark2_defconfig
powerpc                      pasemi_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                      bamboo_defconfig
sh                           se7721_defconfig
sh                           se7705_defconfig
sh                     sh7710voipgw_defconfig
m68k                         apollo_defconfig
sh                            shmin_defconfig
riscv                            allmodconfig
powerpc                       holly_defconfig
arm                      footbridge_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
arc                    vdk_hs38_smp_defconfig
sparc                            alldefconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-c001
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a016-20221107
powerpc                    mvme5100_defconfig
mips                     cu1000-neo_defconfig
arm                         orion5x_defconfig
mips                      malta_kvm_defconfig
mips                        omega2p_defconfig
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
i386                 randconfig-a013-20221107
i386                 randconfig-a015-20221107
i386                 randconfig-a016-20221107
i386                 randconfig-a011-20221107
i386                 randconfig-a014-20221107
i386                 randconfig-a012-20221107
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64               randconfig-k001-20221107
powerpc                        fsp2_defconfig
arm                           omap1_defconfig
arm                       netwinder_defconfig
arm                         palmz72_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                     mpc512x_defconfig
mips                   sb1250_swarm_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                    gamecube_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
