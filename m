Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A940B63581B
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 10:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238289AbiKWJun (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Nov 2022 04:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbiKWJt4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 04:49:56 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AE1116058
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669196829; x=1700732829;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=shv0L9sZEEXp6Ql3OzZxznXKEVw2lXDxHW65x+UUtTs=;
  b=TRadKA2sTYnnYzjjEw+Igsoa185BT2/RQHhiqVLvi/O5rSnVF5OPLi0M
   cHF6qEwfG8WincvrksqbZFoeSyP9sZZXigPOKpk9Nfn45KyjeQjCjH5me
   7ZOk7ZGI20OsZuf+At6JkdMtAOLzRzXL2iqWDbdvQ4O2sJ7QYfOXZfanU
   9ZxCUAF+z9eGt4WFhoxYxSCnjvbab/fgGMZzqAg/gZYwXoDfzQwrSA9Bl
   YoDVXzRYudxGRP0796Ra0DG9ZFyYrn4l50D9Ov0jXZB+T22/oNMmftifC
   kosFhLgPAiSk+TYx3WLk8IYWVp+7ga93MOwJiHZM4O/r+4vbwSlwUx0sn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="312727598"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="312727598"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 01:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641734284"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="641734284"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 01:47:08 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxmLT-0002aa-1w;
        Wed, 23 Nov 2022 09:47:07 +0000
Date:   Wed, 23 Nov 2022 17:46:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 7a21b27aafa3edead79ed97e6f22236be6b9f447
Message-ID: <637dec08.YkmqNARDKyPhRVH5%lkp@intel.com>
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
branch HEAD: 7a21b27aafa3edead79ed97e6f22236be6b9f447  usb: cdnsp: fix issue with ZLP - added TD_SIZE = 1

elapsed time: 1056m

configs tested: 99
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
x86_64                              defconfig
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a012-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a015-20221121
x86_64                               rhel-8.3
x86_64                           allyesconfig
mips                             allyesconfig
x86_64                            allnoconfig
i386                             allyesconfig
i386                                defconfig
sh                              ul2_defconfig
sh                           se7780_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
x86_64               randconfig-a011-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a012-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a015-20221121
m68k                             allmodconfig
sh                   rts7751r2dplus_defconfig
m68k                        m5307c3_defconfig
openrisc                    or1ksim_defconfig
arc                              allyesconfig
m68k                             allyesconfig
alpha                            allyesconfig
s390                 randconfig-r044-20221121
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221120
arc                  randconfig-r043-20221121
i386                          randconfig-c001
arm                                 defconfig
arm                              allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                           sunxi_defconfig
sh                         ap325rxa_defconfig
arm                          simpad_defconfig
powerpc                  iss476-smp_defconfig
sh                             espt_defconfig
arc                    vdk_hs38_smp_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm64                            allyesconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
x86_64                        randconfig-k001
powerpc                    gamecube_defconfig
x86_64               randconfig-a002-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a004-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a003-20221121
i386                 randconfig-a001-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a006-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a002-20221121
powerpc                 mpc832x_rdb_defconfig
mips                     cu1000-neo_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
