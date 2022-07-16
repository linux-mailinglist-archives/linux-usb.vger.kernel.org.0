Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829F9576B3C
	for <lists+linux-usb@lfdr.de>; Sat, 16 Jul 2022 03:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbiGPB65 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 21:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiGPB64 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 21:58:56 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4CDE0E2
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 18:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657936735; x=1689472735;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MRXyHwSnv454KRCsnI3aw7OL4uygwmhT2kl+aXvLzds=;
  b=HNRDI2Ar6t6Nj8zg9LGvQu8855XSdVYyH/5gb8LD0HdImJI2DT4aCmZ8
   6DTusS79HhBKSasH3lktQNa5gqDBGzo2P2ZA3L/n2JsAj2YtHmyc/dLUP
   rFUVIXwty8buVSa2Be9m05KARIbD9thlj9CO53jC3lhg9XqfY9mTZ/fCw
   EcRSKoKu5BNdEsg4ziU32MmYcFvlK/tQe+na+fx7RgBXtKuHdwTUY4ZvC
   9oOQavDKXGFjQNUwsN/khQaNNrS7q+ORimQM5sK1HH6ybtOtMGAtqCskL
   PrTbeinw418dao+sEfEkzsfZUlhIXPNHZxx8F2JcDOQLUUVNPiGk2jhdk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="284695419"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="284695419"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 18:58:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="664407582"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jul 2022 18:58:54 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCX53-00011B-CS;
        Sat, 16 Jul 2022 01:58:53 +0000
Date:   Sat, 16 Jul 2022 09:58:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c76d09da77d69d7f737540985912ad2bca654713
Message-ID: <62d21b48.BXj0hgme+PgsVFPe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c76d09da77d69d7f737540985912ad2bca654713  platform/chrome: cros_ec_typec: Get retimer handle

elapsed time: 726m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220715
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
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
riscv                randconfig-r042-20220715
hexagon              randconfig-r045-20220715
hexagon              randconfig-r041-20220715
s390                 randconfig-r044-20220715

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
