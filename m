Return-Path: <linux-usb+bounces-4047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B32080EE7C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 15:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A93161C20B1B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 14:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB2C73176;
	Tue, 12 Dec 2023 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xf5jImnR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007C6AC;
	Tue, 12 Dec 2023 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702390529; x=1733926529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+CyqDkty4gAG4dffVL639tJHtioITjzlgMZMq9sVuE8=;
  b=Xf5jImnRTqabHtGef0ftPMQKhN0T6DwfeGW61tbFD3uHlbfQ8E8oTXkD
   xEdcN7evttzKBs7yllOIZz/HUTi7XwWx6RsSzfmzkzUU8CQob38go+Ipk
   pOWiWhnrVOFW+eOVQX37+ywtJ0AZH4oHhTj1n9HmeW4mkuwr8WoG1QMMF
   331kdOOhViLGT23GgSXFkaEDuQYYWaGvckbnHiFrJonDCDtI4fJJ2iOGO
   9uuLyCHYmgaCCid6hloZqeADhEnUR//9Qxz7kVXXdvesWgmJXMmw5whqf
   d2zNUezd/4aWloUTQUsES8CIU5Sw7QPlY/80wwzRM3XLmO6zOf1mJilUV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="16364166"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="16364166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 06:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="802484555"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="802484555"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga008.jf.intel.com with SMTP; 12 Dec 2023 06:15:25 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 12 Dec 2023 16:15:24 +0200
Date: Tue, 12 Dec 2023 16:15:24 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: tipd: add function to request firmware
Message-ID: <ZXhq/IJp9KVCkQYb@kuha.fi.intel.com>
References: <20231207-tps6598x_update-v1-0-dc21b5301d91@wolfvision.net>
 <20231207-tps6598x_update-v1-2-dc21b5301d91@wolfvision.net>
 <ZXMudF++A9/y4TNk@kuha.fi.intel.com>
 <196acb44-fb0d-45b6-a9c3-b5a289a41917@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <196acb44-fb0d-45b6-a9c3-b5a289a41917@wolfvision.net>

Hi,

On Fri, Dec 08, 2023 at 07:58:52PM +0100, Javier Carrasco wrote:
> Hi Heikki,
> 
> On 08.12.23 15:55, Heikki Krogerus wrote:
> 
> >> +	ret = request_firmware(fw, firmware_name, tps->dev);
> >> +	if (ret) {
> >> +		dev_err(tps->dev, "failed to retrieve \"%s\"\n", firmware_name);
> >> +		/* probe deferring in case the file system is not ready */
> >> +		return (ret == -ENOENT) ? -EPROBE_DEFER : ret;
> > 
> > It's more likely that the firmware really isn't available, and it will
> > never be available in this case. I think there is only one place in
> > kernel where failing request_firmware() can lead to deferred probe
> > (drivers/tee/optee/smc_abi.c) and there the code can actually see the
> > system state - that's actually the condition.
> > 
> > So just return dev_err_probe() here:
> > 
> > 	ret = request_firmware(fw, firmware_name, tps->dev);
> > 	if (ret)
> >                 return dev_err_probe(tps->dev, ret, "failed to retrieve \"%s\"", firmware_name);
> > 
> Thank you for your feedback.
> 
> This solution arose from a real use case: in the system I am using to
> test the tps65987d, the filesystem is not ready when the probe function
> is called. If I just return on -ENOENT, the device will never get the
> update.

Just like all the other devices that require firmware. This driver is
no different from the others, and it is also not the only one that
needs the firmware only in special cases. Just make the firmware part
of your ramdisk, or build the driver as a module.

Are these firmwares available linux-firmware (or are the going to be)?
https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git

thanks,

-- 
heikki

