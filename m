Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE1A65ECEFD
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 22:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiI0U4D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 16:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiI0Uz5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 16:55:57 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38753110EE2
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 13:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664312154; x=1695848154;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lOYmuZF0foi84lxHSIq5+IGfnvqIEUXr2jZi2fJWbEI=;
  b=CoY1SmRYeLcgtMJRsLgMJdu0tMcmpx92dapTGz/qyvlUfow/nvCfhhVS
   gHc1ezb8Hhufgr4gc3kRT1TqJXkqVpDgKFe3BY5dawnLf3MbuO1fAys3p
   3gr8RIMVvTCKCzdh8S832qOX5YHDGcrZKIbZSOgh6ykJGzx0XQRc671se
   Weg7VgwTyselpYepN8J0l9G+6WCu68n2X64xcTyUMEG4OTKIyeQzJaJ/O
   u18i6TFWiFFr/lB78MrmlAxH/xd9CmvaNAZ97i+oxsTNNIbO7zk1mjG51
   FUymTu5NNygs/CLAVBoPUB9PmVLHLvVVQ2UXLGqMGuP46/PHjGdszo4Qg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="365472697"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="365472697"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 13:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="950433586"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="950433586"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2022 13:55:53 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odHcO-0001Z6-1i;
        Tue, 27 Sep 2022 20:55:52 +0000
Date:   Wed, 28 Sep 2022 04:54:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 0fb9703a3eade0bb84c635705d9c795345e55053
Message-ID: <63336321.wZ/zEeQYeOx4NkBQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 0fb9703a3eade0bb84c635705d9c795345e55053  uas: ignore UAS for Thinkplus chips

elapsed time: 720m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
i386                 randconfig-a001-20220926
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a002-20220926
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                 randconfig-a003-20220926
arc                              allyesconfig
i386                 randconfig-a004-20220926
arc                  randconfig-r043-20220925
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
riscv                randconfig-r042-20220925
m68k                             allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                           allyesconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
i386                                defconfig
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
