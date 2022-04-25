Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFCB50EB2D
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 23:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245271AbiDYVQm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 17:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbiDYVQl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 17:16:41 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3166C9D063
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 14:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650921216; x=1682457216;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pqYmsoIXDTLiNTVQlGudceUIOBpGjlsVZbHHOmbGe2E=;
  b=elZvi3htNzMZ4OHo8Z9el130xawKrXch2seoxgueVzOexGTXhVFQ21NG
   Sz9QHZcW4UOH5O8elBHuD54iiqrJf3vrFZorAfNgdS4+jtgDz9KaJWwWL
   U5AVOf+8YyWayfn+EnF2Wl1IQszqh01m8Vs2pSJxOM4vExcx8KKUz6UgA
   CSETDUY8vV2BVOgA3Pioe6U8RqnfQQZu6MIuhOu8WCHp9azQUoJKF3KPd
   rCkivUBCvPxLQ/CemCc2GE91zUhoLPAN8vMfqjYOoEP1WaB4jLo98V32s
   ovt/jZDaIrpOyBxTKk11g9WKZ2TakQV4Ts7RwMcjwD6Ypmfg3aJGwabvo
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264214557"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; 
   d="scan'208";a="264214557"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 14:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; 
   d="scan'208";a="729916222"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Apr 2022 14:13:32 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nj61U-0002t0-3u;
        Mon, 25 Apr 2022 21:13:32 +0000
Date:   Tue, 26 Apr 2022 05:13:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 bdddc253b0938a0063798881d1f6a971ea1d8943
Message-ID: <62670eed.wvIxx2YsCYoeuD+E%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: bdddc253b0938a0063798881d1f6a971ea1d8943  usb: rework usb_maxpacket() using usb_pipe_endpoint()

elapsed time: 3590m

configs tested: 177
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220425
arm                        keystone_defconfig
arm                        mvebu_v7_defconfig
powerpc                        cell_defconfig
mips                         rt305x_defconfig
h8300                       h8s-sim_defconfig
arm                             rpc_defconfig
powerpc                     pq2fads_defconfig
mips                      maltasmvp_defconfig
arc                          axs101_defconfig
arc                          axs103_defconfig
sh                        edosk7705_defconfig
arm                      integrator_defconfig
m68k                            q40_defconfig
arc                              alldefconfig
arm                           sunxi_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
mips                    maltaup_xpa_defconfig
sh                               j2_defconfig
arm                         assabet_defconfig
xtensa                generic_kc705_defconfig
openrisc                  or1klitex_defconfig
m68k                       bvme6000_defconfig
microblaze                          defconfig
mips                            gpr_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7705_defconfig
powerpc                   currituck_defconfig
m68k                       m5475evb_defconfig
powerpc                 canyonlands_defconfig
powerpc                       holly_defconfig
sparc                               defconfig
arm                         lubbock_defconfig
arc                     haps_hs_smp_defconfig
arm                           h3600_defconfig
xtensa                  nommu_kc705_defconfig
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
arm                  randconfig-c002-20220422
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a013-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220422
arc                  randconfig-r043-20220425
s390                 randconfig-r044-20220425
riscv                randconfig-r042-20220425
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func

clang tested configs:
mips                 randconfig-c004-20220424
arm                  randconfig-c002-20220424
powerpc              randconfig-c003-20220424
x86_64                        randconfig-c007
i386                          randconfig-c001
riscv                randconfig-c006-20220424
s390                 randconfig-c005-20220424
riscv                randconfig-c006-20220425
mips                 randconfig-c004-20220425
x86_64               randconfig-c007-20220425
arm                  randconfig-c002-20220425
i386                 randconfig-c001-20220425
powerpc              randconfig-c003-20220425
powerpc                     kmeter1_defconfig
mips                  cavium_octeon_defconfig
powerpc                    mvme5100_defconfig
powerpc                       ebony_defconfig
hexagon                          alldefconfig
powerpc                 xes_mpc85xx_defconfig
mips                          malta_defconfig
powerpc                    socrates_defconfig
mips                       lemote2f_defconfig
x86_64                           allyesconfig
arm                           spitz_defconfig
powerpc                 mpc836x_mds_defconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
powerpc                   lite5200b_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                 randconfig-a006-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a005-20220425
i386                 randconfig-a003-20220425
i386                 randconfig-a001-20220425
i386                 randconfig-a004-20220425
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220422
hexagon              randconfig-r045-20220422
s390                 randconfig-r044-20220422
riscv                randconfig-r042-20220422
hexagon              randconfig-r041-20220425
hexagon              randconfig-r045-20220425

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
