Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 878736712E0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 05:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjARExu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 23:53:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjARExt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 23:53:49 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699CA51C76
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 20:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674017628; x=1705553628;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dJjh1F8S0qM3PgfeqKDRtVzUOLjjipyzxwyxt5dea8k=;
  b=XdpboNySBItKplGNnwrsCZMzE1QRyNPW4byXTNSwSALy+0TF2nCuVE80
   dVSCA4hglGXiggWewpzWOZq8Pi0OD5U8XKjZjrGZluEeKe2/C/XGmSc7P
   uLmazhFcBRc3yulMdIJRA6a3S5CbrnyHC8omAV9p/W1JT7vOSy2c5py6u
   yJBsxv+G7Wl+IlXP3VGq9oHSUCISnvToTw1EHjNKMXsBDpUF6DmTt3a9B
   1eGvpVFcherX3p43col1NjedjKLTx9RxxMvXBLJEPnWOok3g92tnm9A/U
   YyQfh9iuX93p85zK4liWVKnTOCg6hc0YJyYYLW8TRaTPhIQfaR2t2qRPs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="305271279"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="305271279"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 20:53:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="637117747"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="637117747"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Jan 2023 20:53:45 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pI0SF-0001ds-2y;
        Wed, 18 Jan 2023 04:53:44 +0000
Date:   Wed, 18 Jan 2023 12:53:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 7171b0e261b17de96490adf053b8bb4b00061bcf
Message-ID: <63c77b51.ckXxAm+KhpfZcru9%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 7171b0e261b17de96490adf053b8bb4b00061bcf  usb: core: hub: disable autosuspend for TI TUSB8041

elapsed time: 726m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
sh                               allmodconfig
arc                                 defconfig
x86_64                           rhel-8.3-syz
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
alpha                               defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
s390                                defconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a011-20230116
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
riscv                randconfig-r042-20230116
arm                  randconfig-r046-20230117
s390                 randconfig-r044-20230116
arc                  randconfig-r043-20230117
arc                  randconfig-r043-20230116
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
i386                 randconfig-c001-20230116
m68k                            q40_defconfig
ia64                      gensparse_defconfig
x86_64               randconfig-a011-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a012-20230116
mips                  decstation_64_defconfig
m68k                          multi_defconfig
powerpc                    sam440ep_defconfig
sh                         ap325rxa_defconfig
riscv                            allyesconfig
i386                 randconfig-a015-20230116
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
arm                  randconfig-r046-20230115
arc                  randconfig-r043-20230115
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
m68k                          hp300_defconfig
arm                            lart_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20230117
powerpc                      bamboo_defconfig
arm                           imxrt_defconfig
powerpc                      makalu_defconfig
arm                        cerfcube_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                        generic_defconfig
sh                 kfr2r09-romimage_defconfig
openrisc                         alldefconfig

clang tested configs:
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
x86_64                        randconfig-k001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                      acadia_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a002-20230116
powerpc                     tqm8560_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     kmeter1_defconfig
arm                         hackkit_defconfig
mips                          malta_defconfig
mips                        qi_lb60_defconfig
arm                          sp7021_defconfig
powerpc                     ppa8548_defconfig
x86_64                          rhel-8.3-rust
arm                           sama7_defconfig
riscv                          rv32_defconfig
powerpc                    mvme5100_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
