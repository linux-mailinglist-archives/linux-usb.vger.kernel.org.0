Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65511670DCA
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 00:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjAQXlT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 18:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjAQXja (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 18:39:30 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE95D4670A
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 14:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673995560; x=1705531560;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Mi0sw0RRUsAW2mEaQshW4xLWHSKCqVZvZTJJCnSxByE=;
  b=HIHtTr81ngnU1H2CBp6S9Qi1avBtOK14xssScFUL0YA+5OpnaVbq8YQE
   /ciVM5Zpp4JYMqSXTxw2BqI2FW1oPxoCDk5RJe+2qaOjObEMD/OQ7dH42
   vp1H8DWuaqOsa1qfZscvhw2IdwLIE1eSzVsQtQHb9r2EvppcqduOx7LZA
   xdfuzexrFvhlfmPZGgXSml8fq9AHxaKs5Kb7P7G7KJw3yNefa9yTooNvT
   ec1Z1l0i1eJbcJwl72ZMMH8xMLuqVOgCAuFbV/Va/WnzJUV0wgyBOSk19
   DSu3RI5gqMLqSuxDTjnpyX5Buil2mKbNnwmIi6ienLfNtcY3xUhlBnM5D
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="411076634"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="411076634"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 14:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="904825027"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="904825027"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jan 2023 14:45:57 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHuiK-0001SK-35;
        Tue, 17 Jan 2023 22:45:56 +0000
Date:   Wed, 18 Jan 2023 06:45:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 6ce3563520be90a155706bafc186fc264a13850e
Message-ID: <63c724fa.etPQ63z2GNKywF4m%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 6ce3563520be90a155706bafc186fc264a13850e  thunderbolt: Add support for DisplayPort bandwidth allocation mode

elapsed time: 723m

configs tested: 143
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                                defconfig
i386                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
arc                                 defconfig
x86_64                         rhel-8.3-kunit
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a011-20230116
alpha                               defconfig
x86_64               randconfig-a013-20230116
x86_64               randconfig-a012-20230116
ia64                             allmodconfig
x86_64               randconfig-a014-20230116
x86_64               randconfig-a016-20230116
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a015-20230116
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20230115
s390                 randconfig-r044-20230116
s390                                defconfig
riscv                randconfig-r042-20230116
arc                  randconfig-r043-20230116
sh                               allmodconfig
s390                             allyesconfig
arm                  randconfig-r046-20230115
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117
powerpc                          allmodconfig
mips                             allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                     decstation_defconfig
mips                         bigsur_defconfig
openrisc                            defconfig
m68k                         apollo_defconfig
um                               alldefconfig
mips                         db1xxx_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                 kfr2r09-romimage_defconfig
i386                 randconfig-c001-20230116
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                        sh7763rdp_defconfig
sh                          landisk_defconfig
arm                           sama5_defconfig
i386                          randconfig-c001
sh                     sh7710voipgw_defconfig
arm                      jornada720_defconfig
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
x86_64                        randconfig-c001
arm                  randconfig-c002-20230115
xtensa                  cadence_csp_defconfig
sh                             shx3_defconfig
sh                          kfr2r09_defconfig
sh                     magicpanelr2_defconfig

clang tested configs:
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
x86_64                        randconfig-a001
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116
x86_64                        randconfig-a003
i386                 randconfig-a006-20230116
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230116
riscv                randconfig-r042-20230117
hexagon              randconfig-r045-20230117
s390                 randconfig-r044-20230117
hexagon              randconfig-r045-20230115
hexagon              randconfig-r041-20230117
riscv                randconfig-r042-20230115
arm                  randconfig-r046-20230116
s390                 randconfig-r044-20230115
hexagon              randconfig-r045-20230116
hexagon              randconfig-r041-20230115
arm                        vexpress_defconfig
powerpc                 mpc8315_rdb_defconfig
x86_64                        randconfig-k001
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a002-20230116
powerpc                  iss476-smp_defconfig
arm                          sp7021_defconfig
powerpc                     ppa8548_defconfig
powerpc                        fsp2_defconfig
mips                           rs90_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     sequoia_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                      acadia_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
arm                         hackkit_defconfig
mips                          malta_defconfig
mips                        qi_lb60_defconfig
powerpc                     tqm8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
