Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613EA20BF06
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jun 2020 08:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgF0Gvf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jun 2020 02:51:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:17110 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbgF0Gvf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Jun 2020 02:51:35 -0400
IronPort-SDR: aSI9bU43PyJzASQcm2kybStMxgSB9O6fcShZT/26QtX0dDg28MJtjWLIlCqpPDIZw7KBz+D1TF
 Bg01lgacMLCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="125245552"
X-IronPort-AV: E=Sophos;i="5.75,286,1589266800"; 
   d="scan'208";a="125245552"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 23:51:34 -0700
IronPort-SDR: qv5Vt5QY9p4wIM6ultO5EhmvQKbnphRF7ffdjXAq0oBhcZuP0ofHNj53MBu1Dm5tiAI+1xA+Ey
 R/AtJRMTYJqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,286,1589266800"; 
   d="scan'208";a="276576312"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Jun 2020 23:51:32 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jp4gW-0002h6-7R; Sat, 27 Jun 2020 06:51:32 +0000
Date:   Sat, 27 Jun 2020 14:50:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ed8fa04243e22f7b8f470d08e5806c9f8c6a460a
Message-ID: <5ef6ec38.fTSONKo+t+8XpCnk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: ed8fa04243e22f7b8f470d08e5806c9f8c6a460a  Merge tag 'fixes-for-v5.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus

elapsed time: 727m

configs tested: 100
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arc                     haps_hs_smp_defconfig
powerpc                          g5_defconfig
mips                        jmr3927_defconfig
sh                           se7751_defconfig
arm                       imx_v6_v7_defconfig
arm                            xcep_defconfig
arm                      pxa255-idp_defconfig
arm                          tango4_defconfig
h8300                            allyesconfig
arc                                 defconfig
m68k                          atari_defconfig
arm                        mini2440_defconfig
arm                          pxa168_defconfig
arm                            lart_defconfig
arm                             pxa_defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
arm                     eseries_pxa_defconfig
mips                      loongson3_defconfig
parisc                            allnoconfig
arm                         bcm2835_defconfig
powerpc                       ppc64_defconfig
sh                  sh7785lcr_32bit_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
