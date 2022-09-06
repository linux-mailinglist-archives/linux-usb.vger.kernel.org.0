Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95C8A5ADCB1
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 02:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiIFAwJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 20:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiIFAwH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 20:52:07 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882FC49B54
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 17:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662425526; x=1693961526;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ct3NoMT4HKZsJGxbCAV4WMFl38Lt9W8sF8QRrS3YuMw=;
  b=G9GDjW7h1lpD98D64WoWlH1lBSMwVV/cU4mrZBLNTgpsfbbmB1x8ZOqM
   GO3Mip8NVJ9gSwR+kR2aZHrKh8tttIGFhFjqIdjTeJjsZOa52d1LBtrlC
   nCLokGnNRzFU//eEfFdS9T5G61ygENTXGO+h1iXFph4AgrBNYO7YnU1kc
   u6f+x0q0FAJ2Xm6G/6Wn/2CdK0qZzD+wOhYFUMXtIrd9NFroMAUcEXrEC
   CLJ6qPjRmbJUOJ1UcuBOaKXOa7rk1GNmViPZLsMGPmm5YiiQj59nz5CKQ
   meGgpH5FC/yjUcQYXsbzubn0+oD98TN4b0hxKSzduFOPYq75LBif8bfrS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="279483392"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="279483392"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 17:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="859081849"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Sep 2022 17:52:04 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oVMou-0004gZ-0r;
        Tue, 06 Sep 2022 00:52:04 +0000
Date:   Tue, 06 Sep 2022 08:51:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 766a96dc558385be735a370db867e302c8f22153
Message-ID: <63169988.cFaltNLQxK342Ynp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 766a96dc558385be735a370db867e302c8f22153  USB: core: Fix RST error in hub.c

elapsed time: 729m

configs tested: 137
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
arm                                 defconfig
mips                             allyesconfig
arc                  randconfig-r043-20220905
x86_64                               rhel-8.3
sh                               allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm64                            allyesconfig
m68k                        m5272c3_defconfig
powerpc                         ps3_defconfig
m68k                             alldefconfig
i386                 randconfig-a003-20220905
i386                 randconfig-a005-20220905
i386                 randconfig-a006-20220905
i386                 randconfig-a001-20220905
i386                 randconfig-a002-20220905
i386                 randconfig-a004-20220905
sh                           se7780_defconfig
sh                   sh7770_generic_defconfig
alpha                            alldefconfig
powerpc                      pasemi_defconfig
openrisc                    or1ksim_defconfig
x86_64               randconfig-a001-20220905
x86_64               randconfig-a006-20220905
x86_64               randconfig-a004-20220905
x86_64               randconfig-a003-20220905
x86_64               randconfig-a002-20220905
x86_64               randconfig-a005-20220905
m68k                          hp300_defconfig
arm                        realview_defconfig
arc                          axs103_defconfig
alpha                               defconfig
mips                     loongson1b_defconfig
mips                      loongson3_defconfig
arm                           h3600_defconfig
sh                        sh7757lcr_defconfig
arm                            hisi_defconfig
ia64                         bigsur_defconfig
sh                          r7780mp_defconfig
openrisc                 simple_smp_defconfig
sh                             sh03_defconfig
powerpc                      pcm030_defconfig
riscv                               defconfig
powerpc                     tqm8541_defconfig
arm                           corgi_defconfig
arm                      integrator_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
arm                          iop32x_defconfig
sh                         microdev_defconfig
arm                            lart_defconfig
sh                           se7721_defconfig
mips                  decstation_64_defconfig
arc                            hsdk_defconfig
i386                 randconfig-c001-20220905
s390                          debug_defconfig
arm                         vf610m4_defconfig
arc                        vdk_hs38_defconfig
mips                         bigsur_defconfig
arm                            zeus_defconfig
riscv                            allyesconfig
arm64                               defconfig
sh                            titan_defconfig
powerpc                       maple_defconfig
m68k                        m5407c3_defconfig
powerpc                     sequoia_defconfig
mips                            ar7_defconfig
xtensa                          iss_defconfig
arm                             pxa_defconfig
loongarch                        alldefconfig
powerpc                  storcenter_defconfig
powerpc                 mpc834x_itx_defconfig
sparc                            allyesconfig
sh                             shx3_defconfig
mips                           ip32_defconfig
sh                          sdk7780_defconfig
openrisc                            defconfig
arm                          pxa910_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
um                               alldefconfig
parisc                generic-32bit_defconfig
loongarch                 loongson3_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                  randconfig-c002-20220905
x86_64               randconfig-c001-20220905
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a012-20220905
x86_64               randconfig-a013-20220905
hexagon              randconfig-r045-20220905
x86_64               randconfig-a011-20220905
riscv                randconfig-r042-20220905
x86_64               randconfig-a016-20220905
hexagon              randconfig-r041-20220905
s390                 randconfig-r044-20220905
x86_64               randconfig-a015-20220905
x86_64               randconfig-a014-20220905
i386                 randconfig-a016-20220905
i386                 randconfig-a012-20220905
i386                 randconfig-a015-20220905
i386                 randconfig-a011-20220905
i386                 randconfig-a013-20220905
i386                 randconfig-a014-20220905
mips                       lemote2f_defconfig
arm                    vt8500_v6_v7_defconfig
mips                          ath25_defconfig
mips                           ip22_defconfig
arm                          moxart_defconfig
arm                         palmz72_defconfig
arm                        spear3xx_defconfig
powerpc                       ebony_defconfig
mips                      bmips_stb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
