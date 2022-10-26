Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4BD60DB12
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 08:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbiJZGSq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 02:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbiJZGSo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 02:18:44 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8754714037
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 23:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666765123; x=1698301123;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7eHKdUAiZ/S3HsVRqIobg0RyBPcwh4SZeM5+bONNbfU=;
  b=heHG8w43epxvQZ3BEe83PKWmeeFkW0Rh7e9MaMtsn3/uOkoAc6fkmHv0
   +CJQ6qKwSE8t8oXT/on6w7Y5f/KOPUHETGWinerVxcGdxOZX0rtJVvNUC
   UW9Quoo6nEfvbJqDww6/OLsFKWm56E09YS9q5p18pRzecmwq/CLm/QJoa
   SjoIG8V8rPB+4yzIwd7IXrr+VvfKUczY0W207SjBDGi60FzpPmhzoSarh
   /7P9BHKthmHwZLmQBRhnzgQUZoCGaTrQ6uWFj0ZMoXWwVzygNxQ5Q+FY5
   lU/SRK035B9j8vCzUTREQ4q65Y0w32qySo7QYjXOEY6a5cL/j6Mh1Q2DX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="306598885"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="306598885"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 23:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="631895736"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="631895736"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Oct 2022 23:18:41 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onZkP-00075w-0i;
        Wed, 26 Oct 2022 06:18:41 +0000
Date:   Wed, 26 Oct 2022 14:18:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 5aed5b7c2430ce318a8e62f752f181e66f0d1053
Message-ID: <6358d13f.VJXLdRB9klVgUUho%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 5aed5b7c2430ce318a8e62f752f181e66f0d1053  xhci: Remove device endpoints from bandwidth list when freeing the device

elapsed time: 726m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221024
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20221024
powerpc                           allnoconfig
arc                  randconfig-r043-20221023
powerpc                          allmodconfig
s390                 randconfig-r044-20221024
mips                             allyesconfig
i386                                defconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
ia64                             allmodconfig
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-a011-20221024
i386                 randconfig-a014-20221024
x86_64                              defconfig
i386                             allyesconfig
i386                 randconfig-a013-20221024
i386                 randconfig-a012-20221024
i386                 randconfig-a016-20221024
i386                 randconfig-a015-20221024
m68k                             allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                  randconfig-r043-20221025
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
riscv                randconfig-r042-20221026
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016

clang tested configs:
hexagon              randconfig-r045-20221023
hexagon              randconfig-r041-20221024
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221024
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
x86_64               randconfig-a001-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a003-20221024
x86_64               randconfig-a004-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a006-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a002-20221024
x86_64                        randconfig-a012
i386                 randconfig-a005-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
x86_64                        randconfig-a016
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
