Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB2A26F53A
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 06:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgIREtY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 00:49:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:22354 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbgIREtY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 00:49:24 -0400
IronPort-SDR: gWglo8LRVEojWp/2CjIKlwDneJMYrHwNSgUrMYqA/sK2eTtE06i+PYB0Ar99lR8pSan8qbPqPn
 GeEgw+RByU5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147543349"
X-IronPort-AV: E=Sophos;i="5.77,273,1596524400"; 
   d="scan'208";a="147543349"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 21:49:22 -0700
IronPort-SDR: WVrFV6jBU5hoslYgQjYyaX1IS9IhnR5bE2ZzPNmPmFKDKxFuIBBjjLJP+G0n/USei374nHEV05
 go/uqdcTiqpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,273,1596524400"; 
   d="scan'208";a="307743780"
Received: from lkp-server01.sh.intel.com (HELO a05db971c861) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Sep 2020 21:49:21 -0700
Received: from kbuild by a05db971c861 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kJ8Km-0000QO-CK; Fri, 18 Sep 2020 04:49:20 +0000
Date:   Fri, 18 Sep 2020 12:48:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 9cdabcb3ef8c24ca3a456e4db7b012befb688e73
Message-ID: <5f643c1c.wrsfUEPkISxsLHcE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 9cdabcb3ef8c24ca3a456e4db7b012befb688e73  usblp: fix race between disconnect() and read()

elapsed time: 720m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
s390                       zfcpdump_defconfig
arm                     davinci_all_defconfig
s390                                defconfig
m68k                             allyesconfig
powerpc                     akebono_defconfig
powerpc                     rainier_defconfig
mips                       capcella_defconfig
powerpc                     kilauea_defconfig
powerpc                  mpc866_ads_defconfig
sh                          rsk7269_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                        cell_defconfig
mips                        nlm_xlp_defconfig
powerpc                      ppc6xx_defconfig
arc                             nps_defconfig
arm                           h5000_defconfig
mips                        bcm47xx_defconfig
arm                        neponset_defconfig
mips                  cavium_octeon_defconfig
x86_64                           allyesconfig
nios2                         10m50_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                        fsp2_defconfig
mips                       lemote2f_defconfig
powerpc                       maple_defconfig
sh                          sdk7780_defconfig
powerpc                     sbc8548_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     pq2fads_defconfig
um                           x86_64_defconfig
sh                              ul2_defconfig
ia64                      gensparse_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200917
i386                 randconfig-a006-20200917
i386                 randconfig-a003-20200917
i386                 randconfig-a001-20200917
i386                 randconfig-a002-20200917
i386                 randconfig-a005-20200917
x86_64               randconfig-a014-20200917
x86_64               randconfig-a011-20200917
x86_64               randconfig-a016-20200917
x86_64               randconfig-a012-20200917
x86_64               randconfig-a015-20200917
x86_64               randconfig-a013-20200917
i386                 randconfig-a015-20200917
i386                 randconfig-a014-20200917
i386                 randconfig-a011-20200917
i386                 randconfig-a013-20200917
i386                 randconfig-a016-20200917
i386                 randconfig-a012-20200917
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200917
x86_64               randconfig-a004-20200917
x86_64               randconfig-a003-20200917
x86_64               randconfig-a002-20200917
x86_64               randconfig-a001-20200917
x86_64               randconfig-a005-20200917

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
