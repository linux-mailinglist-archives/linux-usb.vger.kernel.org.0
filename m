Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 721085ABC6F
	for <lists+linux-usb@lfdr.de>; Sat,  3 Sep 2022 04:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbiICCuo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 22:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbiICCun (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 22:50:43 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E7820BDF
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 19:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662173442; x=1693709442;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LhTuPJMofhC/SbaQ7YrSSnhGgNu0bi9fl9kmVCenLfc=;
  b=jFiw4WgpLz6j7SseAIqrMtv49yFV84zOfZBwbNZtO8Hay5Do9J0YuJhm
   VzZvUt4zOe739g7mhbGorN0NsOiBzivi+pF4s6NC7tK4gKbgVok1mkqPz
   T4Ni3beDSU92zdRxDnfTBiRK7HwN4wYgplsByfb+aA6bxlOnZTmNDLFCz
   7iuaRLgoc3cIxLFKIMSsGAdKojVGwbkUlXz6XILHbk0HQFm27jeWnsjto
   bMwh9P7RMH5ga+gBUjunpQwbTXCOzx8EqF/Rk1OUrPnCLlABP+W6YjnDQ
   fSsOTV2A2jmjpozT4IA+r3FtSXNK7oQd/+HLbM4e12rkMFUfa4zf5HJAE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="279139612"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="279139612"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 19:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="590291876"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 02 Sep 2022 19:50:40 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUJF1-0000v5-2Q;
        Sat, 03 Sep 2022 02:50:39 +0000
Date:   Sat, 03 Sep 2022 10:50:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS WITH WARNING
 fe0a2ac7c627b064c479ad0c3b25e531d342e048
Message-ID: <6312c0f1.q8Y5ShinronIIEWG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: fe0a2ac7c627b064c479ad0c3b25e531d342e048  Revert "usb: gadget: udc-xilinx: replace memcpy with memcpy_toio"

Warning reports:

https://lore.kernel.org/linux-doc/202209030207.7BTPa8q0-lkp@intel.com

Warning: (recently discovered and may have been fixed)

Documentation/driver-api/usb/usb:176: ./drivers/usb/core/hub.c:6040: WARNING: Unknown target name: "pre".

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-allnoconfig
    `-- Documentation-driver-api-usb-usb:.-drivers-usb-core-hub.c:WARNING:Unknown-target-name:pre-.

elapsed time: 1158m

configs tested: 53
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220901
alpha                            allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a002
m68k                             allyesconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a006
m68k                             allmodconfig
i386                          randconfig-a001
powerpc                           allnoconfig
i386                          randconfig-a003
x86_64                        randconfig-a013
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                               rhel-8.3
i386                          randconfig-a014
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
i386                          randconfig-a012
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
x86_64                        randconfig-a015
sh                               allmodconfig
x86_64                           allyesconfig
i386                                defconfig
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
riscv                randconfig-r042-20220901
hexagon              randconfig-r045-20220901
hexagon              randconfig-r041-20220901
s390                 randconfig-r044-20220901
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
