Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E63E5B15A7
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 09:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbiIHHad (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 03:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiIHHac (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 03:30:32 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38E47B79E
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 00:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662622231; x=1694158231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DVDN45B13QrMw7FxPsfJwbOuIdzbqoktz7EUg5emTxQ=;
  b=ndpyXhLu1ga1xVXNQD6hw3zV4CKbE+TpsobsUPK7Mzyp/IG6qYm4gJZw
   RF+2rL9yg1SluOH3PwUkB4VshSzixIaYYzgzHZjO0QkCIIlvrQmYBhrMj
   NyYvGi3g6eAMVH1cH/+kmjhQtFrfF88987ENHoxS6hz+EsEpu+qT/n7dl
   jN0vLxJaM1lEHh4sNxFm8PS8MouekRjY0/MycxdHTpJgbkEZ+Ublow17N
   GHXpggGu1okru1oUz/FPCPqaWC0mfTFjgaW0OrmumiTw/4FEBKXSnz+Sy
   jF0ulQLZz2R1okKCPT99hJG6iCpPPKaFY9WjQc5HfmehBYnfdrRzOzRWS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="294679361"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="294679361"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 00:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="592054811"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Sep 2022 00:29:55 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWBz0-0007UP-3D;
        Thu, 08 Sep 2022 07:29:55 +0000
Date:   Thu, 08 Sep 2022 15:29:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 91062e663b261815573ce00967b1895a99e668df
Message-ID: <631999bf.h70xP92eUcf2reLw%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 91062e663b261815573ce00967b1895a99e668df  usb: dwc3: core: leave default DMA if the controller does not support 64-bit DMA

elapsed time: 959m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
um                             i386_defconfig
mips                             allyesconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220907
m68k                             allyesconfig
x86_64                               rhel-8.3
sh                               allmodconfig
arm                                 defconfig
x86_64                        randconfig-a002
x86_64                           allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a006
arm64                            allyesconfig
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a005
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
csky                                defconfig
sparc                            alldefconfig
sparc                               defconfig
um                                  defconfig
sh                            titan_defconfig
arm                            mps2_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
sparc                             allnoconfig
arm                        cerfcube_defconfig
powerpc                      arches_defconfig
openrisc                 simple_smp_defconfig
powerpc                     asp8347_defconfig
sh                     sh7710voipgw_defconfig
i386                          randconfig-c001
i386                             alldefconfig
powerpc                     ep8248e_defconfig
m68k                          hp300_defconfig
m68k                        m5272c3_defconfig
arm                          exynos_defconfig
ia64                          tiger_defconfig
arc                              alldefconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                          r7785rp_defconfig
arm                          iop32x_defconfig
powerpc                     mpc83xx_defconfig
xtensa                generic_kc705_defconfig
sh                             sh03_defconfig
sh                           se7750_defconfig
s390                             allmodconfig
xtensa                       common_defconfig
arm                        clps711x_defconfig
arc                           tb10x_defconfig
powerpc                       eiger_defconfig
sh                          r7780mp_defconfig
arm                            qcom_defconfig
arm                          pxa3xx_defconfig
arm                         s3c6400_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
sh                           se7722_defconfig
riscv                randconfig-r042-20220908
arc                  randconfig-r043-20220908
s390                 randconfig-r044-20220908
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                         wii_defconfig
xtensa                  cadence_csp_defconfig
m68k                       m5275evb_defconfig
sh                         ap325rxa_defconfig
xtensa                           allyesconfig
sparc                            allyesconfig
x86_64                                  kexec
microblaze                          defconfig
powerpc                        cell_defconfig
parisc64                         alldefconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
riscv                randconfig-r042-20220907
x86_64                        randconfig-a001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                 mpc8315_rdb_defconfig
mips                           ip22_defconfig
powerpc                     tqm8540_defconfig
arm                           spitz_defconfig
x86_64                        randconfig-k001
powerpc                     akebono_defconfig
mips                      malta_kvm_defconfig
arm                    vt8500_v6_v7_defconfig
arm                      pxa255-idp_defconfig
s390                             alldefconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
