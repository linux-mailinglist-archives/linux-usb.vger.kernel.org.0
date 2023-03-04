Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D3F6AA7EF
	for <lists+linux-usb@lfdr.de>; Sat,  4 Mar 2023 05:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjCDECi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 23:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjCDECh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 23:02:37 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B382C2CC55
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 20:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677902555; x=1709438555;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kI77ddoQTF693S8MGV1i5B2rBz8GecY+VaA3K2NQ/t4=;
  b=nheZBIl2ohEvdwT5Y7fO0sN5EmSxGDhb6lfJGAiwF95Efla+3Pv4Luru
   bVLiajJ7mNh0YZ5LqvYpELykTDOQfewP8ZGG0xYaE6sIKcrhrpPc7Hk6M
   C9M539qTFBe/lu3n7mXub7w3xwKkiX19a+86BcHXnJOdMAlq21QLLV6Cn
   gQSB/V6gmA9KH4Gx1HagbKVv0qMi/Mezm41sk/PsfHenuhJAVJpO8BnVL
   U7/FLkXgnwVTY0AFcly0m0hLl2XFcMdG1VH0nC+2KYv1QExbLqoyOsffA
   SnQcSnEiDVyJZiEv1UWOuOmlgdd5e0nsIO2O/9Glee6lqwTGUfxKQ9WVK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="333940357"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="333940357"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 20:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="675585086"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="675585086"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Mar 2023 20:02:33 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pYJ6P-0001qM-0M;
        Sat, 04 Mar 2023 04:02:33 +0000
Date:   Sat, 04 Mar 2023 12:02:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 98961622ac21e0a4e7c1353ab161f61393f60dcc
Message-ID: <6402c2bf.V/BEKsH6L9B3qI2I%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 98961622ac21e0a4e7c1353ab161f61393f60dcc  USB: disable all RNDIS protocol drivers

elapsed time: 726m

configs tested: 107
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230302   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230303   gcc  
alpha                randconfig-r025-20230302   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230302   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230302   gcc  
arc                  randconfig-r043-20230302   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230302   clang
arm                  randconfig-r003-20230302   clang
arm                  randconfig-r011-20230302   gcc  
arm                  randconfig-r012-20230302   gcc  
arm                  randconfig-r014-20230303   clang
arm                  randconfig-r046-20230302   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230302   clang
csky                                defconfig   gcc  
hexagon              randconfig-r021-20230302   clang
hexagon              randconfig-r041-20230302   clang
hexagon              randconfig-r045-20230302   clang
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
ia64                 randconfig-r026-20230302   gcc  
ia64                 randconfig-r033-20230302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230302   clang
mips                 randconfig-r004-20230302   clang
mips                 randconfig-r005-20230302   clang
nios2        buildonly-randconfig-r004-20230302   gcc  
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r002-20230302   gcc  
openrisc             randconfig-r015-20230303   gcc  
openrisc             randconfig-r035-20230302   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230303   gcc  
parisc               randconfig-r034-20230302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230302   clang
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230303   gcc  
riscv                randconfig-r042-20230302   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230302   gcc  
s390                 randconfig-r022-20230302   clang
s390                 randconfig-r024-20230302   clang
s390                 randconfig-r036-20230302   gcc  
s390                 randconfig-r044-20230302   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r016-20230302   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230302   gcc  
sparc                randconfig-r031-20230302   gcc  
sparc64              randconfig-r032-20230302   gcc  
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
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r015-20230302   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
