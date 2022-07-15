Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2B157645D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jul 2022 17:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234858AbiGOPTM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 11:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235415AbiGOPSu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 11:18:50 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01495646F
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657898321; x=1689434321;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZQxE6kIhJDvsJ2Idxd0IwmgpO4FvhvMZzDTMg/UUuEo=;
  b=aX+B3W7Kegdyg16C0Wa3QDQPTUVaqmNM2wBQhFy/Y33NKvoSDUxVVe1W
   B3nWosphvWjqhiFsT+ZcC2MFwgDnrjNck8RmOVrOMFAhNs0PxIm06Z4Dy
   P+rlSOsjSI/Vqb6d4arN99VLjmEwait6AmjWfk3iSqV+penQXrk5fDOoS
   j94i4/3FrX5IH8E3OVT8DD9DJecQ4wJcSejQAPcsaWACzQ2seJYY1t932
   3FI6GThhDn2c2/QCVS+yTWeK/0/Gyhcxqu0yUqP83Vgxurind0CVKI+/N
   kdKRdkRsGi6GH6Ai9uil3sMxYO725VzLwCaFzFSBhFrxCrXvIvQ8aR5vV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286955562"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="286955562"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 08:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="842541121"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jul 2022 08:18:40 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCN5T-0000DY-93;
        Fri, 15 Jul 2022 15:18:39 +0000
Date:   Fri, 15 Jul 2022 17:09:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 3486af89dd3c0b0bef194c4bccf17c31ef16b99f
Message-ID: <62d12ecf.1D1UueQhbFav7EMO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 3486af89dd3c0b0bef194c4bccf17c31ef16b99f  Merge tag 'usb-serial-5.19-rc7' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 1123m

configs tested: 95
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
sparc                             allnoconfig
arm                           h3600_defconfig
mips                         cobalt_defconfig
sh                        sh7785lcr_defconfig
m68k                       m5275evb_defconfig
arm                        oxnas_v6_defconfig
arm                        clps711x_defconfig
powerpc                      pcm030_defconfig
m68k                          atari_defconfig
arc                          axs103_defconfig
powerpc                     pq2fads_defconfig
arm                             ezx_defconfig
sh                             sh03_defconfig
m68k                        m5272c3_defconfig
arc                                 defconfig
arm                         at91_dt_defconfig
powerpc                 mpc8540_ads_defconfig
alpha                             allnoconfig
arm                           viper_defconfig
sh                        edosk7705_defconfig
x86_64                                  kexec
i386                   debian-10.3-kselftests
i386                              debian-10.3
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
x86_64                        randconfig-c001
csky                              allnoconfig
arc                               allnoconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                 mpc836x_rdk_defconfig
powerpc                    gamecube_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    mvme5100_defconfig
s390                             alldefconfig
powerpc                   lite5200b_defconfig
arm                      pxa255-idp_defconfig
arm                          pcm027_defconfig
arm                       cns3420vb_defconfig
powerpc                        fsp2_defconfig
hexagon                             defconfig
powerpc                      ppc44x_defconfig
mips                           ip28_defconfig
powerpc                     ppa8548_defconfig
powerpc                     kilauea_defconfig
powerpc                      pmac32_defconfig
arm                         socfpga_defconfig
riscv                            alldefconfig
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220714
hexagon              randconfig-r041-20220714

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
