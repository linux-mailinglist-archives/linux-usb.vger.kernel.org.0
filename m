Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47EB950B1BB
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 09:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444916AbiDVHkQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 03:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444923AbiDVHkM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 03:40:12 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2B651334
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650613040; x=1682149040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eS6MU90FaAdP+WgDXWi3MNTG+A6Jzv/0TV5EWsbZ9Lk=;
  b=OMEqqQXi+XN+DWI8IwimXqplzNsThq4qnhcYdmG0uTUdlyXl1O5v8FVh
   gdHr64zA4isQduoPGAOGT+ypH50le4rd3eJW2/mpZw1Gij0N7WjAhyAY2
   8WfOrx3jJnKHI63U54vScLUo8iDv+uFfQqAPf3BWkUdRdhrRBA4USdTdp
   M7TlTKTcRDJXQTWhp9Gx0iPtNuFEQP+gYYDVYhRqTrct6JE5TrglXazfT
   PnvnnWuFKnakU/DdFWaLk7QUI3/BpSZydXdf0PagE27DFARYRDKDn5j+s
   H3mO4kx6CfxexCx9vInK9KbrzFZCYp60EUrTb1nd0/IdchuJVwB5e5ffI
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246509720"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="246509720"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 00:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="648515806"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2022 00:37:18 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nhnqw-0009tm-2C;
        Fri, 22 Apr 2022 07:37:18 +0000
Date:   Fri, 22 Apr 2022 15:36:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 bf95c4d4630c7a2c16e7b424fdea5177d9ce0864
Message-ID: <62625afc.yeX5MRh3k/M4okGO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: bf95c4d4630c7a2c16e7b424fdea5177d9ce0864  usb: gadget: configfs: clear deactivation flag in configfs_composite_unbind()

elapsed time: 799m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc                     asp8347_defconfig
sh                           se7712_defconfig
sh                        edosk7760_defconfig
arm                             rpc_defconfig
powerpc                 linkstation_defconfig
powerpc64                           defconfig
powerpc                       ppc64_defconfig
parisc                           alldefconfig
mips                         cobalt_defconfig
sparc64                             defconfig
arm                          iop32x_defconfig
arm                         assabet_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220421
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
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
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220421
s390                 randconfig-r044-20220421
riscv                randconfig-r042-20220421
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220421
mips                 randconfig-c004-20220421
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220421
powerpc              randconfig-c003-20220421
powerpc                      ppc64e_defconfig
mips                           rs90_defconfig
powerpc                        fsp2_defconfig
powerpc                     tqm8560_defconfig
hexagon                          alldefconfig
arm                     davinci_all_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
