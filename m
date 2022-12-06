Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB66C643C84
	for <lists+linux-usb@lfdr.de>; Tue,  6 Dec 2022 05:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiLFE5w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 23:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLFE5s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 23:57:48 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EBA64F4
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 20:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670302666; x=1701838666;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9yjT1L7bUuQZkvU0er/xEnojjxnBBtNqSLaY3Js9tQk=;
  b=WH9YmaWAO2vVO93uSPFRTLLhP5NgSQ+OWU7wO1AfSPaDcZJzQMJhmc+2
   8ODLb5vWG6yl6M8w64gTBXml+deC9T6J/bEQgv3pfzxqTVMlYmOlNyUNB
   BEsoKZlW72pPKNNj+lycodBLN+zP2TDmk8tu7KnPlTxt16CuVRqEcW6y7
   5rBAohDFawL9eef2OD7j7D4JI95viVDeTut5WOPcfE3G5JdKMkCnKN99I
   cQAtZV+z7meNCoNaj92pJJBIiI5UAZqBImBxqwecigAcSG1bdVojP9olc
   qSEnLpa/mukW6G7piMpQ1WcnV5NUHNR8MnAoPBAM1z6C3Ukd3YPMHJxoy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="378697981"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="378697981"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 20:57:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="820449226"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="820449226"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2022 20:57:44 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2Q1Y-0000bJ-0d;
        Tue, 06 Dec 2022 04:57:44 +0000
Date:   Tue, 06 Dec 2022 12:57:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 751fbcc59a16ece5d1fb35ae6b25ef79ffa92d0c
Message-ID: <638ecbae.00l1IxaR/IdwC+xQ%lkp@intel.com>
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
branch HEAD: 751fbcc59a16ece5d1fb35ae6b25ef79ffa92d0c  usb: gadget: uvc: Rename bmInterfaceFlags -> bmInterlaceFlags

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202212060347.MaTRoCo0-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/usb/gadget/legacy/webcam.c:174:3: error: field designator 'bmInterfaceFlags' does not refer to any field in type 'const struct uvc_format_uncompressed'; did you mean 'bmInterlaceFlags'?
drivers/usb/gadget/legacy/webcam.c:225:3: error: field designator 'bmInterfaceFlags' does not refer to any field in type 'const struct uvc_format_mjpeg'; did you mean 'bmInterlaceFlags'?

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-r012-20221205
|   |-- drivers-usb-gadget-legacy-webcam.c:error:field-designator-bmInterfaceFlags-does-not-refer-to-any-field-in-type-const-struct-uvc_format_mjpeg
|   `-- drivers-usb-gadget-legacy-webcam.c:error:field-designator-bmInterfaceFlags-does-not-refer-to-any-field-in-type-const-struct-uvc_format_uncompressed
|-- arm64-randconfig-r032-20221205
|   |-- drivers-usb-gadget-legacy-webcam.c:error:field-designator-bmInterfaceFlags-does-not-refer-to-any-field-in-type-const-struct-uvc_format_mjpeg
|   `-- drivers-usb-gadget-legacy-webcam.c:error:field-designator-bmInterfaceFlags-does-not-refer-to-any-field-in-type-const-struct-uvc_format_uncompressed
`-- powerpc-randconfig-r014-20221204
    |-- drivers-usb-gadget-legacy-webcam.c:error:field-designator-bmInterfaceFlags-does-not-refer-to-any-field-in-type-const-struct-uvc_format_mjpeg
    `-- drivers-usb-gadget-legacy-webcam.c:error:field-designator-bmInterfaceFlags-does-not-refer-to-any-field-in-type-const-struct-uvc_format_uncompressed

elapsed time: 727m

configs tested: 63
configs skipped: 3

gcc tested configs:
um                             i386_defconfig
i386                                defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
i386                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
sh                               allmodconfig
s390                             allmodconfig
s390                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
s390                             allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
arc                  randconfig-r043-20221205
s390                 randconfig-r044-20221205
riscv                randconfig-r042-20221205
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a011-20221205
x86_64               randconfig-a012-20221205
arm                                 defconfig
x86_64               randconfig-a014-20221205
i386                 randconfig-a013-20221205
x86_64               randconfig-a013-20221205
i386                 randconfig-a012-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a014-20221205
x86_64               randconfig-a015-20221205
i386                 randconfig-a015-20221205
i386                 randconfig-a016-20221205
x86_64               randconfig-a016-20221205
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221205
arm                  randconfig-r046-20221205
hexagon              randconfig-r041-20221205
x86_64               randconfig-a003-20221205
x86_64               randconfig-a004-20221205
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
x86_64               randconfig-a005-20221205
x86_64               randconfig-a006-20221205
i386                 randconfig-a001-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a005-20221205
i386                 randconfig-a006-20221205
i386                 randconfig-a003-20221205
hexagon              randconfig-r041-20221204
riscv                randconfig-r042-20221204
hexagon              randconfig-r045-20221204
s390                 randconfig-r044-20221204

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
