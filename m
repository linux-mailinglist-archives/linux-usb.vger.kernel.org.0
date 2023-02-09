Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05A968FBF4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 01:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjBIA0W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 19:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjBIA0V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 19:26:21 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD3F1B557
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 16:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675902380; x=1707438380;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oOwBptlBv55HHj6BhYgyQlqaKwsv6SJjBXzU3WFYQrA=;
  b=PpMZAZA4MVul9+aN14O06cL/aF/OPDTqmCsH5+6Hr8CBfVGnjSjTF1DW
   IJpIEqJ6+BoxZ08+z93me86vLlo51GUZF68r1Qbnt55iwAzLo4AJc6cpW
   o/86OkNEjhIlS9HtkbYFEMcxVDgJ8b5OEIvRGNoqrKdvir/LL3Xeya7Mp
   wYv/Q5/gP3QWaJcGXrEbdhZ9TkoxoOJOeO/eJr61XqzMeqIRKRF1N+43p
   iyH/ccK9O2gE+smFYJsOsSYJIHAwu3DWWiemtkPLZ+9dE+8JiMg5MEWjf
   A94XzHQF4WFarxBr0vg5DSRzUgzJjGUtdwOVyB3H3gTqr5ZJwaATM2jw5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416188212"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="416188212"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 16:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="791401037"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="791401037"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 16:26:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPulW-0004ik-0b;
        Thu, 09 Feb 2023 00:26:18 +0000
Date:   Thu, 09 Feb 2023 08:25:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 88e054e8df1db32cea4ccb911b67dba22f1ddfa2
Message-ID: <63e43d96.2b0n7GoVC2eNydat%lkp@intel.com>
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
branch HEAD: 88e054e8df1db32cea4ccb911b67dba22f1ddfa2  Merge tag 'thunderbolt-for-v6.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202302071942.wrmMMxiA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302072028.rI3pAivq-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/gadget/configfs.c:824:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
drivers/usb/gadget/configfs.c:824:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- alpha-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- alpha-randconfig-r033-20230207
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- arc-buildonly-randconfig-r001-20230205
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- i386-randconfig-a014
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- ia64-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- loongarch-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- m68k-buildonly-randconfig-r003-20230205
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- m68k-randconfig-r021-20230206
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- nios2-randconfig-r011-20230204
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- openrisc-randconfig-r001-20230206
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- sh-randconfig-r015-20230204
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- sparc-allyesconfig
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
clang_recent_errors
|-- hexagon-randconfig-r041-20230206
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- i386-randconfig-a011
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- i386-randconfig-a015
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- mips-randconfig-r035-20230207
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- riscv-randconfig-r003-20230204
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
|-- riscv-randconfig-r042-20230205
|   `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used
`-- s390-randconfig-r044-20230205
    `-- drivers-usb-gadget-configfs.c:warning:variable-ret-set-but-not-used

elapsed time: 725m

configs tested: 62
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
sh                               allmodconfig
x86_64                           rhel-8.3-bpf
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
arm                                 defconfig
i386                 randconfig-a012-20230206
i386                 randconfig-a013-20230206
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a016-20230206
i386                 randconfig-a015-20230206
i386                          randconfig-a014
arm                              allyesconfig
i386                                defconfig
arm64                            allyesconfig
mips                             allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
powerpc                          allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                          randconfig-a012
x86_64                               rhel-8.3
m68k                             allmodconfig
i386                          randconfig-a016
arc                              allyesconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
riscv                randconfig-r042-20230206
s390                 randconfig-r044-20230206
i386                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig

clang tested configs:
i386                          randconfig-a013
i386                 randconfig-a004-20230206
i386                          randconfig-a011
i386                 randconfig-a003-20230206
i386                 randconfig-a006-20230206
i386                 randconfig-a001-20230206
i386                 randconfig-a002-20230206
i386                 randconfig-a005-20230206
i386                          randconfig-a015
x86_64                          rhel-8.3-rust
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
hexagon              randconfig-r045-20230205
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r041-20230205

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
