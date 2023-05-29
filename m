Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D671471519E
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 00:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjE2WPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 18:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjE2WPf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 18:15:35 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B4DDE
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685398498; x=1716934498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rm/Zd2Gr2Tl5IPUVeiK2Ox8VwuonwexCHLkbgSoskDI=;
  b=juhzuJWoZdtmY+hT4GDD+p3h9CXBSDDn2C3jpNQnmVUT/X+JX2Zgpx89
   mL/Ws2yZsK3UA5KTD7gldAYaRKNk7xeU5ABTcxTpjMjrsUt1bXFT4U4D/
   Jz7mA82k1NTimmVEzxvbkMRi9UTgbNyKrtNOuaJH4RIy0BeHJhYWYdAGm
   xGkafZOEoEBHTSHQRegS6TF3V38CXZnOknKIN5gl7Arhnkit7vTP2QqaT
   UE8tGRAGMpguOz1zpwyPR7qpeJ/fCzc+CQZ67oHubhVrJl+eOXz30OA7G
   WIbf1AF3hhgma6W2BL2ml2p/KBIXUWrMrS7M90CKbOB1Vlsl7QcdAB+Ps
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357149093"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="357149093"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 15:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706189008"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="706189008"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 May 2023 15:14:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q3l8U-000L9M-30;
        Mon, 29 May 2023 22:14:42 +0000
Date:   Tue, 30 May 2023 06:14:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Minda Chen <minda.chen@starfivetech.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>
Subject: [usb:usb-testing 25/35] drivers/usb/cdns3/cdns3-starfive.c:23:
 warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST()
 instead
Message-ID: <202305300608.8CuLyqAL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   046895105d9666ab56e86ce8dd9786f8003125c6
commit: bfb46b424652a3396b92ca3c96c169ade9b45b8d [25/35] usb: cdns3: Add StarFive JH7110 USB driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230530/202305300608.8CuLyqAL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=bfb46b424652a3396b92ca3c96c169ade9b45b8d
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout bfb46b424652a3396b92ca3c96c169ade9b45b8d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300608.8CuLyqAL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead


vim +23 drivers/usb/cdns3/cdns3-starfive.c

    22	
  > 23	#define USB_STRAP_HOST			BIT(17)
    24	#define USB_STRAP_DEVICE		BIT(18)
    25	#define USB_STRAP_MASK			GENMASK(18, 16)
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
