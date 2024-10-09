Return-Path: <linux-usb+bounces-15910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FBF996616
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 11:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B7F1F26A15
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 09:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86F71917C0;
	Wed,  9 Oct 2024 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUe/1xJ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA51190696;
	Wed,  9 Oct 2024 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728467631; cv=none; b=euelM93rRw8IqYo/m2rXnQbCOq8oXMBCgR5rTFLDdqhofnp5u84bSukTdldXjokDIWTnYRJHCjl9uNqLP4LLtDtiC84Ay3qKIqtrD2V5VpNxQ8UUPOTdofFnEJSdbFTlx2bHXGwwLoXv7t0Ktabnu6hMqZs27JWGC86Iw7LGYNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728467631; c=relaxed/simple;
	bh=NIyPMmhdZjGAs7fBYKVzyddUl0tMwlIKJxqntEDOS0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRAfC9BPRyMXWcnRJZVVr8eJGwJQ57CBqNSAxrKd+/Pl2BvYzS7GTxFdcYZ2VWdj0NA7lrXuJZ70ZEggmBccHeQQKoSCnXDG9ZPUDJy7XdTstoihC90tWkJqGYPOhIixOiffdKaqsqYlr13Stq3asgqiLC37fKGwg7mADr2dLr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUe/1xJ5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728467630; x=1760003630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIyPMmhdZjGAs7fBYKVzyddUl0tMwlIKJxqntEDOS0U=;
  b=KUe/1xJ5HdFIHVEzFOqY2wND0iAcOsFmA4hScwa5gUjiJVAnwSohUwKE
   fJkKz0WCkQXBS+Ea4qC95J+Jhi1Dl8jYIHtPXhzCxYrIOV8uIBlA9yGzo
   2CegD5nvlvtC+jH+UfYgRop7EWX5gqOqgT2DqaPtfJW27dqJ4B25G/6xM
   ySUbZfFduM0t6Q0XxjficufUEkIfmgxpkdr9uSwgR8DpIEI0r2LSCvmuZ
   wOdB4fhdrrloIrU4AAeWBo5Mr2HuH9Zg4w/vTfJTQ5q9qgldPd6brYI23
   ayAMyjCQqqQol8dlDDuyApA+l9V6pJtiCTgXqBUEC8nq6Uw6wvNxiVjCj
   Q==;
X-CSE-ConnectionGUID: h+BE4+MUSryu++K1M1mJMQ==
X-CSE-MsgGUID: L9trdupMSGuiA0rg302acQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27649801"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27649801"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 02:53:50 -0700
X-CSE-ConnectionGUID: tMctLKAAQnSQz9R1a7sZow==
X-CSE-MsgGUID: /L/cKijTS2CyMnLn+ctVzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="75789835"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2024 02:53:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syTO2-00094m-2v;
	Wed, 09 Oct 2024 09:53:42 +0000
Date: Wed, 9 Oct 2024 17:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, gregkh@linuxfoundation.org,
	peter.chen@kernel.org, herve.codina@bootlin.com
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v6 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <202410091742.HgStY96T-lkp@intel.com>
References: <20241008062744.2211539-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008062744.2211539-1-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/arm64-dts-imx95-add-usb3-related-nodes/20241008-152345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241008062744.2211539-1-xu.yang_2%40nxp.com
patch subject: [PATCH v6 1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
config: arm-randconfig-r121-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091742.HgStY96T-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410091742.HgStY96T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091742.HgStY96T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/freescale/phy-fsl-imx8mq-usb.c:264:24: sparse: sparse: Using plain integer as NULL pointer
>> drivers/phy/freescale/phy-fsl-imx8mq-usb.c:272:27: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct tca_blk * @@     got void [noderef] __iomem *base @@
   drivers/phy/freescale/phy-fsl-imx8mq-usb.c:272:27: sparse:     expected struct tca_blk *
   drivers/phy/freescale/phy-fsl-imx8mq-usb.c:272:27: sparse:     got void [noderef] __iomem *base
   drivers/phy/freescale/phy-fsl-imx8mq-usb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +264 drivers/phy/freescale/phy-fsl-imx8mq-usb.c

   254	
   255	static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
   256					struct imx8mq_usb_phy *imx_phy)
   257	{
   258		struct device *dev = &pdev->dev;
   259		struct resource *res;
   260		struct tca_blk *tca;
   261	
   262		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
   263		if (!res)
 > 264			return 0;
   265	
   266		tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
   267		if (!tca)
   268			return ERR_PTR(-ENOMEM);
   269	
   270		tca->base = devm_ioremap_resource(&pdev->dev, res);
   271		if (IS_ERR(tca->base))
 > 272			return tca->base;
   273	
   274		mutex_init(&tca->mutex);
   275	
   276		tca->orientation = TYPEC_ORIENTATION_NORMAL;
   277		tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
   278	
   279		return tca;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

