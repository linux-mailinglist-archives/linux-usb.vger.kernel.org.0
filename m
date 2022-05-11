Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD6C522E82
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 10:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237730AbiEKIgO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 04:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243869AbiEKIfy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 04:35:54 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BA01A40B9
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652258077; x=1683794077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xPBuiMUOqJUBtshCWZs+iqYo4xvFqh80c5mMpe7CIxg=;
  b=VphPoYgtDFE4um9kDst3Lvx9QhyHZ89R6Trw71EpkF05N4OECUSzTBD8
   AC0r1nf8MFliuNe7X1GqLXKC8EjltFAR3BUby9HT4TgnvAPL+PZtgczeV
   ppaS3U0gYsF6LCLvRcB2gM2j+vF32CyaEcxSntDvLwfQd7EvBOu69xqtw
   neHcWEmu2Nlemo4QiW7HPqxfWM5g/vuW4PtjWDXpD1rIjqbmkdFrHEl7d
   hGRWxlQkUmY9uXzFMAnx/t9ocqEkuDBFlniq+P4QOLfiisHHMydQgMSwV
   IK4JxDgjITlNRNSgmJA2K5VnqtamlzrU6mGdkw6aiyPaIz1lAHLobRSS1
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="332671233"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="332671233"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 01:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="739119313"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2022 01:34:35 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nohnm-000IuA-JL;
        Wed, 11 May 2022 08:34:34 +0000
Date:   Wed, 11 May 2022 16:33:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     kbuild-all@lists.01.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: hub: port: add sysfs entry to switch port power
Message-ID: <202205111601.PmB3PwmE-lkp@intel.com>
References: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

I love your patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on v5.18-rc6 next-20220510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Grzeschik/usb-hub-port-add-sysfs-entry-to-switch-port-power/20220511-071411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: arc-vdk_hs38_smp_defconfig (https://download.01.org/0day-ci/archive/20220511/202205111601.PmB3PwmE-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/19efde40be7597697c54241a120f812d5864b677
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Grzeschik/usb-hub-port-add-sysfs-entry-to-switch-port-power/20220511-071411
        git checkout 19efde40be7597697c54241a120f812d5864b677
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/usb/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/core/port.c: In function 'port_power_store':
>> drivers/usb/core/port.c:42:17: error: implicit declaration of function 'usb_remote_wakeup' [-Werror=implicit-function-declaration]
      42 |                 usb_remote_wakeup(hdev);
         |                 ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/usb_remote_wakeup +42 drivers/usb/core/port.c

    19	
    20	static ssize_t port_power_store(struct device *dev, struct device_attribute *attr,
    21				    const char *buf, size_t count)
    22	{
    23		struct usb_port *port_dev = to_usb_port(dev);
    24		struct usb_device *udev = port_dev->child;
    25		struct usb_device *hdev = to_usb_device(dev->parent->parent);
    26		struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
    27		int port1 = port_dev->portnum;
    28		bool value;
    29		int rc = 0;
    30	
    31		if (!hub)
    32			return -EINVAL;
    33	
    34		if (hub->in_reset)
    35			return -EBUSY;
    36	
    37		rc = strtobool(buf, &value);
    38		if (rc)
    39			return rc;
    40	
    41		if (value)
  > 42			usb_remote_wakeup(hdev);
    43	
    44		rc = usb_hub_set_port_power(hdev, hub, port1, value);
    45		if (rc)
    46			return rc;
    47	
    48		if (!value) {
    49			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
    50			if (!port_dev->is_superspeed)
    51				usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
    52	
    53			if (udev) {
    54				port_dev->child = NULL;
    55				usb_disconnect(&udev);
    56			}
    57		}
    58	
    59		if (!rc)
    60			rc = count;
    61	
    62		return rc;
    63	}
    64	static DEVICE_ATTR_WO(port_power);
    65	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
