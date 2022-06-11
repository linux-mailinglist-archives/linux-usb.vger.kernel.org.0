Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663FF54745F
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jun 2022 13:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiFKLoS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jun 2022 07:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiFKLoR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jun 2022 07:44:17 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12C8488A9
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 04:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654947854; x=1686483854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OblGOYFBALxJoI+zHGQYGW+Tw5m3FXPP/tDciIoUtUo=;
  b=Od/tG9WUFxeYit/dNHLmWjyxfn3/yTqm7JTw/zZFJAbW2ovPuhWuC0A1
   hIfcgZfi86ld169YfK9BSWaPSV0xLLUcJxnB82o4cbneKH6tq6Ed84tuw
   fU4OZqv4yutzp0tUiBvywzeeU3FvzxF5dGIHHNhxPo4LTWT7TQDWCo91k
   P5bJEh7wS/y5sZGXkBto+w+l+1IQ50RF2N24UeH2Ce5Ej9aeUAKbfpgVe
   V7xstzafxyJPA0jbHebE8yJ3vM1oW6EAByxCyz6MlBEMPXWOmWc0hZZYu
   Y16TsarfhM5WYLHo6x8Xd/mne2qKtznINvFeX16Zg2r9MShZDEDpuWTp6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341910255"
X-IronPort-AV: E=Sophos;i="5.91,293,1647327600"; 
   d="scan'208";a="341910255"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 04:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,293,1647327600"; 
   d="scan'208";a="828745085"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jun 2022 04:44:12 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nzzXH-000IqT-Pr;
        Sat, 11 Jun 2022 11:44:11 +0000
Date:   Sat, 11 Jun 2022 19:44:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [usb:usb-testing 39/44] drivers/usb/dwc3/dwc3-qcom.c:301:23:
 warning: no previous prototype for function 'dwc3_qcom_read_usb2_speed'
Message-ID: <202206111907.EvH06x2T-lkp@intel.com>
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
config: mips-randconfig-r024-20220611 (https://download.01.org/0day-ci/archive/20220611/202206111907.EvH06x2T-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe755279a3a47cc416ef80dbc900d9a98a19)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=4387ea43e3a9dac058adfe5fc68e0e82750201e5
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 4387ea43e3a9dac058adfe5fc68e0e82750201e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-qcom.c:301:23: warning: no previous prototype for function 'dwc3_qcom_read_usb2_speed' [-Wmissing-prototypes]
   enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
                         ^
   drivers/usb/dwc3/dwc3-qcom.c:301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
   ^
   static 
   1 warning generated.


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
