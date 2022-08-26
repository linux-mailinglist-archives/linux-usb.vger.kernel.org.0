Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5275A1F87
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 05:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244491AbiHZDvq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 23:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiHZDvp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 23:51:45 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A442065261
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 20:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661485904; x=1693021904;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RIxAUGaQ9d3qxSTmtBSBoQGdghpiBbTiRRJv0puNY1w=;
  b=ATyb0brse4GVtpE9egvo1Tp2acSUrYXr104ulLf5UrpSh0CgXV7mdDIQ
   GH8gyUMlddskm8kOtzLIBo/C0GEpFXaKR0n3gXZs2RL5PgHZixNQjbB2z
   flnsPte5advq65LPNkBh4XWYXfaWoB/x00zy0UuMnw6OphWesT/No7/Wd
   G/4E5Sy4nXelmxWPfCnjB8URf38ibeDRi64IGbSCOuEnpqJoDfzQvuXDg
   DhXwJQG9HuCbbzYXELAySxo2RaRO8Pf92pSkERWEXluYIMxR31UW9H0EO
   qnITbv0lFmWTKhuBhp2MsNeYsj3fa2jSOnmjIMnKKkOI5bodXAYlb88rW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="281385978"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="281385978"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 20:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="671292917"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2022 20:51:42 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oRQNi-0003JG-17;
        Fri, 26 Aug 2022 03:51:42 +0000
Date:   Fri, 26 Aug 2022 11:51:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 8531aa1659f7278d4f2ec7408cc000eaa8d85217
Message-ID: <63084349.hb6sz7CYm869nnaZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 8531aa1659f7278d4f2ec7408cc000eaa8d85217  Revert "xhci: turn off port power in shutdown"

elapsed time: 720m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                          allmodconfig
loongarch                         allnoconfig
sh                               allmodconfig
arc                              allyesconfig
mips                             allyesconfig
um                           x86_64_defconfig
loongarch                           defconfig
alpha                            allyesconfig
powerpc                           allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
i386                                defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a004
x86_64                           allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                             allyesconfig
arm                                 defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arc                  randconfig-r043-20220823
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220825
riscv                randconfig-r042-20220824
s390                 randconfig-r044-20220824
arc                  randconfig-r043-20220824
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220825
hexagon              randconfig-r041-20220823
i386                          randconfig-a002
hexagon              randconfig-r045-20220825
i386                          randconfig-a004
i386                          randconfig-a013
riscv                randconfig-r042-20220823
i386                          randconfig-a011
i386                          randconfig-a006
hexagon              randconfig-r045-20220823
i386                          randconfig-a015
s390                 randconfig-r044-20220825
riscv                randconfig-r042-20220825
s390                 randconfig-r044-20220823

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
