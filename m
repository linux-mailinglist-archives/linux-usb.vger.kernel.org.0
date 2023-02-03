Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8BC688F55
	for <lists+linux-usb@lfdr.de>; Fri,  3 Feb 2023 07:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjBCGDr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Feb 2023 01:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjBCGDp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Feb 2023 01:03:45 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70555709B4
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 22:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675404223; x=1706940223;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w7bClF8oPZGW+LahuRNtiQrowc63E41TZFkKdFO0iHo=;
  b=hKwPxF8RdNL+KkgsSYECTwsyye+MKY/3Z6BuyKThzdgr9fV1df9hs/WN
   1FAvJYrA0iJ4CVxs+BrK3+lNSKefv4XzAeS4OniKhw3yYNjZwy5jOxpvY
   lPj7QMRedrtYRcXkz2n3wOYILdFyhEZlpG/Yst6YehhABwPVkf0+X4lxw
   U5TtcJwG3e+QGxppxW6iwTXfmIj5jruWYJpjKPJhEI1U3iSmp21f88K8V
   641J13tDflxzSJAwErRGs6nnIislD9Jh4NG38zFvu0npXzXsvx08P0RsV
   y8VSbeIH940apV6hkt0jImEZ8C7SlEIYRo88eGRltRbDNQ3PoKK2tL03Q
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="312321337"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="312321337"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 22:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="754355974"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="754355974"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2023 22:03:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pNpAi-0000B7-1u;
        Fri, 03 Feb 2023 06:03:40 +0000
Date:   Fri, 03 Feb 2023 14:02:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 b0425784b942fffbbdb804896197f1dbccda37c5
Message-ID: <63dca386.KDK+vNUVTKZfoQ39%lkp@intel.com>
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
branch HEAD: b0425784b942fffbbdb804896197f1dbccda37c5  xhci: decouple usb2 port resume and get_port_status request handling

elapsed time: 852m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                        randconfig-a002
x86_64                           allyesconfig
sh                               allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a006
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
s390                 randconfig-r044-20230202
arc                  randconfig-r043-20230202
riscv                randconfig-r042-20230202
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a005
arm                  randconfig-r046-20230202
hexagon              randconfig-r045-20230202
hexagon              randconfig-r041-20230202
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
riscv                randconfig-r042-20230203
s390                 randconfig-r044-20230203
hexagon              randconfig-r045-20230203
hexagon              randconfig-r041-20230203

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
