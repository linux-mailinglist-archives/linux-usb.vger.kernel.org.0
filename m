Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339DC599664
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 09:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347216AbiHSHrr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 03:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236150AbiHSHrq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 03:47:46 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6351ED7599
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660895265; x=1692431265;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BKBdbmv+QaL/y9YkLHcH7WTSbUA85ha40o6k9vx/Kys=;
  b=lmco0ko50KEG9TkpqyBXhWDFiyUR8Ou+oLEFPRuDutwTkZTQ3AK5zj6q
   Lf/zcf4uHf7qnqdU1izIAmDXrvfXFrT1c/oB+CTvQiiF261+azNOEAfHG
   8zh1kjRu/UKn6yFqU1Ujgr7eavu5NaFRY3RA1Bl0yA5EtBF5D1bynbMnN
   uokklgwBknXf59yiPrSCK9i1dsHkP7wSq0HFlMDxOEzm2ZkAz3tWuPtxs
   xbBN5sYYkwruh7yFVwpFh8Mu38XvBcbo/zuQ1Uy8p09T5iXvAoiODpxlR
   ckzTnrEzavs4ZoUeliQqhfGXJA7TUSwsgROD9TBSd6n3gFeyo3u4loXE2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="290526976"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="290526976"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 00:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="637177940"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Aug 2022 00:47:43 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOwjG-0001Br-38;
        Fri, 19 Aug 2022 07:47:42 +0000
Date:   Fri, 19 Aug 2022 15:47:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ad57410d231da1fff3f53ff42ebcdc6d388e21d1
Message-ID: <62ff400a.476K7o+ubDPZlXWv%lkp@intel.com>
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
branch HEAD: ad57410d231da1fff3f53ff42ebcdc6d388e21d1  usb: gadget: rndis: use %u instead of %d to print u32 values

elapsed time: 725m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20220818
x86_64                              defconfig
sh                               allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
arm                                 defconfig
x86_64                         rhel-8.3-kunit
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
s390                 randconfig-r044-20220818
riscv                randconfig-r042-20220818
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a015
x86_64                        randconfig-a002
x86_64                        randconfig-a013
sh                   rts7751r2dplus_defconfig
sh                                  defconfig
sh                               alldefconfig
i386                             allyesconfig
x86_64                        randconfig-a011
um                                  defconfig
sh                               j2_defconfig
ia64                             alldefconfig
arm                            mps2_defconfig
x86_64                        randconfig-a006
sparc                       sparc64_defconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
ia64                             allmodconfig
i386                          randconfig-c001
arm                        clps711x_defconfig
arm                      footbridge_defconfig
arm                            qcom_defconfig
m68k                           sun3_defconfig
sh                           sh2007_defconfig
arm                          gemini_defconfig
mips                            gpr_defconfig
mips                         db1xxx_defconfig
mips                       bmips_be_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                           sunxi_defconfig
arc                 nsimosci_hs_smp_defconfig
loongarch                        alldefconfig
m68k                                defconfig
sparc                             allnoconfig
m68k                         amcore_defconfig
xtensa                              defconfig
ia64                                defconfig
arm                           sama5_defconfig
sh                          landisk_defconfig
sh                        apsh4ad0a_defconfig
arm                            pleb_defconfig
parisc                generic-64bit_defconfig
sh                          rsk7201_defconfig
xtensa                  audio_kc705_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                         s3c6400_defconfig
powerpc                  iss476-smp_defconfig
arm                         cm_x300_defconfig
powerpc                      ep88xc_defconfig
parisc                generic-32bit_defconfig
arc                        nsim_700_defconfig
m68k                          hp300_defconfig
m68k                        mvme147_defconfig
m68k                             alldefconfig

clang tested configs:
hexagon              randconfig-r041-20220818
hexagon              randconfig-r045-20220818
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
riscv                randconfig-r042-20220819
s390                 randconfig-r044-20220819
hexagon              randconfig-r045-20220819
hexagon              randconfig-r041-20220819
arm                         s5pv210_defconfig
arm                         shannon_defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_rdk_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
