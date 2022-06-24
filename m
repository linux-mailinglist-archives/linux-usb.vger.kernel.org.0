Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9DC55A529
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jun 2022 01:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiFXX6i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 19:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiFXX6h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 19:58:37 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5454BBAE
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 16:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656115116; x=1687651116;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wTc9mY5NCZoOm6VKXG7M2xjrfUpR+qvmmGsvn74xoJE=;
  b=iwSpBZyTLHNSNLLkCBfyDmQS7d8OGZyuzUMwVFkMbznbk0DyY0lb2cd9
   uv/6HIOoGNwBzrnd2SSE2Rq7oe63ILAyDHRSeXeUAXVzCRBI4I68VvP6q
   bvP/PqlYLMphhRih5uzbSFu8KAaAzlF2/YM3h0Gxq+8dW5PZKt5vkh7iy
   1vtXfTemLEdTbfG8AskIVov6yOcd4gqZgaIA0ivCxJQVFy6TDt+ZRdMCt
   IKyTnvVVpFvZfhQYa8FBuKGIgZ/V/xGTJwDPXP4Lr0cfFRarYyK5tf36m
   q++kWK5t4fiHNfSq9CUosh2OFVAU5zciRQLUYKyUB62RA37RXn+aI62ZQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="281165971"
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; 
   d="scan'208";a="281165971"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 16:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; 
   d="scan'208";a="589180886"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Jun 2022 16:58:35 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o4tC6-0004wK-H0;
        Fri, 24 Jun 2022 23:58:34 +0000
Date:   Sat, 25 Jun 2022 07:57:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 b24346a240b36cfc4df194d145463874985aa29b
Message-ID: <62b64f7c.Rn8V6ZqchrRGSzaw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: b24346a240b36cfc4df194d145463874985aa29b  usb: chipidea: udc: check request status before setting device address

elapsed time: 724m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
powerpc                           allnoconfig
i386                                defconfig
i386                             allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
arc                  randconfig-r043-20220624
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220624
hexagon              randconfig-r045-20220624
s390                 randconfig-r044-20220624
riscv                randconfig-r042-20220624

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
