Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0448F609083
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 02:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiJWAFF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Oct 2022 20:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiJWAFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Oct 2022 20:05:03 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACAE40E26
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666483500; x=1698019500;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vxqrgElRKlE0OnIpXsHY9G8PfphMI6bvkY2hbpgz5OI=;
  b=C6J5b78hUDhn1Bsc7IFvHB9jDsi23XQloig+peh7DAFYD9b0NJrS9VZi
   /cA33HVoBwXFdLvZ2a2eXiMMYHGPOB2rlUvphSSbdYxryU07SGda7w5WA
   Q0KuhjSk8RtJHRypVAgVBvRAJb50rG8xRALxSkzq7J3cIPLW95UOziEJf
   WQxG4hCScuoWPI5vCRKwkQMRCiT7LJ2XxSsPuK9CslUsHmqqKd2wWL9p2
   Skl6OviPXvCba2e+CH2FKhC6bRTw+AjyrFHS0Hg1TwoUYxpD0GcmHBR82
   sp6miTfW7+9f8XgbSlgcDJj9CuHDaK0ITbzoWjJmJbzsTeRwziVMZqtXd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="294618094"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="294618094"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2022 17:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="960030624"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="960030624"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Oct 2022 17:04:57 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1omOU4-0003zO-1b;
        Sun, 23 Oct 2022 00:04:56 +0000
Date:   Sun, 23 Oct 2022 08:03:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ef9b5001471cf71e4e587dcbaa6e84f13cec03fd
Message-ID: <635484ef.4twNYdSJHMlHbVRS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ef9b5001471cf71e4e587dcbaa6e84f13cec03fd  usb: chipidea: usbmisc: add power lost check for imx7ulp

elapsed time: 721m

configs tested: 59
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
i386                                defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                              defconfig
mips                             allyesconfig
sh                               allmodconfig
s390                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arm                                 defconfig
x86_64                               rhel-8.3
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a014
x86_64                           allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20221019
m68k                             allmodconfig
x86_64                        randconfig-a013
arc                  randconfig-r043-20221020
x86_64                        randconfig-a004
m68k                             allyesconfig
arm                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
s390                 randconfig-r044-20221020
x86_64                        randconfig-a002
arm64                            allyesconfig
riscv                randconfig-r042-20221020
x86_64                           rhel-8.3-kvm
alpha                            allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
riscv                randconfig-r042-20221019
hexagon              randconfig-r041-20221020
hexagon              randconfig-r045-20221020
i386                          randconfig-a015
x86_64                        randconfig-a012
hexagon              randconfig-r045-20221019
hexagon              randconfig-r041-20221019
x86_64                        randconfig-a005
s390                 randconfig-r044-20221019
x86_64                        randconfig-a001
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
