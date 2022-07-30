Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0639585C1E
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jul 2022 22:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235929AbiG3Uje (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jul 2022 16:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbiG3Ujd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 Jul 2022 16:39:33 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DBC140CF
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659213572; x=1690749572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M8Nbvm/fMsYkHfEtWbdeuuq4twtw5gBZPrSupAwgaxk=;
  b=kHkb9GUHmvSLBl55MPMUbGfzCt8k0ZVeKx0hxQnge2UvEOQoMc8Zm7pE
   9PQqcfvKKIUM87n7xZbTDtA0cawpEn/f9BF0diep8xDTYOEyjmvOSFtET
   TfZgr4cirrC2eR/73hcReFIbghCq10pwsx4il4mSWS6eP4vOym4xMqBtg
   VwiuT/RqoiCGGnMmqQLMK0AqMZGJCfAovLvO4z8ZxzRQQtYUCAx/VhrSo
   p1HQCicsn3EUSh1pqBFbin5jBfegjismk3BDlLGUs6O7ids8mYLJ4i604
   RNZZDfXnCzcJAmoteqdqyHC3oXyqZEAsAuABqUjn7xDxRRrVkfNVyxllD
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="288959566"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="288959566"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 13:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="777850985"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Jul 2022 13:39:29 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oHtFA-000DJU-1t;
        Sat, 30 Jul 2022 20:39:28 +0000
Date:   Sun, 31 Jul 2022 04:39:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek Vasut <marex@denx.de>, linux-usb@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Marek Vasut <marex@denx.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Message-ID: <202207310431.Rtpq2bqx-lkp@intel.com>
References: <20220730180500.152004-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220730180500.152004-2-marex@denx.de>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on chanwoo-extcon/extcon-next]
[also build test WARNING on linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/extcon-usbc-tusb320-Factor-out-extcon-into-dedicated-functions/20220731-020545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-next
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220731/202207310431.Rtpq2bqx-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7bce9c0377f5e41fa29f57af40f436a48e2260b1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marek-Vasut/extcon-usbc-tusb320-Factor-out-extcon-into-dedicated-functions/20220731-020545
        git checkout 7bce9c0377f5e41fa29f57af40f436a48e2260b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/extcon/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead


vim +19 drivers/extcon/extcon-usbc-tusb320.c

    18	
  > 19	#define TUSB320_REG8				0x8
    20	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE	GENMASK(7, 6)
    21	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_USB	0x0
    22	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_15A	0x1
    23	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_30A	0x2
    24	#define TUSB320_REG8_CURRENT_MODE_DETECT	GENMASK(5, 4)
    25	#define TUSB320_REG8_CURRENT_MODE_DETECT_DEF	0x0
    26	#define TUSB320_REG8_CURRENT_MODE_DETECT_MED	0x1
    27	#define TUSB320_REG8_CURRENT_MODE_DETECT_ACC	0x2
    28	#define TUSB320_REG8_CURRENT_MODE_DETECT_HI	0x3
    29	#define TUSB320_REG8_ACCESSORY_CONNECTED	GENMASK(3, 2)
    30	#define TUSB320_REG8_ACCESSORY_CONNECTED_NONE	0x0
    31	#define TUSB320_REG8_ACCESSORY_CONNECTED_AUDIO	0x4
    32	#define TUSB320_REG8_ACCESSORY_CONNECTED_ACC	0x5
    33	#define TUSB320_REG8_ACCESSORY_CONNECTED_DEBUG	0x6
    34	#define TUSB320_REG8_ACTIVE_CABLE_DETECTION	BIT(0)
    35	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
