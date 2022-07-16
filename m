Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D3F5771C7
	for <lists+linux-usb@lfdr.de>; Sun, 17 Jul 2022 00:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbiGPWUA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Jul 2022 18:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiGPWT7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Jul 2022 18:19:59 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C422D18E36
        for <linux-usb@vger.kernel.org>; Sat, 16 Jul 2022 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658009998; x=1689545998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iIBnQezwoIdI5dqXCl3gu8ElC/60sLINT/OHjK/x58k=;
  b=j70UdflfhDH9/xOGHBo+wCrJqcliSf6PIlN8sgxVhkAtYOfyE8eK8uII
   IW6+Pe2mgNy9W2vi6LsHlBurlRtVnHgfPWoaKgErqHCnvTSMDYGdSU77j
   A/Mhsf3AasE7fey4a1fg3ISz65H2/Vgcd7g1m4xGWRnop3sNSpsxEoy6Z
   ApH64TAnfPRPzAZUhrO9Wh94XhCnHzHi/iEqK3n4r5PcjqaVISZd8pLBa
   WoO+AO+wm8BLqWjx6Rc7XTHlwCb84EmnYVX3RoQx8EAc4/dR7XYyuiWXJ
   RoGk9WE9oIZb6HXpw0lFOTbmIeB5APIMzCZs959kJcY2vsewshn6aXUKM
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="286032006"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="286032006"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 15:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="723456966"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Jul 2022 15:19:56 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCq8h-0002E8-V9;
        Sat, 16 Jul 2022 22:19:55 +0000
Date:   Sun, 17 Jul 2022 06:18:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 50/55]
 drivers/platform/chrome/cros_typec_switch.c:93:9: error: call to undeclared
 function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202207170614.2HHvAplN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   c76d09da77d69d7f737540985912ad2bca654713
commit: e54369058f3da181fcc4c893f224a0c5a8a526b6 [50/55] platform/chrome: cros_typec_switch: Add switch driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220717/202207170614.2HHvAplN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=e54369058f3da181fcc4c893f224a0c5a8a526b6
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout e54369058f3da181fcc4c893f224a0c5a8a526b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/block/ drivers/iio/light/ drivers/media/i2c/ drivers/net/pcs/ drivers/pinctrl/nuvoton/ drivers/platform/chrome/ drivers/spmi/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/platform/chrome/cros_typec_switch.c:93:9: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
                         ^
   drivers/platform/chrome/cros_typec_switch.c:93:9: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
                               acpi_evaluate_object(acpi_handle object,
                               ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
           static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
                              ^
>> drivers/platform/chrome/cros_typec_switch.c:93:35: error: incomplete definition of type 'struct acpi_device'
                   ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
                                               ~~~~^
   include/linux/acpi.h:790:8: note: forward declaration of 'struct acpi_device'
   struct acpi_device;
          ^
   2 errors generated.


vim +/acpi_evaluate_integer +93 drivers/platform/chrome/cros_typec_switch.c

    62	
    63	static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
    64	{
    65		struct cros_typec_port *port = NULL;
    66		struct device *dev = sdata->dev;
    67		struct fwnode_handle *fwnode;
    68		struct acpi_device *adev;
    69		unsigned long long index;
    70		int ret = 0;
    71		int nports;
    72	
    73		nports = device_get_child_node_count(dev);
    74		if (nports == 0) {
    75			dev_err(dev, "No switch devices found.\n");
    76			return -ENODEV;
    77		}
    78	
    79		device_for_each_child_node(dev, fwnode) {
    80			port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
    81			if (!port) {
    82				ret = -ENOMEM;
    83				goto err_switch;
    84			}
    85	
    86			adev = to_acpi_device_node(fwnode);
    87			if (!adev) {
    88				dev_err(fwnode->dev, "Couldn't get ACPI device handle\n");
    89				ret = -ENODEV;
    90				goto err_switch;
    91			}
    92	
  > 93			ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
    94			if (ACPI_FAILURE(ret)) {
    95				dev_err(fwnode->dev, "_ADR wasn't evaluated\n");
    96				ret = -ENODATA;
    97				goto err_switch;
    98			}
    99	
   100			if (index < 0 || index >= EC_USB_PD_MAX_PORTS) {
   101				dev_err(fwnode->dev, "Invalid port index number: %llu", index);
   102				ret = -EINVAL;
   103				goto err_switch;
   104			}
   105			port->sdata = sdata;
   106			port->port_num = index;
   107			sdata->ports[index] = port;
   108	
   109			ret = cros_typec_register_retimer(port, fwnode);
   110			if (ret) {
   111				dev_err(dev, "Retimer switch register failed\n");
   112				goto err_switch;
   113			}
   114	
   115			dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
   116		}
   117	
   118		return 0;
   119	err_switch:
   120		cros_typec_unregister_switches(sdata);
   121		return ret;
   122	}
   123	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
