Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9853C686496
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 11:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjBAKnI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 05:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbjBAKm7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 05:42:59 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65DBE39A
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 02:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675248155; x=1706784155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDyjh9ni0JcrhKwGHINeoMZe+Iu7ncIw8lJqTLpGyw8=;
  b=ZU1vfre88Q4/sGATxZWcy4a5T0mh7OBOxr3fANAD4KDphHi7keyXK/+4
   QaW0Owch91+Y0HfdkvzozCcMa+OCtaRK/5L3JToWf4x1fnt+LscgqAn+U
   38c5a2Wb3KaoQLsIF5QfBu6ybEzW/2O2dPFMkvDvXHYqjkfuL3AQqFxFl
   33tpqDIjaZn/i4jgLxMakCiV7ppxGaeORGGxeGPHER9bDat4hJTy2BPZM
   tgm6kqywubim2SSbX/ogKJf3GcwAoZ2VjxiTvQJyjewC1eMztVQ0v5xvQ
   Mb98KGQIMGyTWLMn+BVcpXGMkQmrra9sH/UtdkGT3aKRHl8CO/FO7WfWk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392685470"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392685470"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 02:42:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="664847311"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="664847311"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Feb 2023 02:42:21 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pNAZI-0005MU-30;
        Wed, 01 Feb 2023 10:42:20 +0000
Date:   Wed, 1 Feb 2023 18:42:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 35/58] ld.lld: error: undefined symbol:
 rzv2m_usb3drd_reset
Message-ID: <202302011806.QrzYCatO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   45bf39f8df7f05efb83b302c65ae3b9bc92b7065
commit: c52c9acc415eb6ff54f658492f8c53da0fc3528a [35/58] xhci: host: Add Renesas RZ/V2M SoC support
config: arm64-randconfig-r015-20230201 (https://download.01.org/0day-ci/archive/20230201/202302011806.QrzYCatO-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=c52c9acc415eb6ff54f658492f8c53da0fc3528a
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-next
        git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rzv2m_usb3drd_reset
   >>> referenced by xhci-rzv2m.c
   >>>               drivers/usb/host/xhci-rzv2m.o:(xhci_rzv2m_init_quirk) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
   Depends on [n]: USB_SUPPORT [=y] && USB_GADGET [=n] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])
   Selected by [y]:
   - USB_XHCI_RZV2M [=y] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && USB_XHCI_PLATFORM [=y] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
