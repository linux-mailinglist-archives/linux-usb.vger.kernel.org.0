Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816D95E8F7F
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 21:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbiIXTRy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 15:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbiIXTRx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 15:17:53 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D5C5AC55
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 12:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664047072; x=1695583072;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s5C+Dym0wOJlnno56UuTanB56b3aTbITl/kx2rGsKHs=;
  b=H6FgLRO+zoroEKUxbfNPru96QGkApKfdCE+IF3QyzKEL5q894ufo61qG
   1tOR6TksvhIG5UUb9d3A1qJ41eQpRn/yK9l+iLyftejlJavXboX5sYSOQ
   Wl03XXeEu8dyQvBDJw7X5uWVuM8XR0XAAqwJqoyilH8cI5BADz+WJvxDq
   iZD/vR9SZ+X9Z4UNsWxJc22JNYumpDAsPJAUEFZV0HGz8ounIOEYJnGig
   0r1rhqmIhmW+BmTRut99K7yKytlHY81TuSbaSj3SriFwHbj1hh551c18T
   PHsJpHtBJI9sGb1r3IkxsU5tCeMZPoEBll+BYrzhIB1LSBl44bRiaLac6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="387093615"
X-IronPort-AV: E=Sophos;i="5.93,342,1654585200"; 
   d="scan'208";a="387093615"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2022 12:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,342,1654585200"; 
   d="scan'208";a="651341785"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Sep 2022 12:17:51 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocAes-0006uK-2L;
        Sat, 24 Sep 2022 19:17:50 +0000
Date:   Sun, 25 Sep 2022 03:16:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 8d9dcfff7b1c6b5c4264d91b193336c6f6df9b53
Message-ID: <632f57a3.IPADFPuUfJ4Ja1+7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        LONGWORDS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 8d9dcfff7b1c6b5c4264d91b193336c6f6df9b53  thunderbolt: Use dev_err_probe()

elapsed time: 720m

configs tested: 110
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
arm                                 defconfig
arc                  randconfig-r043-20220923
powerpc                           allnoconfig
s390                 randconfig-r044-20220923
riscv                randconfig-r042-20220923
arm64                            allyesconfig
arm                              allyesconfig
x86_64                              defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                                 defconfig
x86_64                        randconfig-a004
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
i386                          randconfig-a003
m68k                             allmodconfig
i386                          randconfig-a005
s390                             allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
m68k                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                           allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                          randconfig-c001
um                               alldefconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
xtensa                       common_defconfig
ia64                            zx1_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
xtensa                              defconfig
powerpc                     tqm8555_defconfig
arc                      axs103_smp_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220925
s390                 randconfig-r044-20220925
x86_64                        randconfig-c001
arm                  randconfig-c002-20220924
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec

clang tested configs:
hexagon              randconfig-r041-20220923
hexagon              randconfig-r045-20220923
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
powerpc                     pseries_defconfig
mips                       lemote2f_defconfig
powerpc                      katmai_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-c007
arm                  randconfig-c002-20220923
i386                          randconfig-c001
s390                 randconfig-c005-20220923
riscv                randconfig-c006-20220923
mips                 randconfig-c004-20220923
powerpc              randconfig-c003-20220923

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
