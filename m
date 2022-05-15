Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42BC052790D
	for <lists+linux-usb@lfdr.de>; Sun, 15 May 2022 20:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238013AbiEOSOp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 May 2022 14:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238007AbiEOSOo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 May 2022 14:14:44 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFBF2AE22
        for <linux-usb@vger.kernel.org>; Sun, 15 May 2022 11:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652638483; x=1684174483;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TWYPo1b3hFlrbLp79hf6muAIpZj+LOMtJkg8YpZRdRw=;
  b=OakcUIQWrNlkl61O2LEsB2MZvS7TeEqCt9YatC7XCMTyFgHLKOWENjM0
   a/UnJBZIvTaXC9yjGIlM+XldPiU6ns2S35qYwoP6PIzHiayViQvUcrEJ0
   EnFNlsGt8OSTdMr32CCSiEQ16oQRmmYBpupHVYh7XyZqSZ3xRy0/sw5/E
   I+6/KBeaUMhj6qzljsOm6o8jLOqRxX4gtEnxIkTcpOOHyBZkyjJzTersq
   96QgR3lhWh+DP8M0yIBX8sPL+ehd5LwVlwrBen6K87pvWZbIUW6CPuBh9
   B9WrDUu4JQPMpMYatnuZwVF2sSvzooX4xPy9aJ9jg0uXLS+oCyRB2Vuly
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="250556872"
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; 
   d="scan'208";a="250556872"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2022 11:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; 
   d="scan'208";a="544028977"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 May 2022 11:14:15 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqIkw-0001sx-Mw;
        Sun, 15 May 2022 18:14:14 +0000
Date:   Mon, 16 May 2022 02:13:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 74f55a62c4c354f43a6d75f77dd184c4f57b9a26
Message-ID: <628142d2.fLp0bPxgRk6RTrrn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 74f55a62c4c354f43a6d75f77dd184c4f57b9a26  xhci: Allow host runtime PM as default for Intel Alder Lake N xHCI

elapsed time: 4395m

configs tested: 161
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
arm                           stm32_defconfig
csky                                defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                     tqm8555_defconfig
arm                          simpad_defconfig
sh                          r7785rp_defconfig
sh                          urquell_defconfig
arm                        cerfcube_defconfig
h8300                     edosk2674_defconfig
arm                            hisi_defconfig
mips                        bcm47xx_defconfig
sh                              ul2_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7712_defconfig
sh                        sh7763rdp_defconfig
arm                         axm55xx_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc8540_ads_defconfig
sh                   secureedge5410_defconfig
mips                            ar7_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                       holly_defconfig
arm                        trizeps4_defconfig
mips                         tb0226_defconfig
powerpc                        warp_defconfig
sh                        dreamcast_defconfig
sh                        apsh4ad0a_defconfig
sh                   rts7751r2dplus_defconfig
m68k                                defconfig
mips                             allmodconfig
nios2                         3c120_defconfig
m68k                       bvme6000_defconfig
i386                             alldefconfig
ia64                         bigsur_defconfig
m68k                        mvme147_defconfig
sh                         ecovec24_defconfig
powerpc                     taishan_defconfig
sparc                       sparc32_defconfig
arm                             ezx_defconfig
sh                          lboxre2_defconfig
mips                         rt305x_defconfig
powerpc                           allnoconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  cadence_csp_defconfig
arm                        oxnas_v6_defconfig
powerpc                    amigaone_defconfig
sh                          landisk_defconfig
arc                        nsim_700_defconfig
m68k                          atari_defconfig
arm                         lpc18xx_defconfig
sh                           se7343_defconfig
arc                     haps_hs_smp_defconfig
powerpc                         wii_defconfig
um                                  defconfig
arc                        nsimosci_defconfig
sh                           se7750_defconfig
arc                          axs101_defconfig
arm                         s3c6400_defconfig
mips                         mpc30x_defconfig
mips                           ci20_defconfig
powerpc                  iss476-smp_defconfig
sh                          sdk7786_defconfig
sh                          rsk7264_defconfig
sh                           se7751_defconfig
parisc                generic-32bit_defconfig
sh                            hp6xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220512
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220512
x86_64                        randconfig-c007
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
i386                          randconfig-c001
arm                  randconfig-c002-20220512
arm                      pxa255-idp_defconfig
arm                  colibri_pxa270_defconfig
arm                        magician_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm8540_defconfig
riscv                             allnoconfig
arm                        mvebu_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          moxart_defconfig
powerpc                   lite5200b_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      ppc44x_defconfig
powerpc                   bluestone_defconfig
powerpc                     tqm5200_defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220512
hexagon              randconfig-r041-20220512

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
