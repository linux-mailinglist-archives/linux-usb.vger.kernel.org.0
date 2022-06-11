Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291185477DF
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jun 2022 01:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiFKXOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jun 2022 19:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiFKXOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jun 2022 19:14:51 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087483FDAF
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 16:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654989290; x=1686525290;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TuAuV5rLoQVDlWDphdJYae3ITpWAiubq97mt+tNejVs=;
  b=lT0qSWb3e/qt5nxR1QLMIAMFcVXT4YkAFggJ5YeXw7+atm3LgJ1rTDp8
   p2g8XvSoOBxtkq4FQp+ahIkkv0BaS+BaUF58HgNMbQkaGrUk77YWlSNsR
   pCOhETYHVbD+3wanFL9zMskdDrxraAJb5Mz470j6PSk01/xpYIY0KnIQB
   fVFA1mykPmsB5eOyPeVUV+UmcGzdMA9TleFmL6SVLZraNe+E4M0OoZWfE
   iE8H3Ih10YlQ0lVLpX9RzsAb4SNm+SMd2pjjeA1uQfafy3uNYIO+B5aXf
   FloGuFCM6ynUumxU5+RarobaX596y9GXSAQoDpG2zw3lqCREBG8LEAUiS
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10375"; a="278714525"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="278714525"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 16:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="586960150"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2022 16:14:48 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o0AJb-000JP5-J0;
        Sat, 11 Jun 2022 23:14:47 +0000
Date:   Sun, 12 Jun 2022 07:14:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 477122a1eec325621cefd62da8bd8ac20a66fb8e
Message-ID: <62a521d1.7pa6peuEv+x2ortF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 477122a1eec325621cefd62da8bd8ac20a66fb8e  usb: typec: tcpm: Register USB Power Delivery Capabilities

Warning reports:

https://lore.kernel.org/linux-usb/202206110832.2zOQ2T8f-lkp@intel.com
https://lore.kernel.org/llvm/202206111907.EvH06x2T-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/dwc3/dwc3-qcom.c:301:23: warning: no previous prototype for 'dwc3_qcom_read_usb2_speed' [-Wmissing-prototypes]
drivers/usb/dwc3/dwc3-qcom.c:301:23: warning: no previous prototype for function 'dwc3_qcom_read_usb2_speed' [-Wmissing-prototypes]
drivers/usb/dwc3/dwc3-qcom.c:302:23: warning: no previous prototype for 'dwc3_qcom_read_usb2_speed' [-Wmissing-prototypes]
drivers/usb/dwc3/dwc3-qcom.c:302:23: warning: no previous prototype for function 'dwc3_qcom_read_usb2_speed' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- alpha-randconfig-r006-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- alpha-randconfig-r032-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arc-randconfig-r005-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arc-randconfig-r032-20220612
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arc-randconfig-r036-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arm-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arm-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arm-defconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arm-randconfig-r001-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arm64-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arm64-defconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arm64-randconfig-r001-20220612
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- arm64-randconfig-r014-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- csky-randconfig-r001-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- ia64-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- ia64-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- ia64-randconfig-r004-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- ia64-randconfig-r022-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- ia64-randconfig-r023-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- ia64-randconfig-r035-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- m68k-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- m68k-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- m68k-randconfig-r031-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- microblaze-randconfig-r033-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- mips-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- mips-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- mips-randconfig-r031-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- nios2-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- nios2-randconfig-r036-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- openrisc-randconfig-r005-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- openrisc-randconfig-r005-20220612
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- openrisc-randconfig-r022-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- openrisc-randconfig-r024-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- openrisc-randconfig-r036-20220612
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- parisc-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- parisc-randconfig-r006-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- powerpc-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- riscv-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- riscv-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- s390-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- sparc-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- sparc-randconfig-r004-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- sparc-randconfig-r016-20220612
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- sparc64-randconfig-r021-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- sparc64-randconfig-r034-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
|-- xtensa-allyesconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed
`-- xtensa-randconfig-r035-20220611
    `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-dwc3_qcom_read_usb2_speed

clang_recent_errors
|-- arm-randconfig-r023-20220611
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-function-dwc3_qcom_read_usb2_speed
`-- mips-randconfig-r024-20220611
    `-- drivers-usb-dwc3-dwc3-qcom.c:warning:no-previous-prototype-for-function-dwc3_qcom_read_usb2_speed

elapsed time: 2171m

configs tested: 71
configs skipped: 3

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                                defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220611
arc                  randconfig-r043-20220611
s390                 randconfig-r044-20220611
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220611
hexagon              randconfig-r045-20220611

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
