Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B8459A7FE
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 23:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237655AbiHSV5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 17:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237450AbiHSV5P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 17:57:15 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BD5B942B
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 14:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660946234; x=1692482234;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=idBO4eNutfJtNxAHBdpznjHhcknUnivhY7CClFYqq1Q=;
  b=YcT38IPe4l3XVm4JnRgJCwGQrMOjQ9yOE7bt8odJArAY0Ghfhv1WMvH6
   hSE/qARqx+zhLmSvEmJ058zLyp9HN2Ow6nYb5n1Yi3lttdwnsJfDweaE9
   PMf3IvS97yu26X1S2S4tZkmvqjnBCebtGSunpvJJxsXqMArp5mMcYL6jV
   rEtMQwe0qVhcAN0f0Wm31Kih8Wwnx0WaY1387qcrQtszDsTabaMJFVQLg
   oSc4WrxjGiVg5Wnpv+tUB6+75quhkvunhEI7E+4UIikccOqcHqGoBp3LX
   NxZK3FsbyTgYtrp1BIDhO6o2SG6cLAEUbHBialZbeZa5hxX5jqY1esf6+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="379405095"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="379405095"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 14:57:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="668756994"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Aug 2022 14:57:13 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oP9zM-0001ql-1w;
        Fri, 19 Aug 2022 21:57:12 +0000
Date:   Sat, 20 Aug 2022 05:56:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS WITH WARNING
 a8c67e27d9e3ed33afadbdf86bbd58e26e0c4357
Message-ID: <63000709.79x4DAEU+D2F+Dx6%lkp@intel.com>
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
branch HEAD: a8c67e27d9e3ed33afadbdf86bbd58e26e0c4357  dt-bindings: usb: mtu3: add compatible for mt8188

Warning reports:

https://lore.kernel.org/linux-usb/202208190411.1lugjsYz-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/dwc3/dwc3-qcom.c:313:25: warning: variable 'hcd' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
`-- riscv-allmodconfig
    `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used

elapsed time: 720m

configs tested: 53
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arm                                 defconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                              defconfig
arc                  randconfig-r043-20220819
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
m68k                             allyesconfig
m68k                             allmodconfig
i386                          randconfig-a014
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a016
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
i386                             allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
arm                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220819
hexagon              randconfig-r041-20220819
x86_64                        randconfig-a012
i386                          randconfig-a002
riscv                randconfig-r042-20220819
s390                 randconfig-r044-20220819
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
