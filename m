Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B897865DD24
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 20:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239968AbjADTx3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 14:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240302AbjADTxT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 14:53:19 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81A53F125
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 11:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672861990; x=1704397990;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fwka77KzM9mVpjl8mz+LMcYwZ1BxCK9deadI4FdcL7E=;
  b=RrVq1dvCKSxKp8hk4XwfRltmxPxsOy3duatHGbnKGxCgB3XPNeq+fd4A
   87YTd2IGRoOPa59C14cJy6VLdiZT+BOhzJdWkIQm7tlDnu64L6HDdL1xA
   bNBNFVBtOx7zj+74ZdiHujbHEEJprDnf2rJL0JLhauSb3WzJf00IREFLh
   xWq5CNUNvIFjXwnlEJ8GdDDtFqnmMmgW7SgNx9gh9QIGjp9qgJh2pigO1
   R7pSwwYptIXNYTSWNkMU1LWWOF/UKTFv74sDtkADpLK9czYjizytDmazo
   uEXc+OWqV0rZ+SaGpZNGPNtC3rJDSNNLnrK6fPZ8ZVfO7Iwu7vzXjZTU4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="305530883"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="305530883"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 11:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="723775291"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="723775291"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2023 11:53:08 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pD9ox-0000iM-2t;
        Wed, 04 Jan 2023 19:53:07 +0000
Date:   Thu, 05 Jan 2023 03:52:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 953ff25fc9fb831a675259ce1e738c94fb6202b6
Message-ID: <63b5d901.F7rPzlgU8gzlQF0K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 953ff25fc9fb831a675259ce1e738c94fb6202b6  thunderbolt: Refactor tb_acpi_add_link()

elapsed time: 723m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                              defconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20230103
s390                 randconfig-r044-20230103
riscv                randconfig-r042-20230103
i386                 randconfig-a004-20230102
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a003-20230102
x86_64                          rhel-8.3-func
i386                 randconfig-a001-20230102
i386                 randconfig-a002-20230102
i386                 randconfig-a005-20230102
x86_64                               rhel-8.3
i386                 randconfig-a006-20230102
x86_64               randconfig-a003-20230102
x86_64               randconfig-a001-20230102
x86_64                           allyesconfig
x86_64               randconfig-a004-20230102
x86_64               randconfig-a002-20230102
x86_64               randconfig-a006-20230102
x86_64               randconfig-a005-20230102
i386                             allyesconfig
x86_64                           rhel-8.3-bpf
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20230101

clang tested configs:
i386                 randconfig-a013-20230102
i386                 randconfig-a012-20230102
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a015-20230102
arm                  randconfig-r046-20230103
i386                 randconfig-a016-20230102
hexagon              randconfig-r045-20230103
hexagon              randconfig-r041-20230103
x86_64                          rhel-8.3-rust
x86_64               randconfig-a011-20230102
x86_64               randconfig-a014-20230102
x86_64               randconfig-a012-20230102
x86_64               randconfig-a013-20230102
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
