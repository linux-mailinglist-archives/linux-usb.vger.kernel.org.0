Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 271E55A869A
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 21:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiHaTSp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 15:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiHaTSo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 15:18:44 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC91CDA3E2
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661973523; x=1693509523;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TZkH63pFfr3Mu/2NxuC6Tra86VE9OnM1XQka6YIcYFs=;
  b=G2Qg/L827aByoVtASubx0KsXYarzbQ2Sm22X+ircszYFMES8G1GO7toZ
   nK4z0jwCxXefvA6ZlhPbCywOE82mXPgJG5Rx1x1WgaC/+9zRrksbnkG/H
   8tkdCy08VOH4e3rM+D5lXZB5R8aRt7vk2SIMN0fEjd4XE27eJFMc5LpIC
   RO7w+wf9LtDvI60iZ+Hju2d4oblMKqf7etF6Bh5KZNfmTjqpytPY+XGKI
   tW7oQ9Yh2V3+VHp4Q7SYVs/bdeIzgYcObd+S/ednipe0LDjaxf3+W/wZu
   H4+AFU35ihu+1fJtZGHK9THalA7JC5W/ayi0u/jBB3yXiayYtxC7OLyhk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="321667830"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; 
   d="scan'208";a="321667830"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 12:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; 
   d="scan'208";a="563146410"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 31 Aug 2022 12:18:24 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTTEF-0000ci-2n;
        Wed, 31 Aug 2022 19:18:23 +0000
Date:   Thu, 01 Sep 2022 03:17:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 8f36b3b4e1b58dca7d05e1579019230437e55d43
Message-ID: <630fb3db.mBEzsNhfjps6zND2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 8f36b3b4e1b58dca7d05e1579019230437e55d43  usbip: add USBIP_URB_* URB transfer flags

elapsed time: 725m

configs tested: 77
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220830
arm                                 defconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
arm64                            allyesconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a002
arm                              allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a004
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
i386                          randconfig-a012
x86_64                        randconfig-a013
i386                          randconfig-a003
i386                             allyesconfig
i386                          randconfig-a016
x86_64                        randconfig-a011
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
sh                               allmodconfig
arc                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
loongarch                           defconfig
loongarch                         allnoconfig
arc                        nsim_700_defconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                          lboxre2_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
s390                 randconfig-r044-20220831
arc                  randconfig-r043-20220831
riscv                randconfig-r042-20220831
arc                           tb10x_defconfig
arm                       multi_v4t_defconfig
parisc64                            defconfig
powerpc                      cm5200_defconfig
arm                            hisi_defconfig
powerpc                      pcm030_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     rainier_defconfig
arm                      jornada720_defconfig

clang tested configs:
hexagon              randconfig-r045-20220830
riscv                randconfig-r042-20220830
hexagon              randconfig-r041-20220830
s390                 randconfig-r044-20220830
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                        randconfig-a003
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a014
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a006
i386                          randconfig-a004
arm                        vexpress_defconfig
arm                         socfpga_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
