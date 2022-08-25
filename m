Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636215A0947
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 08:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbiHYG5c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 02:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiHYG5a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 02:57:30 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA76EA030B
        for <linux-usb@vger.kernel.org>; Wed, 24 Aug 2022 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661410649; x=1692946649;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nwGjKrKscNQbDDb6nw7k2K7YyTPhs6lkfJ//eKguzaQ=;
  b=TXs+nYYNVka6l3ZsHNy0SXbRef+19mihV1bg0wYtMo81nSaY+baVF5TG
   zUR1LDFpqP4vgiehpSKvJq5iGRGV+RN7JjKsZExgxi0TooYULfHIaleJ6
   y12ZKx/W1jDG/ycnzXJF53sPGeZFjtrUHLqvgAmS6L1iQS315CxiLGwJt
   w+A+lwW/XTaKH3hcTPthEsngmHN35HRPqQWrKBM94AaQRJ6vGR77WTjWm
   sFjXpzzy8uk5tZByiSDLdMbhg1uJYnsRVulpT8tUGSTaJlSNIFUSADEz6
   dDUUofXfoEit3I8xY7imBhkGzV2TuhZ+M3jav8Lflz+qb/9mmODtxNdgH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="380455506"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="380455506"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 23:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="752374102"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2022 23:57:28 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oR6nw-0001pk-0N;
        Thu, 25 Aug 2022 06:57:28 +0000
Date:   Thu, 25 Aug 2022 14:57:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 5f73aa2cf8bef4a39baa1591c3144ede4788826e
Message-ID: <63071d4a.4l0Q+jOBJk2dOnxB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 5f73aa2cf8bef4a39baa1591c3144ede4788826e  Revert "usb: typec: ucsi: add a common function ucsi_unregister_connectors()"

elapsed time: 2836m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a015
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                        randconfig-a006
arc                  randconfig-r043-20220823
alpha                            allyesconfig
i386                                defconfig
i386                          randconfig-a001
arc                              allyesconfig
i386                          randconfig-a003
m68k                             allmodconfig
i386                          randconfig-a005
m68k                             allyesconfig
i386                          randconfig-a016
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
loongarch                         allnoconfig
loongarch                           defconfig
riscv                randconfig-r042-20220824
s390                 randconfig-r044-20220824
arc                  randconfig-r043-20220824

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220823
riscv                randconfig-r042-20220823
hexagon              randconfig-r045-20220823
s390                 randconfig-r044-20220823
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a013
hexagon              randconfig-r045-20220824
hexagon              randconfig-r041-20220824

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
