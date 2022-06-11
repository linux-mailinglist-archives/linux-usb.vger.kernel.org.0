Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65815470B4
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jun 2022 02:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243284AbiFKA4B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 20:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238092AbiFKA4A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 20:56:00 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C1125E92
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 17:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654908959; x=1686444959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7zxHVc3u1edYVlsFkXDv8jvso6CaYkBuy1s0jkrdoo=;
  b=SULLRqVHe0nWujQFOUhYUTLsAWswQoxne09jNPu2yN4ke4VYUzLISIxs
   jewRUT0JA6KyrrKRx73nsc9IcB3URAuOGRFTTO9Pp9hjqHz3I8ERhuGvf
   EeY8bjn/LU6m5xOgtO77utsX1s+KFxHmC1uBnUVdx97I8FvjdNziEQJUo
   mnyuKRwv2JI+PPnUlVx0i9MtZPUE1G0feE+wFw9efxNL+y3JCB+kIy/4F
   V21e4qGsmdpjvZ1v2Ry4zERDJvTrNgfn2LZIubmm8ouIEX5DWpqRWG6ap
   0EX0iTMMj0GE1nQsGPuXDOVV2JaIg7VKesaHku7O/BPhmcAAPVpxQ90Zb
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="276575241"
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="276575241"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 17:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="828530276"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2022 17:55:57 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nzpPx-000IPn-3C;
        Sat, 11 Jun 2022 00:55:57 +0000
Date:   Sat, 11 Jun 2022 08:55:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [usb:usb-testing 39/44] drivers/usb/dwc3/dwc3-qcom.c:301:23:
 warning: no previous prototype for 'dwc3_qcom_read_usb2_speed'
Message-ID: <202206110832.2zOQ2T8f-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   477122a1eec325621cefd62da8bd8ac20a66fb8e
commit: 4387ea43e3a9dac058adfe5fc68e0e82750201e5 [39/44] usb: dwc3: qcom: Configure wakeup interrupts during suspend
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220611/202206110832.2zOQ2T8f-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=4387ea43e3a9dac058adfe5fc68e0e82750201e5
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 4387ea43e3a9dac058adfe5fc68e0e82750201e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-qcom.c:301:23: warning: no previous prototype for 'dwc3_qcom_read_usb2_speed' [-Wmissing-prototypes]
     301 | enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dwc3_qcom_read_usb2_speed +301 drivers/usb/dwc3/dwc3-qcom.c

   300	
 > 301	enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
   302	{
   303		struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
   304		struct usb_hcd *hcd = platform_get_drvdata(dwc->xhci);
   305		struct usb_device *udev;
   306	
   307		/*
   308		 * It is possible to query the speed of all children of
   309		 * USB2.0 root hub via usb_hub_for_each_child(). DWC3 code
   310		 * currently supports only 1 port per controller. So
   311		 * this is sufficient.
   312		 */
   313		udev = usb_hub_find_child(hcd->self.root_hub, 1);
   314	
   315		if (!udev)
   316			return USB_SPEED_UNKNOWN;
   317	
   318		return udev->speed;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
