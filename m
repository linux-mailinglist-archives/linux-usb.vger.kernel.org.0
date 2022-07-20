Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D25957AAD5
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 02:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbiGTANo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jul 2022 20:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiGTANm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jul 2022 20:13:42 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32CB4B0FB
        for <linux-usb@vger.kernel.org>; Tue, 19 Jul 2022 17:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658276021; x=1689812021;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E/wBtr7xdrZxUWBmYFtAVjoE+nzfCTRpiER4gS8F2Qc=;
  b=lDQcGqMkYvxZM1/xa/cKA4zuzjVaeHxTfYoLuzhAWzfUWE+t3syaIVuQ
   c2JrnFF8visvTIkvW1uaZc+2/ew/GftJii+gtxgZHOs/0oLygG4lD19hw
   SYGPeHh+e0NHFTsoQvJqX7TZjZhMobpy1TgTvOr4ay/9taJdv1sNT+ta5
   wspTfw5NYeir2KsnFTvtBfeLEjXNrCGCDWB0Z6fdfq2s6tR8ikJ2Ytf11
   AUm7O6FhOK1uYvtluXTB0orEHtzXKhU302+wBKPJLRs0mL76Fx2s4XP6a
   WE50nWbvwu1Yk1oElq9GkLxPum4B+AwazcMK1u0ict2awbiwYQgi0l4LZ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="266415538"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="266415538"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 17:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="548124738"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Jul 2022 17:13:39 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDxLO-0006Fy-Qj;
        Wed, 20 Jul 2022 00:13:38 +0000
Date:   Wed, 20 Jul 2022 08:13:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 32f02a211b0a192553075803b0b819027f96bb43
Message-ID: <62d74892.ArjtAriGC87Asvbo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 32f02a211b0a192553075803b0b819027f96bb43  Revert "platform/chrome: Add Type-C mux set command definitions"

elapsed time: 721m

configs tested: 80
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220718
powerpc                    sam440ep_defconfig
xtensa                    smp_lx200_defconfig
m68k                          atari_defconfig
powerpc                     asp8347_defconfig
m68k                           virt_defconfig
mips                        bcm47xx_defconfig
powerpc                      ppc40x_defconfig
arm64                            alldefconfig
mips                            ar7_defconfig
sh                        sh7757lcr_defconfig
mips                      loongson3_defconfig
sh                        dreamcast_defconfig
xtensa                       common_defconfig
mips                            gpr_defconfig
sh                          lboxre2_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a015-20220718
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a015-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a013-20220718
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                    gamecube_defconfig
mips                      maltaaprp_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a004-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a003-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
