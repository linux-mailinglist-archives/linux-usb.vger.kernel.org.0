Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC0D5256C5
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 22:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358547AbiELU64 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 16:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352821AbiELU6y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 16:58:54 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C70227BC4F
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652389133; x=1683925133;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NrP6wSPM+PFPgfxZrufXls3Ssj0VF2vXRXsIiN4sq2k=;
  b=iZzx0QFMaDwbDjaIrGhn9awFjEFhqZZT5HoKNqPBRqKfAxBTWAsHQ99Z
   azAEC8ZW1ynygo3987FondWLC+gVyxx8VQQNxUpr+FVedCiCHj9z+7fnz
   0Ds/CzJ6aO7L+k6E8tATjI/I/L40W4my4j0cKZp5HYsw/4njFbw5AwdBm
   MjqaWJQxYOzFSdM/gesDWo1IJTEYBTxQtlypaXU/cFGiEDfxWlcUy52KP
   cj4sjVippdS3mrsCF8lby6BIYN2uOg54ajymoGjYJP83z9y5GE2glQbYW
   fLxfksxMuh9uxMylrHMysyP22x8PQMy0vDg0BEm2s44y3NbU6r3Uy0ijX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="250665528"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="250665528"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 13:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="572690986"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 May 2022 13:58:51 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npFtb-000Kvk-8U;
        Thu, 12 May 2022 20:58:51 +0000
Date:   Fri, 13 May 2022 04:58:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 f9d76d15072caf1ec5558fa7cc6d93c7b9d33488
Message-ID: <627d74d8.AF2WNr6SEoM3ttaz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: f9d76d15072caf1ec5558fa7cc6d93c7b9d33488  USB: gadget: Add ID numbers to gadget names

elapsed time: 1645m

configs tested: 219
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220509
s390                                defconfig
powerpc                  storcenter_defconfig
arm                         nhk8815_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
arc                          axs101_defconfig
h8300                       h8s-sim_defconfig
xtensa                generic_kc705_defconfig
powerpc                      arches_defconfig
mips                           ip32_defconfig
ia64                         bigsur_defconfig
arm                            pleb_defconfig
xtensa                          iss_defconfig
powerpc                       eiger_defconfig
arm                           h3600_defconfig
arm                          iop32x_defconfig
arm                         cm_x300_defconfig
sh                          r7785rp_defconfig
sh                                  defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g5_defconfig
ia64                        generic_defconfig
xtensa                  nommu_kc705_defconfig
ia64                          tiger_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
m68k                       m5275evb_defconfig
sh                           sh2007_defconfig
i386                                defconfig
xtensa                         virt_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
arm                        realview_defconfig
arm                         vf610m4_defconfig
sh                        sh7785lcr_defconfig
openrisc                    or1ksim_defconfig
m68k                          multi_defconfig
sh                          sdk7780_defconfig
s390                             allyesconfig
mips                            ar7_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                       holly_defconfig
sparc                       sparc32_defconfig
sh                           se7750_defconfig
arm                          exynos_defconfig
sparc                               defconfig
arm                        cerfcube_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
sh                         ap325rxa_defconfig
sparc64                             defconfig
arc                    vdk_hs38_smp_defconfig
xtensa                    smp_lx200_defconfig
sh                         microdev_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc837x_mds_defconfig
sh                           se7206_defconfig
sh                             shx3_defconfig
arm                        spear6xx_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                            mps2_defconfig
s390                       zfcpdump_defconfig
arm                        shmobile_defconfig
sh                               alldefconfig
mips                  maltasmvp_eva_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
ia64                                defconfig
m68k                         amcore_defconfig
sh                            titan_defconfig
m68k                          atari_defconfig
parisc                           allyesconfig
sh                           se7722_defconfig
openrisc                  or1klitex_defconfig
arm                         at91_dt_defconfig
m68k                        m5407c3_defconfig
riscv                               defconfig
xtensa                           alldefconfig
powerpc                   currituck_defconfig
sh                     sh7710voipgw_defconfig
sh                        apsh4ad0a_defconfig
arc                        nsim_700_defconfig
arm                         lpc18xx_defconfig
sh                           se7343_defconfig
arc                     haps_hs_smp_defconfig
microblaze                      mmu_defconfig
arm                             ezx_defconfig
openrisc                         alldefconfig
powerpc                  iss476-smp_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      cm5200_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
x86_64                        randconfig-c001
arm                  randconfig-c002-20220512
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
s390                 randconfig-c005-20220510
powerpc              randconfig-c003-20220510
x86_64                        randconfig-c007
riscv                randconfig-c006-20220510
mips                 randconfig-c004-20220510
i386                          randconfig-c001
arm                  randconfig-c002-20220510
s390                 randconfig-c005-20220512
powerpc              randconfig-c003-20220512
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
arm                  randconfig-c002-20220512
powerpc                      acadia_defconfig
arm                  colibri_pxa300_defconfig
arm                          pcm027_defconfig
mips                       rbtx49xx_defconfig
mips                        maltaup_defconfig
mips                      maltaaprp_defconfig
mips                        omega2p_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     pseries_defconfig
arm                         shannon_defconfig
powerpc                    mvme5100_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220509
hexagon              randconfig-r041-20220509
hexagon              randconfig-r045-20220512
hexagon              randconfig-r041-20220512

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
