Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5B01D7C39
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 17:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgERPDQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 11:03:16 -0400
Received: from mga01.intel.com ([192.55.52.88]:6818 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbgERPDP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 11:03:15 -0400
IronPort-SDR: uvQRUMxM3bXKLycqLoey2freZp1BcP5J1IOfXYvynw3dIZqK9Tngxv2E+VZL1kM3qYtLUuy+JJ
 18tb12NoV4jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 08:03:13 -0700
IronPort-SDR: uS5clPfH1+xA4GrrF87RB4snxv8rQSdGc+eZb9WuG4I7E1bAOSyxD+6Yowoq/fdT7Wo/576E1B
 bM3K3ngjm28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="373411881"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 May 2020 08:03:12 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jahIN-0005hs-PR; Mon, 18 May 2020 23:03:11 +0800
Date:   Mon, 18 May 2020 23:02:19 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 48a789079a146ecd916e29cc5e47410d9cb05fbe
Message-ID: <5ec2a37b.BlirQ6yafcKFiu+n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 48a789079a146ecd916e29cc5e47410d9cb05fbe  Merge 5.7-rc6 into usb-next

Error/Warning in current branch:

include/linux/unaligned/access_ok.h:13:28: error: redefinition of 'get_unaligned_le32'
include/linux/unaligned/access_ok.h:18:28: error: redefinition of 'get_unaligned_le64'
include/linux/unaligned/access_ok.h:23:28: error: redefinition of 'get_unaligned_be16'
include/linux/unaligned/access_ok.h:28:28: error: redefinition of 'get_unaligned_be32'
include/linux/unaligned/access_ok.h:33:28: error: redefinition of 'get_unaligned_be64'
include/linux/unaligned/access_ok.h:38:29: error: redefinition of 'put_unaligned_le16'
include/linux/unaligned/access_ok.h:43:29: error: redefinition of 'put_unaligned_le32'
include/linux/unaligned/access_ok.h:48:29: error: redefinition of 'put_unaligned_le64'
include/linux/unaligned/access_ok.h:53:29: error: redefinition of 'put_unaligned_be16'
include/linux/unaligned/access_ok.h:58:29: error: redefinition of 'put_unaligned_be32'
include/linux/unaligned/access_ok.h:63:29: error: redefinition of 'put_unaligned_be64'
include/linux/unaligned/access_ok.h:8:28: error: redefinition of 'get_unaligned_le16'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- ia64-allmodconfig
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_be16
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_be32
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_be64
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_le16
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_le32
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_le64
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_be16
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_be32
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_be64
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_le16
|   |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_le32
|   `-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_le64
`-- ia64-allyesconfig
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_be16
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_be32
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_be64
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_le16
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_le32
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-get_unaligned_le64
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_be16
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_be32
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_be64
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_le16
    |-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_le32
    `-- include-linux-unaligned-access_ok.h:error:redefinition-of-put_unaligned_le64

elapsed time: 537m

configs tested: 128
configs skipped: 6

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
powerpc                      tqm8xx_defconfig
arm                       omap2plus_defconfig
sh                         apsh4a3a_defconfig
mips                   sb1250_swarm_defconfig
um                                allnoconfig
sh                   secureedge5410_defconfig
sh                        apsh4ad0a_defconfig
powerpc                          allmodconfig
s390                          debug_defconfig
sh                         ap325rxa_defconfig
c6x                                 defconfig
h8300                    h8300h-sim_defconfig
c6x                        evmc6457_defconfig
arm                           corgi_defconfig
mips                     cu1000-neo_defconfig
mips                           xway_defconfig
arm                          ixp4xx_defconfig
arm                            mps2_defconfig
mips                           ip27_defconfig
sh                           se7724_defconfig
sh                            titan_defconfig
arc                              alldefconfig
um                                  defconfig
mips                 pnx8335_stb225_defconfig
sh                          lboxre2_defconfig
mips                     decstation_defconfig
arm                          iop32x_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
arm                          moxart_defconfig
mips                          rb532_defconfig
arm                            u300_defconfig
arm                          imote2_defconfig
nds32                               defconfig
um                               allyesconfig
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
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
openrisc                            defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200518
i386                 randconfig-a005-20200518
i386                 randconfig-a001-20200518
i386                 randconfig-a003-20200518
i386                 randconfig-a004-20200518
i386                 randconfig-a002-20200518
x86_64               randconfig-a016-20200518
x86_64               randconfig-a012-20200518
x86_64               randconfig-a015-20200518
x86_64               randconfig-a013-20200518
x86_64               randconfig-a011-20200518
x86_64               randconfig-a014-20200518
i386                 randconfig-a016-20200518
i386                 randconfig-a012-20200518
i386                 randconfig-a014-20200518
i386                 randconfig-a011-20200518
i386                 randconfig-a015-20200518
i386                 randconfig-a013-20200518
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
