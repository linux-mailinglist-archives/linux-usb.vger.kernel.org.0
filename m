Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B4063BDF8
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 11:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiK2K3s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 05:29:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiK2K3q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 05:29:46 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8266643841
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 02:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669717783; x=1701253783;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/5dWgMdSI7RQDhXhehcp3QkOWiw7+6Dos7Oc6jRN9IA=;
  b=F7HAsLO1kt47SZeQYp2gp6YS5o3GzRUs67DkfJq1EgBUmksxHCpyZg2H
   mZV5UbCdrhvk8cu/8wVEAeBjSwug7SxzkKVsSHU/ZP30N5zw9hn1jnH2X
   6naehdvKyPnG52VgLYojOCemo8eYpEFsqC1AKkIk/qXtnmeie+ZtVO6ee
   qHczzV7JxwOZa9ZcdyDrHoCMMmyrXE7WsGsXTEk0yZPpioCjIENkIwxUf
   5F++o1LS1mixdrFNnYW2ejJDB4CGQpBYyQYq2MvzWNKWK2YcIT6JWTBT7
   dTVCD4basoVxk/hHW1qRN4ACL0EecDhzbWL/uPVA56X9bwRqL3Dzj0/sx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="316911293"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="316911293"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 02:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="643733643"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="643733643"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Nov 2022 02:29:41 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ozxrx-0008vO-0W;
        Tue, 29 Nov 2022 10:29:41 +0000
Date:   Tue, 29 Nov 2022 18:28:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 9d1566e1f36b5167731372d2dfea97dbb4c43edf
Message-ID: <6385dedd.M3Cr1F5qzwpo7Ojc%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 9d1566e1f36b5167731372d2dfea97dbb4c43edf  Merge 6.1-rc7 into usb-next

elapsed time: 1021m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221128
m68k                             allmodconfig
i386                 randconfig-a001-20221128
x86_64                              defconfig
i386                 randconfig-a004-20221128
arc                              allyesconfig
sh                               allmodconfig
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
mips                             allyesconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
x86_64                           allyesconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a001-20221128
i386                                defconfig
ia64                             allmodconfig
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a002-20221128
x86_64               randconfig-a006-20221128
x86_64               randconfig-a005-20221128
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
hexagon              randconfig-r041-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a012-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
