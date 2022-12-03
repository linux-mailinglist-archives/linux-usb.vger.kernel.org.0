Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1B96414FD
	for <lists+linux-usb@lfdr.de>; Sat,  3 Dec 2022 09:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbiLCIjs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Dec 2022 03:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiLCIjr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Dec 2022 03:39:47 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8637BC25
        for <linux-usb@vger.kernel.org>; Sat,  3 Dec 2022 00:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670056786; x=1701592786;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=S4YTp6fvscY/E8RLStViOKHsPXuSnuLaCUErga3aAy0=;
  b=dbTkQ0Ehe0AQ6EZnwLyzoBaPDp4kmKag+40+bAMIg1ogVSfLDsIoU0P7
   1xVfEisUK7XrSZMJilrsp8mbBtODw1AcihRKOwDdzGUuYPibbOjDsNyOI
   ikloLUjuz+ZuNYTH7KFssiVs7Nq8CO+OrRWqNYYuRE5bv2nzT1mebrQgq
   m2grtiucqu/6I6hGu6JBK0+pI1gNxmnQOZ8iPolA0vRYzfCZQq8fvSlJS
   IUBJ3975l0wEV+9uEFRcEnhk3VGXDxqaQ0bQhH+TmMDyPH5iso1iauTcK
   l5V5Txtxmu7F8Wf9hn1dxPmC7T5V4VrHVUtQJ79o+5SiidvXzGtb8CLpl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="343084006"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="343084006"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 00:39:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="890418798"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="890418798"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Dec 2022 00:39:44 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1O3k-000EQF-0E;
        Sat, 03 Dec 2022 08:39:44 +0000
Date:   Sat, 03 Dec 2022 16:38:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 1524ceb14dd5ebd6f724d993c5ec1a9a8d445d8e
Message-ID: <638b0b23.CzKoiX8geGeBmKpK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1524ceb14dd5ebd6f724d993c5ec1a9a8d445d8e  Merge tag 'usb-serial-6.1-rc8' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 833m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
arc                                 defconfig
alpha                               defconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221201
x86_64                           allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
ia64                             allmodconfig
riscv                randconfig-r042-20221201
x86_64                           rhel-8.3-syz
s390                 randconfig-r044-20221201
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
s390                             allmodconfig
s390                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                                defconfig
s390                             allyesconfig
x86_64                        randconfig-a013
i386                             allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r045-20221201
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
