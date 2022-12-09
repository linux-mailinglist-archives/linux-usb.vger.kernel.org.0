Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE085647CBF
	for <lists+linux-usb@lfdr.de>; Fri,  9 Dec 2022 05:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiLIEFM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Dec 2022 23:05:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLIEFJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 23:05:09 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4BAB2EE0
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 20:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670558705; x=1702094705;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DdjVKQUmB0EDBnWwoxucjd+oYt7NT0Owb7VGI3sFqrw=;
  b=eBWAZRanQBsR6cpVIu4szkLW3PIUAEHN/9pt4nJ/DeqNEG+aZxlHJSlL
   mlSt+d/1KDNJAc8I3qLghipYNRc05uSLQzhnNvBKmqYyNJ2LcaBWejYgd
   IUdOZOslLP85zv6g0J0tBbjPWqbYHfgN/oln8c/k204SaWFZz5/eydSRw
   9M+7cMd6fOauwrXVKmt5Zy6MD831yPNs5VKqDaXidq2Ds3njjRsJ4FeA7
   CLRmhJLxGsZo+HEqwYgEnUZbQt6c+BdLEoKX1bR+ttE/ghy1BFnnfKD0R
   EbJNIhaOdjv6Kyfk0YiLPDA80CSz7U4xYW2sjFSstLQJOAv20O+vYLHLO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="300794722"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="300794722"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 20:05:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="649425294"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="649425294"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Dec 2022 20:05:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p3UdB-0001bR-2P;
        Fri, 09 Dec 2022 04:05:01 +0000
Date:   Fri, 09 Dec 2022 12:04:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 82710ecd0e5d401c36ad21f00d644672005233b9
Message-ID: <6392b3e9.ZxyudBqZYYyqIaEE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 82710ecd0e5d401c36ad21f00d644672005233b9  Merge tag 'usb-serial-6.2-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 730m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sh                               allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20221207
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
i386                                defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
arm                                 defconfig
i386                             allyesconfig
s390                                defconfig
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
ia64                             allmodconfig
arm                              allyesconfig
s390                             allyesconfig
i386                          randconfig-a005
arm64                            allyesconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a013
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
