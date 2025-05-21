Return-Path: <linux-usb+bounces-24206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E04ABFF79
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 00:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9EB3164548
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 22:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4147F23A58B;
	Wed, 21 May 2025 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAtglIIX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C5E1428E7
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 22:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866445; cv=none; b=gqNRcXj6FPFs5wO6s1WRyWii3XhK92N8FJQAr22S99KRbliknLv22/UpuTyipSev3S7JQXy9Osa1oPr4ASgpf87nPipi7Pqt8F5VsPexXirZlLUrhzCotTaQ9AO64rXmcVo2+2b1GTBS7pminIhWMOLwNTD7L/hQg1hJ1RJS+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866445; c=relaxed/simple;
	bh=TBarqKSFX9bxLv+qOpWl2XT+t1ZUtMPIuuna6xNszlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdjdL6Mqv+XypIJ9UJF9P8d4OuSOfd/r5UUzwKn5r6YZKeRHe8KWAnxMQEk4ffZbKIR78hOWWIPR9IjAAY6KWX+fZRan1d4B19X1hKWCDisJaK83UT7xB9rlEVpCkvC9IQbTMMEsmdjLJBNBedRAkSJPj8yGshAAV65F34zNPIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAtglIIX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747866444; x=1779402444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TBarqKSFX9bxLv+qOpWl2XT+t1ZUtMPIuuna6xNszlE=;
  b=BAtglIIXBWutXaNiubA9w+6DBfAEDJuZ1KoKYHw9e8BwVulp+7BvNzr7
   1aWP/SQdLwSkvoladkRtF0li3n+E/UfTyKm49hL5j+OHWb2AXuwl+J29U
   eUw5vG3Hvlcv3vM1bb3Aqn6hy7zDMga4x1x9JvUBJrIahP8JrkCR2G0RD
   /HwZV2ZaMlucNgli7TrxEMxW371QH2VqQZACZ2bywAsksEjpi/hM55PGp
   K8wju5KBV7UV+uFroSGVKRIq9XYhsA78FHz12pETs+9svAPIIhtikEspI
   n8v+onC515oKitTE8SucxKYxOvJOvjTaC6cVEgo6L+Onqah6XtHuRo0hT
   A==;
X-CSE-ConnectionGUID: JcRgZBbhRLGYSrNEW6KX2g==
X-CSE-MsgGUID: tG9aOMs/TO+3EvnD7mWyBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="75265412"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="75265412"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:27:23 -0700
X-CSE-ConnectionGUID: KOjeMz1RR82jkj5XGuH3LA==
X-CSE-MsgGUID: lJat/osMT92Rsyfb9JULZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="177439000"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2025 15:27:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHruB-000Ofy-1Y;
	Wed, 21 May 2025 22:27:19 +0000
Date: Thu, 22 May 2025 06:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Stroud <jonathan.stroud@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [usb:usb-testing 46/52] drivers/usb/misc/onboard_usb_dev.c:358:12:
 warning: 'onboard_dev_5744_i2c_write_byte' defined but not used
Message-ID: <202505220644.tD2JYSkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   342e4955a1f1ce28c70a589999b76365082dbf10
commit: 1143d41922c0f87504f095417ba1870167970143 [46/52] usb: misc: onboard_usb_dev: Fix usb5744 initialization sequence
config: xtensa-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220644.tD2JYSkV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220644.tD2JYSkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220644.tD2JYSkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/misc/onboard_usb_dev.c:358:12: warning: 'onboard_dev_5744_i2c_write_byte' defined but not used [-Wunused-function]
     358 | static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr, u8 data)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/misc/onboard_usb_dev.c:313:12: warning: 'onboard_dev_5744_i2c_read_byte' defined but not used [-Wunused-function]
     313 | static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u8 *data)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/onboard_dev_5744_i2c_write_byte +358 drivers/usb/misc/onboard_usb_dev.c

   312	
 > 313	static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u8 *data)
   314	{
   315		struct i2c_msg msg[2];
   316		u8 rd_buf[3];
   317		int ret;
   318	
   319		u8 wr_buf[7] = {0, USB5744_CREG_MEM_ADDR, 4,
   320				USB5744_CREG_READ, 1,
   321				addr >> 8 & 0xff,
   322				addr & 0xff};
   323		msg[0].addr = client->addr;
   324		msg[0].flags = 0;
   325		msg[0].len = sizeof(wr_buf);
   326		msg[0].buf = wr_buf;
   327	
   328		ret = i2c_transfer(client->adapter, msg, 1);
   329		if (ret < 0)
   330			return ret;
   331	
   332		wr_buf[0] = USB5744_CMD_CREG_ACCESS;
   333		wr_buf[1] = USB5744_CMD_CREG_ACCESS_LSB;
   334		wr_buf[2] = 0;
   335		msg[0].len = 3;
   336	
   337		ret = i2c_transfer(client->adapter, msg, 1);
   338		if (ret < 0)
   339			return ret;
   340	
   341		wr_buf[0] = 0;
   342		wr_buf[1] = USB5744_CREG_MEM_RD_ADDR;
   343		msg[0].len = 2;
   344	
   345		msg[1].addr = client->addr;
   346		msg[1].flags = I2C_M_RD;
   347		msg[1].len = 2;
   348		msg[1].buf = rd_buf;
   349	
   350		ret = i2c_transfer(client->adapter, msg, 2);
   351		if (ret < 0)
   352			return ret;
   353		*data = rd_buf[1];
   354	
   355		return 0;
   356	}
   357	
 > 358	static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr, u8 data)
   359	{
   360		struct i2c_msg msg[2];
   361		int ret;
   362	
   363		u8 wr_buf[8] = {0, USB5744_CREG_MEM_ADDR, 5,
   364				USB5744_CREG_WRITE, 1,
   365				addr >> 8 & 0xff,
   366				addr & 0xff,
   367				data};
   368		msg[0].addr = client->addr;
   369		msg[0].flags = 0;
   370		msg[0].len = sizeof(wr_buf);
   371		msg[0].buf = wr_buf;
   372	
   373		ret = i2c_transfer(client->adapter, msg, 1);
   374		if (ret < 0)
   375			return ret;
   376	
   377		msg[0].len = 3;
   378		wr_buf[0] = USB5744_CMD_CREG_ACCESS;
   379		wr_buf[1] = USB5744_CMD_CREG_ACCESS_LSB;
   380		wr_buf[2] = 0;
   381	
   382		ret = i2c_transfer(client->adapter, msg, 1);
   383		if (ret < 0)
   384			return ret;
   385	
   386		return 0;
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

