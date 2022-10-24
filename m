Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAD66097AE
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 03:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiJXBF2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 21:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiJXBF0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 21:05:26 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0105140038
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 18:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666573525; x=1698109525;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YSdU0BlVkB+kmMNnfAH6OaQCzpB4LdfsCKoXpkueeIk=;
  b=BRkJxb0KUw0000NvhvdVrU+sJZVv3lGdTm6g7Be27+ik+7ba7JA19eU3
   n40NJq7T7H7edDFuetnIqDdO7bFtii0ZhcWrsRRz+PUeVeVd3WJMfI6yv
   5Kk7jE1yguL5IBZ65AWWur36g/ibuS8uRrmRp8J6ERGvlVk1qDkqfVxLK
   wIZDi7hdUpOtlCO2cae5mEvF7pIrEU4wUiqYKE1ZqLTy03Vs4ZG7S1TSv
   GdOEJhxLesBXscY7Y88WXpXU99z1ewO7NHUqaful4XEy/XRpI8W6FxTuQ
   xiKYwJ6dBywaBtugPZ/9E9ipu/R/q6ysojGeQktiR6xN8OW9tZALiTY+9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="308408387"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="308408387"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2022 18:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="700003358"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="700003358"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 23 Oct 2022 18:05:23 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1omlu6-0004pa-2L;
        Mon, 24 Oct 2022 01:05:22 +0000
Date:   Mon, 24 Oct 2022 09:05:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 8127cac0f393abaddf5747bcc7e7ccf6668117fe
Message-ID: <6355e4ca.tV591zWIos+0pYxv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 8127cac0f393abaddf5747bcc7e7ccf6668117fe  usb: chipidea: usbmisc: add power lost check for imx7ulp

elapsed time: 720m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20221023
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a012
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64                        randconfig-a015
x86_64                           rhel-8.3-syz
i386                          randconfig-a005
x86_64                              defconfig
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
arc                                 defconfig
s390                             allyesconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a016
mips                             allyesconfig
x86_64                               rhel-8.3
i386                                defconfig
i386                          randconfig-a014
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a001
x86_64                        randconfig-a013
x86_64                        randconfig-a002
x86_64                        randconfig-a011
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a004
ia64                             allmodconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221023
i386                          randconfig-a011
i386                          randconfig-a013
hexagon              randconfig-r041-20221023
i386                          randconfig-a004
s390                 randconfig-r044-20221023
x86_64                        randconfig-a016
riscv                randconfig-r042-20221023
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a001
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a003
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
