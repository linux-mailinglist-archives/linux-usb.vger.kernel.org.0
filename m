Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C165806EA
	for <lists+linux-usb@lfdr.de>; Mon, 25 Jul 2022 23:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234916AbiGYVrN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 17:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiGYVrL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 17:47:11 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D8911821
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 14:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658785631; x=1690321631;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qSNyJLnE+tgP95CDZwA3GRRNF0DnpCPGk9aBUfC0S7Q=;
  b=DWXKsZdwr4n8Sx6ixS+XVj9Wcv2L557dZb1fvnOOl5rTricmgUmz1Wih
   ce9/VsRkUfM7buHOVp8ER9imZoTYfGDfa0NGjJ3j+qtdqRdM9kQ+3uaqB
   6ulp/54N4EHd5Gi6HNJL65H0BgCQ+XONIpQx3BmJ8LdKb0IGLlj9sVuDY
   +ysB1GadFpXPVeGymJoQEjbmedPZOEDSDvQ7ZS0GhMFI/DJIzIUOFYeG4
   3wEcmGJPsJxYWp9u6cCLDOMoqUtGreINu3z8cVIP3o0WX0rsh1QZ0d2Wb
   +wQUFMnXpejmBmUN1OJKkck65b7j5VVkKJeUPJTNm49ZCyVh8e6wqSfM6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="288559002"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="288559002"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 14:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="741975468"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2022 14:47:09 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oG5uu-0005b2-1c;
        Mon, 25 Jul 2022 21:47:08 +0000
Date:   Tue, 26 Jul 2022 05:46:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 b6de1f901039cfcbd605842d454bd80c589105d8
Message-ID: <62df0f21.ftv0oCNCsKXaO6BY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: b6de1f901039cfcbd605842d454bd80c589105d8  Merge tag 'usb-serial-5.20-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 721m

configs tested: 76
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc              randconfig-c003-20220724
i386                          randconfig-c001
arm                        clps711x_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc64                         alldefconfig
powerpc                    amigaone_defconfig
arm                        cerfcube_defconfig
arc                          axs101_defconfig
arm                        shmobile_defconfig
m68k                           virt_defconfig
arm                            lart_defconfig
xtensa                generic_kc705_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                               allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
i386                                defconfig
i386                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                          randconfig-a012
i386                          randconfig-a014
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
s390                 randconfig-r044-20220724
riscv                randconfig-r042-20220724
arc                  randconfig-r043-20220724
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
arm                         hackkit_defconfig
mips                         tb0219_defconfig
arm                        mvebu_v5_defconfig
mips                   sb1250_swarm_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r041-20220724
hexagon              randconfig-r045-20220724

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
