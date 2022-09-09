Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEEDE5B4027
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 21:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbiIITtq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 15:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbiIITtT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 15:49:19 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE2F106357
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 12:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662752887; x=1694288887;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CETwE2pv9jpDxgdAJb9ZQ3GyJ3DeOLvv4b7ZylO22TQ=;
  b=mupljmqaBa1zFBoJJN7G/zfFubD8fulCUeVunkXihq2nAt+CvP0gbGx2
   ws2I3MO0UUMekQyJ7gCD1zPpbw5PZKc5JkYNbN7F/h7srvEoX4xX5R2gb
   v+ADhUNCaLAfNI/kMsOQ1BWRrk/U/rVnwrf6abY3C6WWBLg/k2emAMyyY
   nQBdj5vs+QQ2Zwt7yfsj3bjB873smKoyr0rw43fG023PFgoNyCnGmP7mE
   G8AmCG/rgXimTc9Mwtj6BJMNzxgXUGkxB/A86u0CJA0Ojebm73/l6PilZ
   YxWFrV2NBnqYNXrUbxnP0yrxDswlcnwvOx+BaaYX55jvPD54Y4EUnPCJn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="277950147"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="277950147"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 12:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="943892355"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2022 12:48:05 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWjyv-0001g1-0J;
        Fri, 09 Sep 2022 19:48:05 +0000
Date:   Sat, 10 Sep 2022 03:47:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 7eb2bf871454d3b35c2e988477aab4c0e12aa7c4
Message-ID: <631b9850.RZHBJbo4K4JCNtyD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 7eb2bf871454d3b35c2e988477aab4c0e12aa7c4  usb: misc: usb3503: call clk_disable_unprepare in the error handling

elapsed time: 720m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                                defconfig
arm                                 defconfig
x86_64                              defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
m68k                             allmodconfig
i386                             allyesconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
arc                              allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a002
powerpc                           allnoconfig
x86_64                        randconfig-a015
alpha                            allyesconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a014
x86_64                        randconfig-a004
i386                          randconfig-a012
arc                  randconfig-r043-20220908
riscv                randconfig-r042-20220908
i386                          randconfig-a016
arc                  randconfig-r043-20220907
s390                 randconfig-r044-20220908
mips                            ar7_defconfig
mips                         rt305x_defconfig
arc                      axs103_smp_defconfig
openrisc                    or1ksim_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
arc                    vdk_hs38_smp_defconfig
sh                         microdev_defconfig
mips                           xway_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
m68k                          multi_defconfig
nios2                            allyesconfig
sh                             espt_defconfig
sh                     magicpanelr2_defconfig
i386                             alldefconfig
arm                        mini2440_defconfig
sh                            shmin_defconfig
powerpc                        cell_defconfig
nios2                               defconfig
mips                 decstation_r4k_defconfig
sh                             shx3_defconfig
xtensa                              defconfig
mips                    maltaup_xpa_defconfig
mips                  maltasmvp_eva_defconfig
sh                        edosk7705_defconfig
arm                             pxa_defconfig
arc                              alldefconfig
arm                           u8500_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                       m5475evb_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     tqm8548_defconfig
ia64                             allmodconfig
s390                       zfcpdump_defconfig
mips                        bcm47xx_defconfig
riscv                               defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
s390                 randconfig-r044-20220907
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220907
hexagon              randconfig-r041-20220908
riscv                randconfig-r042-20220907
i386                          randconfig-a011
hexagon              randconfig-r045-20220908
i386                          randconfig-a015
hexagon              randconfig-r045-20220907
powerpc                        fsp2_defconfig
powerpc                 mpc8272_ads_defconfig
mips                        qi_lb60_defconfig
arm                          pcm027_defconfig
x86_64                        randconfig-k001
mips                           mtx1_defconfig
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
s390                 randconfig-r044-20220909
powerpc                          allmodconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc44x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
