Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95EEE5AA65E
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 05:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235275AbiIBDbF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 23:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbiIBDa7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 23:30:59 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38DCABD71
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 20:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662089452; x=1693625452;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W/rSRAkjxriSygk4PKWM8ZhVJ80D63SCOsw7O8HshIc=;
  b=a40lAE539YH0uQv+2uvbXnDAhkqUZh9dm0loVkIoH+l/vXeUGkgvhP3v
   VM+zsAFG5JMtU0e9w83tILE+HdjrI+feOhbLQKTUT2zJrEQR9327f1BIY
   poZ6Ehi7r56djWWCCvhww186gdgIprXjATI71hOjYnfxBAs2ba3NNoP2+
   N4cRILhGOs0o/MC42RBqKPbyV7bm4thRKAirtvM0cxOYwakVVq2aZeHza
   sF6e4BRCpjD/RrjR727OMwr2YSgNGbfdMRPYnT9HUZkQkB2GYwfT/RZV+
   qjFqfwHVXgzeEgSIcIaM0It/TioWmPQQaK886BhKjJvWJsePVdJsIon8Q
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="297167760"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="297167760"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 20:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="738727278"
Received: from lkp-server02.sh.intel.com (HELO fccc941c3034) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2022 20:30:50 -0700
Received: from kbuild by fccc941c3034 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTxOM-00004n-0Q;
        Fri, 02 Sep 2022 03:30:50 +0000
Date:   Fri, 02 Sep 2022 11:29:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 a6aedb58a887aa2ea142ee914ff4030d019584bf
Message-ID: <631178b4.c20f7/yGs0dyuLsU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: a6aedb58a887aa2ea142ee914ff4030d019584bf  Merge tag 'usb-serial-6.0-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 1092m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
x86_64                        randconfig-a004
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a002
i386                          randconfig-a005
i386                          randconfig-a012
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
arc                  randconfig-r043-20220901
x86_64                               rhel-8.3
x86_64                        randconfig-a006
x86_64                           allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a016
i386                          randconfig-a011
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
i386                          randconfig-a006
i386                          randconfig-a015
hexagon              randconfig-r041-20220901
x86_64                        randconfig-a005
riscv                randconfig-r042-20220901
hexagon              randconfig-r045-20220901
s390                 randconfig-r044-20220901

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
