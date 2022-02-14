Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2620E4B5B4F
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 21:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiBNUtu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 15:49:50 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiBNUts (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 15:49:48 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0FA127D4F
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 12:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644871771; x=1676407771;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jw0wJX1P7CwLw0WtYUHigtqI/wgniBSCpLZkaYSzrGQ=;
  b=Se6XmF8yk2JC3mpwmbZU/2F/ZUuEvaPIqfcceg9huxxAxHlucDV4Qqrg
   SC+7EXAStjfFqQatSBi/qo+xNFcPf28vTawqyROpCjKkh81arWmiIbZ/s
   hl3rOC8CxMD0k1DwD65JshcWtKZXYYjFOF6AjSsAEh8RJd55HAZDtUiPd
   5bj/QjwDZa1p68HklP45ppZ/TdotD3tHbYDkxLPht/rGKYbMZ79wtYcAz
   8xKERtR1/1iaqd4kV/ORY80J8+snylTTxx6fqQZgUXpT9qxhbRlc92NTu
   8BbhlcyC28CRJY4X21kxYlS54SaZqEwiYQM2vMOXcRIOK+2+WxbEKdZgi
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="249926532"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="249926532"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 12:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="775423289"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2022 12:25:18 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nJhuP-0008uT-W6; Mon, 14 Feb 2022 20:25:17 +0000
Date:   Tue, 15 Feb 2022 04:25:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 fbd533e90d239e17d9427a6481ae60be25680cb7
Message-ID: <620abaa5.lDa2a7qC+BKhGf41%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: fbd533e90d239e17d9427a6481ae60be25680cb7  Merge 5.17-rc4 into usb-next

elapsed time: 733m

configs tested: 221
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220214
sh                          rsk7264_defconfig
arm                           h3600_defconfig
openrisc                            defconfig
nios2                            alldefconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
ia64                         bigsur_defconfig
m68k                        mvme147_defconfig
sh                            hp6xx_defconfig
powerpc64                        alldefconfig
sh                               alldefconfig
arm                           tegra_defconfig
powerpc                     stx_gp3_defconfig
mips                        vocore2_defconfig
powerpc                     pq2fads_defconfig
m68k                         apollo_defconfig
ia64                        generic_defconfig
mips                      maltasmvp_defconfig
i386                             alldefconfig
sh                          sdk7780_defconfig
powerpc                    klondike_defconfig
powerpc                       ppc64_defconfig
arm                        trizeps4_defconfig
xtensa                         virt_defconfig
arc                     haps_hs_smp_defconfig
xtensa                              defconfig
arm                          lpd270_defconfig
csky                                defconfig
powerpc                     mpc83xx_defconfig
arm                          pxa910_defconfig
arm                           corgi_defconfig
mips                     decstation_defconfig
sh                ecovec24-romimage_defconfig
sh                              ul2_defconfig
mips                         rt305x_defconfig
sh                        edosk7705_defconfig
powerpc                      cm5200_defconfig
powerpc                       eiger_defconfig
arm                        shmobile_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                         lubbock_defconfig
parisc                           allyesconfig
arm                      integrator_defconfig
mips                          rb532_defconfig
s390                       zfcpdump_defconfig
sh                          polaris_defconfig
m68k                       m5475evb_defconfig
mips                     loongson1b_defconfig
sparc64                             defconfig
sh                             shx3_defconfig
sh                         apsh4a3a_defconfig
m68k                            mac_defconfig
mips                         tb0226_defconfig
sparc                               defconfig
arm64                            alldefconfig
arm                        mvebu_v7_defconfig
sparc64                          alldefconfig
mips                            gpr_defconfig
arm                         axm55xx_defconfig
sh                           se7721_defconfig
powerpc                     rainier_defconfig
s390                                defconfig
powerpc                 linkstation_defconfig
m68k                        stmark2_defconfig
mips                             allmodconfig
powerpc                           allnoconfig
sh                           se7722_defconfig
mips                         db1xxx_defconfig
powerpc                      ppc40x_defconfig
h8300                               defconfig
arm                         lpc18xx_defconfig
powerpc                      bamboo_defconfig
arc                        nsimosci_defconfig
powerpc                      tqm8xx_defconfig
sh                         ap325rxa_defconfig
powerpc                    adder875_defconfig
m68k                       bvme6000_defconfig
arm                      jornada720_defconfig
mips                            ar7_defconfig
sparc                       sparc64_defconfig
xtensa                           alldefconfig
mips                 decstation_r4k_defconfig
arm                  randconfig-c002-20220214
arm                  randconfig-c002-20220213
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
x86_64                        randconfig-a006
i386                 randconfig-a013-20220214
i386                 randconfig-a016-20220214
i386                 randconfig-a012-20220214
i386                 randconfig-a015-20220214
i386                 randconfig-a011-20220214
i386                 randconfig-a014-20220214
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                randconfig-r042-20220214
arc                  randconfig-r043-20220214
s390                 randconfig-r044-20220214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
riscv                randconfig-c006-20220214
i386                 randconfig-c001-20220214
x86_64               randconfig-c007-20220214
powerpc              randconfig-c003-20220214
arm                  randconfig-c002-20220214
mips                 randconfig-c004-20220214
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220213
arm                  randconfig-c002-20220213
i386                          randconfig-c001
mips                 randconfig-c004-20220213
riscv                randconfig-c006-20220213
arm                       aspeed_g4_defconfig
hexagon                             defconfig
mips                        workpad_defconfig
arm                         s3c2410_defconfig
powerpc                     ppa8548_defconfig
powerpc                     pseries_defconfig
powerpc                      ppc64e_defconfig
arm                        spear3xx_defconfig
powerpc                     tqm8560_defconfig
powerpc                     kmeter1_defconfig
arm                         socfpga_defconfig
powerpc                    socrates_defconfig
powerpc                          allmodconfig
mips                          ath25_defconfig
powerpc                        icon_defconfig
powerpc                     mpc5200_defconfig
arm                  colibri_pxa300_defconfig
arm                         bcm2835_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                  mpc885_ads_defconfig
mips                     loongson1c_defconfig
arm                        magician_defconfig
mips                         tb0287_defconfig
powerpc                     tqm8540_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                           rs90_defconfig
mips                          ath79_defconfig
mips                     cu1000-neo_defconfig
arm                            dove_defconfig
mips                            e55_defconfig
x86_64               randconfig-a002-20220214
x86_64               randconfig-a006-20220214
x86_64               randconfig-a005-20220214
x86_64               randconfig-a004-20220214
x86_64               randconfig-a003-20220214
x86_64               randconfig-a001-20220214
i386                 randconfig-a004-20220214
i386                 randconfig-a005-20220214
i386                 randconfig-a006-20220214
i386                 randconfig-a002-20220214
i386                 randconfig-a003-20220214
i386                 randconfig-a001-20220214
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r045-20220213
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214
hexagon              randconfig-r041-20220213
riscv                randconfig-r042-20220213
s390                 randconfig-r044-20220213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
