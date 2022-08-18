Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D623598EED
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 23:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346472AbiHRVI3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 17:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346509AbiHRVIE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 17:08:04 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FBA9411D
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660856618; x=1692392618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=czIt9/GjYMkH8ldLVLj9OXo6Mzlzk0geJNRfromC7rY=;
  b=kKq/RCisNDuVKtcUEkqo1J5W6UOar4kC+O6fbKlq/xh4uqEey4WfuQSY
   KLyRIavd1rcjRvzSyMO9rMYBXO9D6OJKqM/N8A5l0p1e9B5FKsJlMNCL4
   6tH2YrsuAr7uSjHTvf16Nm0OG8oxz6cUN9xeGGIGNID9IM/ZEoIr+GI2h
   oIEiUhwS27f3grLniyW4DxH2Vu01RiXoCn7hFGj/LsRbsc/OTXR8+5u7X
   iYRzDKUWGhmkUzRlS2ciwmWNBzIodgfY67ElleeWS5XUjzOUjQGwR+Sf4
   jbHBpUGy1wABVEef4UWjtRKCpdDPSRL9MFOGlYsm3knSjFWD3w9sGBV/P
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="318893171"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="318893171"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 14:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="636993124"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Aug 2022 14:03:11 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOmfW-0000br-0c;
        Thu, 18 Aug 2022 21:03:10 +0000
Date:   Fri, 19 Aug 2022 05:02:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-linus 9/18] drivers/usb/dwc3/dwc3-qcom.c:313:25: warning:
 variable 'hcd' set but not used
Message-ID: <202208190411.1lugjsYz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
head:   aece382251f8fa660d8f621a7f50b0ea0f390178
commit: c5f14abeb52b0177b940fd734133d383da3521d8 [9/18] usb: dwc3: qcom: fix peripheral and OTG suspend
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220819/202208190411.1lugjsYz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=c5f14abeb52b0177b940fd734133d383da3521d8
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-linus
        git checkout c5f14abeb52b0177b940fd734133d383da3521d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/dwc3-qcom.c: In function 'dwc3_qcom_read_usb2_speed':
>> drivers/usb/dwc3/dwc3-qcom.c:313:25: warning: variable 'hcd' set but not used [-Wunused-but-set-variable]
     313 |         struct usb_hcd *hcd;
         |                         ^~~


vim +/hcd +313 drivers/usb/dwc3/dwc3-qcom.c

   308	
   309	static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
   310	{
   311		struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
   312		struct usb_device *udev;
 > 313		struct usb_hcd *hcd;
   314	
   315		/*
   316		 * FIXME: Fix this layering violation.
   317		 */
   318		hcd = platform_get_drvdata(dwc->xhci);
   319	
   320		/*
   321		 * It is possible to query the speed of all children of
   322		 * USB2.0 root hub via usb_hub_for_each_child(). DWC3 code
   323		 * currently supports only 1 port per controller. So
   324		 * this is sufficient.
   325		 */
   326	#ifdef CONFIG_USB
   327		udev = usb_hub_find_child(hcd->self.root_hub, 1);
   328	#else
   329		udev = NULL;
   330	#endif
   331		if (!udev)
   332			return USB_SPEED_UNKNOWN;
   333	
   334		return udev->speed;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
