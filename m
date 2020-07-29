Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E83231CA6
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 12:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgG2K0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 06:26:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:61688 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgG2K0H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jul 2020 06:26:07 -0400
IronPort-SDR: 9fr9Xwy7NliJNpxuPj+RThETSbqYmI3X6eB9Z6LVX8ub9P+F/kD+q/mT6QzOVmuRh7jwuAz/VZ
 MHU1NWjQpW5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="150558655"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="150558655"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 03:26:07 -0700
IronPort-SDR: +MomgHOrGxAEuXiKLfRu7nhII/WLOXerC/QIsdkYg3FiQW6lUJbTCKNcaXeC0Ic6O3QdcIsQ0t
 D44sUE0nhO5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="464814774"
Received: from lkp-server02.sh.intel.com (HELO 1bde1f275adc) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Jul 2020 03:26:05 -0700
Received: from kbuild by 1bde1f275adc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k0jHg-00003E-Lo; Wed, 29 Jul 2020 10:26:04 +0000
Date:   Wed, 29 Jul 2020 18:25:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 fa56dd9152ef955bd21082c5330e4dff8621bca6
Message-ID: <5f214ea1.PLZIgSu4aeE2FBb4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: fa56dd9152ef955bd21082c5330e4dff8621bca6  Merge tag 'usb-serial-5.9-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 1017m

configs tested: 71
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                     davinci_all_defconfig
nios2                            alldefconfig
arm                         vf610m4_defconfig
m68k                            mac_defconfig
sh                          lboxre2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a003-20200728
i386                 randconfig-a004-20200728
i386                 randconfig-a005-20200728
i386                 randconfig-a002-20200728
i386                 randconfig-a006-20200728
i386                 randconfig-a001-20200728
x86_64               randconfig-a014-20200728
x86_64               randconfig-a012-20200728
x86_64               randconfig-a015-20200728
x86_64               randconfig-a016-20200728
x86_64               randconfig-a013-20200728
x86_64               randconfig-a011-20200728
i386                 randconfig-a016-20200728
i386                 randconfig-a012-20200728
i386                 randconfig-a013-20200728
i386                 randconfig-a014-20200728
i386                 randconfig-a011-20200728
i386                 randconfig-a015-20200728
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
