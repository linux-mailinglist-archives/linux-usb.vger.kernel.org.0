Return-Path: <linux-usb+bounces-17277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1809BFD5E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 05:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B7C1B21F30
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 04:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBC818A943;
	Thu,  7 Nov 2024 04:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mohk9j7P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343F0186E2D
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 04:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730953321; cv=none; b=eXea+YjzYq3PVgHZLsetdet6wHgXOkTTRNjh7qZCW/J0MyrzZbWCyOsGuTIKD1yqwwEpXBC+c6JKABr7s1X2th32I4gGvGsVgGAskb/xeMJ10iQIUo44q/MN+dNW1fPvco++ThBIO64n/yr9ezWuOLTuBdFjm10EMtLsKj/N23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730953321; c=relaxed/simple;
	bh=/3q/ayUN4G84HdA2ocVlTGexfbkVtK39oGfgna6NU3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wm6PPaRe/gh3W0kHC8eemq30UFrLhjB/3sgV+grAewT0hnesUTl0bF0rg9ohx+0PuALdWVoSQH+RsYbfYHiHsG2nYT43TH01/70TxCnbdNOrY/N5PPgaVB98S5l0jiOgGO+exGWmL0UnH3BJ2tPCvFuK6QJivd0EOkLb0KF/0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mohk9j7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA84C4CECC;
	Thu,  7 Nov 2024 04:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730953320;
	bh=/3q/ayUN4G84HdA2ocVlTGexfbkVtK39oGfgna6NU3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mohk9j7Pp2umzNi5UvJMs0ReYe09Tawmu1jt6gZgj/CUGtu/igjoLfKbgpMoD44u6
	 EX2jnRZBx9Q9B7ud87rish/fPFCGVdvP7lGuFTDM27lUiZUXHbzK/vdSYXO6/J4Ui7
	 VEIFwOMS9V8DdiftvobHE5jcO0Rv3G/7Rku2xBGg=
Date: Thu, 7 Nov 2024 05:21:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v2 3/3] usb: misc: ljca: print firmware version
Message-ID: <2024110740-egotistic-isolation-52c7@gregkh>
References: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
 <20241106123438.337117-3-stanislaw.gruszka@linux.intel.com>
 <2024110620-dating-roman-f820@gregkh>
 <ZytxNk1DEiwiXJ5b@kekkonen.localdomain>
 <ZyuCU/qVsLD8Symv@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyuCU/qVsLD8Symv@linux.intel.com>

On Wed, Nov 06, 2024 at 03:50:59PM +0100, Stanislaw Gruszka wrote:
> On Wed, Nov 06, 2024 at 01:37:58PM +0000, Sakari Ailus wrote:
> > Hi Greg,
> > 
> > On Wed, Nov 06, 2024 at 01:42:33PM +0100, Greg KH wrote:
> > > On Wed, Nov 06, 2024 at 01:34:38PM +0100, Stanislaw Gruszka wrote:
> > > > For diagnostics purposes read firmware version from device
> > > > and print it to dmesg during initialization.
> > > 
> > > No, sorry, when drivers work properly, they are quiet.  Think about what
> > > your kernel log would look like if you did this for every single driver
> > > in the tree.
> 
> Not single one, but there are plenty of drivers in the tree that
> print driver/firmware/hardware version to the log. Few in the usb
> subsystem:
> 
> drivers/usb/fotg210/fotg210-udc.c:      dev_info(dev, "version %s\n", DRIVER_VERSION);
> drivers/usb/gadget/legacy/acm_ms.c:     dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
> drivers/usb/gadget/legacy/cdc2.c:       dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
> drivers/usb/gadget/legacy/ether.c:      dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
> drivers/usb/gadget/legacy/hid.c:        dev_info(&gadget->dev, DRIVER_DESC ", version: " DRIVER_VERSION "\n");
> drivers/usb/gadget/udc/fusb300_udc.c:   dev_info(&pdev->dev, "version %s\n", DRIVER_VERSION);
> drivers/usb/gadget/udc/lpc32xx_udc.c:   dev_info(udc->dev, "%s version %s\n", driver_name, DRIVER_VERSION);
> drivers/usb/gadget/udc/m66592-udc.c:    dev_info(&pdev->dev, "version %s\n", DRIVER_VERSION);
> drivers/usb/gadget/udc/net2272.c:       dev_info(dev->dev, "version: %s\n", driver_vers);
> drivers/usb/gadget/udc/net2272.c:       dev_info(dev->dev, "RDK2 FPGA version %08x\n",
> drivers/usb/gadget/udc/r8a66597-udc.c:  dev_info(dev, "version %s\n", DRIVER_VERSION);
> drivers/usb/gadget/udc/renesas_usbf.c:  dev_info(dev, "USBF version: %08x\n",
> drivers/usb/host/xhci-mtk.c:    dev_info(mtk->dev, "uwk - reg:0x%x, version:%d\n",
> drivers/usb/mtu3/mtu3_core.c:   dev_info(mtu->dev, "IP version 0x%x(%s IP)\n", mtu->hw_version,
> drivers/usb/mtu3/mtu3_host.c:   dev_info(ssusb->dev, "uwk - reg:0x%x, version:%d\n",
> drivers/usb/typec/ucsi/ucsi_ccg.c:              dev_info(dev, "secondary fw version is too low (< %d)\n",
> drivers/usb/typec/ucsi/ucsi_ccg.c:              dev_info(dev, "found primary fw with later version\n");
> drivers/usb/typec/ucsi/ucsi_stm32g0.c:          dev_info(g0->dev, "Flashing FW: %08x (%08x cur)\n", fw_info->version, fw_version);
> drivers/usb/typec/ucsi/ucsi_stm32g0.c:  dev_info(g0->dev, "Bootloader Version 0x%02x\n", g0->bl_version);

Yes, and all of those should be fixed up and removed.

Also, the idea of "DRIVER_VERSION" is obsolete for a very very long time
and should also just be removed entirely.  We swept it from many drivers
years ago, looks like it snuck back in or that we missed some.

thanks,

greg k-h

