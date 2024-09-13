Return-Path: <linux-usb+bounces-15106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A463978ABD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 23:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E682E2822AD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 21:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C754815575F;
	Fri, 13 Sep 2024 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZa4KYUy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048CE6BFD4
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 21:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263812; cv=none; b=MaLmH7Xc9vvI67CP74XYQmvwQl5pia6W56aBB0KphQYG8LtMDO3pOjFu7wLYTS6t5ZRAi+2wuCfiplHokaMRpjHIb1CTFRw/tJAYhbkvIqIG+O2Wtbl3RmP8nrBRaIaV8r01/PFjzUyljcErhAdUaGx4vexFgt34z6fSm5PKb6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263812; c=relaxed/simple;
	bh=odbKU6PS5Wbevs4KwzF7t6Mhr6prCGKKDen7m2WlMmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ayVFp9JUIpKwUpSZb+3TAYA+md+XelAlLIKkoKmtWVVKsmF40LSRLLVSisLKLcdBIja9axtIdeQbCtJY7VzHypl0/214u7Tg4YxS9jiUyj3o0xChiLOoSI6JhWzoD2haUNkERfxtLqcB4CxAupwVXvRO9SNhq4/N5rse6fJEF/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZa4KYUy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726263809; x=1757799809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=odbKU6PS5Wbevs4KwzF7t6Mhr6prCGKKDen7m2WlMmw=;
  b=XZa4KYUyZA4REhcF/G/ILHQiNPp0T3l4j3dhJSOzoUmLhpwjjpKXFtpc
   WYP88uxDht/AG+Oa4qvaJCHWgyHslUt72DWWlNdaFiDh8afdV6jkIaCLc
   rCjmzahsV15voYKRrcutxxUUn7SVquhvicx2uH004lv2zve8dllcLQvmX
   OZ+kNFfedscV0N3RCoc3Bx2wyeup66RVQ1u7T3WG2TR9UlK23tNYPO/S6
   mvrjqhv8N7Ku+YMXKmhCWKP9b1T4PX4T7kiJZmNx6vEFJHrxZDeU1PSdV
   uir9sN3YdclKnCMAEgbh2J+VPWkwmvNYfC9CGKw+ALeGYB9VcxoFy0dNE
   w==;
X-CSE-ConnectionGUID: l/cWIOnQTwyMGh/FeX5a/Q==
X-CSE-MsgGUID: MQP0eh2TSmiKf93ti3YkVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25064053"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25064053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 14:43:28 -0700
X-CSE-ConnectionGUID: 5I40DgcBRy2epldv8ZO6bw==
X-CSE-MsgGUID: 2vfqQfIJSpOY4Dzw9vNllQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72582015"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 14:43:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spE4b-00073c-0R;
	Fri, 13 Sep 2024 21:43:25 +0000
Date: Sat, 14 Sep 2024 05:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 14/33]
 drivers/usb/misc/onboard_usb_dev.c:408:undefined reference to
 `i2c_smbus_write_block_data'
Message-ID: <202409140539.3Axwv38m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   68d4209158f43a558c5553ea95ab0c8975eab18c
commit: 6782311d04dfbb01d379836ee5c564f49e66648c [14/33] usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support
config: riscv-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140539.3Axwv38m-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140539.3Axwv38m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140539.3Axwv38m-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o: in function `fsleep':
   include/linux/delay.h:89:(.text+0xaa4): undefined reference to `i2c_find_device_by_fwnode'
   riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o: in function `onboard_dev_probe':
>> drivers/usb/misc/onboard_usb_dev.c:408:(.text+0xb24): undefined reference to `i2c_smbus_write_block_data'
   riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o: in function `onboard_dev_5744_i2c_init':
>> drivers/usb/misc/onboard_usb_dev.c:330:(.text+0xb58): undefined reference to `i2c_smbus_write_word_data'
>> riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.c:332:(.text+0xb8c): undefined reference to `i2c_smbus_write_word_data'


vim +408 drivers/usb/misc/onboard_usb_dev.c

   311	
   312	static int onboard_dev_5744_i2c_init(struct i2c_client *client)
   313	{
   314	#if IS_ENABLED(CONFIG_I2C)
   315		struct device *dev = &client->dev;
   316		int ret;
   317	
   318		/*
   319		 * Set BYPASS_UDC_SUSPEND bit to ensure MCU is always enabled
   320		 * and ready to respond to SMBus runtime commands.
   321		 * The command writes 5 bytes to memory and single data byte in
   322		 * configuration register.
   323		 */
   324		char wr_buf[7] = {USB5744_CREG_MEM_ADDR, 5,
   325				  USB5744_CREG_WRITE, 1,
   326				  USB5744_CREG_RUNTIMEFLAGS2,
   327				  USB5744_CREG_RUNTIMEFLAGS2_LSB,
   328				  USB5744_CREG_BYPASS_UDC_SUSPEND};
   329	
 > 330		ret = i2c_smbus_write_block_data(client, 0, sizeof(wr_buf), wr_buf);
   331		if (ret)
 > 332			return dev_err_probe(dev, ret, "BYPASS_UDC_SUSPEND bit configuration failed\n");
   333	
   334		ret = i2c_smbus_write_word_data(client, USB5744_CMD_CREG_ACCESS,
   335						USB5744_CMD_CREG_ACCESS_LSB);
   336		if (ret)
   337			return dev_err_probe(dev, ret, "Configuration Register Access Command failed\n");
   338	
   339		/* Send SMBus command to boot hub. */
   340		ret = i2c_smbus_write_word_data(client, USB5744_CMD_ATTACH,
   341						USB5744_CMD_ATTACH_LSB);
   342		if (ret < 0)
   343			return dev_err_probe(dev, ret, "USB Attach with SMBus command failed\n");
   344	
   345		return ret;
   346	#else
   347		return -ENODEV;
   348	#endif
   349	}
   350	
   351	static int onboard_dev_probe(struct platform_device *pdev)
   352	{
   353		struct device *dev = &pdev->dev;
   354		struct onboard_dev *onboard_dev;
   355		struct device_node *i2c_node;
   356		int err;
   357	
   358		onboard_dev = devm_kzalloc(dev, sizeof(*onboard_dev), GFP_KERNEL);
   359		if (!onboard_dev)
   360			return -ENOMEM;
   361	
   362		onboard_dev->pdata = device_get_match_data(dev);
   363		if (!onboard_dev->pdata)
   364			return -EINVAL;
   365	
   366		if (!onboard_dev->pdata->is_hub)
   367			onboard_dev->always_powered_in_suspend = true;
   368	
   369		onboard_dev->dev = dev;
   370	
   371		err = onboard_dev_get_regulators(onboard_dev);
   372		if (err)
   373			return err;
   374	
   375		onboard_dev->clk = devm_clk_get_optional(dev, NULL);
   376		if (IS_ERR(onboard_dev->clk))
   377			return dev_err_probe(dev, PTR_ERR(onboard_dev->clk),
   378					     "failed to get clock\n");
   379	
   380		onboard_dev->reset_gpio = devm_gpiod_get_optional(dev, "reset",
   381								  GPIOD_OUT_HIGH);
   382		if (IS_ERR(onboard_dev->reset_gpio))
   383			return dev_err_probe(dev, PTR_ERR(onboard_dev->reset_gpio),
   384					     "failed to get reset GPIO\n");
   385	
   386		mutex_init(&onboard_dev->lock);
   387		INIT_LIST_HEAD(&onboard_dev->udev_list);
   388	
   389		dev_set_drvdata(dev, onboard_dev);
   390	
   391		err = onboard_dev_power_on(onboard_dev);
   392		if (err)
   393			return err;
   394	
   395		i2c_node = of_parse_phandle(pdev->dev.of_node, "i2c-bus", 0);
   396		if (i2c_node) {
   397			struct i2c_client *client;
   398	
   399			client = of_find_i2c_device_by_node(i2c_node);
   400			of_node_put(i2c_node);
   401	
   402			if (!client) {
   403				err = -EPROBE_DEFER;
   404				goto err_power_off;
   405			}
   406	
   407			if (of_device_is_compatible(pdev->dev.of_node, "usb424,2744") ||
 > 408			    of_device_is_compatible(pdev->dev.of_node, "usb424,5744"))
   409				err = onboard_dev_5744_i2c_init(client);
   410	
   411			put_device(&client->dev);
   412			if (err < 0)
   413				goto err_power_off;
   414		}
   415	
   416		/*
   417		 * The USB driver might have been detached from the USB devices by
   418		 * onboard_dev_remove() (e.g. through an 'unbind' by userspace),
   419		 * make sure to re-attach it if needed.
   420		 *
   421		 * This needs to be done deferred to avoid self-deadlocks on systems
   422		 * with nested onboard hubs.
   423		 */
   424		schedule_work(&attach_usb_driver_work);
   425	
   426		return 0;
   427	
   428	err_power_off:
   429		onboard_dev_power_off(onboard_dev);
   430		return err;
   431	}
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

