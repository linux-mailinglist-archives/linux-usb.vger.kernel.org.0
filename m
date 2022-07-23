Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1FB57F211
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jul 2022 01:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239062AbiGWXYO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Jul 2022 19:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239028AbiGWXYN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Jul 2022 19:24:13 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FF112775
        for <linux-usb@vger.kernel.org>; Sat, 23 Jul 2022 16:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658618652; x=1690154652;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Jq9lJHlWd8HYz87jEX+851djEHuF+4utqx1RpZfMlEw=;
  b=dtQh7Ot+t2v77ZM90y2KYLmrGk7rgmSJj4gY1no9joLnUJ6T2HQk64Pf
   wbPAiKZ3f8Kf8pzm3h6xhQ1O8cZhbmMiJVF5j3vkJtMIzyvYdQj5dGf0H
   ln26dBv8PzhJmRUr/C33LuVQvzNHYfLf41fv4ERB45xgsFPSA5SuDLxXL
   oxHY//LDXPFhXc+/LtgORx8+3NRz4cWd3FgmcR0d0QseCysT43uuAwLHJ
   S9E4ljqwLnLbxeQlbCm7x+FsFHlg6X5r9TNdpT0A7XEFt2HqAj0P8uEau
   4KutzMIIUNDFlwZISDYyebQxVDc9tLmzIDCZyfd+o1r81sfcOonKYHCXT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10417"; a="286259931"
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="286259931"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2022 16:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="574577067"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Jul 2022 16:24:11 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oFOTi-0003Ds-1M;
        Sat, 23 Jul 2022 23:24:10 +0000
Date:   Sun, 24 Jul 2022 07:23:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 b7423bb23cdd0ee4850279742158a64a4bb25ef0
Message-ID: <62dc82fa.LoEAXthG9SvaGlMc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: b7423bb23cdd0ee4850279742158a64a4bb25ef0  USB: docs: fixed table margin in configfs-usb-gadget-mass-storage

elapsed time: 720m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a005
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220722
arc                  randconfig-r043-20220722
s390                 randconfig-r044-20220722
arc                  randconfig-r043-20220721
x86_64                        randconfig-a006
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a006
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220722
hexagon              randconfig-r041-20220722
hexagon              randconfig-r041-20220721
hexagon              randconfig-r045-20220721
s390                 randconfig-r044-20220721
riscv                randconfig-r042-20220721

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
