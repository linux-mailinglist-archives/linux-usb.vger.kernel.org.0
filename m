Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F8D59CFCB
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 06:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbiHWEKd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 00:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiHWEKb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 00:10:31 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B45C51A03
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 21:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661227830; x=1692763830;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3LS5rmAWLG1RAVJ0mXePx0PwrcRTyAhMT/9yN7xtGkg=;
  b=Ta6gE2WZd7O/1QQ3Oc2HhX95XPS7bqsRanObRWpSdZFacYDLKxUNgCl2
   JtAiSBYmgHffu6jlwUDkSnALyq8GM8jzonh7HyT87SwwXl5E7EHGZxO2L
   DQzL1OwZ88TTHNWd0Hiy9Sh0JaMhjmjLSEXqb1HrgT14Milbv8fRSyAp4
   bMmykpCWAvHqcloNTkSnHbgFOUNH0c2bbTMS+V6elerx6cZPNFfjokXNc
   i5djpV+dDUcdYmfP7cnPTW2Y2hdMHxny2/3+3VzYJ/dotHYkE6sCsIR+c
   zEGM2jZNYIwuRO5kIMgoSm/yjROvnt8KNoluZrRPWZ0fdoMNdh2WWHFQC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="357566418"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="357566418"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 21:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="751547664"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2022 21:10:28 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQLFD-00019n-18;
        Tue, 23 Aug 2022 04:10:27 +0000
Date:   Tue, 23 Aug 2022 12:09:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS WITH WARNING
 8d1e09cfbd4da67d68a03e86818db5340c05abb8
Message-ID: <63045313.kp5wdtiTC6pqQITl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 8d1e09cfbd4da67d68a03e86818db5340c05abb8  Merge tag 'thunderbolt-for-v6.0-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

Warning reports:

https://lore.kernel.org/linux-usb/202208190411.1lugjsYz-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/dwc3/dwc3-qcom.c:313:25: warning: variable 'hcd' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- ia64-randconfig-r021-20220822
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- microblaze-randconfig-r002-20220822
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
`-- riscv-allmodconfig
    `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used

elapsed time: 721m

configs tested: 62
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
alpha                            allyesconfig
arc                              allyesconfig
arc                  randconfig-r043-20220821
arc                  randconfig-r043-20220822
riscv                randconfig-r042-20220822
m68k                             allmodconfig
m68k                             allyesconfig
s390                 randconfig-r044-20220822
x86_64               randconfig-a014-20220822
x86_64               randconfig-a012-20220822
x86_64               randconfig-a013-20220822
x86_64               randconfig-a011-20220822
x86_64               randconfig-a015-20220822
i386                          randconfig-a014
i386                          randconfig-a012
x86_64               randconfig-a016-20220822
i386                             allyesconfig
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
arm                                 defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig
ia64                             allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                 randconfig-a001-20220822
i386                 randconfig-a005-20220822
i386                 randconfig-a002-20220822
i386                 randconfig-a003-20220822
i386                 randconfig-a004-20220822
i386                 randconfig-a006-20220822
hexagon              randconfig-r041-20220822
hexagon              randconfig-r045-20220822
hexagon              randconfig-r045-20220821
hexagon              randconfig-r041-20220821
riscv                randconfig-r042-20220821
s390                 randconfig-r044-20220821
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64               randconfig-a002-20220822
x86_64               randconfig-a004-20220822
x86_64               randconfig-a003-20220822
x86_64               randconfig-a001-20220822
x86_64               randconfig-a005-20220822
x86_64               randconfig-a006-20220822

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
