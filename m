Return-Path: <linux-usb+bounces-5090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35A82E861
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 05:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323E82848C1
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 04:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8849A79D2;
	Tue, 16 Jan 2024 04:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="MTCmSxV5";
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="MTCmSxV5"
X-Original-To: linux-usb@vger.kernel.org
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A94848A;
	Tue, 16 Jan 2024 04:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Received: by nautica.notk.org (Postfix, from userid 108)
	id ED726C021; Tue, 16 Jan 2024 05:04:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1705377872; bh=/aO4xrkVMg6aSFqO+IRlnuSmorQeMyv8Ss2BauLOeEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTCmSxV5vzb2xX7Qa9Mq5Zozqaqtm2X3liNKY65G6TEXJMtLX2WNgg5pvyxmFhamf
	 PdZ5tDd95sgTThBo5dRm0E9f3UOZf8f31+2EPi31LuQ6i4aExsly2qaORnVrCnLRkV
	 zxGvb1Q0h2Dn/NZBRs/Y8T9z0OzQCJXK12XDNRSdSqvfwnZU/q844qP9ZUThY5Jj+t
	 VWdii95JOfvjIvV2A4GvtHhtJJtPIShOWdyBfwwP8xoTZPOZygOXv3wtPD5O2sTfOd
	 4Ebf+hA38tOwI0zWUuYPuZg3UO2r0L5q84dNZcwm6uGW2jEeyDYP3jrC3639ycB14A
	 JrgZbsTwDwujw==
X-Spam-Level: 
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id AE02EC01A;
	Tue, 16 Jan 2024 05:04:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1705377872; bh=/aO4xrkVMg6aSFqO+IRlnuSmorQeMyv8Ss2BauLOeEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTCmSxV5vzb2xX7Qa9Mq5Zozqaqtm2X3liNKY65G6TEXJMtLX2WNgg5pvyxmFhamf
	 PdZ5tDd95sgTThBo5dRm0E9f3UOZf8f31+2EPi31LuQ6i4aExsly2qaORnVrCnLRkV
	 zxGvb1Q0h2Dn/NZBRs/Y8T9z0OzQCJXK12XDNRSdSqvfwnZU/q844qP9ZUThY5Jj+t
	 VWdii95JOfvjIvV2A4GvtHhtJJtPIShOWdyBfwwP8xoTZPOZygOXv3wtPD5O2sTfOd
	 4Ebf+hA38tOwI0zWUuYPuZg3UO2r0L5q84dNZcwm6uGW2jEeyDYP3jrC3639ycB14A
	 JrgZbsTwDwujw==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 6f25fe22;
	Tue, 16 Jan 2024 04:04:23 +0000 (UTC)
Date: Tue, 16 Jan 2024 13:04:08 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	v9fs@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 1/3] usb: gadget: function: 9pfs
Message-ID: <ZaYAONB-fUB3gjBl@codewreck.org>
References: <20240116-ml-topic-u9p-v1-0-ad8c306f9a4e@pengutronix.de>
 <20240116-ml-topic-u9p-v1-1-ad8c306f9a4e@pengutronix.de>
 <4856923e-3ce8-4372-9451-f9c8aa157111@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4856923e-3ce8-4372-9451-f9c8aa157111@rowland.harvard.edu>

Alan Stern wrote on Mon, Jan 15, 2024 at 10:17:34PM -0500:
> > diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
> > index b3592bcb0f966..72cdecaef6aa9 100644
> > --- a/drivers/usb/gadget/Kconfig
> > +++ b/drivers/usb/gadget/Kconfig
> > @@ -153,6 +153,10 @@ config USB_F_ACM
> >  config USB_F_SS_LB
> >  	tristate
> >  
> > +config USB_F_9PFS
> > +	tristate
> > +	select NET_9P
> > +
> >  config USB_U_SERIAL
> >  	tristate
> >  
> > @@ -363,6 +367,13 @@ config USB_CONFIGFS_F_LB_SS
> >  	  test software, like the "usbtest" driver, to put your hardware
> >  	  and its driver through a basic set of functional tests.
> >  
> > +config USB_CONFIGFS_F_9PFS
> > +	bool "9pfs over usb gadget"
> > +	depends on USB_CONFIGFS
> > +	select USB_F_9PFS
> > +	help
> > +	  9pfs support for usb gadget
> 
> This may be a dumb question, but what is the purpose of this CONFIG
> symbol?  It doesn't get used by any of the patches in this series, as
> far as I can see.

USB_F_9PFS cannot be selected directly in menuconfig so this allows
configuring the build option -- that appears to be how the other usb
gadgets are configured so I assume it's done that way for consistency
more than out of necessity (I don't see a problem in making the build
system use USB_CONFIGFS_F_9PFS directly, it'd just be different from the
rest)

-- 
Dominique Martinet | Asmadeus

