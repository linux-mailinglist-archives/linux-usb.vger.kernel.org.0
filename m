Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D456B360C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 06:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjCJF07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 00:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjCJF06 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 00:26:58 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCC5F73A2
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 21:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678426016; x=1709962016;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h4+nU3Phxp3Ulp5deUXvCY9O/S+SHtNuHE8KT1n2kbU=;
  b=Vg/Q1VzmOd69r0Z0TmDXD8KKszr5wl1BkPgUB8I6AW4tLWWJjoQuX1fl
   EHgQq2cdqCPcUFm+wTIERYjht0ulgJalUWcqX6KDESqHbnzIW0n5kay7A
   Rq11g5mh9urO7DPK41I4UAcTTerkIR6DiUkOnA1JtJVN9hwyih2PUfKOM
   BvUPLP4RrhM4sUfL8TTQsbW0C8VQGSMCv+yqAmMAOMKaw8NS2prFiHPuX
   pXtnZoqQfqDfqzp9y0gJngZewKubP6dwBh0YwSCmpDdLAL4eLgy4e+kXE
   epo7CjBlLY8s/byCLgzgsLTPlA6dAjYKYVuSeGDjbKUZhp6G7CjH6oDwr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338205167"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="338205167"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 21:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="820919950"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="820919950"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 21:26:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1paVHK-0003XD-1S;
        Fri, 10 Mar 2023 05:26:54 +0000
Date:   Fri, 10 Mar 2023 13:26:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 82f5332d3b9872ab5b287e85c57b76d8bb640cd1
Message-ID: <640abf8a.bwVcovW8r/hJkO6T%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 82f5332d3b9872ab5b287e85c57b76d8bb640cd1  usb: dwc2: drd: fix inconsistent mode if role-switch-default-mode="host"

elapsed time: 864m

configs tested: 86
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230308   gcc  
alpha                randconfig-r014-20230308   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230308   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230308   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230308   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230308   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230308   clang
hexagon              randconfig-r045-20230308   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230308   gcc  
ia64                 randconfig-r033-20230308   gcc  
ia64                 randconfig-r036-20230308   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230308   gcc  
loongarch            randconfig-r035-20230308   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230308   clang
mips                 randconfig-r013-20230308   gcc  
mips                 randconfig-r032-20230308   clang
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230308   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230308   gcc  
riscv                randconfig-r031-20230308   gcc  
riscv                randconfig-r034-20230308   gcc  
riscv                randconfig-r042-20230308   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230308   gcc  
s390                 randconfig-r044-20230308   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230308   gcc  
sparc        buildonly-randconfig-r005-20230308   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
