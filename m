Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9304D6803DF
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 03:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235239AbjA3CmH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Jan 2023 21:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjA3CmF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Jan 2023 21:42:05 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285EA18AB3
        for <linux-usb@vger.kernel.org>; Sun, 29 Jan 2023 18:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675046525; x=1706582525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n4bjKMTTt1A9Ns2l5KAG1RFlZYdRPlG6wPWs/TscKL0=;
  b=d9PYk1ZrD5dKyp3vldaZHReA0fZEGasOgareKIXesV2Pn8dmgAwyh82T
   l+TqOg2tpaTi8G0lvd0x9y+xd5PK9m8P/VbcZth5YZRT4uJIEtw3uOcb0
   FBiYXsLoiMrQFNBBQgDZSn39xJpJ9rpUjA9a00s3MPikx22BJYVQwJyPq
   EpExpGQU3ipzHZW4FL1i9PIuyeXsbj/8WjvjSV9q4qWT0NK/sH9L1OD57
   J3fe93lzU5PTVXTQdXQ8gq4dHfcZ/LpqrqZIVrKod7XYIllCcng5xk47G
   erTT2Z2AUAfWN6o9mTz93baKqNhD7dIu7hzx89A4kpx7a8JTcFPwTL2kr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="325156494"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="325156494"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 18:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="772319475"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="772319475"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2023 18:42:02 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMK7N-0003Iw-2j;
        Mon, 30 Jan 2023 02:42:01 +0000
Date:   Mon, 30 Jan 2023 10:41:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
 detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Message-ID: <202301301054.KVvGA5XO-lkp@intel.com>
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
head:   c52c9acc415eb6ff54f658492f8c53da0fc3528a
commit: c52c9acc415eb6ff54f658492f8c53da0fc3528a [35/35] xhci: host: Add Renesas RZ/V2M SoC support
config: csky-kismet-CONFIG_USB_RZV2M_USB3DRD-CONFIG_USB_XHCI_RZV2M-0-0 (https://download.01.org/0day-ci/archive/20230130/202301301054.KVvGA5XO-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=c52c9acc415eb6ff54f658492f8c53da0fc3528a
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-next
        git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_USB_RZV2M_USB3DRD --selectors CONFIG_USB_XHCI_RZV2M -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
   .config:4492:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
     Depends on [n]: USB_SUPPORT [=y] && USB_GADGET [=n] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])
     Selected by [y]:
     - USB_XHCI_RZV2M [=y] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && USB_XHCI_PLATFORM [=y] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
