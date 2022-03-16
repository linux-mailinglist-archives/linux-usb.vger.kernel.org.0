Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DA54DB9E0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 22:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355320AbiCPVFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 17:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355049AbiCPVFE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 17:05:04 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C8DDED0
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647464629; x=1679000629;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ODrHCDEyVdHVF668cSzErXiaUPijkJ9vy+FDwiVf+UA=;
  b=awTcdXbmuMGq43H5YuzSbwU1lV4mO36KaMfUJO7KfsVVTzVuAbKwyszg
   6ebE9UCDpQavcbV3fMa+CRC+o00EhAEjMRV55QkKjT37qwF/2XPZhBL2d
   QSvZSR8+fIZFqkq9TUMrrqXzrzHa5xH2gUmkm/95OUZedg189WhkBb8UE
   QMe31FQzgJF3tVimwFtbWiQfwWo/ITOvwn57hSNSzCjrdHh4gE58EY72e
   I5mVMgu7xfEQHbXm4X0Iy4CSpT+bGxswjT3o86u+UUNGncf4oaXo945n5
   clwGvBrDaHZwqTeVDdnSl66MPUm4fBK/2a0gtqFCjxib7GU6I7HFavhcy
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="244164210"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="244164210"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 14:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="714765464"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Mar 2022 14:03:48 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nUao7-000Cvn-OK; Wed, 16 Mar 2022 21:03:47 +0000
Date:   Thu, 17 Mar 2022 05:03:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 e4cf6580ac740f766dae26203bd6311d353dcd42
Message-ID: <623250b0.HZjNbjBBexjUWvLy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: e4cf6580ac740f766dae26203bd6311d353dcd42  usb: dwc3: gadget: Wait for ep0 xfers to complete during dequeue

elapsed time: 1322m

configs tested: 169
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220314
mips                 randconfig-c004-20220314
i386                          randconfig-c001
powerpc                 mpc834x_itx_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
mips                        vocore2_defconfig
arm                            lart_defconfig
sh                         microdev_defconfig
arm                         vf610m4_defconfig
powerpc64                           defconfig
mips                  decstation_64_defconfig
powerpc                  storcenter_defconfig
sh                           sh2007_defconfig
alpha                            alldefconfig
ia64                            zx1_defconfig
arc                     nsimosci_hs_defconfig
powerpc                       ppc64_defconfig
powerpc                 mpc85xx_cds_defconfig
ia64                      gensparse_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
h8300                            allyesconfig
um                           x86_64_defconfig
sh                          r7780mp_defconfig
powerpc                      pasemi_defconfig
s390                       zfcpdump_defconfig
um                               alldefconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
arm                          pxa910_defconfig
powerpc                     ep8248e_defconfig
parisc                generic-64bit_defconfig
xtensa                           alldefconfig
sh                              ul2_defconfig
sparc                            alldefconfig
openrisc                 simple_smp_defconfig
sh                   secureedge5410_defconfig
arm                         lubbock_defconfig
sh                             shx3_defconfig
nios2                         3c120_defconfig
sh                          polaris_defconfig
arm                        realview_defconfig
sh                        edosk7760_defconfig
arm                         assabet_defconfig
xtensa                          iss_defconfig
arm                          badge4_defconfig
powerpc                     tqm8548_defconfig
powerpc                     pq2fads_defconfig
sh                        sh7763rdp_defconfig
sh                     sh7710voipgw_defconfig
mips                           ci20_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a006-20220314
x86_64               randconfig-a001-20220314
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
arc                  randconfig-r043-20220313
arc                  randconfig-r043-20220314
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220313
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220313
riscv                randconfig-c006-20220313
mips                 randconfig-c004-20220313
i386                          randconfig-c001
powerpc                     pseries_defconfig
powerpc                      katmai_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_mds_defconfig
mips                      maltaaprp_defconfig
powerpc                          g5_defconfig
powerpc                     skiroot_defconfig
powerpc                      pmac32_defconfig
powerpc                     kilauea_defconfig
mips                           mtx1_defconfig
mips                        maltaup_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220313
hexagon              randconfig-r045-20220313
hexagon              randconfig-r045-20220314
riscv                randconfig-r042-20220314
hexagon              randconfig-r041-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
