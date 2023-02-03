Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B31D688B76
	for <lists+linux-usb@lfdr.de>; Fri,  3 Feb 2023 01:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233131AbjBCAKB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 19:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbjBCAKA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 19:10:00 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6642629158
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 16:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675382999; x=1706918999;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PTIWzUiiWcWhgD30igDbFW54Lq9uLp8g4gUo1u7uJeU=;
  b=P1rI+u5LH62VU0cy2pnQGtu674E4+7M7s/bkl6dLgV1jKiKd4yCET7CO
   DNyzhpk1K5CKcqHYAmMDnF9081L9RWWnTGUOW+zt8reXiXgjNXNMz0VHc
   cYr8GdOcOKuwM/kAHVWAfs9jpnVCubPaJC9NRoq9T7raRw6LJ4APLcqNU
   laWBRO9ue4SgFRbrSg/YckG2E6OuEDBMH2EtBXuyYEfeEp/X8LbIkSXVP
   qgVoktQ8YSxDu4QdwplWsf0XtiS3LQEx3CEsMfGRAO3RsJ8m4by3nTKYR
   2lEcKj8OAWqwpHiXQy8WmMj/p4fMNJ4UmDET3f7yrwX+P4W8gltL+ax9E
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="316609441"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="316609441"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 16:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="754267406"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="754267406"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2023 16:09:57 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pNjeO-0006ye-1O;
        Fri, 03 Feb 2023 00:09:56 +0000
Date:   Fri, 03 Feb 2023 08:09:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f82060da749c611ed427523b6d1605d87338aac1
Message-ID: <63dc50c0.FFUcIT34IkIRb42J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: f82060da749c611ed427523b6d1605d87338aac1  usb: typec: ucsi: Don't attempt to resume the ports before they exist

elapsed time: 772m

configs tested: 62
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
x86_64                              defconfig
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64               randconfig-a006-20230130
x86_64               randconfig-a005-20230130
x86_64                    rhel-8.3-kselftests
s390                                defconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
x86_64                           allyesconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a013
riscv                randconfig-r042-20230202
s390                 randconfig-r044-20230202
x86_64                        randconfig-a015
x86_64                        randconfig-a011
arc                  randconfig-r043-20230202
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                          randconfig-a006
arm                  randconfig-r046-20230202
hexagon              randconfig-r045-20230202
hexagon              randconfig-r041-20230202
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
