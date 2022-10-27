Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA7F60EF25
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 06:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbiJ0Erk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 00:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbiJ0Erj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 00:47:39 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D636E15627A
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 21:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666846057; x=1698382057;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DjfBOyh90d6MjCAvR9yNDO6UjKsmKn5uMAefhwsZX5s=;
  b=je3n/qkRP4Mcx8nU7XAu90wqTHX66kwevHH3xbKAsodewq26uLc6VXPp
   Ikw8+qgeQqUvIAFkWsCBQP/tBPy+Un1TXrM/zT38PNvTXJsUgTfPFqEE2
   abwK2tjei3RskkY4uir/GDVRO40hlX2i/QLxD2d5kP3yEBWL4R3O3RcDC
   ToYtGP647ov9Il5pfr9i5pDJ02vt0a6LOq5twt8266iuXBBUNQY+GEMZy
   6rOJsKF8gMqyFwYkC8kC2Eo26cUCKkqC584ovoYaiPt7rhbgAG3pVqw+S
   HrwlL+LJPxvJt1Yg2sBvpCtdb3pIrJ5bgZDEmsKa9nx7y9CEJk3xYt9gl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="308121874"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="308121874"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 21:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="961484431"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="961484431"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2022 21:47:36 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onunn-0008HV-2p;
        Thu, 27 Oct 2022 04:47:35 +0000
Date:   Thu, 27 Oct 2022 12:47:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 308c316d16cbad99bb834767382baa693ac42169
Message-ID: <635a0d59.rZeedW3mw10X4Pyp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 308c316d16cbad99bb834767382baa693ac42169  usb: dwc3: gadget: Don't set IMI for no_interrupt

elapsed time: 722m

configs tested: 75
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
sh                               allmodconfig
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221026
i386                                defconfig
riscv                randconfig-r042-20221026
x86_64                           rhel-8.3-kvm
s390                 randconfig-r044-20221026
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a004
i386                          randconfig-a001
x86_64                        randconfig-a002
x86_64                        randconfig-a013
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a005
m68k                             allmodconfig
x86_64                        randconfig-a006
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
m68k                            q40_defconfig
arm                           imxrt_defconfig
arm                         assabet_defconfig
arm                          gemini_defconfig
mips                            ar7_defconfig
arc                            hsdk_defconfig
arm                             ezx_defconfig
sh                            migor_defconfig
nios2                         3c120_defconfig
sparc                               defconfig
arc                              alldefconfig
arm                            pleb_defconfig
mips                      maltasmvp_defconfig
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r041-20221026
hexagon              randconfig-r045-20221026
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a002
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a014
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
powerpc                      pmac32_defconfig
mips                      bmips_stb_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
