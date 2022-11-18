Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479B662F22F
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 11:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241039AbiKRKKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 05:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241554AbiKRKJz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 05:09:55 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477002B60D
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 02:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668766194; x=1700302194;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NeSbvZrTaf+r4bE9cCTHqqfvI+JG0REM4j/YlpWXGFI=;
  b=Fc6AmomNxwQ1wtoKIeYXfK6ZXoWnLMfNwTqdSU8AddEvSumquFBo8nwj
   GVXmREdQjaC4xW++bVjO09Lr7+F/733ryA2GojHsYXfNR97uTR8EvGU0w
   +QYKodFGVuj30ry6RcQchgGY315kxWTTG3jzc0BICWpofOtwrdjNbUw7z
   6J35NeeS5IVHod3jtCBrpRTZ7MFzCEZ71s73biSKmUNeWyb2tfHCbXto2
   a2ahd+Cx5FqgZleCuYEf14X+9P5XyMh4uOmXQYGFla8MLE8zKHkTTs6kk
   vLSdz+D9nZ4ByaLyy9Ps0UV+4BW+rFhleK0VOwaBbMB0NWqkAnygLOh9o
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311807818"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="311807818"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2022 02:09:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="885249038"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="885249038"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2022 02:09:49 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ovyJe-0001MJ-1K;
        Fri, 18 Nov 2022 10:09:46 +0000
Date:   Fri, 18 Nov 2022 18:08:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 181135bb20dcb184edd89817831b888eb8132741
Message-ID: <637759b9.yZD0MwS+p3Dmdg+K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 181135bb20dcb184edd89817831b888eb8132741  usb: add NO_LPM quirk for Realforce 87U Keyboard

elapsed time: 12763m

configs tested: 442
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
um                           x86_64_defconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
s390                             allmodconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a011
sh                         microdev_defconfig
x86_64                        randconfig-a004
x86_64                           allyesconfig
i386                          randconfig-a005
arc                        nsimosci_defconfig
x86_64                        randconfig-a002
s390                             allyesconfig
powerpc                     tqm8541_defconfig
sh                   rts7751r2dplus_defconfig
x86_64                          rhel-8.3-func
arm                             pxa_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a006
x86_64                        randconfig-a015
powerpc                          allmodconfig
ia64                             allmodconfig
i386                          randconfig-a014
mips                             allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a012
sh                               allmodconfig
i386                          randconfig-a016
arc                  randconfig-r043-20221110
arc                  randconfig-r043-20221109
i386                             allyesconfig
x86_64                            allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm                        cerfcube_defconfig
sh                               alldefconfig
sh                        sh7757lcr_defconfig
arm                                 defconfig
s390                       zfcpdump_defconfig
powerpc                      arches_defconfig
powerpc                     sequoia_defconfig
mips                         cobalt_defconfig
arm                      footbridge_defconfig
xtensa                  cadence_csp_defconfig
mips                         db1xxx_defconfig
arm                        spear6xx_defconfig
powerpc                      pasemi_defconfig
sh                           se7722_defconfig
arm                         cm_x300_defconfig
powerpc              randconfig-c003-20221110
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                   secureedge5410_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                    xip_kc705_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
arm                         lpc18xx_defconfig
nios2                         10m50_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7724_defconfig
microblaze                          defconfig
parisc                           alldefconfig
arm                          pxa910_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                               defconfig
powerpc                 linkstation_defconfig
parisc                generic-64bit_defconfig
loongarch                           defconfig
arm                             rpc_defconfig
m68k                          multi_defconfig
arc                         haps_hs_defconfig
powerpc                    amigaone_defconfig
powerpc                       ppc64_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          randconfig-c001
xtensa                           alldefconfig
parisc                generic-32bit_defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
ia64                        generic_defconfig
openrisc                         alldefconfig
sparc                               defconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                     taishan_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         vf610m4_defconfig
xtensa                           allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                 randconfig-r044-20221111
arm                           viper_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221110
arc                           tb10x_defconfig
sh                         apsh4a3a_defconfig
powerpc              randconfig-c003-20221111
arm                      integrator_defconfig
arc                          axs101_defconfig
loongarch                 loongson3_defconfig
riscv                randconfig-r042-20221111
arc                  randconfig-r043-20221111
mips                 randconfig-c004-20221111
powerpc                         ps3_defconfig
loongarch                        alldefconfig
arm                            pleb_defconfig
arm                           sunxi_defconfig
xtensa                  nommu_kc705_defconfig
arm                            qcom_defconfig
powerpc                      ppc40x_defconfig
sparc64                             defconfig
powerpc                       maple_defconfig
arc                          axs103_defconfig
powerpc                          allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
m68k                          hp300_defconfig
arm                         at91_dt_defconfig
arm                       imx_v6_v7_defconfig
mips                 decstation_r4k_defconfig
arm                        oxnas_v6_defconfig
riscv                               defconfig
arm                  randconfig-c002-20221111
sh                          r7780mp_defconfig
arm                           u8500_defconfig
mips                           gcw0_defconfig
mips                     loongson1b_defconfig
m68k                       m5208evb_defconfig
mips                           jazz_defconfig
mips                      loongson3_defconfig
powerpc                      cm5200_defconfig
mips                            gpr_defconfig
sparc                       sparc32_defconfig
powerpc                     mpc83xx_defconfig
sh                        apsh4ad0a_defconfig
mips                      fuloong2e_defconfig
arm                         axm55xx_defconfig
openrisc                            defconfig
openrisc                  or1klitex_defconfig
arm                        mvebu_v7_defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
sh                            hp6xx_defconfig
powerpc                     asp8347_defconfig
m68k                       m5275evb_defconfig
m68k                         apollo_defconfig
mips                  maltasmvp_eva_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                             alldefconfig
sh                     magicpanelr2_defconfig
m68k                        m5407c3_defconfig
arm                          iop32x_defconfig
powerpc                    adder875_defconfig
powerpc                  storcenter_defconfig
mips                           ip32_defconfig
sh                          sdk7786_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      pcm030_defconfig
sh                   sh7770_generic_defconfig
arc                     nsimosci_hs_defconfig
sh                   sh7724_generic_defconfig
mips                         rt305x_defconfig
m68k                           virt_defconfig
m68k                       m5249evb_defconfig
m68k                        mvme147_defconfig
sh                         ecovec24_defconfig
um                               alldefconfig
mips                           ci20_defconfig
arm                        multi_v7_defconfig
mips                    maltaup_xpa_defconfig
arc                        nsim_700_defconfig
m68k                        m5272c3_defconfig
powerpc                    sam440ep_defconfig
sh                          rsk7201_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
sh                              ul2_defconfig
ia64                            zx1_defconfig
powerpc                     ep8248e_defconfig
sh                          r7785rp_defconfig
sparc64                          alldefconfig
arm64                            alldefconfig
powerpc                     pq2fads_defconfig
openrisc                    or1ksim_defconfig
arm                        mini2440_defconfig
sh                            migor_defconfig
arm                  randconfig-c002-20221113
m68k                           sun3_defconfig
arm                           tegra_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     redwood_defconfig
xtensa                         virt_defconfig
powerpc                        warp_defconfig
m68k                          amiga_defconfig
sh                        edosk7760_defconfig
i386                 randconfig-a002-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a001-20221114
arm                             ezx_defconfig
mips                      maltasmvp_defconfig
x86_64               randconfig-a003-20221114
x86_64               randconfig-a005-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a006-20221114
microblaze                      mmu_defconfig
m68k                          sun3x_defconfig
arc                     haps_hs_smp_defconfig
mips                       bmips_be_defconfig
ia64                          tiger_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                  decstation_64_defconfig
arm                               allnoconfig
powerpc                      ppc6xx_defconfig
sh                           se7343_defconfig
sh                            shmin_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
powerpc                     stx_gp3_defconfig
sh                           sh2007_defconfig
arm                  randconfig-c002-20221115
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
ia64                         bigsur_defconfig
sh                               j2_defconfig
arm                           stm32_defconfig
arm                         assabet_defconfig
arc                               allnoconfig
sh                            titan_defconfig
sparc                       sparc64_defconfig
m68k                          atari_defconfig
powerpc                        cell_defconfig
sh                          kfr2r09_defconfig
arm                       multi_v4t_defconfig
sh                 kfr2r09-romimage_defconfig
mips                     decstation_defconfig
openrisc                 simple_smp_defconfig
s390                          debug_defconfig
arm                            hisi_defconfig
powerpc                   motionpro_defconfig
sh                           se7721_defconfig
m68k                            q40_defconfig
sh                        dreamcast_defconfig
sh                          rsk7203_defconfig
arm                         lubbock_defconfig
sh                           se7705_defconfig
powerpc                      makalu_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                          rsk7264_defconfig
arm                         s3c6400_defconfig
arm                        shmobile_defconfig
alpha                            alldefconfig
powerpc                     tqm8555_defconfig
um                                  defconfig
sh                ecovec24-romimage_defconfig
openrisc                       virt_defconfig
sh                           se7751_defconfig
arm                        realview_defconfig
powerpc                   currituck_defconfig
mips                            ar7_defconfig
arm                            zeus_defconfig
arm                  randconfig-c002-20221116
sh                         ap325rxa_defconfig
powerpc                      bamboo_defconfig
sh                        sh7785lcr_defconfig
arm                       omap2plus_defconfig
sh                        edosk7705_defconfig
x86_64                           alldefconfig
arm                  randconfig-c002-20221117
arm                        trizeps4_defconfig
m68k                        stmark2_defconfig
sh                          sdk7780_defconfig
arm                          gemini_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
arm                       imx_v4_v5_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a006
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a016
i386                          randconfig-a011
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221110
riscv                randconfig-r042-20221109
i386                          randconfig-a015
hexagon              randconfig-r045-20221110
hexagon              randconfig-r045-20221109
riscv                randconfig-r042-20221110
hexagon              randconfig-r041-20221109
s390                 randconfig-r044-20221109
s390                 randconfig-r044-20221110
powerpc                        fsp2_defconfig
powerpc                    gamecube_defconfig
mips                malta_qemu_32r6_defconfig
mips                     loongson2k_defconfig
riscv                             allnoconfig
x86_64                        randconfig-k001
hexagon              randconfig-r041-20221111
hexagon              randconfig-r045-20221111
arm                        vexpress_defconfig
powerpc                    mvme5100_defconfig
arm                       versatile_defconfig
riscv                randconfig-c006-20221110
x86_64                        randconfig-c007
mips                 randconfig-c004-20221110
i386                          randconfig-c001
arm                  randconfig-c002-20221110
powerpc              randconfig-c003-20221110
s390                 randconfig-c005-20221110
arm                       aspeed_g4_defconfig
mips                      pic32mzda_defconfig
arm                         lpc32xx_defconfig
powerpc                      obs600_defconfig
powerpc                    socrates_defconfig
powerpc                        icon_defconfig
arm                         hackkit_defconfig
arm                       netwinder_defconfig
arm                          ixp4xx_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         s3c2410_defconfig
arm                           sama7_defconfig
arm                          pcm027_defconfig
arm                           omap1_defconfig
mips                        qi_lb60_defconfig
mips                  cavium_octeon_defconfig
powerpc                     skiroot_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                     ppa8548_defconfig
riscv                randconfig-c006-20221111
mips                 randconfig-c004-20221111
powerpc              randconfig-c003-20221111
s390                 randconfig-c005-20221111
riscv                            alldefconfig
powerpc                      ppc44x_defconfig
mips                           rs90_defconfig
arm                          sp7021_defconfig
powerpc                 mpc8560_ads_defconfig
arm                  randconfig-c002-20221111
powerpc                  mpc885_ads_defconfig
riscv                    nommu_virt_defconfig
arm                       cns3420vb_defconfig
arm                     am200epdkit_defconfig
powerpc                 mpc8272_ads_defconfig
mips                           ip27_defconfig
mips                        bcm63xx_defconfig
mips                     cu1000-neo_defconfig
mips                           ip22_defconfig
x86_64                           allyesconfig
arm                      pxa255-idp_defconfig
mips                          ath25_defconfig
arm                        magician_defconfig
arm                       spear13xx_defconfig
powerpc                     kilauea_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                          allyesconfig
mips                        maltaup_defconfig
powerpc                          g5_defconfig
arm                         mv78xx0_defconfig
powerpc                     akebono_defconfig
mips                          malta_defconfig
i386                              allnoconfig
i386                             allyesconfig
powerpc                      ppc64e_defconfig
mips                     cu1830-neo_defconfig
mips                      malta_kvm_defconfig
i386                 randconfig-a015-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a016-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a014-20221114
mips                       lemote2f_defconfig
s390                 randconfig-r044-20221114
riscv                randconfig-r042-20221114
hexagon              randconfig-r041-20221114
hexagon              randconfig-r045-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a011-20221114
mips                           mtx1_defconfig
arm                       mainstone_defconfig
mips                      bmips_stb_defconfig
arm                        multi_v5_defconfig
arm                                 defconfig
powerpc                     mpc512x_defconfig
powerpc                     kmeter1_defconfig
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
riscv                randconfig-c006-20221114
mips                 randconfig-c004-20221114
arm                  randconfig-c002-20221114
powerpc              randconfig-c003-20221114
s390                 randconfig-c005-20221114
powerpc                   bluestone_defconfig
powerpc               mpc834x_itxgp_defconfig
riscv                randconfig-c006-20221115
mips                 randconfig-c004-20221115
arm                  randconfig-c002-20221115
powerpc              randconfig-c003-20221115
s390                 randconfig-c005-20221115
mips                        omega2p_defconfig
s390                 randconfig-r044-20221116
riscv                randconfig-r042-20221116
hexagon              randconfig-r041-20221116
hexagon              randconfig-r045-20221116
powerpc                     pseries_defconfig
hexagon              randconfig-r041-20221117
hexagon              randconfig-r045-20221117
riscv                randconfig-c006-20221116
mips                 randconfig-c004-20221116
arm                  randconfig-c002-20221116
powerpc              randconfig-c003-20221116
s390                 randconfig-c005-20221116
riscv                randconfig-c006-20221117
mips                 randconfig-c004-20221117
arm                  randconfig-c002-20221117
powerpc              randconfig-c003-20221117
s390                 randconfig-c005-20221117
arm                        mvebu_v5_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
