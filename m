Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1CB6265C8
	for <lists+linux-usb@lfdr.de>; Sat, 12 Nov 2022 01:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbiKLAFh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Nov 2022 19:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiKLAF2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Nov 2022 19:05:28 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E0E252B0
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 16:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668211527; x=1699747527;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f6EnZpDiHw457F8m5Z5N1s84Jnu6zSHUeqJGIh2QXIo=;
  b=T0vLxtZfSD2evSnLHfWEUWU+9F/Jq+wl0xv5EGGmQDtXIh9E1Wrh2yPW
   X8syC1jIHWA0gKSjvaKoY1zc6q2UObg+WKqQRUe1NtckzOvs4EuF0VOTZ
   m9qvmc+kiqo2QvnIQvqbqQFIhP6e2xQkBTupX56Fg+srubMHUvdkm6bxN
   QvipC7Rtc2RQuHWds6p+aGWKUFSCQyi2L0AodedIV20RzJUaNy2TCCs9Q
   5RXjfkIvb/Vkhj7ZBUyV1lt/iOjasRs0p6S2N9innccYHj51IhAfDQjYg
   9LL7gPwJ2973SuzRppvz953+oMmeuQLFmNDWSNrYMwEtTaHMr2y/yep5U
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="292083361"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; 
   d="scan'208";a="292083361"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 16:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="743430247"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; 
   d="scan'208";a="743430247"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2022 16:05:25 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ote1V-0004Ne-0H;
        Sat, 12 Nov 2022 00:05:25 +0000
Date:   Sat, 12 Nov 2022 08:04:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 dd65a243a915ca319ed5fee9161a168c836fa2f2
Message-ID: <636ee30e.xtmxoJdkM1DEUt2q%lkp@intel.com>
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
branch HEAD: dd65a243a915ca319ed5fee9161a168c836fa2f2  usb/usbip: Fix v_recv_cmd_submit() to use PIPE_BULK define

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211112132.0BUPGKCd-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

fotg210-core.c:(.init.text+0x26): undefined reference to `usb_disabled'
fotg210-hcd.c:(.exit.text+0x32): undefined reference to `usb_hcds_loaded'
fotg210-hcd.c:(.init.text+0x26): undefined reference to `usb_disabled'
fotg210-hcd.c:(.text+0x1654): undefined reference to `usb_hub_clear_tt_buffer'
fotg210-hcd.c:(.text+0x25b4): undefined reference to `ehci_cf_port_reset_rwsem'
fotg210-hcd.c:(.text+0x5e3e): undefined reference to `usb_calc_bus_time'
fotg210-hcd.c:(.text+0x76b4): undefined reference to `usb_hcd_link_urb_to_ep'
fotg210-hcd.c:(.text+0x8a56): undefined reference to `usb_hc_died'
fotg210-hcd.c:(.text+0x8b70): undefined reference to `usb_hcd_check_unlink_urb'
fotg210-hcd.c:(.text+0x8c9a): undefined reference to `usb_disabled'
fotg210-hcd.c:(.text+0x90a0): undefined reference to `usb_remove_hcd'
fotg210-hcd.c:(.text+0xda2): undefined reference to `usb_hcd_unlink_urb_from_ep'
s390-linux-ld: fotg210-hcd.c:(.init.text+0x3e): undefined reference to `usb_hcds_loaded'
s390-linux-ld: fotg210-hcd.c:(.text+0x5f38): undefined reference to `usb_calc_bus_time'
s390-linux-ld: fotg210-hcd.c:(.text+0x7500): undefined reference to `usb_hcd_link_urb_to_ep'
s390-linux-ld: fotg210-hcd.c:(.text+0x7564): undefined reference to `usb_hcd_unlink_urb_from_ep'
s390-linux-ld: fotg210-hcd.c:(.text+0x8af6): undefined reference to `usb_hcd_poll_rh_status'
s390-linux-ld: fotg210-hcd.c:(.text+0x8d00): undefined reference to `usb_create_hcd'
s390-linux-ld: fotg210-hcd.c:(.text+0x8f30): undefined reference to `usb_add_hcd'
s390-linux-ld: fotg210-hcd.c:(.text+0x8fc8): undefined reference to `usb_put_hcd'
s390-linux-ld: fotg210-hcd.c:(.text+0xdc2): undefined reference to `usb_hcd_giveback_urb'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- s390-randconfig-c031-20221110
    |-- fotg210-core.c:(.init.text):undefined-reference-to-usb_disabled
    |-- fotg210-hcd.c:(.exit.text):undefined-reference-to-usb_hcds_loaded
    |-- fotg210-hcd.c:(.init.text):undefined-reference-to-usb_disabled
    |-- fotg210-hcd.c:(.text):undefined-reference-to-ehci_cf_port_reset_rwsem
    |-- fotg210-hcd.c:(.text):undefined-reference-to-usb_calc_bus_time
    |-- fotg210-hcd.c:(.text):undefined-reference-to-usb_disabled
    |-- fotg210-hcd.c:(.text):undefined-reference-to-usb_hc_died
    |-- fotg210-hcd.c:(.text):undefined-reference-to-usb_hcd_check_unlink_urb
    |-- fotg210-hcd.c:(.text):undefined-reference-to-usb_hcd_link_urb_to_ep
    |-- fotg210-hcd.c:(.text):undefined-reference-to-usb_hcd_unlink_urb_from_ep
    |-- fotg210-hcd.c:(.text):undefined-reference-to-usb_hub_clear_tt_buffer
    |-- fotg210-hcd.c:(.text):undefined-reference-to-usb_remove_hcd
    |-- s390-linux-ld:fotg210-hcd.c:(.init.text):undefined-reference-to-usb_hcds_loaded
    |-- s390-linux-ld:fotg210-hcd.c:(.text):undefined-reference-to-usb_add_hcd
    |-- s390-linux-ld:fotg210-hcd.c:(.text):undefined-reference-to-usb_calc_bus_time
    |-- s390-linux-ld:fotg210-hcd.c:(.text):undefined-reference-to-usb_create_hcd
    |-- s390-linux-ld:fotg210-hcd.c:(.text):undefined-reference-to-usb_hcd_giveback_urb
    |-- s390-linux-ld:fotg210-hcd.c:(.text):undefined-reference-to-usb_hcd_link_urb_to_ep
    |-- s390-linux-ld:fotg210-hcd.c:(.text):undefined-reference-to-usb_hcd_poll_rh_status
    |-- s390-linux-ld:fotg210-hcd.c:(.text):undefined-reference-to-usb_hcd_unlink_urb_from_ep
    `-- s390-linux-ld:fotg210-hcd.c:(.text):undefined-reference-to-usb_put_hcd

elapsed time: 720m

configs tested: 73
configs skipped: 2

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
arm                                 defconfig
x86_64                        randconfig-a006
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221111
m68k                             allyesconfig
x86_64                              defconfig
i386                                defconfig
s390                                defconfig
ia64                             allmodconfig
arm64                            allyesconfig
riscv                randconfig-r042-20221111
arm                              allyesconfig
s390                 randconfig-r044-20221111
s390                             allmodconfig
x86_64                        randconfig-a013
x86_64                           allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                            allnoconfig
i386                             allyesconfig
s390                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                       imx_v6_v7_defconfig
mips                 decstation_r4k_defconfig
arm                        oxnas_v6_defconfig
m68k                          hp300_defconfig
arm                         at91_dt_defconfig
mips                 randconfig-c004-20221111
i386                          randconfig-c001

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221111
hexagon              randconfig-r045-20221111
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a006
i386                          randconfig-a013
arm                           omap1_defconfig
arm                       netwinder_defconfig
i386                          randconfig-a011
i386                          randconfig-a015
mips                        qi_lb60_defconfig
mips                  cavium_octeon_defconfig
powerpc                     skiroot_defconfig
powerpc                  mpc866_ads_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
