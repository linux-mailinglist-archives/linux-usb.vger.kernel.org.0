Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5495ADCB0
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 02:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiIFAwI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 20:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiIFAwH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 20:52:07 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86413474C6
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 17:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662425526; x=1693961526;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cvqdInnz2xSvh4iJd+L/CHE93/Wbfcn1EXdltu/5pmI=;
  b=csiaNZUfCoazaVRalE3x3XkIcuarc9vJXvKGXsJflQfoU6XR63/HDMTK
   pkYDqArBF0bnswzIjYng+JIAFiVBGvaaZqL319YPn5jxLej0qJp+nPmAM
   4G3ButDN5bqwE3WAQhXo+wqqZX77BywOvmZZStvllIw7YMMFN5WTKJLSP
   2xnfDrO4CGl8Peit/v7wKI27fcBd8u9PlJpfaAmdo2FTUob/og4kowUgK
   pdO89zIWaEsld5ihC8IyJGntZzJvtWT2JcnZB2Jza6EQf0iCqaRRWuuPq
   ZB7xeQ/45lCK7Xt5qTdUZ1ncDW6PHH2bAl9cmWKGusX6ca6ICeGVJG7it
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="322641370"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="322641370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 17:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="739718476"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Sep 2022 17:52:04 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oVMou-0004gX-0o;
        Tue, 06 Sep 2022 00:52:04 +0000
Date:   Tue, 06 Sep 2022 08:51:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 6690986da1e21f3bebe1aaa54a70c636f40343b5
Message-ID: <6316997f.yLV9d2rNJ9/116AX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 6690986da1e21f3bebe1aaa54a70c636f40343b5  usb: clean up after dropping driver registration log spam

elapsed time: 728m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
arm                                 defconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
arc                  randconfig-r043-20220905
m68k                             allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
arm                              allyesconfig
x86_64                              defconfig
arm64                            allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a003-20220905
i386                 randconfig-a004-20220905
i386                                defconfig
i386                 randconfig-a001-20220905
i386                 randconfig-a002-20220905
i386                 randconfig-a005-20220905
i386                 randconfig-a006-20220905
x86_64                           allyesconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a003-20220905
x86_64               randconfig-a002-20220905
x86_64               randconfig-a001-20220905
x86_64               randconfig-a004-20220905
x86_64               randconfig-a006-20220905
x86_64               randconfig-a005-20220905
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220905
hexagon              randconfig-r041-20220905
riscv                randconfig-r042-20220905
s390                 randconfig-r044-20220905
x86_64               randconfig-a012-20220905
x86_64               randconfig-a013-20220905
x86_64               randconfig-a011-20220905
x86_64               randconfig-a014-20220905
x86_64               randconfig-a016-20220905
x86_64               randconfig-a015-20220905
i386                 randconfig-a013-20220905
i386                 randconfig-a012-20220905
i386                 randconfig-a011-20220905
i386                 randconfig-a014-20220905
i386                 randconfig-a015-20220905
i386                 randconfig-a016-20220905

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
