Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE1859BE60
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 13:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbiHVLWw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 07:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbiHVLWv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 07:22:51 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A23D20F7A;
        Mon, 22 Aug 2022 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661167370; x=1692703370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gGwvfCojFPh3FSFhF+6BmFchyNznPTsKfqMvlEWgPg4=;
  b=H3neKUh2AGLsoZrWSz75JRkIZotc9kJ4DJPN3LPP/kYctpkCU0GuKsmy
   0p+P4/P251sEqVnJjEa53nNx6ssuE/biQpsgIAVzqZH1pKbq3cmIhM+Du
   z/41pUGjyWCk2AlSMAf9MJiADzZtPotDGZZyzgWfwxMw7XAWwt3ythGg0
   IKykjIOXOaPnVVT8e4m8VsiODUJQmYfCknNWAmd6Ohs0ktWere9gdI4tO
   A0T4e2HxCk3++WVFwucpAkOIL3YFHM/AG1bDF1FIPOY39SypRxTsnTBne
   vkYnvaABLWijOOOEzfuo7/YoSiOcgzfkE79lVuPW2OsjwJyuQljqL8i6X
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="290943523"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="290943523"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 04:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="669497293"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2022 04:22:46 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQ5W2-0005GN-0Y;
        Mon, 22 Aug 2022 11:22:46 +0000
Date:   Mon, 22 Aug 2022 19:22:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com,
        robh+dt@kernel.org, peda@axentia.se, shawnguo@kernel.org
Cc:     kbuild-all@lists.01.org, gregkh@linuxfoundation.org,
        linux@roeck-us.net, jun.li@nxp.com, xu.yang_2@nxp.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] usb: typec: mux: add typec orientation switch
 support via mux controller
Message-ID: <202208221924.BfrOX4DZ-lkp@intel.com>
References: <20220822153517.3747679-4-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822153517.3747679-4-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Xu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on shawnguo/for-next linus/master v6.0-rc2 next-20220822]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/typec-orientation-switch-support-via-mux-controller/20220822-153600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20220822/202208221924.BfrOX4DZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/703ba3cfec5b6f9422ac9a859bc6121f7c4a12fd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xu-Yang/typec-orientation-switch-support-via-mux-controller/20220822-153600
        git checkout 703ba3cfec5b6f9422ac9a859bc6121f7c4a12fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/usb/typec/mux.o: in function `typec_switch_put':
>> drivers/usb/typec/mux.c:200: undefined reference to `mux_control_put'
   ld: drivers/usb/typec/mux.o: in function `typec_switch_set':
>> drivers/usb/typec/mux.c:286: undefined reference to `mux_control_deselect'
   ld: drivers/usb/typec/mux.o: in function `mux_control_typec_switch_get':
>> drivers/usb/typec/mux.c:139: undefined reference to `mux_control_get'
   ld: drivers/usb/typec/mux.o: in function `mux_control_select':
>> include/linux/mux/consumer.h:34: undefined reference to `mux_control_select_delay'


vim +200 drivers/usb/typec/mux.c

   125	
   126	static struct typec_switch *mux_control_typec_switch_get(struct device *dev)
   127	{
   128		struct typec_switch *sw;
   129		struct mux_control *mux;
   130		int ret;
   131	
   132		if (!device_property_present(dev, "mux-controls"))
   133			return NULL;
   134	
   135		sw = kzalloc(sizeof(*sw), GFP_KERNEL);
   136		if (!sw)
   137			return ERR_PTR(-ENOMEM);
   138	
 > 139		mux = mux_control_get(dev, NULL);
   140		if (!IS_ERR(mux)) {
   141			sw->mux_switch = mux;
   142			ret = device_property_read_u32_array(dev,
   143				"typec-switch-states", sw->mux_states, 3);
   144			if (ret) {
   145				kfree(sw);
   146				return ERR_PTR(ret);
   147			}
   148		} else {
   149			kfree(sw);
   150			return ERR_CAST(mux);
   151		}
   152	
   153		return sw;
   154	}
   155	
   156	/**
   157	 * typec_switch_get - Find USB Type-C orientation switch
   158	 * @dev: The device using switch
   159	 *
   160	 * Finds a switch used by @dev. Returns a reference to the switch on
   161	 * success, NULL if no matching connection was found, or
   162	 * ERR_PTR(-EPROBE_DEFER) when a connection was found but the switch
   163	 * has not been enumerated yet, or ERR_PTR with a negative errno.
   164	 */
   165	struct typec_switch *typec_switch_get(struct device *dev)
   166	{
   167		struct typec_switch *sw;
   168	
   169		sw = fwnode_typec_switch_get(dev_fwnode(dev));
   170		if (!sw)
   171			/* Try get switch based on mux control */
   172			sw = mux_control_typec_switch_get(dev);
   173	
   174		return sw;
   175	}
   176	EXPORT_SYMBOL_GPL(typec_switch_get);
   177	
   178	/**
   179	 * typec_switch_put - Release USB Type-C orientation switch
   180	 * @sw: USB Type-C orientation switch
   181	 *
   182	 * Decrement reference count for @sw.
   183	 */
   184	void typec_switch_put(struct typec_switch *sw)
   185	{
   186		struct typec_switch_dev *sw_dev;
   187		unsigned int i;
   188	
   189		if (IS_ERR_OR_NULL(sw))
   190			return;
   191	
   192		for (i = 0; i < sw->num_sw_devs; i++) {
   193			sw_dev = sw->sw_devs[i];
   194	
   195			module_put(sw_dev->dev.parent->driver->owner);
   196			put_device(&sw_dev->dev);
   197		}
   198	
   199		if (sw->mux_switch)
 > 200			mux_control_put(sw->mux_switch);
   201	
   202		kfree(sw);
   203	}
   204	EXPORT_SYMBOL_GPL(typec_switch_put);
   205	
   206	static void typec_switch_release(struct device *dev)
   207	{
   208		kfree(to_typec_switch_dev(dev));
   209	}
   210	
   211	const struct device_type typec_switch_dev_type = {
   212		.name = "orientation_switch",
   213		.release = typec_switch_release,
   214	};
   215	
   216	/**
   217	 * typec_switch_register - Register USB Type-C orientation switch
   218	 * @parent: Parent device
   219	 * @desc: Orientation switch description
   220	 *
   221	 * This function registers a switch that can be used for routing the correct
   222	 * data pairs depending on the cable plug orientation from the USB Type-C
   223	 * connector to the USB controllers. USB Type-C plugs can be inserted
   224	 * right-side-up or upside-down.
   225	 */
   226	struct typec_switch_dev *
   227	typec_switch_register(struct device *parent,
   228			      const struct typec_switch_desc *desc)
   229	{
   230		struct typec_switch_dev *sw_dev;
   231		int ret;
   232	
   233		if (!desc || !desc->set)
   234			return ERR_PTR(-EINVAL);
   235	
   236		sw_dev = kzalloc(sizeof(*sw_dev), GFP_KERNEL);
   237		if (!sw_dev)
   238			return ERR_PTR(-ENOMEM);
   239	
   240		sw_dev->set = desc->set;
   241	
   242		device_initialize(&sw_dev->dev);
   243		sw_dev->dev.parent = parent;
   244		sw_dev->dev.fwnode = desc->fwnode;
   245		sw_dev->dev.class = &typec_mux_class;
   246		sw_dev->dev.type = &typec_switch_dev_type;
   247		sw_dev->dev.driver_data = desc->drvdata;
   248		ret = dev_set_name(&sw_dev->dev, "%s-switch", desc->name ? desc->name : dev_name(parent));
   249		if (ret) {
   250			put_device(&sw_dev->dev);
   251			return ERR_PTR(ret);
   252		}
   253	
   254		ret = device_add(&sw_dev->dev);
   255		if (ret) {
   256			dev_err(parent, "failed to register switch (%d)\n", ret);
   257			put_device(&sw_dev->dev);
   258			return ERR_PTR(ret);
   259		}
   260	
   261		return sw_dev;
   262	}
   263	EXPORT_SYMBOL_GPL(typec_switch_register);
   264	
   265	int typec_switch_set(struct typec_switch *sw,
   266			     enum typec_orientation orientation)
   267	{
   268		struct typec_switch_dev *sw_dev;
   269		struct mux_control *mux;
   270		unsigned int i;
   271		int ret;
   272	
   273		if (IS_ERR_OR_NULL(sw))
   274			return 0;
   275	
   276		for (i = 0; i < sw->num_sw_devs; i++) {
   277			sw_dev = sw->sw_devs[i];
   278	
   279			ret = sw_dev->set(sw_dev, orientation);
   280			if (ret)
   281				return ret;
   282		}
   283	
   284		mux = sw->mux_switch;
   285		if (mux) {
 > 286			ret = mux_control_deselect(mux);
   287			if (ret)
   288				return ret;
   289	
   290			ret = mux_control_select(mux, sw->mux_states[orientation]);
   291			if (ret)
   292				return ret;
   293		}
   294	
   295		return 0;
   296	}
   297	EXPORT_SYMBOL_GPL(typec_switch_set);
   298	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
