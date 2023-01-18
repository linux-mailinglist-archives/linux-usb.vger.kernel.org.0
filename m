Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F251A6712AA
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 05:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjAREfp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 23:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjAREfo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 23:35:44 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA2A5422D
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 20:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674016543; x=1705552543;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p2TMeuoHCiqXNiVvaEzFPBWkmCMrafX75TcxuOqAEP0=;
  b=ZNOGxhayeUbHP8c0yjbw9H8qVBXtT1/Wb7uubhh0yYqeN6LnloXS4yQH
   porNEYlwhuNXbbsd4NzTSS3zfS0JqWGiXRU6Ick0XH+xHS6bSkIcZictH
   tq1+WXfsfVquor0ZZtYYtN5oGVC5/HxvIfULkj/lMGMWTlMQH5KNNh2/o
   g+qA0ytBL405Gl6OiIkEwvVve7p4FssbSkPkC7t9gdiuf6GYGQnhfujXX
   hdlwreZqmWBYD9W4tbOo6HK58Q/K9kxh8aI40z/R6wp97+82C2qd0aBPT
   SXu4f5aMh0Wj2QWfvUj4bwo6eiDS3f1GdPySMfkBQFWXZNo6FvuwPte7S
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="387246524"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="387246524"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 20:35:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="722935997"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="722935997"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jan 2023 20:35:41 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pI0Am-0001dC-30;
        Wed, 18 Jan 2023 04:35:40 +0000
Date:   Wed, 18 Jan 2023 12:34:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 82b0417e4bfc5af8c1710996913374f09f4a2a03
Message-ID: <63c776e4.sMGJ/YE2kF2hEg4q%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 82b0417e4bfc5af8c1710996913374f09f4a2a03  usb: cdnsp: : add scatter gather support for ISOC endpoint

elapsed time: 721m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
i386                                defconfig
sh                               allmodconfig
s390                             allyesconfig
i386                 randconfig-a014-20230116
i386                 randconfig-a013-20230116
m68k                             allyesconfig
i386                 randconfig-a012-20230116
m68k                             allmodconfig
i386                 randconfig-a011-20230116
arc                              allyesconfig
alpha                            allyesconfig
mips                             allyesconfig
i386                 randconfig-a015-20230116
i386                 randconfig-a016-20230116
x86_64               randconfig-a011-20230116
powerpc                          allmodconfig
x86_64               randconfig-a012-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
ia64                             allmodconfig
x86_64               randconfig-a016-20230116
x86_64               randconfig-a015-20230116
arm                                 defconfig
x86_64                              defconfig
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117
i386                             allyesconfig
arm                              allyesconfig
x86_64                               rhel-8.3
arm64                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
hexagon              randconfig-r045-20230117
s390                 randconfig-r044-20230117
i386                 randconfig-a002-20230116
hexagon              randconfig-r041-20230117
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
riscv                randconfig-r042-20230117
i386                 randconfig-a001-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
