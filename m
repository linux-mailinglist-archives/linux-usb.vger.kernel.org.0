Return-Path: <linux-usb+bounces-13265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4E94CD65
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 11:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B917A1F222C7
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 09:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DED190470;
	Fri,  9 Aug 2024 09:33:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBD16C698
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723196010; cv=none; b=iZcaspocL/GpHuekR13uwloYL0Xib7Am+QT/pi56zSDqE7qyLrqzAJ0qTOfYykmCtApJjM9TrYmSMbv73laiYZAr7RyVaP9kUtHkzPLviZQlWBG0g1kiJss+fmReygwwqcX3fVQULHrCh/leQneE8y7TuHcoXFbJZSd9HCIIkAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723196010; c=relaxed/simple;
	bh=Jo1QAopdRGkAg1qTnVNcj32JKUPDLDyrOzFVHb1ZNEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrkxbbDkozaydw7fR+ey5/oGzs4nOHS9MFJ0MkPO0JU0FAAuYsP329CRVpsYDjffHD899YKMp+a80sQaTbZok8VhKa+9Md0izxN1h27i6uMBaf8fEYHLc3WXb0JUxVHGmO7pff8bTiaY1aM/L/rut82SHykWyBzqFYoB7NB/jSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1scLzn-0004XE-8g; Fri, 09 Aug 2024 11:33:15 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1scLzm-005dKS-09; Fri, 09 Aug 2024 11:33:14 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1scLzl-00Aljg-2r;
	Fri, 09 Aug 2024 11:33:13 +0200
Date: Fri, 9 Aug 2024 11:33:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, oe-kbuild-all@lists.linux.dev,
	kernel@pengutronix.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: hub: add infrastructure to pass onboard_dev
 port features
Message-ID: <20240809093313.xn3x2p3st2b32g27@pengutronix.de>
References: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-1-f33ce21353c9@pengutronix.de>
 <202408081557.FiEe9Tzz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408081557.FiEe9Tzz-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi all,

On 24-08-08, kernel test robot wrote:
> Hi Marco,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 0c3836482481200ead7b416ca80c68a29cfdaabd]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/usb-hub-add-infrastructure-to-pass-onboard_dev-port-features/20240807-224100
> base:   0c3836482481200ead7b416ca80c68a29cfdaabd
> patch link:    https://lore.kernel.org/r/20240807-b4-v6-10-topic-usb-onboard-dev-v1-1-f33ce21353c9%40pengutronix.de
> patch subject: [PATCH 1/3] usb: hub: add infrastructure to pass onboard_dev port features
> config: i386-randconfig-141-20240808 (https://download.01.org/0day-ci/archive/20240808/202408081557.FiEe9Tzz-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081557.FiEe9Tzz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408081557.FiEe9Tzz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/usb/core/hub.o: in function `set_port_feature':
> >> drivers/usb/core/hub.c:481: undefined reference to `onboard_dev_port_feature'
>    ld: drivers/usb/core/hub.o: in function `usb_clear_port_feature':
>    drivers/usb/core/hub.c:462: undefined reference to `onboard_dev_port_feature'

I understood the isse but have a few questions. Before continue the work
on this topic I would like to ask if the patchset is okay in general?
I'm open for alternatives if the patchset approach is not okay.

I have a few ideas in mind (see below) to fix the 0day build issue which
was caused by the Kconfig selection:

 - CONFIG_USB=y
 - CONFIG_USB_ONBOARD_DEV=m.

Idea-1:
-------

Dropping the module support for CONFIG_USB_ONBOARD_DEV.

Idea-2:
-------

CONFIG_USB_ONBOARD_DEV follows CONFIG_USB:

CONFIG_USB=y -> CONFIG_USB_ONBOARD_DEV=y,
CONFIG_USB=m -> CONFIG_USB_ONBOARD_DEV=m.

and exporting usb_clear_port_feature().

I don't know to add such Kconfig dependency and also this idea require
that the usbcore have to load the usb_onboard_dev module always,
regardless if used.

So this idea is rather suboptimal.

Idea-3:
-------

Adding a function to the hub.c usbcore which can be used by the
usb-onboard-dev driver to register this function as hook. This removes
the dependency from the core and the usb-onboard-dev module is only
pulled if really required. Of course this require that the hub.c usbcore
driver allows custom hooks.

Idea-X:
-------

I'm open for your input :)


Regards,
  Marco

PS: My favourite is Idea-3 followed by Idea-1.

> vim +481 drivers/usb/core/hub.c
> 
>    466	
>    467	/*
>    468	 * USB 2.0 spec Section 11.24.2.13
>    469	 */
>    470	static int set_port_feature(struct usb_device *hdev, int port1, int feature)
>    471	{
>    472		int ret;
>    473	
>    474		ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
>    475			USB_REQ_SET_FEATURE, USB_RT_PORT, feature, port1,
>    476			NULL, 0, 1000);
>    477		if (ret)
>    478			return ret;
>    479	
>    480		if (!is_root_hub(hdev))
>  > 481			ret = onboard_dev_port_feature(hdev, true, feature, port1);
>    482	
>    483		return ret;
>    484	}
>    485	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

