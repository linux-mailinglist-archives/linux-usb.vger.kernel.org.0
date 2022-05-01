Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE20D516220
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 08:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241686AbiEAGMh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 02:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234748AbiEAGMg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 02:12:36 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57FE1A39E
        for <linux-usb@vger.kernel.org>; Sat, 30 Apr 2022 23:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651385351; x=1682921351;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uq3BLzrCu6jK7MFxv7MlStAfvQF5+ACMJwd4cytNhbQ=;
  b=FQPv9Qz/1prhRvB8AV/UQ6VvKTztAaSWl14HNSFlzbrHDxaCDD2MvmQd
   PjeiCFAATuBraWfl06iVNAxGJHLHdhSPPsiM7RFqGwpJ6wYHDEXuyXbTt
   s3OK7fMSKuw7MeHgR9UWHyo/YSAmocWRryw59aHmLmtQPb3Neu3FIgxpA
   QukvaRhCrLENEhwWEHKLUwgopOLDTSPap1Dq+er1Pz+yCZOcxXE59sSkk
   goHnd3xV84Zr0qrg4YwUcYVM7EFujZ8tFvOpy4RHIkd98mURVzvNsioW3
   GGmieV24+R9Mv7wIhJTB29Kp/BuJId8xhBRYrUtC0rw1J1YmrxKWtkRtX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="353394468"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; 
   d="scan'208";a="353394468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2022 23:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; 
   d="scan'208";a="515515630"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Apr 2022 23:09:09 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nl2lY-0008Y5-W5;
        Sun, 01 May 2022 06:09:08 +0000
Date:   Sun, 01 May 2022 14:08:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c40b62216c1aecc0dc00faf33d71bd71cb440337
Message-ID: <626e23ef.45MGo2wO//KNA5Zt%lkp@intel.com>
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
branch HEAD: c40b62216c1aecc0dc00faf33d71bd71cb440337  usb: core: hcd: Create platform devices for onboard hubs in probe()

Unverified Warning (likely false positive, please contact us if interested):

drivers/usb/gadget/udc/core.c:1558:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
drivers/usb/typec/tipd/core.c:455:18: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]

Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-c002-20220425
|   `-- drivers-usb-gadget-udc-core.c:warning:Value-stored-to-ret-is-never-read-clang-analyzer-deadcode.DeadStores
`-- x86_64-randconfig-c007-20220425
    `-- drivers-usb-typec-tipd-core.c:warning:Assigned-value-is-garbage-or-undefined-clang-analyzer-core.uninitialized.Assign

elapsed time: 6824m

configs tested: 306
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
mips                 randconfig-c004-20220425
i386                 randconfig-c001-20220425
i386                          randconfig-c001
mips                     decstation_defconfig
m68k                            q40_defconfig
arm                           corgi_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
sh                               j2_defconfig
arm                        cerfcube_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
s390                             allmodconfig
sh                          rsk7264_defconfig
arm                            zeus_defconfig
mips                  maltasmvp_eva_defconfig
mips                      maltasmvp_defconfig
arm                         lubbock_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
powerpc                     tqm8555_defconfig
powerpc                   motionpro_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          badge4_defconfig
arc                        nsimosci_defconfig
powerpc                      arches_defconfig
powerpc                 linkstation_defconfig
sh                     sh7710voipgw_defconfig
sh                        edosk7705_defconfig
powerpc                      ppc6xx_defconfig
arm                       multi_v4t_defconfig
arm                      jornada720_defconfig
arc                              alldefconfig
parisc                generic-32bit_defconfig
sh                   secureedge5410_defconfig
sh                            shmin_defconfig
sh                          r7780mp_defconfig
sh                     magicpanelr2_defconfig
nios2                               defconfig
powerpc                     taishan_defconfig
sparc                       sparc64_defconfig
h8300                            alldefconfig
powerpc                       eiger_defconfig
sh                          kfr2r09_defconfig
powerpc                   currituck_defconfig
mips                            gpr_defconfig
arm                         lpc18xx_defconfig
microblaze                      mmu_defconfig
ia64                         bigsur_defconfig
m68k                          sun3x_defconfig
arm                         nhk8815_defconfig
i386                             alldefconfig
arm                        clps711x_defconfig
powerpc                     tqm8541_defconfig
powerpc                       holly_defconfig
arm                            lart_defconfig
powerpc                         ps3_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc8540_ads_defconfig
alpha                               defconfig
arm                             pxa_defconfig
arm                        keystone_defconfig
arm                         vf610m4_defconfig
m68k                           sun3_defconfig
sparc                               defconfig
arm                        mini2440_defconfig
sh                ecovec24-romimage_defconfig
sh                           se7724_defconfig
m68k                       bvme6000_defconfig
m68k                       m5208evb_defconfig
xtensa                  cadence_csp_defconfig
parisc                              defconfig
powerpc                     tqm8548_defconfig
sh                         ecovec24_defconfig
xtensa                         virt_defconfig
powerpc                      mgcoge_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc837x_mds_defconfig
arc                            hsdk_defconfig
arm                            qcom_defconfig
sh                   sh7724_generic_defconfig
powerpc                        cell_defconfig
mips                     loongson1b_defconfig
m68k                        m5307c3_defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
arm                          lpd270_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
openrisc                         alldefconfig
xtensa                    smp_lx200_defconfig
arm                      integrator_defconfig
um                               alldefconfig
sh                          rsk7201_defconfig
arm                        oxnas_v6_defconfig
m68k                          multi_defconfig
powerpc64                        alldefconfig
arm                           sama5_defconfig
arc                        nsim_700_defconfig
mips                       capcella_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                             sh03_defconfig
sparc64                          alldefconfig
sh                        edosk7760_defconfig
arm                       aspeed_g5_defconfig
arm                         cm_x300_defconfig
sh                      rts7751r2d1_defconfig
sh                   rts7751r2dplus_defconfig
alpha                            allyesconfig
m68k                             alldefconfig
arm                           h3600_defconfig
powerpc                    amigaone_defconfig
sh                           se7721_defconfig
powerpc                           allnoconfig
powerpc                      cm5200_defconfig
mips                           jazz_defconfig
powerpc                      makalu_defconfig
powerpc                      chrp32_defconfig
arm                      footbridge_defconfig
ia64                             alldefconfig
sh                           se7206_defconfig
parisc64                            defconfig
arc                                 defconfig
mips                          rb532_defconfig
powerpc                  storcenter_defconfig
x86_64                           alldefconfig
openrisc                    or1ksim_defconfig
m68k                         amcore_defconfig
powerpc                    sam440ep_defconfig
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
x86_64                        randconfig-c001
arm                  randconfig-c002-20220427
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220501
arm                  randconfig-c002-20220429
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
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
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
x86_64               randconfig-a013-20220425
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
arc                  randconfig-r043-20220425
s390                 randconfig-r044-20220425
riscv                randconfig-r042-20220425
arc                  randconfig-r043-20220501
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
arc                  randconfig-r043-20220428
arc                  randconfig-r043-20220429
s390                 randconfig-r044-20220429
riscv                randconfig-r042-20220429
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
riscv                randconfig-c006-20220425
mips                 randconfig-c004-20220425
x86_64               randconfig-c007-20220425
arm                  randconfig-c002-20220425
i386                 randconfig-c001-20220425
powerpc              randconfig-c003-20220425
riscv                randconfig-c006-20220427
mips                 randconfig-c004-20220427
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220427
powerpc              randconfig-c003-20220427
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
powerpc              randconfig-c003-20220501
riscv                randconfig-c006-20220501
mips                 randconfig-c004-20220501
arm                  randconfig-c002-20220501
riscv                randconfig-c006-20220429
mips                 randconfig-c004-20220429
arm                  randconfig-c002-20220429
powerpc              randconfig-c003-20220429
mips                          ath79_defconfig
arm                       spear13xx_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
mips                     loongson2k_defconfig
s390                             alldefconfig
arm                        vexpress_defconfig
arm                         palmz72_defconfig
arm                       cns3420vb_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          pxa168_defconfig
powerpc                    socrates_defconfig
arm                            dove_defconfig
powerpc                     tqm5200_defconfig
arm                           sama7_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                     cu1830-neo_defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc44x_defconfig
arm                         s3c2410_defconfig
arm                            mmp2_defconfig
powerpc                      katmai_defconfig
arm                      pxa255-idp_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                       aspeed_g4_defconfig
powerpc                      walnut_defconfig
arm                              alldefconfig
mips                            e55_defconfig
arm                       mainstone_defconfig
arm                                 defconfig
powerpc                     pseries_defconfig
arm                         bcm2835_defconfig
mips                          rm200_defconfig
arm                       netwinder_defconfig
mips                          ath25_defconfig
powerpc                  mpc885_ads_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                       ebony_defconfig
arm                       imx_v4_v5_defconfig
powerpc                          allyesconfig
arm                        neponset_defconfig
x86_64                           allyesconfig
mips                           ip28_defconfig
mips                      maltaaprp_defconfig
powerpc                        fsp2_defconfig
mips                      malta_kvm_defconfig
mips                           ip27_defconfig
mips                       rbtx49xx_defconfig
powerpc                          allmodconfig
powerpc                 mpc8560_ads_defconfig
riscv                          rv32_defconfig
mips                     cu1000-neo_defconfig
arm                             mxs_defconfig
mips                         tb0287_defconfig
powerpc                 linkstation_defconfig
arm                          moxart_defconfig
arm                       versatile_defconfig
arm                     davinci_all_defconfig
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a003-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a001-20220425
i386                 randconfig-a006-20220425
i386                 randconfig-a005-20220425
i386                 randconfig-a004-20220425
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220425
hexagon              randconfig-r045-20220425
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
hexagon              randconfig-r045-20220428

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
