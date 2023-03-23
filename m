Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0295C6C60EF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 08:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjCWHli (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 03:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjCWHle (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 03:41:34 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0588110CE
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679557294; x=1711093294;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9RKCrn3bcP/OEYzSV8j/R9WoUgHnkkOyJdrgC5rZCHY=;
  b=a09D+3ZvEk1KaOVp7T4wzFJ0NT9g021IBXUvZG80Qb96QYGSBQBLuxKh
   zfEHUSQN2eLqUyMtRAxfUuc5eSodtczVSItRm1Qe5pwLmAddjk8DR7j0F
   Uxhvp3/Pz/jot+PdUrRBZ0RKsmmTdLlO4oD0XjfMJKrk1iLOEUPBKp9w3
   18OSI7oUjFl+8dciFVMtDI6e29OGocvjeNax5SOeg1e15EKmIXL2PHoov
   B0tmRe8J0PeztixP9DwYubZHcckpJS7GOLFyPC0tY6PfRJA/amNjeKo80
   6nfryf7CMoCcdceCKuBN5TglsdBlgrsfMXv467a3TlmsxtzxURt7h9TEo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319071186"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319071186"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 00:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714701911"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714701911"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 00:41:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfFZS-000E7H-21;
        Thu, 23 Mar 2023 07:41:14 +0000
Date:   Thu, 23 Mar 2023 15:40:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 bbefb7ed83e639ba1633e807f56b38a71c51fda3
Message-ID: <641c0288.EDbZs24Ib0jwjpuU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: bbefb7ed83e639ba1633e807f56b38a71c51fda3  Merge tag 'thunderbolt-for-v6.3-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 729m

configs tested: 78
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230322   gcc  
csky                 randconfig-r026-20230322   gcc  
hexagon              randconfig-r004-20230322   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a004   clang
i386                          randconfig-a006   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a014   gcc  
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r031-20230322   gcc  
ia64                 randconfig-r032-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r034-20230322   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r023-20230322   gcc  
openrisc             randconfig-r033-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230322   gcc  
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230322   clang
s390                 randconfig-r003-20230322   clang
s390                 randconfig-r022-20230322   gcc  
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r016-20230322   gcc  
sh                   randconfig-r036-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230322   gcc  
sparc                randconfig-r035-20230322   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
