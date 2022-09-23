Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92925E71CD
	for <lists+linux-usb@lfdr.de>; Fri, 23 Sep 2022 04:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiIWCQ1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 22:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiIWCQ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 22:16:26 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA15EBBFA
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 19:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663899385; x=1695435385;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZJZVvp6RsjPCQ1G1hM+rxwzBQMxA/inJ+4HhJU00QEg=;
  b=CHEhSvtCqntgX5VJ8a6f/HGdPR16+0HrgYUW7AAih5StzmgxiikIwRBI
   o+9Qt32niwNwT9RMrSJivZ58xPKIFqr7+mTxlZEwEuuPn07ol+A8HxnjP
   MOOGxXuYErvgZLe9nGQivqez97SEEjuLq8uo0uDzZ2QTaCNaFdgf488hd
   VOQRPbiySTSp7lHoWMaxuYaz6AtYbpYoIq34v56REjpGD8xBPOK0IZlZG
   fU0BPinM+p7RG68y/JwvaSd32pMrANgA2ZaGMh7fJ0Y4p1V4u402Czqod
   tCIxNQyCbrnonlkJtAf/qqA4ZUQq9vw2h9uloe8JlMsgDN2rciiBK+I4c
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="364501974"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="364501974"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 19:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="682488104"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2022 19:16:23 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obYEp-0005CS-0Q;
        Fri, 23 Sep 2022 02:16:23 +0000
Date:   Fri, 23 Sep 2022 10:16:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 47af6c640ed82f111dbce0b3bf4083a91d61e324
Message-ID: <632d16f2.pAewr0x/IBYhpsCY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 47af6c640ed82f111dbce0b3bf4083a91d61e324  Merge tag 'usb-serial-6.0-rc7' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 723m

configs tested: 85
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
um                           x86_64_defconfig
alpha                            allyesconfig
um                             i386_defconfig
s390                             allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
arc                  randconfig-r043-20220922
x86_64                        randconfig-a013
x86_64                              defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                                defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
i386                          randconfig-a014
arm                              allyesconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a003
i386                             allyesconfig
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
ia64                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
powerpc                      tqm8xx_defconfig
csky                             alldefconfig
xtensa                    smp_lx200_defconfig
sh                           se7705_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
microblaze                          defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220922
i386                          randconfig-c001
sparc                               defconfig
loongarch                        alldefconfig
xtensa                       common_defconfig
m68k                        stmark2_defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220922
riscv                randconfig-r042-20220922
hexagon              randconfig-r045-20220922
x86_64                        randconfig-a012
s390                 randconfig-r044-20220922
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
i386                          randconfig-a006
mips                     loongson1c_defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
