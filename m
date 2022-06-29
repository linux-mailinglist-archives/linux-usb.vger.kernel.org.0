Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03BFC55F323
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 04:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbiF2CIr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jun 2022 22:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiF2CIq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jun 2022 22:08:46 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE6925C4B
        for <linux-usb@vger.kernel.org>; Tue, 28 Jun 2022 19:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656468525; x=1688004525;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GGavIRn39NodUS303mk0CX524+V1NQFRGeIYAWt93lE=;
  b=NmYSplSL4b3Dq8eCo3hZCcU+vLarrcR5D1aCL9vlwPAJ2TGfVg7ggF5R
   ef2OcaLfvU39IQTfdfbYWWICQlHBolaYRBK8anaW3kfflSFLbPvwi0p16
   LNiZ2bdHhvcVy2yjd0C1CVJpf22WJedZ+SQRydJU6iN2D24Oqch/ZlVQu
   IV0KGp/50riSemmQvkd59qpWRpWuIFBGmyI5G2TXouY4Cy8wU7gTBtwCL
   M3rYPuG6qd6HMxzC9bcJiBuqs7ju7Tx+Wt0dNCUUM8egKwMjxOzorQ0Os
   rzCRuQJDTbuXlIM0ookj+HKzRu4l6hJtrfne4sumYoSSnPy7zQb4dcmHW
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="282631700"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="282631700"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 19:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="658366494"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2022 19:08:43 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6N8F-000ApO-8D;
        Wed, 29 Jun 2022 02:08:43 +0000
Date:   Wed, 29 Jun 2022 10:08:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 849f35422319a46c2a52289e2d5c85eb3346a921
Message-ID: <62bbb415.kfJsRIlq3hyF1O9a%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 849f35422319a46c2a52289e2d5c85eb3346a921  Merge tag 'thunderbolt-for-v5.20-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

elapsed time: 720m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                                defconfig
i386                             allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a016-20220627
x86_64               randconfig-a014-20220627
x86_64               randconfig-a012-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a013-20220627
x86_64               randconfig-a015-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a016-20220627
i386                 randconfig-a013-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a015-20220627
s390                 randconfig-r044-20220627
arc                  randconfig-r043-20220627
riscv                randconfig-r042-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
i386                 randconfig-a002-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a005-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a005-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a004-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
