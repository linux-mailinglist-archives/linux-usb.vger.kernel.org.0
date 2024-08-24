Return-Path: <linux-usb+bounces-14037-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD495DE97
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 16:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D109DB21676
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 14:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E4B17ADE0;
	Sat, 24 Aug 2024 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0YbsUR+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7A176AC1
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724511251; cv=none; b=rHY2OXW5kZztQBJAlOQThYUxZXyL7oR9lkLX6ExyYXGyCl66x9RD6JbO4N6QGCimxSbpLZD6DXz3Aw1wy+GvRb6EYJ0/G32rEPnFTs0pfXDS+QMJdapbFjIC7UEjy6upTTeB1Nrjg3aNtxkfrvdYVX1w/9cy3iHcM32GsKz7ddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724511251; c=relaxed/simple;
	bh=/+GNvKbTNYnRq2xzSrKYptz7eI8kWjKW+KeyDQbaRYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NmXfNwPxsasL5x4BYuv32JwGt4GgMFw3L2zX0qNF1wm4SpiTyZ0RlsSsfGU4VDUxwXxmV3GUsFR4nRSlFEVGlvdT/uMANIKNwslQUDa4vVmW3vok0QW1iSRIx1uF1cMLolfW6waGENKLW5XKLV88hCn3PU7XffDUSvxtfCjbRGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0YbsUR+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724511248; x=1756047248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+GNvKbTNYnRq2xzSrKYptz7eI8kWjKW+KeyDQbaRYM=;
  b=Q0YbsUR+C0s56XACLK9IjhOzaClZXZdLh+41OU8lAv8EP2tmd28/ebmM
   aKL+Q0rtVNpxpN3jAye2nibQoqcsae8HoKiPsheNcTAvYLZUUdlqamOtq
   2rZwbpeEq4d/kdhGQp+2OeWuxgIa63QSd9oK1SR4ANx9Z6erIs1KPpVA8
   2BTHuflUSy2GnLU1hjb878M9O18pz6d/jN+s6+61IxqcQ9NAsCq/Xg5xy
   wN4KL+XQu/yNmATquohhaSvFiUy6Nv8Chx5892dc5/Gb6pacYcZuIZJ+O
   LEsegXyEsFYTQBbAWT2wtBveqzEAns/q8yVgAmAeaUS7jVqQ+jLE0jkP4
   Q==;
X-CSE-ConnectionGUID: qvEhFJiWRZq+TOCsSQshug==
X-CSE-MsgGUID: 9IkYtCeXTp+bKSenbI7+KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="22572998"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="22572998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 07:54:08 -0700
X-CSE-ConnectionGUID: bLTchCxbQyewZqKK2BJNWQ==
X-CSE-MsgGUID: hrAx67lNRhCh1nUZ+zMh8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="99581811"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Aug 2024 07:54:07 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shs9T-000EY3-37;
	Sat, 24 Aug 2024 14:54:03 +0000
Date: Sat, 24 Aug 2024 22:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 20/25] drivers/usb/misc/onboard_usb_dev.c:329:15:
 error: implicit declaration of function 'i2c_smbus_write_block_data'
Message-ID: <202408242231.WOLALxi9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   9a03b9a88e4a44e358e3638736286442ae262497
commit: 7b5e970ff0e58f9239226fe81c77d5b98d744986 [20/25] usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support
config: arc-randconfig-001-20240824 (https://download.01.org/0day-ci/archive/20240824/202408242231.WOLALxi9-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408242231.WOLALxi9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408242231.WOLALxi9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/misc/onboard_usb_dev.c: In function 'onboard_dev_5744_i2c_init':
>> drivers/usb/misc/onboard_usb_dev.c:329:15: error: implicit declaration of function 'i2c_smbus_write_block_data' [-Werror=implicit-function-declaration]
     329 |         ret = i2c_smbus_write_block_data(client, 0, sizeof(wr_buf), wr_buf);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/misc/onboard_usb_dev.c:333:15: error: implicit declaration of function 'i2c_smbus_write_word_data' [-Werror=implicit-function-declaration]
     333 |         ret = i2c_smbus_write_word_data(client, USB5744_CMD_CREG_ACCESS,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/i2c_smbus_write_block_data +329 drivers/usb/misc/onboard_usb_dev.c

   311	
   312	static int onboard_dev_5744_i2c_init(struct i2c_client *client)
   313	{
   314		struct device *dev = &client->dev;
   315		int ret;
   316	
   317		/*
   318		 * Set BYPASS_UDC_SUSPEND bit to ensure MCU is always enabled
   319		 * and ready to respond to SMBus runtime commands.
   320		 * The command writes 5 bytes to memory and single data byte in
   321		 * configuration register.
   322		 */
   323		char wr_buf[7] = {USB5744_CREG_MEM_ADDR, 5,
   324				  USB5744_CREG_WRITE, 1,
   325				  USB5744_CREG_RUNTIMEFLAGS2,
   326				  USB5744_CREG_RUNTIMEFLAGS2_LSB,
   327				  USB5744_CREG_BYPASS_UDC_SUSPEND};
   328	
 > 329		ret = i2c_smbus_write_block_data(client, 0, sizeof(wr_buf), wr_buf);
   330		if (ret)
   331			return dev_err_probe(dev, ret, "BYPASS_UDC_SUSPEND bit configuration failed\n");
   332	
 > 333		ret = i2c_smbus_write_word_data(client, USB5744_CMD_CREG_ACCESS,
   334						USB5744_CMD_CREG_ACCESS_LSB);
   335		if (ret)
   336			return dev_err_probe(dev, ret, "Configuration Register Access Command failed\n");
   337	
   338		/* Send SMBus command to boot hub. */
   339		ret = i2c_smbus_write_word_data(client, USB5744_CMD_ATTACH,
   340						USB5744_CMD_ATTACH_LSB);
   341		if (ret < 0)
   342			return dev_err_probe(dev, ret, "USB Attach with SMBus command failed\n");
   343	
   344		return ret;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

