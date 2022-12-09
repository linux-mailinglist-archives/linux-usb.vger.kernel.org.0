Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9EFE647CD1
	for <lists+linux-usb@lfdr.de>; Fri,  9 Dec 2022 05:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiLIEFS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Dec 2022 23:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLIEFP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 23:05:15 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10018B2EE2
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 20:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670558710; x=1702094710;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VbQl8ExaSHrm/j5XEYS3BneLB2XIXAZyBRNU7Og7wZo=;
  b=IwmSKksu5bd/hqWdHt+MU7+C9aXwhS+hGibzzkST7rbWRn1xPzsdsMdW
   NVTlbQ8VqkyEJZ9ajTBR2zdHSOS8SbocZ5zb2HXihGDy3k/mbiUyIvg+a
   lb9ccRvUAt5uw21PQUykp7sksM+DI8JtSPY6FLPxzHliXagPvvUi0ChSK
   +qyelWZx85CJQ8Vv5B9JMep4+s6CsRvmw5k6qw+hh5mXKSoKH9ld5Cibl
   8q27/gOL3NAafuYDjRZ6VwOUTeLYkGJOZd6uRKk4Be7ltJxw3gzq1yGjr
   AVjkExcU6N6fO+nnNvact/T72vcNaqEt95e47Gd8fNYM4/dGWEyD8zHQ3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="300794726"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="300794726"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 20:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="789585716"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="789585716"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2022 20:05:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p3UdB-0001bX-2c;
        Fri, 09 Dec 2022 04:05:01 +0000
Date:   Fri, 09 Dec 2022 12:04:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 81c25247a2a03a0f97e4805d7aff7541ccff6baa
Message-ID: <6392b3e6.sSEcFCv7sUHyIGLH%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 81c25247a2a03a0f97e4805d7aff7541ccff6baa  usb: gadget: uvc: Rename bmInterfaceFlags -> bmInterlaceFlags

elapsed time: 729m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20221207
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
x86_64                          rhel-8.3-rust
i386                          randconfig-a001
i386                          randconfig-a014
i386                          randconfig-a003
i386                          randconfig-a012
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a013
arm                                 defconfig
x86_64                        randconfig-a011
i386                          randconfig-a016
i386                             allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a015
i386                          randconfig-a004
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
